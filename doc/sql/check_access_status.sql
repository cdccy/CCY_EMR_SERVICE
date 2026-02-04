-- ============================================================
-- 检查 ACCESS 表配置状态脚本
-- 执行此脚本可以查看当前数据库中已配置的表和缺失的表
-- ============================================================

-- 1. 查看当前所有已配置的 ACCESS 表
SELECT 
    name as "实际表名",
    alias as "别名",
    get as "GET权限",
    post as "POST权限",
    delete as "DELETE权限"
FROM "Access" 
ORDER BY name;

-- 2. 统计当前配置的表数量
SELECT COUNT(*) as "当前ACCESS表数量" FROM "Access";

-- 3. 列出应该配置的所有表（基于 apijson_config.sql）
WITH expected_tables AS (
    SELECT 'Function' as table_name, 'Function' as expected_alias
    UNION SELECT 'Script', 'Script'
    UNION SELECT 'Request', 'Request'  
    UNION SELECT 'Document', 'Document'
    UNION SELECT 'sys_user', 'User'
    UNION SELECT 'sys_role', 'Role'
    UNION SELECT 'sys_menu', 'Menu'
    UNION SELECT 'patient', 'Patient'
    UNION SELECT 'registration', 'Registration'
    UNION SELECT 'outpatient_visit', 'OutpatientVisit'
    UNION SELECT 'sys_department', 'Department'
    UNION SELECT 'doctor', 'Doctor'
    UNION SELECT 'emr_data_element', 'DataElement'
    UNION SELECT 'emr_data_set', 'DataSet'
    UNION SELECT 'emr_data_set_element', 'DataSetElement'
    UNION SELECT 'emr_template', 'EmrTemplate'
    UNION SELECT 'emr_record', 'EmrRecord'
    UNION SELECT 'emr_value_domain', 'ValueDomain'
    UNION SELECT 'emr_value_domain_item', 'ValueDomainItem'
    UNION SELECT 'outpatient_encounter_data', 'OutpatientEncounterData'
    UNION SELECT 'emr_template_department', 'EmrTemplateDepartment'
    UNION SELECT 'emr_record_version', 'EmrRecordVersion'
    UNION SELECT 'doctor_favorite_template', 'DoctorFavoriteTemplate'
    UNION SELECT 'medical_order', 'MedicalOrder'
    UNION SELECT 'medical_order_drug', 'MedicalOrderDrug'
    UNION SELECT 'medical_order_exam', 'MedicalOrderExam'
    UNION SELECT 'exam_result', 'ExamResult'
    UNION SELECT 'medical_order_lab', 'MedicalOrderLab'
    UNION SELECT 'lab_result', 'LabResult'
)
-- 4. 找出缺失的表或别名不匹配的表
SELECT 
    et.table_name as "表名",
    et.expected_alias as "期望别名",
    a.alias as "当前别名",
    CASE 
        WHEN a.name IS NULL THEN '缺失'
        WHEN a.alias != et.expected_alias THEN '别名不匹配'
        ELSE '正常'
    END as "状态"
FROM expected_tables et
LEFT JOIN "Access" a ON et.table_name = a.name
WHERE a.name IS NULL OR a.alias != et.expected_alias
ORDER BY et.table_name;

-- 5. 显示问题表的数量
WITH expected_tables AS (
    SELECT 'Function' as table_name, 'Function' as expected_alias
    UNION SELECT 'Script', 'Script'
    UNION SELECT 'Request', 'Request'  
    UNION SELECT 'Document', 'Document'
    UNION SELECT 'sys_user', 'User'
    UNION SELECT 'sys_role', 'Role'
    UNION SELECT 'sys_menu', 'Menu'
    UNION SELECT 'patient', 'Patient'
    UNION SELECT 'registration', 'Registration'
    UNION SELECT 'outpatient_visit', 'OutpatientVisit'
    UNION SELECT 'sys_department', 'Department'
    UNION SELECT 'doctor', 'Doctor'
    UNION SELECT 'emr_data_element', 'DataElement'
    UNION SELECT 'emr_data_set', 'DataSet'
    UNION SELECT 'emr_data_set_element', 'DataSetElement'
    UNION SELECT 'emr_template', 'EmrTemplate'
    UNION SELECT 'emr_record', 'EmrRecord'
    UNION SELECT 'emr_value_domain', 'ValueDomain'
    UNION SELECT 'emr_value_domain_item', 'ValueDomainItem'
    UNION SELECT 'outpatient_encounter_data', 'OutpatientEncounterData'
    UNION SELECT 'emr_template_department', 'EmrTemplateDepartment'
    UNION SELECT 'emr_record_version', 'EmrRecordVersion'
    UNION SELECT 'doctor_favorite_template', 'DoctorFavoriteTemplate'
    UNION SELECT 'medical_order', 'MedicalOrder'
    UNION SELECT 'medical_order_drug', 'MedicalOrderDrug'
    UNION SELECT 'medical_order_exam', 'MedicalOrderExam'
    UNION SELECT 'exam_result', 'ExamResult'
    UNION SELECT 'medical_order_lab', 'MedicalOrderLab'
    UNION SELECT 'lab_result', 'LabResult'
)
SELECT 
    COUNT(*) as "问题表数量"
FROM expected_tables et
LEFT JOIN "Access" a ON et.table_name = a.name
WHERE a.name IS NULL OR a.alias != et.expected_alias;