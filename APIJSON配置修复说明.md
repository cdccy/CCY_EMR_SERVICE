# APIJSON 配置修复说明

## 问题概述

启动应用时 APIJSON 初始化报错,主要问题:
1. Function 表不存在,导致远程函数配置失败
2. Script 表不存在,导致脚本配置失败
3. Access 表权限配置不完整

## 已完成的修复

### ✅ 1. 更新 DemoSQLConfig.java

文件位置: `src/main/java/com/ccy/emr/apijson/DemoSQLConfig.java`

添加了配置表列表方法:
```java
@Override
public java.util.List<String> getConfigTableList() {
    return java.util.Arrays.asList(
        "Access",      // 权限配置表
        "Function",    // 远程函数配置表
        "Script",      // 脚本配置表  
        "Request"      // 请求参数校验表
    );
}
```

### ✅ 2. 创建 APIJSON 配置 SQL 脚本

文件位置: `doc/sql/apijson_config.sql`

包含内容:
- Function 表结构和示例数据 (3 个函数)
- Script 表结构和示例数据 (3 个脚本)
- Access 表权限配置更新 (16 个表)
- 业务表访问权限配置

### ✅ 3. 执行 SQL 脚本

```bash
docker exec -i emr-postgres psql -U emr_user -d emr_db < doc/sql/apijson_config.sql
```

执行结果:
- Function 表: 3 条记录 ✅
- Script 表: 3 条记录 ✅
- Access 表: 16 条配置 ✅

## 下一步操作

### 方式 1: 重启应用 (推荐)

如果应用正在 IDE 中运行:
1. 停止当前运行的应用
2. 重新运行 `EmrApplication.java`
3. 观察启动日志,确认 APIJSON 初始化成功

### 方式 2: 使用 Maven 启动

```bash
cd /Users/ccy/Desktop/毕业设计/毕业设计项目资料代码/CCY_EMR_SERVICE
mvn spring-boot:run
```

## 验证修复

### 检查启动日志

启动成功后,应该看到:

```
<<<<<<<<<<<<<<<<<<<<<<<<< APIJSON 启动完成，试试调用零代码万能通用 API 吧 ^_^ >>>>>>>>>>>>>>>>>>>>>>>>
```

**不应该出现:**
- ❌ `Function 不允许 UNKNOWN 用户的 GET 请求！`
- ❌ `不允许调用远程函数 countArray !`

### 测试 API

启动成功后,可以测试 APIJSON API:

```bash
# 测试 Function 表查询
curl -X POST http://localhost:8080/api/get \
  -H "Content-Type: application/json" \
  -d '{"Function": {"@column": "id,name"}}'
```

期望返回:
```json
{
  "Function": {
    "id": 1,
    "name": "countArray"
  },
  "ok": true,
  "code": 200
}
```

## 相关文档

- 详细修复记录: `doc/log/APIJSON配置修复记录.md`
- SQL 脚本说明: `doc/sql/README.md`
- 测试用例: `doc/test/apijson_test.md`

## 技术支持

如果仍有问题,请检查:
1. 数据库是否正常运行: `docker ps | grep postgres`
2. 数据库表是否创建成功: 查看 `doc/sql/README.md` 中的验证 SQL
3. 应用配置是否正确: 检查 `application-dev.yml` 中的数据库连接信息

---

**修复完成时间**: 2026-01-29  
**修复状态**: ✅ 已完成,等待重启验证
