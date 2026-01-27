package com.ccy.emr.modules.system.service.impl;

import com.ccy.emr.modules.system.entity.SysUser;
import com.ccy.emr.modules.system.mapper.SysUserMapper;
import com.ccy.emr.modules.system.service.SysUserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 系统用户服务实现
 *
 * @author CCY
 * @date 2026-01-27
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class SysUserServiceImpl implements SysUserService {

    private final SysUserMapper sysUserMapper;
    private final PasswordEncoder passwordEncoder;

    @Override
    public SysUser findByUsername(String username) {
        return sysUserMapper.findByUsername(username);
    }

    @Override
    public SysUser findById(Long id) {
        return sysUserMapper.findById(id);
    }

    @Override
    public List<String> getUserPermissions(Long userId) {
        // 获取用户的所有权限标识
        List<String> permissions = sysUserMapper.findUserPermissions(userId);
        if (permissions == null) {
            return new ArrayList<>();
        }
        return permissions;
    }

    @Override
    public boolean createUser(SysUser sysUser) {
        // 加密密码
        sysUser.setPassword(passwordEncoder.encode(sysUser.getPassword()));
        sysUser.setCreateTime(LocalDateTime.now());
        sysUser.setUpdateTime(LocalDateTime.now());
        sysUser.setIsDeleted(0);
        if (sysUser.getStatus() == null) {
            sysUser.setStatus(1);
        }
        return sysUserMapper.insert(sysUser) > 0;
    }

    @Override
    public boolean updateUser(SysUser sysUser) {
        sysUser.setUpdateTime(LocalDateTime.now());
        // 如果密码不为空，则加密
        if (sysUser.getPassword() != null && !sysUser.getPassword().isEmpty()) {
            sysUser.setPassword(passwordEncoder.encode(sysUser.getPassword()));
        }
        return sysUserMapper.update(sysUser) > 0;
    }

    @Override
    public boolean deleteUser(Long id) {
        return sysUserMapper.deleteById(id) > 0;
    }
}
