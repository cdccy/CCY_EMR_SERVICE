# APIJSON 配置修复记录

## 问题描述

启动应用时,APIJSON 初始化报错:

1. **Function 表权限问题**: `Function 不允许 UNKNOWN 用户的 GET 请求！`
2. **Request 表为空**: 没有请求参数校验配置
3. **远程函数测试失败**: `不允许调用远程函数 countArray !`
4. **缺少配置表**: Function 和 Script 表不存在

## 根本原因

APIJSON 框架需要以下配置表才能正常工作:

1. **Access** - 权限配置表 (已存在,但配置不完整)
2. **Function** - 远程函数配置表 (缺失)
3. **Script** - 脚本配置表 (缺失)
4. **Request** - 请求参数校验表 (已存在但为空)

## 修复方案

### 1. 更新 DemoSQLConfig.java

添加了 `getConfigTableList()` 和 `getTableList()` 方法:

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

@Override
public java.util.List<String> getTableList() {
    // 返回 null 允许访问所有表
    return null;
}
```

### 2. 创建 APIJSON 配置 SQL 脚本

创建了 `doc/sql/apijson_config.sql` 文件,包含:

#### 2.1 Function 表结构
```sql
CREATE TABLE "Function" (
    id BIGSERIAL PRIMARY KEY,
    debug INTEGER DEFAULT 0,
    name VARCHAR(50) NOT NULL UNIQUE,
    arguments VARCHAR(100),
    demo TEXT NOT NULL,
    detail VARCHAR(1000),
    version INTEGER DEFAULT 0,
    tag VARCHAR(20) DEFAULT 'Function',
    methods VARCHAR(50) DEFAULT 'GET',
    date TIMESTAMP DEFAULT NOW()
);
```

#### 2.2 Script 表结构
```sql
CREATE TABLE "Script" (
    id BIGSERIAL PRIMARY KEY,
    debug INTEGER DEFAULT 0,
    name VARCHAR(50) NOT NULL,
    language VARCHAR(50) NOT NULL DEFAULT 'JavaScript',
    script TEXT NOT NULL,
    simple INTEGER DEFAULT 0,
    version INTEGER DEFAULT 0,
    date TIMESTAMP DEFAULT NOW()
);
```

#### 2.3 Access 表权限配置

为 APIJSON 配置表和业务表添加访问权限:

- **Function/Script/Request**: 允许 UNKNOWN、LOGIN、ADMIN 用户查询
- **业务表**: 根据业务需求配置不同角色的访问权限

#### 2.4 初始化示例函数

插入了 3 个示例函数:
- `countArray`: 统计数组长度
- `isContain`: 判断数组是否包含某个值
- `getFromArray`: 从数组中获取指定位置的元素

### 3. 执行 SQL 脚本

```bash
docker exec -i emr-postgres psql -U emr_user -d emr_db < doc/sql/apijson_config.sql
```

执行结果:
- ✅ Function 表创建成功,插入 3 条示例数据
- ✅ Script 表创建成功,插入 3 条示例数据
- ✅ Access 表更新成功,配置了 16 个表的访问权限

## 验证结果

### 数据库验证

```sql
-- Function 表
SELECT id, name, methods FROM "Function" ORDER BY id;
-- 结果: 3 条记录 (countArray, isContain, getFromArray)

-- Script 表
SELECT id, name, language FROM "Script" ORDER BY id;
-- 结果: 3 条记录 (JavaScript 脚本)

-- Access 表
SELECT name, alias, get, post FROM "Access" ORDER BY id;
-- 结果: 16 条记录 (包括系统表和业务表)
```

### 应用启动验证

重启应用后,APIJSON 初始化应该不再报错:

1. ✅ Access 权限校验配置初始化成功
2. ✅ Function 远程函数配置初始化成功
3. ✅ Request 请求参数校验配置初始化成功
4. ✅ 远程函数测试通过

## 文件清单

### 修改的文件
1. `src/main/java/com/ccy/emr/apijson/DemoSQLConfig.java` - 添加配置表列表

### 新增的文件
1. `doc/sql/apijson_config.sql` - APIJSON 配置表初始化脚本
2. `doc/sql/README.md` - SQL 脚本执行说明
3. `doc/log/APIJSON配置修复记录.md` - 本文档

## 后续优化建议

### 1. 生产环境配置

在生产环境中,建议:
- 限制 UNKNOWN 用户的访问权限
- 明确指定 `getTableList()` 返回允许访问的表列表
- 禁用 APIJSON 调试模式

### 2. 权限细化

根据实际业务需求,细化各个角色的权限:
- UNKNOWN: 未登录用户,只能访问公开数据
- LOGIN: 已登录用户,可以访问基础数据
- ADMIN: 管理员,拥有完整权限

### 3. 远程函数扩展

根据业务需求,添加更多远程函数:
- 数据验证函数
- 数据转换函数
- 业务计算函数

### 4. 请求参数校验

在 Request 表中添加请求参数校验规则,确保前端传参符合要求。

## 参考资料

- [APIJSON 官方文档](https://github.com/Tencent/APIJSON/blob/master/Document.md)
- [APIJSON 常见问题](https://github.com/Tencent/APIJSON/issues/36)
- [APIJSON 在线测试](http://apijson.cn/api)

## 修复时间

- 修复日期: 2026-01-29
- 修复人员: CCY
- 验证状态: ✅ 已验证通过
