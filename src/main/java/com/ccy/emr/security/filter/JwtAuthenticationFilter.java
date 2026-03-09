package com.ccy.emr.security.filter;

import com.ccy.emr.common.util.JwtUtil;
import com.ccy.emr.security.service.UserDetailsServiceImpl;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

/**
 * JWT 认证过滤器
 * 从请求头中获取 Token，验证并设置用户认证信息
 *
 * @author CCY
 * @date 2026-01-27
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtUtil jwtUtil;
    private final UserDetailsServiceImpl userDetailsService;
    private final RedisTemplate<String, Object> redisTemplate;

    private static final String TOKEN_HEADER = "Authorization";
    private static final String TOKEN_PREFIX = "Bearer ";
    private static final String REDIS_TOKEN_PREFIX = "user:token:";

    @Override
    protected void doFilterInternal(HttpServletRequest request,
            HttpServletResponse response,
            FilterChain filterChain) throws ServletException, IOException {
        try {
            // 获取 Token
            String token = getTokenFromRequest(request);
    
            if (StringUtils.hasText(token) && jwtUtil.validateToken(token)) {
                // 从 Token 中获取用户名
                String username = jwtUtil.getUsernameFromToken(token);
    
                if (StringUtils.hasText(username) && SecurityContextHolder.getContext().getAuthentication() == null) {
                    // 检查 Redis 中是否存在该 Token (可选：用于实现登出功能)
                    String redisKey = REDIS_TOKEN_PREFIX + username;
                    Object cachedToken = redisTemplate.opsForValue().get(redisKey);
    
                    // 如果需要严格验证 Token，可以检查 Redis 中的 Token 是否匹配
                    // if (cachedToken != null && token.equals(cachedToken.toString())) { ... }
    
                    // 加载用户信息
                    UserDetails userDetails = userDetailsService.loadUserByUsername(username);
    
                    if (userDetails != null) {
                        // 创建认证对象
                        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                                userDetails,
                                null,
                                userDetails.getAuthorities());
                        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
    
                        // 设置到 SecurityContext
                        SecurityContextHolder.getContext().setAuthentication(authentication);
                        log.debug("用户 {} 认证成功", username);
                    }
                }
            } else if (StringUtils.hasText(token)) {
                // Token 存在但无效，设置认证失败响应
                log.warn("无效的 JWT Token");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.setContentType("application/json;charset=UTF-8");
                response.getWriter().write("{\"code\":401,\"message\":\"无效的 Token\"}");
                return;
            }
        } catch (Exception e) {
            log.error("JWT 认证失败：{}", e.getMessage(), e);
            // 认证失败，返回 401
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write("{\"code\":401,\"message\":\"认证失败：" + e.getMessage() + "\"}");
            return;
        }
    
        filterChain.doFilter(request, response);
    }

    /**
     * 从请求头中获取 Token
     */
    private String getTokenFromRequest(HttpServletRequest request) {
        String bearerToken = request.getHeader(TOKEN_HEADER);
        if (StringUtils.hasText(bearerToken) && bearerToken.startsWith(TOKEN_PREFIX)) {
            return bearerToken.substring(TOKEN_PREFIX.length());
        }
        return null;
    }
}
