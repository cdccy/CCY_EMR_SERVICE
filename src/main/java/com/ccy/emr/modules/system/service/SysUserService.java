package com.ccy.emr.modules.system.service;

import com.ccy.emr.modules.system.entity.SysUser;

import java.util.List;

/**
 * 系统用户服务接口
 *
 * @author CCY
 * @date 2026-01-27
 */
public interface SysUserService {

    /**
     * 根据用户名查询用户
     *
     * @param username 用户名
     * @return 用户信息
     */
    SysUser findByUsername(String username);

    /**
     * 根据ID查询用户
     *
     * @param id 用户ID
     * @return 用户信息
     */
    SysUser findById(Long id);

    /**
     * 获取用户权限列表
     *
     * @param userId 用户ID
     * @return 权限标识列表
     */
    List<String> getUserPermissions(Long userId);

    /**
     * 创建用户
     *
     * @param sysUser 用户信息
     * @return 是否成功
     */
    boolean createUser(SysUser sysUser);

    /**
     * 更新用户
     *
     * @param sysUser 用户信息
     * @return 是否成功
     */
    boolean updateUser(SysUser sysUser);

    /**
     * 删除用户
     *
     * @param id 用户ID
     * @return 是否成功
     */
    boolean deleteUser(Long id);
}
