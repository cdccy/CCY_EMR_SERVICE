-- ============================================================
-- 更新 ACCESS 表别名修正脚本
-- 用于修正已存在的错误别名配置
-- ============================================================

-- 更新病历模板关联表别名
UPDATE "Access" 
SET alias = 'EmrTemplateDepartment' 
WHERE name = 'emr_template_department' AND alias != 'EmrTemplateDepartment';

-- 更新病历版本表别名
UPDATE "Access" 
SET alias = 'EmrRecordVersion' 
WHERE name = 'emr_record_version' AND alias != 'EmrRecordVersion';

-- 更新医生收藏模板表别名
UPDATE "Access" 
SET alias = 'DoctorFavoriteTemplate' 
WHERE name = 'doctor_favorite_template' AND alias != 'DoctorFavoriteTemplate';

-- 更新门诊就诊过程表别名
UPDATE "Access" 
SET alias = 'OutpatientEncounterData' 
WHERE name = 'outpatient_encounter_data' AND alias != 'OutpatientEncounterData';

-- 更新医嘱系统相关表别名
UPDATE "Access" 
SET alias = 'MedicalOrderDrug' 
WHERE name = 'medical_order_drug' AND alias != 'MedicalOrderDrug';

UPDATE "Access" 
SET alias = 'MedicalOrderExam' 
WHERE name = 'medical_order_exam' AND alias != 'MedicalOrderExam';

UPDATE "Access" 
SET alias = 'MedicalOrderLab' 
WHERE name = 'medical_order_lab' AND alias != 'MedicalOrderLab';

-- 验证更新结果
SELECT 
    name as "实际表名",
    alias as "修正后别名"
FROM "Access" 
WHERE name IN (
    'emr_template_department',
    'emr_record_version', 
    'doctor_favorite_template',
    'outpatient_encounter_data',
    'medical_order_drug',
    'medical_order_exam',
    'medical_order_lab'
)
ORDER BY name;