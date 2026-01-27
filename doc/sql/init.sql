-- ============================================================
-- CCY EMR Service 数据库初始化脚本
-- 数据库: PostgreSQL 16+
-- 创建时间: 2026-01-27
-- ============================================================

-- 创建 schema (如果需要)
-- CREATE SCHEMA IF NOT EXISTS emr;

-- ============================================================
-- 1. 系统管理表 (RBAC 权限管理)
-- ============================================================

-- 1.1 用户表
DROP TABLE IF EXISTS sys_user CASCADE;

CREATE TABLE sys_user (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    avatar VARCHAR(255),
    status INTEGER DEFAULT 1 CHECK (status IN (0, 1)),
    create_time TIMESTAMP DEFAULT NOW(),
    update_time TIMESTAMP DEFAULT NOW(),
    is_deleted INTEGER DEFAULT 0 CHECK (is_deleted IN (0, 1))
);

COMMENT ON TABLE sys_user IS '系统用户表';

COMMENT ON COLUMN sys_user.id IS '主键ID';

COMMENT ON COLUMN sys_user.username IS '用户名';

COMMENT ON COLUMN sys_user.password IS '密码(BCrypt加密)';

COMMENT ON COLUMN sys_user.name IS '姓名';

COMMENT ON COLUMN sys_user.phone IS '手机号';

COMMENT ON COLUMN sys_user.email IS '邮箱';

COMMENT ON COLUMN sys_user.avatar IS '头像地址';

COMMENT ON COLUMN sys_user.status IS '状态(1:正常 0:禁用)';

COMMENT ON COLUMN sys_user.is_deleted IS '逻辑删除(0:未删除 1:已删除)';

-- 1.2 角色表
DROP TABLE IF EXISTS sys_role CASCADE;

CREATE TABLE sys_role (
    id BIGSERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL,
    role_code VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    status INTEGER DEFAULT 1 CHECK (status IN (0, 1)),
    create_time TIMESTAMP DEFAULT NOW(),
    update_time TIMESTAMP DEFAULT NOW(),
    is_deleted INTEGER DEFAULT 0 CHECK (is_deleted IN (0, 1))
);

COMMENT ON TABLE sys_role IS '系统角色表';

COMMENT ON COLUMN sys_role.role_name IS '角色名称';

COMMENT ON COLUMN sys_role.role_code IS '角色编码';

COMMENT ON COLUMN sys_role.description IS '角色描述';

-- 1.3 菜单/权限表
DROP TABLE IF EXISTS sys_menu CASCADE;

CREATE TABLE sys_menu (
    id BIGSERIAL PRIMARY KEY,
    parent_id BIGINT DEFAULT 0,
    name VARCHAR(50) NOT NULL,
    type INTEGER NOT NULL CHECK (type IN (1, 2, 3)),
    path VARCHAR(200),
    component VARCHAR(200),
    perms VARCHAR(200),
    icon VARCHAR(100),
    sort_value INTEGER DEFAULT 0,
    status INTEGER DEFAULT 1 CHECK (status IN (0, 1)),
    create_time TIMESTAMP DEFAULT NOW(),
    update_time TIMESTAMP DEFAULT NOW(),
    is_deleted INTEGER DEFAULT 0 CHECK (is_deleted IN (0, 1))
);

COMMENT ON TABLE sys_menu IS '系统菜单/权限表';

COMMENT ON COLUMN sys_menu.parent_id IS '父级ID';

COMMENT ON COLUMN sys_menu.name IS '菜单名称';

COMMENT ON COLUMN sys_menu.type IS '类型(1:目录 2:菜单 3:按钮)';

COMMENT ON COLUMN sys_menu.path IS '路由路径';

COMMENT ON COLUMN sys_menu.component IS '组件路径';

COMMENT ON COLUMN sys_menu.perms IS '权限标识';

COMMENT ON COLUMN sys_menu.icon IS '图标';

COMMENT ON COLUMN sys_menu.sort_value IS '排序值';

-- 1.4 用户-角色关联表
DROP TABLE IF EXISTS sys_user_role CASCADE;

CREATE TABLE sys_user_role (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    create_time TIMESTAMP DEFAULT NOW(),
    UNIQUE (user_id, role_id)
);

COMMENT ON TABLE sys_user_role IS '用户角色关联表';

-- 1.5 角色-菜单关联表
DROP TABLE IF EXISTS sys_role_menu CASCADE;

CREATE TABLE sys_role_menu (
    id BIGSERIAL PRIMARY KEY,
    role_id BIGINT NOT NULL,
    menu_id BIGINT NOT NULL,
    create_time TIMESTAMP DEFAULT NOW(),
    UNIQUE (role_id, menu_id)
);

COMMENT ON TABLE sys_role_menu IS '角色菜单关联表';

-- ============================================================
-- 2. 日志表
-- ============================================================

-- 2.1 登录日志表
DROP TABLE IF EXISTS sys_login_log CASCADE;

CREATE TABLE sys_login_log (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50),
    ip_addr VARCHAR(50),
    status INTEGER CHECK (status IN (0, 1)),
    msg VARCHAR(255),
    login_time TIMESTAMP DEFAULT NOW()
);

COMMENT ON TABLE sys_login_log IS '登录日志表';

-- 2.2 操作日志表
DROP TABLE IF EXISTS sys_oper_log CASCADE;

CREATE TABLE sys_oper_log (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(50),
    method VARCHAR(200),
    request_method VARCHAR(10),
    operator_type INTEGER,
    oper_name VARCHAR(50),
    oper_url VARCHAR(500),
    oper_ip VARCHAR(50),
    oper_param TEXT,
    json_result TEXT,
    status INTEGER,
    error_msg TEXT,
    oper_time TIMESTAMP DEFAULT NOW()
);

COMMENT ON TABLE sys_oper_log IS '操作日志表';

-- ============================================================
-- 3. APIJSON 配置表 (必须存在)
-- ============================================================

-- 3.1 访问权限配置表 Access
-- 控制哪个角色能对哪张表进行增删改查
DROP TABLE IF EXISTS "Access" CASCADE;

CREATE TABLE "Access" (
    id BIGSERIAL PRIMARY KEY,
    debug INTEGER DEFAULT 0,
    name VARCHAR(50) NOT NULL,
    alias VARCHAR(50),
    get VARCHAR(500) DEFAULT '["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]',
    head VARCHAR(500) DEFAULT '["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]',
    gets VARCHAR(500) DEFAULT '["LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]',
    heads VARCHAR(500) DEFAULT '["LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]',
    post VARCHAR(500) DEFAULT '["OWNER","ADMIN"]',
    put VARCHAR(500) DEFAULT '["OWNER","ADMIN"]',
    delete VARCHAR(500) DEFAULT '["OWNER","ADMIN"]',
    date TIMESTAMP DEFAULT NOW()
);

-- 3.2 请求参数校验配置表 Request
-- 控制前端传参结构必须符合什么规则
DROP TABLE IF EXISTS "Request" CASCADE;

CREATE TABLE "Request" (
    id BIGSERIAL PRIMARY KEY,
    debug INTEGER DEFAULT 0,
    version INTEGER DEFAULT 1,
    method VARCHAR(20),
    tag VARCHAR(20) NOT NULL,
    structure TEXT NOT NULL,
    detail VARCHAR(100),
    date TIMESTAMP DEFAULT NOW()
);

-- 3.3 文档表 Document (可选)
DROP TABLE IF EXISTS "Document" CASCADE;

CREATE TABLE "Document" (
    id BIGSERIAL PRIMARY KEY,
    debug INTEGER DEFAULT 0,
    user_id BIGINT NOT NULL,
    version INTEGER DEFAULT 1,
    name VARCHAR(50) NOT NULL,
    type VARCHAR(20) NOT NULL,
    url VARCHAR(255) NOT NULL,
    request TEXT NOT NULL,
    apijson TEXT, -- APIJSON 请求参数
    sql TEXT, -- 生成的 SQL
    result TEXT, -- 返回结果
    date TIMESTAMP DEFAULT NOW()
);

-- ============================================================
-- 4. 初始化数据
-- ============================================================

-- 4.1 初始化管理员用户 (密码: 123456, BCrypt加密)
INSERT INTO
    sys_user (
        username,
        password,
        name,
        phone,
        email,
        status
    )
VALUES (
        'admin',
        '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi',
        '系统管理员',
        '13800138000',
        'admin@emr.com',
        1
    );

-- 4.2 初始化角色
INSERT INTO
    sys_role (
        role_name,
        role_code,
        description,
        status
    )
VALUES (
        '超级管理员',
        'ADMIN',
        '拥有系统所有权限',
        1
    ),
    ('普通用户', 'USER', '普通用户权限', 1),
    ('医生', 'DOCTOR', '医生角色', 1),
    ('护士', 'NURSE', '护士角色', 1);

-- 4.3 初始化菜单
INSERT INTO
    sys_menu (
        parent_id,
        name,
        type,
        path,
        component,
        perms,
        icon,
        sort_value,
        status
    )
VALUES
    -- 系统管理
    (
        0,
        '系统管理',
        1,
        '/system',
        NULL,
        NULL,
        'setting',
        100,
        1
    ),
    (
        1,
        '用户管理',
        2,
        '/system/user',
        'system/user/index',
        'system:user:list',
        'user',
        1,
        1
    ),
    (
        1,
        '角色管理',
        2,
        '/system/role',
        'system/role/index',
        'system:role:list',
        'peoples',
        2,
        1
    ),
    (
        1,
        '菜单管理',
        2,
        '/system/menu',
        'system/menu/index',
        'system:menu:list',
        'tree-table',
        3,
        1
    ),
    -- 用户管理按钮权限
    (
        2,
        '添加用户',
        3,
        NULL,
        NULL,
        'system:user:add',
        NULL,
        1,
        1
    ),
    (
        2,
        '编辑用户',
        3,
        NULL,
        NULL,
        'system:user:edit',
        NULL,
        2,
        1
    ),
    (
        2,
        '删除用户',
        3,
        NULL,
        NULL,
        'system:user:delete',
        NULL,
        3,
        1
    ),
    -- 角色管理按钮权限
    (
        3,
        '添加角色',
        3,
        NULL,
        NULL,
        'system:role:add',
        NULL,
        1,
        1
    ),
    (
        3,
        '编辑角色',
        3,
        NULL,
        NULL,
        'system:role:edit',
        NULL,
        2,
        1
    ),
    (
        3,
        '删除角色',
        3,
        NULL,
        NULL,
        'system:role:delete',
        NULL,
        3,
        1
    ),
    (
        3,
        '分配权限',
        3,
        NULL,
        NULL,
        'system:role:assign',
        NULL,
        4,
        1
    );

-- 4.4 分配管理员角色给admin用户
INSERT INTO sys_user_role (user_id, role_id) VALUES (1, 1);

-- 4.5 给管理员角色分配所有菜单权限
INSERT INTO
    sys_role_menu (role_id, menu_id)
SELECT 1, id
FROM sys_menu
WHERE
    is_deleted = 0;

-- ============================================================
-- 5. APIJSON 默认权限配置
-- ============================================================

-- 配置 sys_user 表只允许 ADMIN 角色增删改查
INSERT INTO
    "Access" (
        name,
        alias,
        get,
        head,
        gets,
        heads,
        post,
        put,
        delete
    )
VALUES (
        'sys_user',
        'User',
        '["ADMIN"]',
        '["ADMIN"]',
        '["ADMIN"]',
        '["ADMIN"]',
        '["ADMIN"]',
        '["ADMIN"]',
        '["ADMIN"]'
    ),
    (
        'sys_role',
        'Role',
        '["ADMIN","USER"]',
        '["ADMIN","USER"]',
        '["ADMIN","USER"]',
        '["ADMIN","USER"]',
        '["ADMIN"]',
        '["ADMIN"]',
        '["ADMIN"]'
    ),
    (
        'sys_menu',
        'Menu',
        '["ADMIN","USER"]',
        '["ADMIN","USER"]',
        '["ADMIN","USER"]',
        '["ADMIN","USER"]',
        '["ADMIN"]',
        '["ADMIN"]',
        '["ADMIN"]'
    );

-- ============================================================
-- 6. 创建索引
-- ============================================================

CREATE INDEX idx_sys_user_username ON sys_user (username);

CREATE INDEX idx_sys_user_deleted ON sys_user (is_deleted);

CREATE INDEX idx_sys_role_code ON sys_role (role_code);

CREATE INDEX idx_sys_menu_parent ON sys_menu (parent_id);

CREATE INDEX idx_sys_user_role_user ON sys_user_role (user_id);

CREATE INDEX idx_sys_user_role_role ON sys_user_role (role_id);

CREATE INDEX idx_sys_role_menu_role ON sys_role_menu (role_id);

CREATE INDEX idx_sys_role_menu_menu ON sys_role_menu (menu_id);

-- ============================================================
-- 完成
-- ============================================================