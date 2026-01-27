package com.ccy.emr.modules.system.mapper;

import com.ccy.emr.modules.system.entity.SysUser;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 系统用户 Mapper
 *
 * @author CCY
 * @date 2026-01-27
 */
@Mapper
public interface SysUserMapper {

    /**
     * 根据用户名查询用户
     */
    @Select("SELECT * FROM sys_user WHERE username = #{username} AND is_deleted = 0")
    SysUser findByUsername(@Param("username") String username);

    /**
     * 根据ID查询用户
     */
    @Select("SELECT * FROM sys_user WHERE id = #{id} AND is_deleted = 0")
    SysUser findById(@Param("id") Long id);

    /**
     * 查询用户权限列表
     */
    @Select("""
            SELECT DISTINCT m.perms
            FROM sys_menu m
            INNER JOIN sys_role_menu rm ON m.id = rm.menu_id
            INNER JOIN sys_user_role ur ON rm.role_id = ur.role_id
            WHERE ur.user_id = #{userId}
              AND m.perms IS NOT NULL
              AND m.perms != ''
              AND m.status = 1
              AND m.is_deleted = 0
            """)
    List<String> findUserPermissions(@Param("userId") Long userId);

    /**
     * 插入用户
     */
    @Insert("""
            INSERT INTO sys_user (username, password, name, phone, email, avatar, status, create_time, update_time, is_deleted)
            VALUES (#{username}, #{password}, #{name}, #{phone}, #{email}, #{avatar}, #{status}, #{createTime}, #{updateTime}, #{isDeleted})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(SysUser sysUser);

    /**
     * 更新用户
     */
    @Update("""
            <script>
            UPDATE sys_user SET
                <if test="password != null and password != ''">password = #{password},</if>
                <if test="name != null">name = #{name},</if>
                <if test="phone != null">phone = #{phone},</if>
                <if test="email != null">email = #{email},</if>
                <if test="avatar != null">avatar = #{avatar},</if>
                <if test="status != null">status = #{status},</if>
                update_time = #{updateTime}
            WHERE id = #{id} AND is_deleted = 0
            </script>
            """)
    int update(SysUser sysUser);

    /**
     * 逻辑删除用户
     */
    @Update("UPDATE sys_user SET is_deleted = 1, update_time = NOW() WHERE id = #{id}")
    int deleteById(@Param("id") Long id);
}
