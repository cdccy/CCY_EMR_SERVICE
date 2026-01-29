# APIJSON 测试用例

## 测试环境

- 应用地址: http://localhost:8080/api
- 数据库: PostgreSQL 16
- APIJSON 版本: 8.0.2

## 测试前提

1. 应用已启动
2. 数据库已初始化(执行了 init.sql, init2.sql, apijson_config.sql)
3. Access 表已配置权限

## 测试用例

### 1. 测试 Access 表查询 (验证权限配置)

**请求:**
```bash
curl -X POST http://localhost:8080/api/get \
  -H "Content-Type: application/json" \
  -d '{
    "Access": {
      "@column": "id,name,alias"
    }
  }'
```

**期望结果:**
- 返回 Access 表的数据
- 包含 Function, Script, Request 等配置

### 2. 测试 Function 表查询 (验证远程函数配置)

**请求:**
```bash
curl -X POST http://localhost:8080/api/get \
  -H "Content-Type: application/json" \
  -d '{
    "Function": {
      "@column": "id,name,arguments,demo"
    }
  }'
```

**期望结果:**
- 返回 Function 表的数据
- 包含 countArray, isContain, getFromArray 函数

### 3. 测试 Script 表查询 (验证脚本配置)

**请求:**
```bash
curl -X POST http://localhost:8080/api/get \
  -H "Content-Type: application/json" \
  -d '{
    "Script": {
      "@column": "id,name,language"
    }
  }'
```

**期望结果:**
- 返回 Script 表的数据
- 包含 JavaScript 脚本

### 4. 测试数组查询 (验证 APIJSON 基础功能)

**请求:**
```bash
curl -X POST http://localhost:8080/api/get \
  -H "Content-Type: application/json" \
  -d '{
    "[]": {
      "Access": {
        "@column": "id,name,alias",
        "@order": "id+"
      },
      "count": 5
    }
  }'
```

**期望结果:**
- 返回 Access 表的前 5 条数据
- 按 id 升序排列

### 5. 测试业务表查询 (验证业务表权限)

#### 5.1 查询科室表

**请求:**
```bash
curl -X POST http://localhost:8080/api/get \
  -H "Content-Type: application/json" \
  -d '{
    "Department": {
      "@column": "id,dept_code,dept_name"
    }
  }'
```

**期望结果:**
- 如果表中有数据,返回科室信息
- 如果表为空,返回空对象

#### 5.2 查询数据元表

**请求:**
```bash
curl -X POST http://localhost:8080/api/get \
  -H "Content-Type: application/json" \
  -d '{
    "DataElement": {
      "@column": "id,element_code,element_name",
      "@order": "id+",
      "count": 10
    }
  }'
```

**期望结果:**
- 如果表中有数据,返回数据元信息
- 如果表为空,返回空数组

### 6. 测试远程函数调用

#### 6.1 测试 countArray 函数

**请求:**
```bash
curl -X POST http://localhost:8080/api/get \
  -H "Content-Type: application/json" \
  -d '{
    "[]": {
      "count": 3
    },
    "@explain": true
  }'
```

#### 6.2 测试 isContain 函数

**请求:**
```bash
curl -X POST http://localhost:8080/api/get \
  -H "Content-Type: application/json" \
  -d '{
    "test": {
      "array": [1, 2, 3, 4, 5],
      "value": 3,
      "@function": "isContain(array,value)"
    }
  }'
```

### 7. 测试权限校验

#### 7.1 测试未授权访问 (应该失败)

**请求:**
```bash
curl -X POST http://localhost:8080/api/post \
  -H "Content-Type: application/json" \
  -d '{
    "Access": {
      "name": "test_table",
      "alias": "TestTable"
    }
  }'
```

**期望结果:**
- 返回 401 或 403 错误
- 提示权限不足

## 验证启动日志

重启应用后,检查启动日志是否包含以下内容:

### 成功标志

```
<<<<<<<<<<<<<<<<<<<<<<<<< APIJSON 开始启动 >>>>>>>>>>>>>>>>>>>>>>>>

开始初始化: Access 权限校验配置 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
完成初始化: Access 权限校验配置 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

开始初始化: Function 远程函数配置 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
完成初始化: Function 远程函数配置 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

开始测试: Function 远程函数 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
完成测试: Function 远程函数 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

开始初始化: Request 请求参数校验配置 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
完成初始化: Request 请求参数校验校验配置 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

<<<<<<<<<<<<<<<<<<<<<<<<< APIJSON 启动完成，试试调用零代码万能通用 API 吧 ^_^ >>>>>>>>>>>>>>>>>>>>>>>>
```

### 不应该出现的错误

- ❌ `Function 不允许 UNKNOWN 用户的 GET 请求！`
- ❌ `不允许调用远程函数 countArray !`
- ❌ `查询远程函数异常`

## 在线测试工具

可以使用 APIJSON 官方提供的在线测试工具:

http://apijson.cn/api?type=JSON&url=http://localhost:8080/api/get

**注意:** 需要确保本地应用可以被外网访问,或者使用内网穿透工具。

## 故障排查

### 如果仍然报错

1. **检查数据库连接**
   ```bash
   docker exec -i emr-postgres psql -U emr_user -d emr_db -c "SELECT COUNT(*) FROM \"Function\";"
   ```

2. **检查 Access 表配置**
   ```bash
   docker exec -i emr-postgres psql -U emr_user -d emr_db -c "SELECT name, get FROM \"Access\" WHERE name IN ('Function', 'Script', 'Request');"
   ```

3. **检查应用配置**
   - 确认 `DemoSQLConfig.java` 中的 `getConfigTableList()` 方法已添加
   - 确认数据库连接信息正确

4. **查看完整启动日志**
   - 检查是否有其他错误信息
   - 确认 APIJSON 版本是否兼容

### 常见问题

**Q: 启动时提示 "Function 不允许 UNKNOWN 用户的 GET 请求"**

A: 检查 Access 表中 Function 的 get 字段是否包含 "UNKNOWN":
```sql
SELECT name, get FROM "Access" WHERE name = 'Function';
```

**Q: 远程函数测试失败**

A: 检查 Function 和 Script 表是否有数据:
```sql
SELECT COUNT(*) FROM "Function";
SELECT COUNT(*) FROM "Script";
```

**Q: 业务表无法访问**

A: 检查 Access 表中是否配置了业务表的访问权限:
```sql
SELECT name, alias, get FROM "Access" WHERE name LIKE '%patient%' OR name LIKE '%department%';
```

## 测试报告模板

```
测试时间: ____________________
测试人员: ____________________

| 测试用例 | 测试结果 | 备注 |
|---------|---------|------|
| Access 表查询 | ☐ 通过 ☐ 失败 | |
| Function 表查询 | ☐ 通过 ☐ 失败 | |
| Script 表查询 | ☐ 通过 ☐ 失败 | |
| 数组查询 | ☐ 通过 ☐ 失败 | |
| 业务表查询 | ☐ 通过 ☐ 失败 | |
| 远程函数调用 | ☐ 通过 ☐ 失败 | |
| 权限校验 | ☐ 通过 ☐ 失败 | |

总体评价: ____________________
```
