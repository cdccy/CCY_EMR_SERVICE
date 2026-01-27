# CCY EMR Service

电子病历管理系统后端服务

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

### 3. 构建并运行

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
    ├── sql/                         # SQL 脚本
    └── ai/                          # AI 生成文档
```

## API 接口

### 认证接口

- `POST /api/auth/login` - 用户登录
- `POST /api/auth/logout` - 用户登出
- `GET /api/auth/info` - 获取当前用户信息

### 文件接口

- `POST /api/file/upload` - 上传文件
- `DELETE /api/file/delete` - 删除文件

## 更多文档

详细文档请查看 `doc/ai/` 目录
