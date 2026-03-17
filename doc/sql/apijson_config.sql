-- ============================================================
-- APIJSON 配置表初始化脚本
-- 数据库: PostgreSQL 16+
-- 创建时间: 2026-01-29
-- 说明: 初始化 APIJSON 所需的配置表和基础数据
-- ============================================================

-- ============================================================
-- 1. Function 远程函数配置表
-- ============================================================
DROP TABLE IF EXISTS "Function" CASCADE;

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

COMMENT ON TABLE "Function" IS 'APIJSON 远程函数配置表';
COMMENT ON COLUMN "Function".id IS '主键ID';
COMMENT ON COLUMN "Function".debug IS '调试模式(0:关闭 1:开启)';
COMMENT ON COLUMN "Function".name IS '函数名称';
COMMENT ON COLUMN "Function".arguments IS '参数列表';
COMMENT ON COLUMN "Function".demo IS '函数示例';
COMMENT ON COLUMN "Function".detail IS '函数说明';
COMMENT ON COLUMN "Function".version IS '版本号';
COMMENT ON COLUMN "Function".tag IS '标签';
COMMENT ON COLUMN "Function".methods IS '允许的请求方法';
COMMENT ON COLUMN "Function".date IS '创建时间';

-- ============================================================
-- 2. Script 脚本配置表
-- ============================================================
DROP TABLE IF EXISTS "Script" CASCADE;

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

COMMENT ON TABLE "Script" IS 'APIJSON 脚本配置表';
COMMENT ON COLUMN "Script".id IS '主键ID';
COMMENT ON COLUMN "Script".debug IS '调试模式(0:关闭 1:开启)';
COMMENT ON COLUMN "Script".name IS '脚本名称';
COMMENT ON COLUMN "Script".language IS '脚本语言';
COMMENT ON COLUMN "Script".script IS '脚本内容';
COMMENT ON COLUMN "Script".simple IS '是否简化(0:否 1:是)';
COMMENT ON COLUMN "Script".version IS '版本号';
COMMENT ON COLUMN "Script".date IS '创建时间';

-- ============================================================
-- 3. 更新 Access 表配置
-- ============================================================

-- 首先为 Access 表的 name 字段添加唯一约束(如果不存在)
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'uk_access_name'
    ) THEN
        ALTER TABLE "Access" ADD CONSTRAINT uk_access_name UNIQUE (name);
    END IF;
END $$;

-- 为 APIJSON 配置表添加权限配置
-- 允许 UNKNOWN 用户访问 Function 和 Script 表(用于初始化)
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

-- ============================================================
-- 4. 初始化示例函数(可选)
-- ============================================================

-- 插入一些基础的远程函数示例
INSERT INTO "Function" (name, arguments, demo, detail, methods)
VALUES 
    ('countArray', 'array', '{"array": [1,2,3]}', '统计数组长度', 'GET'),
    ('isContain', 'array,value', '{"array": [1,2,3], "value": 2}', '判断数组是否包含某个值', 'GET'),
    ('getFromArray', 'array,position', '{"array": [1,2,3], "position": 0}', '从数组中获取指定位置的元素', 'GET')
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- 5. 初始化示例脚本(可选)
-- ============================================================

-- 为 Script 表的 name 字段添加唯一约束(如果不存在)
DO $$ 
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint 
        WHERE conname = 'uk_script_name'
    ) THEN
        ALTER TABLE "Script" ADD CONSTRAINT uk_script_name UNIQUE (name);
    END IF;
END $$;

-- 插入一些基础的脚本示例
INSERT INTO "Script" (name, language, script, simple)
VALUES 
    ('countArray', 'JavaScript', 'function countArray(array) { return array ? array.length : 0; }', 0),
    ('isContain', 'JavaScript', 'function isContain(array, value) { return array ? array.indexOf(value) >= 0 : false; }', 0),
    ('getFromArray', 'JavaScript', 'function getFromArray(array, position) { return array && array.length > position ? array[position] : null; }', 0)
ON CONFLICT (name) DO NOTHING;

-- ============================================================
-- 6. 添加业务表的访问权限配置
-- ============================================================

-- 为业务表添加访问权限(根据实际需求调整)
-- 使用 DO 块来处理可能的重复插入
DO $$ 
DECLARE
    access_configs TEXT[][] := ARRAY[
        ARRAY['patient', 'Patient', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'],
        ARRAY['registration', 'Registration', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        ARRAY['outpatient_visit', 'OutpatientVisit', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        ARRAY['outpatient_visit_active', 'OutpatientVisitActive', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        ARRAY['outpatient_visit_history', 'OutpatientVisitHistory', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        ARRAY['sys_department', 'Department', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'],
        ARRAY['doctor', 'Doctor', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'],
        ARRAY['emr_data_element', 'DataElement', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'],
        ARRAY['emr_data_set', 'DataSet', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'],
        ARRAY['emr_data_set_element', 'DataSetElement', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'],
        ARRAY['emr_icd10_diagnosis', 'Icd10Diagnosis', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'],
        ARRAY['emr_template', 'EmrTemplate', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        ARRAY['emr_record', 'EmrRecord', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        -- 新增的数据元值域相关表
        ARRAY['emr_value_domain', 'ValueDomain', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'],
        ARRAY['emr_value_domain_item', 'ValueDomainItem', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["UNKNOWN","LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'],
        -- 新增的病历模板关联表
        ARRAY['emr_template_department', 'EmrTemplateDepartment', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'],
        -- 新增的病历版本表
        ARRAY['emr_record_version', 'EmrRecordVersion', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        -- 新增的医生收藏模板表
        ARRAY['doctor_favorite_template', 'DoctorFavoriteTemplate', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'],
        -- 新增的门诊就诊过程表
        ARRAY['outpatient_encounter_data', 'OutpatientEncounterData', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        -- 新增的医嘱系统相关表
        ARRAY['medical_order', 'MedicalOrder', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        ARRAY['medical_order_drug', 'MedicalOrderDrug', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        ARRAY['medical_order_exam', 'MedicalOrderExam', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        ARRAY['exam_result', 'ExamResult', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        ARRAY['medical_order_lab', 'MedicalOrderLab', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'],
        ARRAY['lab_result', 'LabResult', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]']
    ];
    config TEXT[];
BEGIN
    FOREACH config SLICE 1 IN ARRAY access_configs
    LOOP
        INSERT INTO "Access" (name, alias, get, head, gets, heads, post, put, delete)
        VALUES (config[1], config[2], config[3], config[4], config[5], config[6], config[7], config[8], config[9])
        ON CONFLICT (name) DO UPDATE SET
            alias = EXCLUDED.alias,
            get = EXCLUDED.get,
            head = EXCLUDED.head,
            gets = EXCLUDED.gets,
            heads = EXCLUDED.heads,
            post = EXCLUDED.post,
            put = EXCLUDED.put,
            delete = EXCLUDED.delete;
    END LOOP;
END $$;

-- ============================================================
-- 完成
-- ============================================================

-- 查询所有配置的表权限
SELECT name, alias, get, post, put, delete 
FROM "Access" 
ORDER BY id;
