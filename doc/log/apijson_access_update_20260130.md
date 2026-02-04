# APIJSON ACCESS 表配置更新总结 (2026-01-30)

## 背景
根据用户要求，完善 APIJSON 的 ACCESS 表配置，确保所有新添加的业务表都有正确的访问权限配置。

## 新增的业务表

### 1. 数据元值域相关表
- `emr_value_domain` - 数据元值域主表
- `emr_value_domain_item` - 数据元值域项表

### 2. 门诊就诊过程表  
- `outpatient_encounter_data` - 门诊就诊过程结构化数据表

### 3. 电子病历管理系统相关表
- `emr_template_department` - 病历模板-科室关联表
- `emr_record_version` - 病历版本表  
- `doctor_favorite_template` - 医生收藏病历模板关联表

### 4. 医嘱系统相关表
- `medical_order` - 医嘱主表
- `medical_order_drug` - 药品医嘱明细表
- `medical_order_exam` - 检查医嘱明细表
- `exam_result` - 检查结果表
- `medical_order_lab` - 检验医嘱明细表  
- `lab_result` - 检验结果表

## 配置策略

### 访问权限分配原则
- **基础信息表** (`sys_department`, `doctor`, `emr_data_element`, `emr_data_set`, `emr_value_domain`): 
  - 允许 `UNKNOWN` (未登录)、`LOGIN` (已登录)、`ADMIN` (管理员) 查询
  - 仅允许 `ADMIN` 进行增删改操作
  
- **业务核心表** (`patient`, `registration`, `outpatient_visit`, `emr_template`, `emr_record`, `medical_order` 等):
  - 仅允许 `LOGIN` (已登录)、`ADMIN` (管理员) 访问
  - 业务操作权限根据实际需求分配

### 别名映射（修正后）
为每个表配置了符合 PascalCase 规范的别名，便于前端调用：
- `emr_value_domain` → `ValueDomain`
- `emr_value_domain_item` → `ValueDomainItem`  
- `outpatient_encounter_data` → `OutpatientEncounterData`
- `emr_template_department` → `EmrTemplateDepartment`
- `emr_record_version` → `EmrRecordVersion`
- `doctor_favorite_template` → `DoctorFavoriteTemplate`
- `medical_order` → `MedicalOrder`
- `medical_order_drug` → `MedicalOrderDrug`
- `medical_order_exam` → `MedicalOrderExam`
- `exam_result` → `ExamResult`
- `medical_order_lab` → `MedicalOrderLab`
- `lab_result` → `LabResult`

## 文件更新

### 1. 后端配置文件
- **文件**: `doc/sql/apijson_config.sql`
- **变更**: 
  - 添加了所有新表的权限配置
  - **修正了别名命名规范**，确保符合 PascalCase 且准确反映表含义

### 2. 前端文档
- **文件**: `CCY_EMR_UI/doc/apijson_access_summary.md`
- **内容**: 完整的 ACCESS 表配置总结，包含修正后的别名配置

### 3. 项目 README 更新
- **后端 README**: `README.md` - 添加了 APIJSON 配置说明和文档引用
- **前端 README**: `CCY_EMR_UI/README.md` - 添加了 APIJSON 文档链接和使用说明

### 4. 新增维护脚本
- **`doc/sql/missing_access_config.sql`**: 添加缺失 ACCESS 配置
- **`doc/sql/update_access_alias.sql`**: 修正现有错误别名
- **`doc/sql/check_access_status.sql`**: 检查 ACCESS 表状态

## 验证方法

### 1. 数据库验证
执行以下 SQL 查询验证 ACCESS 表配置是否正确：

```
-- 查看所有配置的表
SELECT name, alias, get, post, put, delete 
FROM "Access" 
ORDER BY id;

-- 验证特定表的配置
SELECT * FROM "Access" WHERE name = 'emr_template_department';
```

### 2. APIJSON 接口测试
使用 Postman 或 curl 测试新配置的表是否可以正常访问：

```
# 测试查询权限（应该成功）
curl -X POST http://localhost:8080/apijson/gets \
  -H "Content-Type: application/json" \
  -d '{"EmrTemplateDepartment[]": {"count": 5}}'

# 测试使用实际表名（也应该成功）
curl -X POST http://localhost:8080/apijson/gets \
  -H "Content-Type: application/json" \
  -d '{"emr_template_department[]": {"count": 5}}'
```

## 注意事项

1. **表名大小写**: APIJSON 中表名区分大小写，必须严格匹配 ACCESS 表中的 `name` 字段
2. **别名规范**: 别名应遵循 PascalCase 命名规范，准确反映表的业务含义
3. **路径规范**: APIJSON 请求路径必须为 `/apijson/{method}`，不能使用其他路径
4. **字段返回**: 查询时必须显式指定需要返回的字段，否则只返回主键
5. **权限验证**: 确保 Spring Security 配置中已放行 `/apijson/**` 路径

## 后续维护

- 当新增业务表时，需要及时在 `apijson_config.sql` 中添加对应的 ACCESS 配置
- 前端文档 `apijson_access_summary.md` 应与后端配置保持同步更新
- 定期验证各表的访问权限是否符合业务需求
- **别名命名必须遵循 PascalCase 规范并准确反映表含义**
