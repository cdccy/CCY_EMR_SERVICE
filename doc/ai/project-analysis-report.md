# Original Project Analysis Report

> 分析对象: /Users/ccy/Desktop/毕业设计/项目资料/基于SpringBoot的电子病例管理系统/electronic_case_system
> 分析时间: 2026-01-27
> 目的: 为二次开发提供参考

---

## 1. 项目概述

这是一个基于 **Spring Boot 2.5.0** 构建的电子病历管理系统，采用前后端分离架构。

### 1.1 技术栈

| 技术 | 版本 | 用途 |
|------|------|------|
| Spring Boot | 2.5.0 | 核心框架 |
| Spring Security | - | 安全认证授权 |
| MyBatis-Plus | 3.4.1 | ORM 持久层 |
| MySQL | 8.0.19 | 数据库 |
| Redis | - | 缓存/权限存储 |
| JWT | 0.7.0 | Token 认证 |
| Knife4j | 2.0.8 | API 文档 |
| 阿里云 OSS | 3.10.2 | 文件存储 |
| RabbitMQ | - | 消息队列 |
| 腾讯云短信 | 1.0.6 | 短信服务 |

---

## 2. 当前项目技术栈对比

### 2.1 当前项目实际技术栈

| 技术 | 版本 | 用途 |
|------|------|------|
| Spring Boot | 3.2.0 | 核心框架 |
| Spring Security | 6.x | 安全认证授权 |
| MyBatis | 3.0.3 | ORM 持久层 |
| PostgreSQL | 16 | 数据库 |
| Redis | 7 | 缓存/权限存储 |
| JWT | 0.12.3 | Token 认证 |
| SpringDoc | 2.3.0 | API 文档 |
| MinIO | Latest | 文件存储 |
| APIJSON | 8.0.2 | 零代码接口框架 |
| Hutool | 5.8.24 | 工具类库 |
| Druid | 1.2.20 | 数据库连接池 |

### 2.2 主要差异对比

| 项目 | 原项目 | 当前项目 |
|------|--------|----------|
| Spring Boot | 2.5.0 | 3.2.0 |
| Java | 8 | 17+ |
| 数据库 | MySQL | PostgreSQL |
| 文件存储 | 阿里云 OSS | MinIO |
| ORM | MyBatis-Plus | MyBatis (纯注解) |
| API 框架 | 传统 CRUD | APIJSON 8.0.2 |
| API 文档 | Knife4j | SpringDoc (Swagger UI) |

---

## 2. 项目目录结构

```
electronic_case_system/
├── pom.xml
├── src/main/java/com/qingfeng/electronic/
│   │
│   ├── ElectronicCaseSystemApplication.java   # 启动类
│   │
│   ├── base/                    # 🔥 基础模块（可复用）
│   │   ├── controller/          # 基础控制器
│   │   ├── converter/           # 数据类型转换器
│   │   ├── entity/              # BaseEntity
│   │   ├── enums/               # 通用枚举
│   │   ├── handler/             # 异常处理器
│   │   ├── log/                 # 日志 AOP
│   │   ├── security/            # 🔐 安全模块
│   │   │   ├── config/          # WebSecurityConfig
│   │   │   ├── custom/          # 密码编码器
│   │   │   ├── filter/          # JWT 过滤器
│   │   │   └── service/         # UserDetailsService
│   │   └── util/                # 工具类
│   │
│   ├── config/                  # 配置类
│   │
│   └── modules/
│       ├── back/                # 后台管理
│       │   ├── file/            # 文件管理
│       │   ├── hosp/            # 科室管理
│       │   ├── information/     # 信息管理
│       │   ├── medical/         # 病历核心
│       │   └── system/          # 🔥 权限管理
│       │
│       └── front/               # 前台
│           ├── info/
│           ├── login/
│           ├── medical/
│           └── message/
```

---

## 3. RBAC 权限模型分析

### 3.1 核心表结构

| 表名 | 说明 |
|------|------|
| `sys_user` | 用户表 |
| `sys_role` | 角色表 |
| `sys_menu` | 菜单/权限表 |
| `sys_user_role` | 用户-角色关联 |
| `sys_role_menu` | 角色-菜单关联 |

### 3.2 实体设计

```java
// SysUser 用户表
@TableName("sys_user")
public class SysUser extends BaseEntity {
    private String username;
    private String password;
    private String name;
    private String phone;
    private String headUrl;
    private Long deptId;
    private Long postId;
    private String description;
    private Integer status;
    @TableField(exist = false)
    private List<SysRole> roleList;
}

// SysRole 角色表
@TableName("sys_role")
public class SysRole extends BaseEntity {
    private String roleName;
    private String roleCode;
    private String description;
}

// SysMenu 菜单表
@TableName("sys_menu")
public class SysMenu extends BaseEntity {
    private Long parentId;
    private String name;
    private Integer type;      // 1:菜单 2:按钮
    private String path;
    private String component;
    private String perms;      // 权限标识
    private String icon;
    private Integer sortValue;
    private Integer status;
    @TableField(exist = false)
    private List<SysMenu> children;
}

// SysUserRole 用户-角色关联
@TableName("sys_user_role")
public class SysUserRole extends BaseEntity {
    private Long roleId;
    private Long userId;
}

// SysRoleMenu 角色-菜单关联
@TableName("sys_role_menu")
public class SysRoleMenu extends BaseEntity {
    private Long roleId;
    private Long menuId;
}
```

### 3.3 认证流程

```
1. 用户登录 → TokenLoginFilter
   └─ 验证用户名密码 (CustomMd5PasswordEncoder)
   └─ 生成 JWT Token (JwtHelper)
   └─ 权限数据存入 Redis

2. 请求拦截 → TokenAuthenticationFilter
   └─ 解析 JWT Token
   └─ 从 Redis 读取权限数据
   └─ 构建 SecurityContext

3. 接口鉴权 → @PreAuthorize("hasAuthority('xxx')")
```

---

## 4. 可复用模块

### 4.1 ✅ 建议复用

| 模块 | 路径 | 说明 |
|------|------|------|
| BaseEntity | `base/entity/` | 基础实体类 |
| Security | `base/security/` | 安全认证模块 |
| 异常处理 | `base/handler/` | 全局异常处理 |
| 日志 AOP | `base/log/` | 操作日志 |
| 工具类 | `base/util/` | JWT/Result 等 |
| 系统管理 | `modules/back/system/` | RBAC 权限 |

### 4.2 ❌ 不需要的模块

| 模块 | 说明 |
|------|------|
| hosp | 科室管理 |
| information | 字典/公告等 |
| medical | 原有病历业务 |
| front | 前台模块 |

---

## 5. 与新项目的主要差异

| 项目 | 原项目 | 新项目 |
|------|--------|--------|
| Spring Boot | 2.5.0 | 3.2.0 |
| Java | 8 | 17+ |
| 数据库 | MySQL | PostgreSQL |
| 文件存储 | 阿里云 OSS | MinIO |
| ORM | MyBatis-Plus | MyBatis (纯注解) |
| API 框架 | 传统 CRUD | APIJSON 8.0.2 |

---

## 6. 迁移注意事项

### 6.1 Spring Boot 2 → 3 变化

```java
// 包名变化
javax.* → jakarta.*

// Security 配置变化
// 原: extends WebSecurityConfigurerAdapter
// 新: @Bean SecurityFilterChain

// 例如:
@Bean
public SecurityFilterChain filterChain(HttpSecurity http) {
    // 配置
    return http.build();
}
```

### 6.2 密码加密变化

原项目使用自定义 MD5 加密，新项目建议使用 BCrypt:

```java
// 原项目
@Component
public class CustomMd5PasswordEncoder implements PasswordEncoder {
    // MD5 加密
}

// 新项目
@Bean
public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
}
```

### 6.3 当前项目实际实现

当前项目已成功迁移到 Spring Boot 3.2.0，并实现了以下关键特性：

1. **安全配置**: 使用 `@Bean SecurityFilterChain` 方式配置 Spring Security
2. **密码加密**: 使用 BCryptPasswordEncoder 进行密码加密
3. **数据库**: 使用 PostgreSQL 替代 MySQL，配置了 Druid 连接池
4. **文件存储**: 集成 MinIO 作为对象存储服务
5. **API 框架**: 集成 APIJSON 8.0.2 实现零代码 CRUD 接口
6. **API 文档**: 使用 SpringDoc (Swagger UI) 替代 Knife4j

### 6.4 项目结构对比

**原项目结构**:
```
electronic_case_system/
├── pom.xml
├── src/main/java/com/qingfeng/electronic/
│   ├── ElectronicCaseSystemApplication.java
│   ├── base/                    # 基础模块
│   ├── config/                  # 配置类
│   └── modules/
│       ├── back/                # 后台管理
│       │   ├── system/          # 权限管理
│       │   └── ...              # 其他业务模块
│       └── front/               # 前台
```

**当前项目结构**:
```
CCY_EMR_SERVICE/
├── pom.xml
├── .gitmodules                 # Git 子模块配置
├── CCY_EMR_UI/                 # 前端子模块
├── src/main/java/com/ccy/emr/
│   ├── EmrApplication.java      # 启动类
│   ├── common/                 # 公共模块
│   ├── config/                 # 配置类
│   ├── security/               # 安全模块
│   ├── apijson/                # APIJSON 集成
│   └── modules/                # 业务模块
│       ├── auth/               # 认证模块
│       ├── system/             # 系统管理 (RBAC)
│       ├── file/               # 文件管理
│       └── health/             # 健康检查
└── doc/                        # 文档目录
    ├── ai/                     # AI 交互文档
    ├── api-docs/               # API 接口文档
    ├── sql/                    # SQL 脚本
    └── python/                 # Python 脚本
```

当前项目采用了更现代化的架构设计，通过 Git Submodule 集成前端，并建立了完善的文档体系。

## 7. 参考资源

- 原项目 Security 配置: `base/security/config/WebSecurityConfig.java`
- 原项目 JWT 工具: `base/util/utils/JwtHelper.java`
- 原项目登录过滤器: `base/security/filter/TokenLoginFilter.java`

---

> 本文档为原项目分析报告，用于二次开发参考。
