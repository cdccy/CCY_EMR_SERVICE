# CCY EMR Service

电子病历管理系统 - 前后端一体化项目

## 项目架构

本项目采用 Git Submodule 方式集成前后端：
- **后端**: Spring Boot 3.2.0 (当前仓库)
- **前端**: React + Ant Design Pro (作为子模块 `CCY_EMR_UI` 集成)

## 技术栈

| 技术 | 版本 | 说明 |
|------|------|------|
| Spring Boot | 3.2.0 | 核心框架 |
| Spring Security | 6.x | 安全认证 |
| PostgreSQL | 16 | 数据库 |
| Redis | 7 | 缓存 |
| MinIO | Latest | 对象存储 |
| APIJSON | 8.0.2 | 零代码接口 |
| JWT | 0.12.3 | Token 认证 |

## 快速开始

### 1. 启动依赖服务

```bash
# 启动 PostgreSQL + Redis + MinIO
docker-compose up -d
```

### 2. 验证服务状态

```bash
# 检查容器状态
docker-compose ps

# 访问 MinIO Console
# http://localhost:9001
# 用户名: minioadmin
# 密码: minioadmin123
```

### 3. 初始化前端子模块

```bash
# 初始化并更新子模块
git submodule init
git submodule update --remote

# 进入前端目录并安装依赖
cd CCY_EMR_UI
pnpm install

# 启动前端开发服务器
pnpm start
```

### 4. 构建并运行

```bash
# 构建项目
mvn clean package -DskipTests

# 运行项目
mvn spring-boot:run

# 或者直接运行 jar
java -jar target/emr-service-1.0.0-SNAPSHOT.jar
```

### 4. 访问接口

- API 文档: http://localhost:8080/api/swagger-ui.html
- 健康检查: http://localhost:8080/api/health

## 默认账户

| 用户名 | 密码 | 角色 |
|--------|------|------|
| admin | 123456 | 超级管理员 |

## 项目结构

```
CCY_EMR_SERVICE/
├── pom.xml                          # Maven 配置
├── docker-compose.yml               # Docker 服务编排
├── .gitmodules                      # Git 子模块配置
├── CCY_EMR_UI/                      # 前端子模块 (React + Ant Design Pro)
├── src/main/java/com/ccy/emr/
│   ├── EmrApplication.java          # 启动类
│   ├── common/                      # 公共模块
│   ├── config/                      # 配置类
│   ├── security/                    # 安全模块
│   └── modules/                     # 业务模块
│       ├── auth/                    # 认证模块
│       ├── system/                  # 系统管理
│       ├── file/                    # 文件管理
│       └── health/                  # 健康检查
├── src/main/resources/
│   ├── application.yml
│   └── application-dev.yml
└── doc/
    ├── api-docs/                    # API 接口文档
    ├── sql/                         # SQL 脚本
    │   ├── apijson_config.sql       # APIJSON 配置脚本（包含完整的 ACCESS 表配置）
    │   ├── init.sql                 # 基础表结构初始化
    │   └── init2.sql                # 业务表结构初始化
    ├── ai/                          # AI 生成文档和交互规则
    ├── log/                         # 日志相关文档
    ├── own/                         # 自定义文档
    └── python/                      # Python 脚本文档
```

## 文档规范

所有与 AI 工具（如 Cursor、Antigravity 等）的交互关键信息都维护在 `doc/ai/` 目录下。请参考 `doc/ai/ai-interaction-rules.md` 了解详细的交互规则。

## API 接口

### 认证接口

- `POST /api/auth/login` - 用户登录
- `POST /api/auth/logout` - 用户登出
- `GET /api/auth/info` - 获取当前用户信息

### 文件接口

- `POST /api/file/upload` - 上传文件
- `DELETE /api/file/delete` - 删除文件

### APIJSON 接口

- `POST /apijson/get` - 单条数据查询
- `POST /apijson/gets` - 列表数据查询
- `POST /apijson/post` - 新增数据
- `POST /apijson/put` - 更新数据
- `POST /apijson/delete` - 删除数据

**重要**: APIJSON 接口路径必须为 `/apijson/{method}`，不能使用 `/api/json` 等其他路径。

## APIJSON 配置说明

完整的 APIJSON ACCESS 表配置信息请参考：
- 后端: `doc/sql/apijson_config.sql`
- 前端: `CCY_EMR_UI/doc/apijson_access_summary.md`

## 更多文档

详细文档请查看 `doc/ai/` 目录