# 数据库初始化脚本说明

## 执行顺序

请按照以下顺序执行 SQL 脚本:

### 1. 基础表结构初始化 (init.sql)
```bash
psql -U emr_user -d emr_db -f init.sql
```

**包含内容:**
- 系统管理表 (用户、角色、菜单、权限)
- APIJSON 配置表 (Access、Request、Document)
- 初始化管理员用户 (用户名: admin, 密码: 123456)
- 基础权限配置

### 2. 业务表结构初始化 (init2.sql)
```bash
psql -U emr_user -d emr_db -f init2.sql
```

**包含内容:**
- 数据元与数据集模块 (22张表)
- 挂号与门诊就诊体系
- 电子病历管理系统
- 医嘱系统

### 3. APIJSON 配置初始化 (apijson_config.sql)
```bash
psql -U emr_user -d emr_db -f apijson_config.sql
```

**包含内容:**
- Function 远程函数配置表
- Script 脚本配置表
- 更新 Access 表权限配置
- 初始化示例函数和脚本
- 为业务表添加 APIJSON 访问权限

## 一键执行所有脚本

```bash
# 方式1: 使用 psql 命令行
psql -U emr_user -d emr_db -f init.sql
psql -U emr_user -d emr_db -f init2.sql
psql -U emr_user -d emr_db -f apijson_config.sql

# 方式2: 使用 shell 脚本
cd /Users/ccy/Desktop/毕业设计/毕业设计项目资料代码/CCY_EMR_SERVICE/doc/sql
for file in init.sql init2.sql apijson_config.sql; do
    echo "执行 $file ..."
    psql -U emr_user -d emr_db -f $file
done
```

## 验证初始化结果

执行以下 SQL 验证表是否创建成功:

```sql
-- 查看所有表
SELECT tablename 
FROM pg_tables 
WHERE schemaname = 'public' 
ORDER BY tablename;

-- 查看 APIJSON 配置表数据
SELECT * FROM "Access" ORDER BY id;
SELECT * FROM "Function" ORDER BY id;
SELECT * FROM "Script" ORDER BY id;
SELECT * FROM "Request" ORDER BY id;

-- 查看管理员用户
SELECT id, username, name, status FROM sys_user;

-- 查看角色
SELECT id, role_name, role_code FROM sys_role;
```

## 常见问题

### 1. 权限不足
```bash
# 确保使用正确的数据库用户
psql -U emr_user -d emr_db

# 或者使用超级用户
psql -U postgres -d emr_db
```

### 2. 表已存在
脚本中已包含 `DROP TABLE IF EXISTS` 语句,可以安全地重复执行。

### 3. 外键约束错误
请确保按照顺序执行脚本,因为某些表之间存在外键依赖关系。

## APIJSON 配置说明

### Access 表权限配置

权限角色说明:
- `UNKNOWN`: 未登录用户
- `LOGIN`: 已登录用户
- `ADMIN`: 管理员

权限操作说明:
- `get`: 单个查询
- `head`: 单个查询(仅返回数量)
- `gets`: 批量查询
- `heads`: 批量查询(仅返回数量)
- `post`: 新增
- `put`: 修改
- `delete`: 删除

### Function 表说明

存储 APIJSON 远程函数配置,用于扩展 API 功能。

### Script 表说明

存储 JavaScript 脚本,用于实现远程函数的具体逻辑。

### Request 表说明

存储请求参数校验规则,用于验证前端传参是否符合要求。

## 下一步

初始化完成后,可以启动应用程序:

```bash
# 启动后端服务
mvn spring-boot:run

# 或使用 IDE 运行 EmrApplication.java
```

访问 APIJSON 测试页面:
- http://localhost:8080/api/get
- http://apijson.cn/api?type=JSON&url=http://localhost:8080/api/get

## 门诊闭环说明文档

- 医嘱/病历/就诊三条流转总览（含关键触发器）：`doc/log/门诊医生站_医嘱病历就诊流转说明_20260410.md`
