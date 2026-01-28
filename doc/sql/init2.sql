-- ============================================================
-- CCY EMR Service 数据库第二阶段初始化脚本 (22张表)
-- 数据库: PostgreSQL 16+
-- 创建时间: 2026-01-27
-- 说明: 仅包含表结构，无初始数据
-- ============================================================

-- ============================
-- 数据元与数据集模块
-- ============================

-- 表：emr_value_domain_item（数据元值域项表）
CREATE TABLE emr_value_domain_item (
    id           BIGSERIAL PRIMARY KEY,
    domain_code  VARCHAR(64)  NOT NULL,
    item_code    VARCHAR(64)  NOT NULL,
    item_name    VARCHAR(128) NOT NULL,
    item_order   INTEGER      DEFAULT 0,
    is_default   SMALLINT     DEFAULT 0,
    status       SMALLINT     DEFAULT 1,
    remark       VARCHAR(255),
    create_time  TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE emr_value_domain_item IS '电子病历数据元值域项表，用于存储值域下的可选取值';
COMMENT ON COLUMN emr_value_domain_item.id IS '主键ID';
COMMENT ON COLUMN emr_value_domain_item.domain_code IS '所属值域编码，对应数据元的值域定义';
COMMENT ON COLUMN emr_value_domain_item.item_code IS '值域项编码';
COMMENT ON COLUMN emr_value_domain_item.item_name IS '值域项名称';
COMMENT ON COLUMN emr_value_domain_item.item_order IS '显示顺序';
COMMENT ON COLUMN emr_value_domain_item.is_default IS '是否默认值（0 否，1 是）';
COMMENT ON COLUMN emr_value_domain_item.status IS '状态（1 启用，0 停用）';
COMMENT ON COLUMN emr_value_domain_item.remark IS '备注说明';
COMMENT ON COLUMN emr_value_domain_item.create_time IS '创建时间';

CREATE UNIQUE INDEX uk_emr_value_domain_item_code
ON emr_value_domain_item (domain_code, item_code);
CREATE UNIQUE INDEX uk_emr_value_domain_item_default
ON emr_value_domain_item (domain_code)
WHERE is_default = 1;

-- 表：emr_value_domain（数据元值域主表）
CREATE TABLE emr_value_domain (
    id            BIGSERIAL PRIMARY KEY,
    domain_code   VARCHAR(64)  NOT NULL,
    domain_name   VARCHAR(128) NOT NULL,
    domain_type   VARCHAR(32)  DEFAULT 'ENUM',
    description   VARCHAR(255),
    status        SMALLINT     DEFAULT 1,
    create_time   TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE emr_value_domain IS '电子病历数据元值域定义表，用于描述数据元可选取值范围';
COMMENT ON COLUMN emr_value_domain.id IS '主键ID';
COMMENT ON COLUMN emr_value_domain.domain_code IS '值域编码，全系统唯一';
COMMENT ON COLUMN emr_value_domain.domain_name IS '值域名称';
COMMENT ON COLUMN emr_value_domain.domain_type IS '值域类型（ENUM 枚举 / RANGE 范围 / REF 引用）';
COMMENT ON COLUMN emr_value_domain.description IS '值域说明';
COMMENT ON COLUMN emr_value_domain.status IS '状态（1 启用，0 停用）';
COMMENT ON COLUMN emr_value_domain.create_time IS '创建时间';

CREATE UNIQUE INDEX uk_emr_value_domain_code
ON emr_value_domain (domain_code);

-- 表：emr_data_element（数据元定义表）
CREATE TABLE emr_data_element (
    id BIGSERIAL PRIMARY KEY,
    element_code VARCHAR(64) NOT NULL,
    element_name VARCHAR(128) NOT NULL,
    element_desc VARCHAR(256),
    storage_type VARCHAR(16) NOT NULL,
    value_format VARCHAR(16) DEFAULT 'NONE',
    value_length INT,
    value_domain_code VARCHAR(64),
    is_required BOOLEAN DEFAULT FALSE,
    default_value VARCHAR(128),
    enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_emr_data_element_code UNIQUE (element_code)
);

COMMENT ON TABLE emr_data_element IS '电子病历数据元定义表，用于描述病历字段的结构、类型和校验规则';
COMMENT ON COLUMN emr_data_element.id IS '主键';
COMMENT ON COLUMN emr_data_element.element_code IS '数据元编码（全系统唯一）';
COMMENT ON COLUMN emr_data_element.element_name IS '数据元名称';
COMMENT ON COLUMN emr_data_element.element_desc IS '数据元说明';
COMMENT ON COLUMN emr_data_element.storage_type IS '存储数据类型：S，S1，S2.....';
COMMENT ON COLUMN emr_data_element.value_format IS '表示格式：A(字母)/N(数字)/AN(字母数字)/NONE(不限制)';
COMMENT ON COLUMN emr_data_element.value_length IS '最大长度或精度限制';
COMMENT ON COLUMN emr_data_element.value_domain_code IS '值域编码（枚举型数据使用，如性别、血型）';
COMMENT ON COLUMN emr_data_element.is_required IS '是否必填';
COMMENT ON COLUMN emr_data_element.default_value IS '默认值';
COMMENT ON COLUMN emr_data_element.enabled IS '是否启用';
COMMENT ON COLUMN emr_data_element.created_at IS '创建时间';
COMMENT ON COLUMN emr_data_element.updated_at IS '更新时间';
-- 添加 element_name 字段到 emr_data_set_element 表
ALTER TABLE emr_data_set_element
    ADD COLUMN element_name VARCHAR(128) NOT NULL DEFAULT '';

-- 添加字段注释
COMMENT ON COLUMN emr_data_set_element.element_name IS '数据元名称（冗余存储，用于展示优化）';

-- 表：emr_data_set（数据集主表）
CREATE TABLE emr_data_set (
    id BIGSERIAL PRIMARY KEY,
    dataset_code VARCHAR(64) NOT NULL,
    dataset_name VARCHAR(128) NOT NULL,
    dataset_desc VARCHAR(256),
    enabled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_emr_dataset_code UNIQUE (dataset_code)
);

COMMENT ON TABLE emr_data_set IS '电子病历数据集定义表（多个数据元的集合）';
COMMENT ON COLUMN emr_data_set.dataset_code IS '数据集编码';
COMMENT ON COLUMN emr_data_set.dataset_name IS '数据集名称';
COMMENT ON COLUMN emr_data_set.dataset_desc IS '数据集说明';
COMMENT ON COLUMN emr_data_set.enabled IS '是否启用';

-- 表：emr_data_set_element（数据集-数据元关系表）
CREATE TABLE emr_data_set_element (
    id BIGSERIAL PRIMARY KEY,
    dataset_code VARCHAR(64) NOT NULL,
    element_code VARCHAR(64) NOT NULL,
    display_order INT DEFAULT 0,
    is_required BOOLEAN DEFAULT FALSE,
    is_readonly BOOLEAN DEFAULT FALSE,
    default_value VARCHAR(128),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_dataset_element UNIQUE (dataset_code, element_code)
);

COMMENT ON TABLE emr_data_set_element IS '数据集与数据元关系表';
COMMENT ON COLUMN emr_data_set_element.dataset_code IS '数据集编码';
COMMENT ON COLUMN emr_data_set_element.element_code IS '数据元编码';
COMMENT ON COLUMN emr_data_set_element.display_order IS '展示顺序';
COMMENT ON COLUMN emr_data_set_element.is_required IS '是否必填';
COMMENT ON COLUMN emr_data_set_element.is_readonly IS '是否只读';
COMMENT ON COLUMN emr_data_set_element.default_value IS '默认值';

-- ============================
-- 挂号与门诊就诊体系
-- ============================

-- 表：sys_department（科室信息表）
CREATE TABLE sys_department (
    id           BIGSERIAL PRIMARY KEY,
    dept_code    VARCHAR(64)  NOT NULL UNIQUE, 
    dept_name    VARCHAR(128) NOT NULL,        
    parent_code  VARCHAR(64),                  
    dept_type    VARCHAR(32),                  
    enabled      BOOLEAN      DEFAULT TRUE,    
    create_time  TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time  TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE sys_department IS '科室信息表：定义医疗机构的科室逻辑结构';
COMMENT ON COLUMN sys_department.id IS '主键ID';
COMMENT ON COLUMN sys_department.dept_code IS '科室编码：国家规范或院内唯一编码';
COMMENT ON COLUMN sys_department.dept_name IS '科室名称';
COMMENT ON COLUMN sys_department.parent_code IS '上级科室编码';
COMMENT ON COLUMN sys_department.dept_type IS '科室类型：门诊/住院/医技/行政';
COMMENT ON COLUMN sys_department.enabled IS '启用状态';
COMMENT ON COLUMN sys_department.create_time IS '创建时间';
COMMENT ON COLUMN sys_department.update_time IS '更新时间';

-- 表：patient（患者主数据表）
CREATE TABLE patient (
    id           BIGSERIAL PRIMARY KEY,
    patient_code VARCHAR(64)  NOT NULL UNIQUE, 
    patient_name VARCHAR(64)  NOT NULL,        
    gender_code  VARCHAR(32),                  
    birthday     DATE,                         
    id_card      VARCHAR(18),                  
    phone        VARCHAR(20),                  
    create_time  TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time  TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE patient IS '患者主数据表：存储患者唯一档案';
COMMENT ON COLUMN patient.id IS '主键ID';
COMMENT ON COLUMN patient.patient_code IS '患者唯一编码 (DE02.01.039.00)';
COMMENT ON COLUMN patient.patient_name IS '患者姓名';
COMMENT ON COLUMN patient.gender_code IS '性别代码 (DE02.01.040.00)';
COMMENT ON COLUMN patient.birthday IS '出生日期';
COMMENT ON COLUMN patient.id_card IS '身份证号';
COMMENT ON COLUMN patient.phone IS '联系电话';
COMMENT ON COLUMN patient.create_time IS '创建时间';
COMMENT ON COLUMN patient.update_time IS '更新时间';

-- 表：registration（门诊挂号记录表）
CREATE TABLE registration (
    id            BIGSERIAL PRIMARY KEY,
    reg_code      VARCHAR(64)  NOT NULL UNIQUE, 
    patient_code  VARCHAR(64)  NOT NULL,        
    dept_code     VARCHAR(64)  NOT NULL,        
    doctor_code   VARCHAR(64)  NOT NULL,        
    reg_date      DATE         NOT NULL,        
    time_slot     VARCHAR(16),                  
    seq_no        INTEGER,                      
    reg_status    VARCHAR(32)  DEFAULT 'WAITING', 
    create_time   TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time   TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reg_dept FOREIGN KEY (dept_code) REFERENCES sys_department(dept_code),
    CONSTRAINT fk_reg_patient FOREIGN KEY (patient_code) REFERENCES patient(patient_code)
);

COMMENT ON TABLE registration IS '门诊挂号表：单次就诊的号源凭证，每次就诊（含复诊）均需新记录';
COMMENT ON COLUMN registration.id IS '主键ID';
COMMENT ON COLUMN registration.reg_code IS '挂号流水号：本次就诊的唯一入场券';
COMMENT ON COLUMN registration.patient_code IS '患者编码';
COMMENT ON COLUMN registration.dept_code IS '挂号科室编码';
COMMENT ON COLUMN registration.doctor_code IS '挂号医生编码';
COMMENT ON COLUMN registration.reg_date IS '计划就诊日期';
COMMENT ON COLUMN registration.time_slot IS '就诊时段：AM/PM';
COMMENT ON COLUMN registration.seq_no IS '排队号序';
COMMENT ON COLUMN registration.reg_status IS '挂号状态';
COMMENT ON COLUMN registration.create_time IS '创建时间';
COMMENT ON COLUMN registration.update_time IS '更新时间';

-- 表：outpatient_visit（门诊就诊主表）
CREATE TABLE outpatient_visit (
    id            BIGSERIAL PRIMARY KEY,
    visit_code    VARCHAR(64)  NOT NULL UNIQUE, 
    reg_code      VARCHAR(64)  NOT NULL UNIQUE, 
    patient_code  VARCHAR(64)  NOT NULL,
    dept_code     VARCHAR(64)  NOT NULL,        
    doctor_code   VARCHAR(64)  NOT NULL,        
    visit_type    VARCHAR(32)  DEFAULT 'FIRST', 
    visit_status  VARCHAR(32)  DEFAULT 'IN_PROGRESS', 
    start_time    TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    end_time      TIMESTAMP WITHOUT TIME ZONE,
    create_time   TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time   TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_visit_reg FOREIGN KEY (reg_code) REFERENCES registration(reg_code),
    CONSTRAINT fk_visit_patient FOREIGN KEY (patient_code) REFERENCES patient(patient_code),
    CONSTRAINT fk_visit_dept FOREIGN KEY (dept_code) REFERENCES sys_department(dept_code)
);

COMMENT ON TABLE outpatient_visit IS '门诊就诊主表：记录单次诊疗行为，区分初复诊类别';
COMMENT ON COLUMN outpatient_visit.id IS '主键ID';
COMMENT ON COLUMN outpatient_visit.visit_code IS '就诊编码：单次诊疗所有事实数据的根键';
COMMENT ON COLUMN outpatient_visit.reg_code IS '关联挂号单 (1:1)';
COMMENT ON COLUMN outpatient_visit.patient_code IS '患者编码';
COMMENT ON COLUMN outpatient_visit.dept_code IS '接诊科室';
COMMENT ON COLUMN outpatient_visit.doctor_code IS '接诊医生';
COMMENT ON COLUMN outpatient_visit.visit_type IS '诊疗类型：FIRST-初诊, FOLLOW_UP-复诊 (DE06.00.062.00)';
COMMENT ON COLUMN outpatient_visit.visit_status IS '就诊状态';
COMMENT ON COLUMN outpatient_visit.start_time IS '接诊开始时间';
COMMENT ON COLUMN outpatient_visit.end_time IS '接诊完成时间';
COMMENT ON COLUMN outpatient_visit.create_time IS '创建时间';
COMMENT ON COLUMN outpatient_visit.update_time IS '更新时间';

-- 表：outpatient_encounter_data（门诊就诊过程结构化数据表）
CREATE TABLE outpatient_encounter_data (
    id             BIGSERIAL PRIMARY KEY,
    visit_code     VARCHAR(64)  NOT NULL UNIQUE, 
    encounter_json JSONB NOT NULL, 
    create_time    TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time    TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_encounter_visit FOREIGN KEY (visit_code) REFERENCES outpatient_visit(visit_code) ON DELETE CASCADE
);

CREATE INDEX idx_encounter_json_gin ON outpatient_encounter_data USING GIN (encounter_json);
COMMENT ON TABLE outpatient_encounter_data IS '门诊就诊过程事实表：存储本次就诊（初诊或复诊）的独立事实数据';
COMMENT ON COLUMN outpatient_encounter_data.id IS '主键ID';
COMMENT ON COLUMN outpatient_encounter_data.visit_code IS '就诊编码：1:1 绑定单次就诊';
COMMENT ON COLUMN outpatient_encounter_data.encounter_json IS '结构化诊疗数据 (DE 编码集合)';
COMMENT ON COLUMN outpatient_encounter_data.create_time IS '创建时间';
COMMENT ON COLUMN outpatient_encounter_data.update_time IS '更新时间';

-- 表：doctor（医生主数据表）
CREATE TABLE doctor (
    id              BIGSERIAL PRIMARY KEY,
    doctor_code     VARCHAR(64)  NOT NULL UNIQUE,
    doctor_name     VARCHAR(128) NOT NULL,
    dept_code       VARCHAR(64)  NOT NULL,
    title_code      VARCHAR(32),
    license_no      VARCHAR(64),
    user_username   VARCHAR(50)  NOT NULL UNIQUE,
    enabled         BOOLEAN      DEFAULT TRUE,
    create_time     TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time     TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_doctor_dept FOREIGN KEY (dept_code) REFERENCES sys_department(dept_code),
    CONSTRAINT fk_doctor_user FOREIGN KEY (user_username) REFERENCES sys_user(username)
);

COMMENT ON TABLE doctor IS '医生主数据表：描述医疗业务中的医生实体，与系统用户账号解耦';
COMMENT ON COLUMN doctor.id IS '主键ID';
COMMENT ON COLUMN doctor.doctor_code IS '医生业务编码：全院唯一，用于所有业务表关联';
COMMENT ON COLUMN doctor.doctor_name IS '医生姓名';
COMMENT ON COLUMN doctor.dept_code IS '所属科室编码';
COMMENT ON COLUMN doctor.title_code IS '职称编码：如主任医师/主治医师';
COMMENT ON COLUMN doctor.license_no IS '执业医师证号';
COMMENT ON COLUMN doctor.user_username IS '绑定的系统登录账号（sys_user.username）';
COMMENT ON COLUMN doctor.enabled IS '是否在岗启用';
COMMENT ON COLUMN doctor.create_time IS '创建时间';
COMMENT ON COLUMN doctor.update_time IS '更新时间';

CREATE INDEX idx_doctor_dept_code ON doctor(dept_code);
CREATE INDEX idx_doctor_user_username ON doctor(user_username);




-- ============================
-- 电子病历管理系统
-- ============================

-- 表：emr_template（电子病历模板主表）
CREATE TABLE emr_template (
                              id BIGSERIAL PRIMARY KEY,
                              template_code VARCHAR(64) NOT NULL UNIQUE,
                              template_name VARCHAR(128) NOT NULL,
                              emr_type VARCHAR(32) NOT NULL,
                              template_scope VARCHAR(16) NOT NULL,
                              template_structure JSONB NOT NULL,
                              enabled BOOLEAN DEFAULT TRUE,
                              create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                              update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE emr_template IS '电子病历模板主表（定义病历结构）';
COMMENT ON COLUMN emr_template.id IS '模板主键ID';
COMMENT ON COLUMN emr_template.template_code IS '病历模板编码（全局唯一）';
COMMENT ON COLUMN emr_template.template_name IS '病历模板名称';
COMMENT ON COLUMN emr_template.emr_type IS '病历类型（初诊、复诊、病程记录）';
COMMENT ON COLUMN emr_template.template_scope IS '模板范围（HOSPITAL 全院 / DEPARTMENT 科室）';
COMMENT ON COLUMN emr_template.template_structure IS '病历模板结构定义(JSON，包含数据元占位)';
COMMENT ON COLUMN emr_template.enabled IS '是否启用';
COMMENT ON COLUMN emr_template.create_time IS '创建时间';
COMMENT ON COLUMN emr_template.update_time IS '更新时间';

-- 表：emr_template_department（病历模板-科室关联表）
CREATE TABLE emr_template_department (
                                         id BIGSERIAL PRIMARY KEY,
                                         template_id BIGINT NOT NULL,
                                         dept_id     BIGINT NOT NULL,
                                         create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                         update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                         CONSTRAINT uq_template_dept UNIQUE (template_id, dept_id),
                                         CONSTRAINT fk_template_dept_template FOREIGN KEY (template_id) REFERENCES emr_template(id) ON DELETE CASCADE,
                                         CONSTRAINT fk_template_dept_department FOREIGN KEY (dept_id) REFERENCES sys_department(id)
);

COMMENT ON TABLE emr_template_department IS '病历模板-科室关联表（适用于科室模板）';
COMMENT ON COLUMN emr_template_department.id IS '主键ID';
COMMENT ON COLUMN emr_template_department.template_id IS '病历模板ID';
COMMENT ON COLUMN emr_template_department.dept_id IS '科室ID';
COMMENT ON COLUMN emr_template_department.create_time IS '创建时间';
COMMENT ON COLUMN emr_template_department.update_time IS '更新时间';

-- 表：emr_record（病历实例主表）
CREATE TABLE emr_record (
                            id BIGSERIAL PRIMARY KEY,
                            emr_code VARCHAR(64) NOT NULL UNIQUE,
                            visit_code VARCHAR(64) NOT NULL,
                            patient_code VARCHAR(64) NOT NULL,
                            doctor_code VARCHAR(64) NOT NULL,
                            template_code VARCHAR(64) NOT NULL,
                            emr_type VARCHAR(32) NOT NULL,
                            emr_status VARCHAR(32) DEFAULT 'DRAFT',
                            current_version INTEGER DEFAULT 1,
                            create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                            update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE emr_record IS '电子病历实例主表（一次就诊可生成多份病历）';
COMMENT ON COLUMN emr_record.emr_code IS '病历实例编码';
COMMENT ON COLUMN emr_record.visit_code IS '门诊就诊编码';
COMMENT ON COLUMN emr_record.patient_code IS '患者编码';
COMMENT ON COLUMN emr_record.doctor_code IS '医生编码';
COMMENT ON COLUMN emr_record.template_code IS '病历模板编码';
COMMENT ON COLUMN emr_record.emr_type IS '病历类型（初诊、复诊）';
COMMENT ON COLUMN emr_record.emr_status IS '病历状态';
COMMENT ON COLUMN emr_record.current_version IS '当前病历版本号';
COMMENT ON COLUMN emr_record.create_time IS '创建时间';
COMMENT ON COLUMN emr_record.update_time IS '更新时间';

CREATE INDEX idx_emr_record_visit ON emr_record(visit_code);
CREATE INDEX idx_emr_record_patient ON emr_record(patient_code);

-- 表：emr_record_version（病历版本表）
CREATE TABLE emr_record_version (
                                    id BIGSERIAL PRIMARY KEY,
                                    emr_code VARCHAR(64) NOT NULL,
                                    version_no INTEGER NOT NULL,
                                    emr_content JSONB NOT NULL,
                                    signed_flag BOOLEAN DEFAULT FALSE,
                                    create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                    update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE emr_record_version IS '电子病历版本表（支持多版本、签署冻结）';
COMMENT ON COLUMN emr_record_version.emr_code IS '病历实例编码';
COMMENT ON COLUMN emr_record_version.version_no IS '病历版本号';
COMMENT ON COLUMN emr_record_version.emr_content IS '病历内容(JSON)，含医嘱/检查快照';
COMMENT ON COLUMN emr_record_version.signed_flag IS '是否已签署';
COMMENT ON COLUMN emr_record_version.create_time IS '创建时间';
COMMENT ON COLUMN emr_record_version.update_time IS '更新时间';

CREATE UNIQUE INDEX uk_emr_version ON emr_record_version(emr_code, version_no);
CREATE INDEX idx_emr_version_emr ON emr_record_version(emr_code);

-- 表：doctor_favorite_template（医生收藏病历模板关联表）
CREATE TABLE doctor_favorite_template (
    id              BIGSERIAL PRIMARY KEY,
    doctor_code     VARCHAR(64) NOT NULL,
    template_code   VARCHAR(64) NOT NULL,
    create_time     TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_fav_doctor FOREIGN KEY (doctor_code) REFERENCES doctor(doctor_code) ON DELETE CASCADE,
    CONSTRAINT fk_fav_template FOREIGN KEY (template_code) REFERENCES emr_template(template_code) ON DELETE CASCADE,
    CONSTRAINT uk_doctor_template UNIQUE (doctor_code, template_code)
);

COMMENT ON TABLE doctor_favorite_template IS '医生个人收藏的病历模板关系表';
COMMENT ON COLUMN doctor_favorite_template.id IS '主键ID';
COMMENT ON COLUMN doctor_favorite_template.doctor_code IS '医生编码';
COMMENT ON COLUMN doctor_favorite_template.template_code IS '病历模板编码';
COMMENT ON COLUMN doctor_favorite_template.create_time IS '收藏时间';

CREATE INDEX idx_fav_doctor_code ON doctor_favorite_template(doctor_code);
CREATE INDEX idx_fav_template_code ON doctor_favorite_template(template_code);



-- ============================
-- 医嘱系统
-- ============================

-- 表：medical_order（医嘱主表）
CREATE TABLE medical_order (
    id BIGSERIAL PRIMARY KEY,
    order_code VARCHAR(64) NOT NULL UNIQUE,
    visit_code VARCHAR(64) NOT NULL,
    patient_code VARCHAR(64) NOT NULL,
    doctor_code VARCHAR(64) NOT NULL,
    order_type VARCHAR(32) NOT NULL,
    order_status VARCHAR(32) NOT NULL,
    create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE medical_order IS '医嘱主表（统一医嘱生命周期管理）';
COMMENT ON COLUMN medical_order.order_code IS '医嘱编码';
COMMENT ON COLUMN medical_order.visit_code IS '就诊编码';
COMMENT ON COLUMN medical_order.patient_code IS '患者编码';
COMMENT ON COLUMN medical_order.doctor_code IS '医生编码';
COMMENT ON COLUMN medical_order.order_type IS '医嘱类型（药品/检查/检验）';
COMMENT ON COLUMN medical_order.order_status IS '医嘱状态';
COMMENT ON COLUMN medical_order.create_time IS '创建时间';
COMMENT ON COLUMN medical_order.update_time IS '更新时间';

CREATE INDEX idx_order_visit ON medical_order(visit_code);
CREATE INDEX idx_order_patient ON medical_order(patient_code);

-- 表：medical_order_drug（药品医嘱明细表）
CREATE TABLE medical_order_drug (
    id BIGSERIAL PRIMARY KEY,
    order_code VARCHAR(64) NOT NULL,
    drug_code VARCHAR(64) NOT NULL,
    drug_name VARCHAR(128) NOT NULL,
    dosage VARCHAR(64),
    frequency VARCHAR(64),
    route VARCHAR(64),
    days INTEGER,
    create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_drug_order FOREIGN KEY (order_code) REFERENCES medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE
);

COMMENT ON TABLE medical_order_drug IS '药品医嘱明细表';
COMMENT ON COLUMN medical_order_drug.order_code IS '医嘱编码';
COMMENT ON COLUMN medical_order_drug.drug_code IS '药品编码';
COMMENT ON COLUMN medical_order_drug.drug_name IS '药品名称';
COMMENT ON COLUMN medical_order_drug.dosage IS '单次剂量';
COMMENT ON COLUMN medical_order_drug.frequency IS '用药频次';
COMMENT ON COLUMN medical_order_drug.route IS '用药途径';
COMMENT ON COLUMN medical_order_drug.days IS '用药天数';
COMMENT ON COLUMN medical_order_drug.create_time IS '创建时间';
COMMENT ON COLUMN medical_order_drug.update_time IS '更新时间';

CREATE INDEX idx_drug_order ON medical_order_drug(order_code);

-- 表：medical_order_exam（检查医嘱明细表）
CREATE TABLE medical_order_exam (
    id BIGSERIAL PRIMARY KEY,
    order_code VARCHAR(64) NOT NULL,
    exam_item_code VARCHAR(64) NOT NULL,
    exam_item_name VARCHAR(128) NOT NULL,
    exam_part VARCHAR(128),
    is_enhanced BOOLEAN,
    clinical_purpose TEXT,
    create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_exam_order FOREIGN KEY (order_code) REFERENCES medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE
);

COMMENT ON TABLE medical_order_exam IS '检查医嘱明细表';
COMMENT ON COLUMN medical_order_exam.order_code IS '医嘱编码';
COMMENT ON COLUMN medical_order_exam.exam_item_code IS '检查项目编码';
COMMENT ON COLUMN medical_order_exam.exam_item_name IS '检查项目名称';
COMMENT ON COLUMN medical_order_exam.exam_part IS '检查部位';
COMMENT ON COLUMN medical_order_exam.is_enhanced IS '是否增强';
COMMENT ON COLUMN medical_order_exam.clinical_purpose IS '临床目的';
COMMENT ON COLUMN medical_order_exam.create_time IS '创建时间';
COMMENT ON COLUMN medical_order_exam.update_time IS '更新时间';

CREATE INDEX idx_exam_order ON medical_order_exam(order_code);

-- 表：exam_result（检查结果表）
CREATE TABLE exam_result (
    id BIGSERIAL PRIMARY KEY,
    order_code VARCHAR(64) NOT NULL,
    report_content JSONB NOT NULL,
    image_url VARCHAR(256),
    report_time TIMESTAMP WITHOUT TIME ZONE,
    create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_exam_res_order FOREIGN KEY (order_code) REFERENCES medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE
);

COMMENT ON TABLE exam_result IS '检查结果表（报告+影像引用）';
COMMENT ON COLUMN exam_result.order_code IS '医嘱编码';
COMMENT ON COLUMN exam_result.report_content IS '检查报告内容(JSON)';
COMMENT ON COLUMN exam_result.image_url IS '影像存储地址(MinIO)';
COMMENT ON COLUMN exam_result.report_time IS '报告完成时间';
COMMENT ON COLUMN exam_result.create_time IS '创建时间';
COMMENT ON COLUMN exam_result.update_time IS '更新时间';

CREATE INDEX idx_exam_result_order ON exam_result(order_code);

-- 表：medical_order_lab（检验医嘱明细表）
CREATE TABLE medical_order_lab (
    id BIGSERIAL PRIMARY KEY,
    order_code VARCHAR(64) NOT NULL,
    lab_item_code VARCHAR(64) NOT NULL,
    lab_item_name VARCHAR(128) NOT NULL,
    specimen_type VARCHAR(64),
    clinical_diagnosis TEXT,
    create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_lab_order FOREIGN KEY (order_code) REFERENCES medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE
);

COMMENT ON TABLE medical_order_lab IS '检验医嘱明细表';
COMMENT ON COLUMN medical_order_lab.order_code IS '医嘱编码';
COMMENT ON COLUMN medical_order_lab.lab_item_code IS '检验项目编码';
COMMENT ON COLUMN medical_order_lab.lab_item_name IS '检验项目名称';
COMMENT ON COLUMN medical_order_lab.specimen_type IS '标本类型';
COMMENT ON COLUMN medical_order_lab.clinical_diagnosis IS '临床诊断';
COMMENT ON COLUMN medical_order_lab.create_time IS '创建时间';
COMMENT ON COLUMN medical_order_lab.update_time IS '更新时间';

CREATE INDEX idx_lab_order ON medical_order_lab(order_code);

-- 表：lab_result（检验结果表）
CREATE TABLE lab_result (
    id BIGSERIAL PRIMARY KEY,
    order_code VARCHAR(64) NOT NULL,
    result_json JSONB NOT NULL,
    create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_lab_res_order FOREIGN KEY (order_code) REFERENCES medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE
);

COMMENT ON TABLE lab_result IS '检验结果表（结构化存储）';
COMMENT ON COLUMN lab_result.order_code IS '医嘱编码';
COMMENT ON COLUMN lab_result.result_json IS '检验结果(JSON)';
COMMENT ON COLUMN lab_result.create_time IS '创建时间';
COMMENT ON COLUMN lab_result.update_time IS '更新时间';

CREATE INDEX idx_lab_result_order ON lab_result(order_code);

-- ============================================================
-- 完成
-- ============================================================