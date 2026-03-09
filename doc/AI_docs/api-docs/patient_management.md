# 患者管理功能开发文档

## 1. 功能概述

本模块实现了患者信息的增删改查（CRUD）功能，并严格控制了访问权限和数据校验。

### 1.1 权限控制
- **菜单可见性**：所有登录用户均可见“患者管理”菜单。
- **页面访问**：点击菜单进入页面时，系统会检查当前用户角色。
  - **管理员 (admin)**：可以正常访问页面，进行数据的查询、新增、修改和删除操作。
  - **普通用户**：访问页面时会被拦截，显示“无权限访问” (403 Forbidden) 提示页，无法查看任何数据。
- **接口权限**：后端 APIJSON 配置了严格的表级权限，`Patient` 表的增删改查操作仅允许 `ADMIN` 角色执行。

### 1.2 数据校验
- **后端校验**：通过 APIJSON 的 `Request` 表配置，实现了字段的必填校验、正则校验和枚举值校验。
- **前端校验**：在表单提交前进行格式校验，提供即时的错误提示。

---

## 2. 数据库设计与配置

### 2.1 患者表 (Patient) 结构
| 字段名 | 类型 | 说明 | 约束 |
| :--- | :--- | :--- | :--- |
| id | bigint | 主键 ID | Primary Key |
| patient_code | varchar(64) | 患者唯一编码 | Not Null |
| patient_name | varchar(64) | 患者姓名 | Not Null |
| gender_code | varchar(32) | 性别代码 | Not Null (0, 1, 2, 9) |
| birthday | date | 出生日期 | Nullable |
| id_card | varchar(18) | 身份证号 | Nullable |
| phone | varchar(20) | 联系电话 | Nullable |
| create_time | timestamp | 创建时间 | Default Now() |
| update_time | timestamp | 更新时间 | Default Now() |

### 2.2 APIJSON 权限配置 (Access 表)
| name | alias | get | head | gets | heads | post | put | delete |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| patient | Patient | ["ADMIN"] | ["ADMIN"] | ["ADMIN"] | ["ADMIN"] | ["ADMIN"] | ["ADMIN"] | ["ADMIN"] |

> **说明**：`get` 权限设置为 `["ADMIN"]`，确保只有管理员能调用查询接口。

### 2.3 APIJSON 校验配置 (Request 表)

#### POST (新增)
```json
{
    "MUST": "patient_name,gender_code,patient_code",
    "REFUSE": "id",
    "gender_code{0,1,2,9}": 0,
    "phone": "phone",
    "id_card": "id_card",
    "patient_name": "^[\\u4e00-\\u9fa5a-zA-Z]{2,20}$"
}
```

#### PUT (修改)
```json
{
    "MUST": "id",
    "REFUSE": "patient_code",
    "gender_code{0,1,2,9}": 0,
    "phone": "phone",
    "id_card": "id_card",
    "patient_name": "^[\\u4e00-\\u9fa5a-zA-Z]{2,20}$"
}
```

---

## 3. 接口定义 (APIJSON)

所有接口通过统一入口 `/api/get`, `/api/post`, `/api/put`, `/api/delete` 调用。

### 3.1 查询患者列表 (GET)
**请求 URL**: `/api/get`
**请求体**:
```json
{
    "Patient[]": {
        "count": 10, // 每页数量
        "page": 0,   // 页码（从0开始）
        "query": 2,  // 同时查询总数
        "patient_name$": "%张%", // 模糊查询
        "gender_code": "1",      // 精确查询
        "order": "create_time-"  // 按创建时间倒序
    }
}
```

### 3.2 新增患者 (POST)
**请求 URL**: `/api/post`
**请求体**:
```json
{
    "Patient": {
        "patient_name": "张三",
        "gender_code": "1",
        "patient_code": "P1740000000123", // 前端生成
        "phone": "13800138000",
        "id_card": "110101199001011234",
        "birthday": "1990-01-01"
    },
    "tag": "Patient" // 触发校验
}
```

### 3.3 修改患者 (PUT)
**请求 URL**: `/api/put`
**请求体**:
```json
{
    "Patient": {
        "id": 1001,
        "patient_name": "张三丰",
        "phone": "13900139000"
    },
    "tag": "Patient"
}
```

### 3.4 删除患者 (DELETE)
**请求 URL**: `/api/delete`
**请求体**:
```json
{
    "Patient": {
        "id": 1001
    },
    "tag": "Patient"
}
```

---

## 4. 前端实现细节

### 4.1 页面结构
- **路径**: `src/pages/Patient/index.tsx`
- **组件**: 使用 `Ant Design Pro` 的 `ProTable` 和 `ModalForm`。

### 4.2 权限逻辑
```typescript
const { initialState } = useModel('@@initialState');
const isAdmin = initialState?.currentUser?.username === 'admin';

if (!isAdmin) {
  return <Result status="403" title="无权限访问" ... />;
}
```

### 4.3 字段校验规则
1.  **姓名**: 必填，正则 `^[\u4e00-\u9fa5a-zA-Z]{2,20}$` (2-20位中英文)。
2.  **性别**: 必填，下拉选择 (0:未知, 1:男, 2:女, 9:未说明)。
3.  **身份证号**: 正则 `/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/`。
4.  **手机号**: 正则 `/^1[3-9]\d{9}$/`。

### 4.4 其他功能
- **返回首页**: 页面顶部通过 Layout 自带导航或 403 页面的“返回上一页”按钮实现。
- **当前用户显示**: 通过全局 Layout 的 Header 显示当前登录用户信息。
