package com.ccy.emr.modules.auth.controller;

import com.ccy.emr.common.result.Result;
import com.ccy.emr.common.result.ResultCode;
import com.ccy.emr.common.util.JwtUtil;
import com.ccy.emr.modules.auth.dto.LoginRequest;
import com.ccy.emr.modules.auth.dto.LoginResponse;
import com.ccy.emr.modules.system.entity.SysUser;
import com.ccy.emr.modules.system.service.SysUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.TimeUnit;

/**
 * 认证控制器
 *
 * @author CCY
 * @date 2026-01-27
 */
@Slf4j
@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
@Tag(name = "认证管理", description = "用户登录、登出相关接口")
public class AuthController {

    private final SysUserService sysUserService;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;
    private final RedisTemplate<String, Object> redisTemplate;

    private static final String REDIS_TOKEN_PREFIX = "user:token:";

    /**
     * 用户登录
     */
    @PostMapping("/login")
    @Operation(summary = "用户登录", description = "用户名密码登录，返回 JWT Token")
    public Result<LoginResponse> login(@Valid @RequestBody LoginRequest request) {
        log.info("用户登录: {}", request.getUsername());

        // 查询用户
        SysUser user = sysUserService.findByUsername(request.getUsername());
        if (user == null) {
            log.warn("用户不存在: {}", request.getUsername());
            return Result.fail(ResultCode.USER_NOT_FOUND);
        }

        // 验证密码
        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            log.warn("密码错误: {}", request.getUsername());
            return Result.fail(ResultCode.PASSWORD_ERROR);
        }

        // 检查用户状态
        if (user.getStatus() == 0) {
            log.warn("用户已禁用: {}", request.getUsername());
            return Result.fail(ResultCode.USER_DISABLED);
        }

        // 生成 Token
        String token = jwtUtil.generateToken(user.getId(), user.getUsername());

        // 保存 Token 到 Redis (可用于登出时使 Token 失效)
        String redisKey = REDIS_TOKEN_PREFIX + user.getUsername();
        redisTemplate.opsForValue().set(redisKey, token, 24, TimeUnit.HOURS);

        // 构建响应
        LoginResponse response = LoginResponse.builder()
                .token(token)
                .userId(user.getId())
                .username(user.getUsername())
                .name(user.getName())
                .avatar(user.getAvatar())
                .build();

        log.info("用户登录成功: {}", request.getUsername());
        return Result.ok(response);
    }

    /**
     * 用户登出
     */
    @PostMapping("/logout")
    @Operation(summary = "用户登出", description = "登出并使 Token 失效")
    public Result<Void> logout(@RequestHeader("Authorization") String authorization) {
        try {
            String token = authorization.replace("Bearer ", "");
            String username = jwtUtil.getUsernameFromToken(token);

            if (username != null) {
                // 从 Redis 删除 Token
                String redisKey = REDIS_TOKEN_PREFIX + username;
                redisTemplate.delete(redisKey);
                log.info("用户登出成功: {}", username);
            }
        } catch (Exception e) {
            log.error("登出异常: {}", e.getMessage());
        }

        return Result.ok();
    }

    /**
     * 获取当前用户信息
     */
    @GetMapping("/info")
    @Operation(summary = "获取当前用户信息", description = "获取当前登录用户的详细信息")
    public Result<SysUser> getUserInfo(@RequestHeader("Authorization") String authorization) {
        String token = authorization.replace("Bearer ", "");
        Long userId = jwtUtil.getUserIdFromToken(token);

        if (userId == null) {
            return Result.fail(ResultCode.TOKEN_INVALID);
        }

        SysUser user = sysUserService.findById(userId);
        if (user == null) {
            return Result.fail(ResultCode.USER_NOT_FOUND);
        }

        // 清除密码
        user.setPassword(null);
        return Result.ok(user);
    }
}
