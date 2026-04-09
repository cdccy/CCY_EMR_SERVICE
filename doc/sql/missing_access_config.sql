-- ============================================================
-- APIJSON 缺失的 ACCESS 表配置补充脚本
-- 执行此脚本将添加所有缺失的业务表访问权限配置
-- ============================================================

-- 为 APIJSON 配置表添加权限配置（如果不存在）
INSERT INTO "Access" (name, alias, get, head, gets, heads, post, put, delete)
VALUES 
    ('Function', 'Function', 
     '["UNKNOWN","LOGIN","ADMIN"]', 
     '["UNKNOWN","LOGIN","ADMIN"]',
     '["UNKNOWN","LOGIN","ADMIN"]', 
     '["UNKNOWN","LOGIN","ADMIN"]',
     '["ADMIN"]', 
     '["ADMIN"]', 
     '["ADMIN"]'),
    ('Script', 'Script', 
     '["UNKNOWN","LOGIN","ADMIN"]', 
     '["UNKNOWN","LOGIN","ADMIN"]',
     '["UNKNOWN","LOGIN","ADMIN"]', 
     '["UNKNOWN","LOGIN","ADMIN"]',
     '["ADMIN"]', 
     '["ADMIN"]', 
     '["ADMIN"]'),
    ('Request', 'Request', 
     '["UNKNOWN","LOGIN","ADMIN"]', 
     '["UNKNOWN","LOGIN","ADMIN"]',
     '["UNKNOWN","LOGIN","ADMIN"]', 
     '["UNKNOWN","LOGIN","ADMIN"]',
     '["ADMIN"]', 
     '["ADMIN"]', 
     '["ADMIN"]'),
    ('Document', 'Document', 
     '["LOGIN","ADMIN"]', 
     '["LOGIN","ADMIN"]',
     '["LOGIN","ADMIN"]', 
     '["LOGIN","ADMIN"]',
     '["LOGIN","ADMIN"]', 
     '["LOGIN","ADMIN"]', 
     '["ADMIN"]')
ON CONFLICT (name) DO UPDATE SET
    get = EXCLUDED.get,
    head = EXCLUDED.head,
    gets = EXCLUDED.gets,
    heads = EXCLUDED.heads,
    post = EXCLUDED.post,
    put = EXCLUDED.put,
    delete = EXCLUDED.delete;

-- 添加业务表的访问权限配置
INSERT INTO "Access" (name, alias, get, head, gets, heads, post, put, delete)
VALUES 
    -- 基础业务表
    ('patient', 'Patient', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'),
    ('registration', 'Registration', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    ('outpatient_visit', 'OutpatientVisit', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    ('outpatient_visit_active', 'OutpatientVisitActive', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    ('outpatient_visit_history', 'OutpatientVisitHistory', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    ('sys_department', 'Department', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'),
    ('doctor', 'Doctor', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'),
    
    -- 数据元与数据集模块
    ('emr_data_element', 'DataElement', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'),
    ('emr_data_set', 'DataSet', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'),
    ('emr_data_set_element', 'DataSetElement', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'),
    ('emr_drug_dictionary', 'DrugDictionary', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'),
    
    -- 电子病历管理系统
    ('emr_template', 'EmrTemplate', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    ('emr_record', 'EmrRecord', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    
    -- 新增的数据元值域相关表
    ('emr_value_domain', 'ValueDomain', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'),
    ('emr_value_domain_item', 'ValueDomainItem', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'),
    
    -- 新增的病历模板关联表
    ('emr_template_department', 'EmrTemplateDepartment', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'),
    
    -- 新增的病历版本表
    ('emr_record_version', 'EmrRecordVersion', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    
    -- 新增的医生收藏模板表
    ('doctor_favorite_template', 'DoctorFavoriteTemplate', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'),
    
    -- 新增的门诊就诊过程表
    ('outpatient_encounter_data', 'OutpatientEncounterData', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    
    -- 新增的医嘱系统相关表
    ('medical_order', 'MedicalOrder', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    ('medical_order_drug', 'MedicalOrderDrug', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    ('medical_order_exam', 'MedicalOrderExam', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    ('exam_result', 'ExamResult', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    ('medical_order_lab', 'MedicalOrderLab', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
    ('lab_result', 'LabResult', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]')
ON CONFLICT (name) DO UPDATE SET
    alias = EXCLUDED.alias,
    get = EXCLUDED.get,
    head = EXCLUDED.head,
    gets = EXCLUDED.gets,
    heads = EXCLUDED.heads,
    post = EXCLUDED.post,
    put = EXCLUDED.put,
    delete = EXCLUDED.delete;

-- 验证配置是否成功
SELECT name, alias, get, post, delete 
FROM "Access" 
WHERE name IN (
    'Function', 'Script', 'Request', 'Document',
    'patient', 'registration', 'outpatient_visit', 'outpatient_visit_active', 'outpatient_visit_history', 'sys_department', 'doctor',
    'emr_data_element', 'emr_data_set', 'emr_data_set_element',
    'emr_drug_dictionary',
    'emr_template', 'emr_record',
    'emr_value_domain', 'emr_value_domain_item',
    'outpatient_encounter_data',
    'emr_template_department', 'emr_record_version', 'doctor_favorite_template',
    'medical_order', 'medical_order_drug', 'medical_order_exam', 'exam_result', 'medical_order_lab', 'lab_result'
)
ORDER BY name;

-- 显示总配置数量
SELECT COUNT(*) as total_access_records FROM "Access";
