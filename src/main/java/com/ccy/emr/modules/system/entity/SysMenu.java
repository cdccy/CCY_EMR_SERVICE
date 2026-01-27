package com.ccy.emr.modules.system.entity;

import com.ccy.emr.common.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 系统菜单/权限实体
 *
 * @author CCY
 * @date 2026-01-27
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class SysMenu extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 父级ID
     */
    private Long parentId;

    /**
     * 菜单名称
     */
    private String name;

    /**
     * 类型 (1: 目录, 2: 菜单, 3: 按钮)
     */
    private Integer type;

    /**
     * 路由地址
     */
    private String path;

    /**
     * 组件路径
     */
    private String component;

    /**
     * 权限标识
     */
    private String perms;

    /**
     * 图标
     */
    private String icon;

    /**
     * 排序值
     */
    private Integer sortValue;

    /**
     * 状态 (1: 正常, 0: 禁用)
     */
    private Integer status;

    /**
     * 子菜单 (非数据库字段)
     */
    private transient List<SysMenu> children;

    /**
     * 是否选中 (非数据库字段, 用于角色授权)
     */
    private transient Boolean selected;
}
