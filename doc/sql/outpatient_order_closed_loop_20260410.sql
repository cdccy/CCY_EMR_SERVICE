BEGIN;

-- =============================================================================
-- 门诊医嘱闭环重构（2026-04-10）
-- 1) 医嘱状态机约束
-- 2) 药品/检验一医嘱多明细
-- 3) 检查结果 JSONB + XML + MinIO 多图
-- 4) 检验结构化结果 + result_flag 自动计算
-- 5) 就诊聚合视图（医生站查询）
-- =============================================================================

-- 0) 枚举类型
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_type t JOIN pg_namespace n ON n.oid = t.typnamespace
    WHERE n.nspname='public' AND t.typname='order_type_enum'
  ) THEN
    CREATE TYPE public.order_type_enum AS ENUM ('DRUG','EXAM','LAB');
  END IF;
END$$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_type t JOIN pg_namespace n ON n.oid = t.typnamespace
    WHERE n.nspname='public' AND t.typname='order_status_enum'
  ) THEN
    CREATE TYPE public.order_status_enum AS ENUM (
      'PENDING_RECEIVE','RECEIVED','EXECUTING','COMPLETED','CANCELLED'
    );
  END IF;
END$$;

-- 1) medical_order 状态机改造
ALTER TABLE public.medical_order
  ADD COLUMN IF NOT EXISTS status_version BIGINT NOT NULL DEFAULT 0,
  ADD COLUMN IF NOT EXISTS received_time TIMESTAMP,
  ADD COLUMN IF NOT EXISTS completed_time TIMESTAMP,
  ADD COLUMN IF NOT EXISTS cancelled_time TIMESTAMP,
  ADD COLUMN IF NOT EXISTS cancel_reason TEXT;

ALTER TABLE public.medical_order
  ALTER COLUMN order_type TYPE public.order_type_enum USING
    CASE
      WHEN order_type IN ('DRUG','EXAM','LAB') THEN order_type::public.order_type_enum
      ELSE 'DRUG'::public.order_type_enum
    END;

ALTER TABLE public.medical_order
  ALTER COLUMN order_status TYPE public.order_status_enum USING
    CASE
      WHEN order_status IN ('PENDING_RECEIVE','RECEIVED','EXECUTING','COMPLETED','CANCELLED') THEN order_status::public.order_status_enum
      WHEN order_status IN ('PENDING','CONFIRMED') THEN 'PENDING_RECEIVE'::public.order_status_enum
      WHEN order_status IN ('DISPENSED') THEN 'COMPLETED'::public.order_status_enum
      WHEN order_status IN ('RESULTED','REPORTED') THEN 'COMPLETED'::public.order_status_enum
      ELSE 'PENDING_RECEIVE'::public.order_status_enum
    END;

CREATE OR REPLACE FUNCTION public.fn_medical_order_status_guard_bu()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW.order_status IS DISTINCT FROM OLD.order_status THEN
    IF OLD.order_status = 'PENDING_RECEIVE' AND NEW.order_status NOT IN ('RECEIVED','CANCELLED') THEN
      RAISE EXCEPTION '非法状态流转: % -> %', OLD.order_status, NEW.order_status;
    ELSIF OLD.order_status = 'RECEIVED' AND NEW.order_status NOT IN ('EXECUTING','COMPLETED') THEN
      RAISE EXCEPTION '非法状态流转: % -> %', OLD.order_status, NEW.order_status;
    ELSIF OLD.order_status = 'EXECUTING' AND NEW.order_status <> 'COMPLETED' THEN
      RAISE EXCEPTION '非法状态流转: % -> %', OLD.order_status, NEW.order_status;
    ELSIF OLD.order_status IN ('COMPLETED','CANCELLED') THEN
      RAISE EXCEPTION '终态医嘱不允许变更: % -> %', OLD.order_status, NEW.order_status;
    END IF;

    NEW.status_version := COALESCE(OLD.status_version, 0) + 1;
    NEW.update_time := NOW();

    IF NEW.order_status = 'RECEIVED' THEN
      NEW.received_time := COALESCE(NEW.received_time, NOW());
    ELSIF NEW.order_status = 'COMPLETED' THEN
      NEW.completed_time := COALESCE(NEW.completed_time, NOW());
    ELSIF NEW.order_status = 'CANCELLED' THEN
      NEW.cancelled_time := COALESCE(NEW.cancelled_time, NOW());
    END IF;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_medical_order_status_guard_bu ON public.medical_order;
CREATE TRIGGER trg_medical_order_status_guard_bu
BEFORE UPDATE ON public.medical_order
FOR EACH ROW
EXECUTE FUNCTION public.fn_medical_order_status_guard_bu();

-- 2) 旧表迁移到新明细表
CREATE TABLE IF NOT EXISTS public.medical_order_drug_item (
  id BIGSERIAL PRIMARY KEY,
  order_code VARCHAR(64) NOT NULL,
  item_no INTEGER NOT NULL,
  drug_master_id BIGINT,
  drug_spec_id BIGINT,
  drug_code VARCHAR(64),
  drug_name_snapshot VARCHAR(128) NOT NULL,
  spec_snapshot VARCHAR(256),
  dose_value NUMERIC(10,2),
  dose_unit_code VARCHAR(32),
  qty_value NUMERIC(10,2),
  qty_unit_code VARCHAR(32),
  frequency_code VARCHAR(32),
  route_code VARCHAR(32),
  duration_days INTEGER,
  remark TEXT,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_medical_order_drug_item UNIQUE(order_code, item_no),
  CONSTRAINT fk_medical_order_drug_item_order FOREIGN KEY(order_code)
    REFERENCES public.medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_medical_order_drug_item_order ON public.medical_order_drug_item(order_code);

CREATE TABLE IF NOT EXISTS public.medical_order_lab_item (
  id BIGSERIAL PRIMARY KEY,
  order_code VARCHAR(64) NOT NULL,
  item_no INTEGER NOT NULL,
  lab_item_code VARCHAR(64) NOT NULL,
  lab_item_name_snapshot VARCHAR(128) NOT NULL,
  specimen_type VARCHAR(64),
  unit VARCHAR(32),
  ref_low NUMERIC(12,4),
  ref_high NUMERIC(12,4),
  ref_text VARCHAR(128),
  clinical_diagnosis TEXT,
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_medical_order_lab_item UNIQUE(order_code, item_no),
  CONSTRAINT fk_medical_order_lab_item_order FOREIGN KEY(order_code)
    REFERENCES public.medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_medical_order_lab_item_order ON public.medical_order_lab_item(order_code);

INSERT INTO public.medical_order_drug_item (
  order_code, item_no, drug_code, drug_name_snapshot, spec_snapshot,
  qty_value, qty_unit_code, frequency_code, route_code, duration_days,
  create_time, update_time
)
SELECT d.order_code,
       ROW_NUMBER() OVER (PARTITION BY d.order_code ORDER BY d.id),
       d.drug_code,
       COALESCE(d.drug_name, ''),
       d.drug_name,
       NULL,
       NULL,
       d.frequency,
       d.route,
       d.days,
       d.create_time,
       d.update_time
FROM public.medical_order_drug d
WHERE EXISTS (SELECT 1 FROM information_schema.tables t WHERE t.table_schema='public' AND t.table_name='medical_order_drug')
ON CONFLICT (order_code, item_no) DO NOTHING;

INSERT INTO public.medical_order_lab_item (
  order_code, item_no, lab_item_code, lab_item_name_snapshot,
  specimen_type, clinical_diagnosis, create_time, update_time
)
SELECT l.order_code,
       ROW_NUMBER() OVER (PARTITION BY l.order_code ORDER BY l.id),
       l.lab_item_code,
       COALESCE(l.lab_item_name, ''),
       l.specimen_type,
       l.clinical_diagnosis,
       l.create_time,
       l.update_time
FROM public.medical_order_lab l
WHERE EXISTS (SELECT 1 FROM information_schema.tables t WHERE t.table_schema='public' AND t.table_name='medical_order_lab')
ON CONFLICT (order_code, item_no) DO NOTHING;

-- 3) 检查结果增强（JSONB + XML + 多图）
ALTER TABLE public.exam_result
  ADD COLUMN IF NOT EXISTS report_jsonb JSONB NOT NULL DEFAULT '{}'::jsonb,
  ADD COLUMN IF NOT EXISTS report_xml TEXT NOT NULL DEFAULT '',
  ADD COLUMN IF NOT EXISTS image_files JSONB NOT NULL DEFAULT '[]'::jsonb,
  ADD COLUMN IF NOT EXISTS final_diagnosis_jsonb JSONB NOT NULL DEFAULT '{}'::jsonb,
  ADD COLUMN IF NOT EXISTS report_status VARCHAR(16) NOT NULL DEFAULT 'DRAFT',
  ADD COLUMN IF NOT EXISTS report_doctor_code VARCHAR(64);

UPDATE public.exam_result
SET report_jsonb = COALESCE(report_content, '{}'::jsonb)
WHERE report_jsonb = '{}'::jsonb;

CREATE UNIQUE INDEX IF NOT EXISTS uq_exam_result_order_code ON public.exam_result(order_code);

-- 4) 检验结果结构化
ALTER TABLE public.lab_result
  ADD COLUMN IF NOT EXISTS report_status VARCHAR(16) NOT NULL DEFAULT 'DRAFT',
  ADD COLUMN IF NOT EXISTS report_time TIMESTAMP,
  ADD COLUMN IF NOT EXISTS report_doctor_code VARCHAR(64);

CREATE UNIQUE INDEX IF NOT EXISTS uq_lab_result_order_code ON public.lab_result(order_code);

CREATE TABLE IF NOT EXISTS public.lab_result_item (
  id BIGSERIAL PRIMARY KEY,
  order_code VARCHAR(64) NOT NULL,
  lab_item_code VARCHAR(64) NOT NULL,
  item_name VARCHAR(128) NOT NULL,
  result_value_num NUMERIC(12,4),
  result_value_text VARCHAR(128),
  unit VARCHAR(32),
  ref_low NUMERIC(12,4),
  ref_high NUMERIC(12,4),
  ref_text VARCHAR(128),
  critical_low NUMERIC(12,4),
  critical_high NUMERIC(12,4),
  result_flag VARCHAR(2) NOT NULL DEFAULT 'N',
  create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_lab_result_item_order FOREIGN KEY(order_code)
    REFERENCES public.medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_lab_result_item_order ON public.lab_result_item(order_code);

CREATE OR REPLACE FUNCTION public.fn_lab_result_item_calc_flag_biu()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.result_flag := 'N';

  IF NEW.result_value_num IS NOT NULL THEN
    IF NEW.critical_high IS NOT NULL AND NEW.result_value_num > NEW.critical_high THEN
      NEW.result_flag := 'C';
    ELSIF NEW.critical_low IS NOT NULL AND NEW.result_value_num < NEW.critical_low THEN
      NEW.result_flag := 'C';
    ELSIF NEW.ref_high IS NOT NULL AND NEW.result_value_num > NEW.ref_high THEN
      NEW.result_flag := 'H';
    ELSIF NEW.ref_low IS NOT NULL AND NEW.result_value_num < NEW.ref_low THEN
      NEW.result_flag := 'L';
    END IF;
  END IF;

  NEW.update_time := NOW();
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_lab_result_item_calc_flag_biu ON public.lab_result_item;
CREATE TRIGGER trg_lab_result_item_calc_flag_biu
BEFORE INSERT OR UPDATE ON public.lab_result_item
FOR EACH ROW
EXECUTE FUNCTION public.fn_lab_result_item_calc_flag_biu();

-- 5) 检查完成前置条件：必须 FINAL
CREATE OR REPLACE FUNCTION public.fn_exam_order_complete_guard_bu()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_report_status VARCHAR(16);
BEGIN
  IF NEW.order_type = 'EXAM' AND OLD.order_status <> 'COMPLETED' AND NEW.order_status = 'COMPLETED' THEN
    SELECT er.report_status INTO v_report_status
      FROM public.exam_result er
     WHERE er.order_code = NEW.order_code;

    IF COALESCE(v_report_status, '') <> 'FINAL' THEN
      RAISE EXCEPTION '检查医嘱完成失败：请先完成检查报告';
    END IF;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_exam_order_complete_guard_bu ON public.medical_order;
CREATE TRIGGER trg_exam_order_complete_guard_bu
BEFORE UPDATE ON public.medical_order
FOR EACH ROW
EXECUTE FUNCTION public.fn_exam_order_complete_guard_bu();

-- 6) 聚合视图（医生站查询）
CREATE OR REPLACE VIEW public.v_outpatient_visit_detail AS
SELECT
  v.visit_code,
  v.reg_code,
  v.visit_type,
  v.visit_status,
  v.start_time,
  v.end_time,
  v.dept_code,
  v.doctor_code,
  p.patient_code,
  p.patient_name,
  p.gender_code,
  p.birthday,
  p.phone,
  p.id_card,
  d.doctor_name,
  dept.dept_name,
  oed.encounter_json,
  er.emr_status,
  er.current_version,
  (
    SELECT COALESCE(jsonb_agg(x ORDER BY x.create_time), '[]'::jsonb)
    FROM (
      SELECT mo.order_code, mo.order_type, mo.order_status, mo.create_time, mo.update_time,
             CASE WHEN mo.order_type='DRUG' THEN (
               SELECT COALESCE(jsonb_agg(jsonb_build_object(
                 'item_no', di.item_no,
                 'drug_name_snapshot', di.drug_name_snapshot,
                 'spec_snapshot', di.spec_snapshot,
                 'qty_value', di.qty_value,
                 'qty_unit_code', di.qty_unit_code,
                 'frequency_code', di.frequency_code,
                 'route_code', di.route_code,
                 'duration_days', di.duration_days
               ) ORDER BY di.item_no), '[]'::jsonb)
               FROM public.medical_order_drug_item di WHERE di.order_code = mo.order_code
             )
             WHEN mo.order_type='EXAM' THEN (
               SELECT to_jsonb(me) FROM public.medical_order_exam me WHERE me.order_code = mo.order_code LIMIT 1
             )
             WHEN mo.order_type='LAB' THEN (
               SELECT COALESCE(jsonb_agg(jsonb_build_object(
                 'item_no', li.item_no,
                 'lab_item_code', li.lab_item_code,
                 'lab_item_name_snapshot', li.lab_item_name_snapshot,
                 'specimen_type', li.specimen_type,
                 'ref_low', li.ref_low,
                 'ref_high', li.ref_high,
                 'ref_text', li.ref_text,
                 'unit', li.unit
               ) ORDER BY li.item_no), '[]'::jsonb)
               FROM public.medical_order_lab_item li WHERE li.order_code = mo.order_code
             ) END AS detail,
             (SELECT jsonb_build_object(
               'report_status', ex.report_status,
               'report_jsonb', ex.report_jsonb,
               'report_xml', ex.report_xml,
               'image_files', ex.image_files,
               'final_diagnosis_jsonb', ex.final_diagnosis_jsonb,
               'report_time', ex.report_time
             ) FROM public.exam_result ex WHERE ex.order_code = mo.order_code LIMIT 1) AS exam_result,
             (SELECT jsonb_build_object(
               'report_status', lr.report_status,
               'result_json', lr.result_json,
               'report_time', lr.report_time,
               'items', COALESCE((
                 SELECT jsonb_agg(jsonb_build_object(
                   'lab_item_code', lri.lab_item_code,
                   'item_name', lri.item_name,
                   'result_value_num', lri.result_value_num,
                   'result_value_text', lri.result_value_text,
                   'unit', lri.unit,
                   'ref_low', lri.ref_low,
                   'ref_high', lri.ref_high,
                   'ref_text', lri.ref_text,
                   'result_flag', lri.result_flag
                 ) ORDER BY lri.id)
                 FROM public.lab_result_item lri WHERE lri.order_code = mo.order_code
               ), '[]'::jsonb)
             ) FROM public.lab_result lr WHERE lr.order_code = mo.order_code LIMIT 1) AS lab_result
      FROM public.medical_order mo
      WHERE mo.visit_code = v.visit_code
    ) x
  ) AS orders_json
FROM public.outpatient_visit_active v
LEFT JOIN public.patient p ON p.patient_code = v.patient_code
LEFT JOIN public.doctor d ON d.doctor_code = v.doctor_code
LEFT JOIN public.sys_department dept ON dept.dept_code = v.dept_code
LEFT JOIN public.outpatient_encounter_data oed ON oed.visit_code = v.visit_code
LEFT JOIN public.emr_record er ON er.visit_code = v.visit_code AND er.emr_type = 'OUTPATIENT';

-- 7) APIJSON access 注册
INSERT INTO "Access" (name, alias, get, head, gets, heads, post, put, delete)
VALUES
('medical_order_drug_item', 'MedicalOrderDrugItem', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
('medical_order_lab_item', 'MedicalOrderLabItem', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
('lab_result_item', 'LabResultItem', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]'),
('v_outpatient_visit_detail', 'VOutpatientVisitDetail', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["ADMIN"]', '["ADMIN"]', '["ADMIN"]')
ON CONFLICT (name) DO UPDATE SET
  alias = EXCLUDED.alias,
  get = EXCLUDED.get,
  head = EXCLUDED.head,
  gets = EXCLUDED.gets,
  heads = EXCLUDED.heads;

-- 8) APIJSON 参数类型兼容（JDBC string -> enum/jsonb）
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_cast c
    JOIN pg_type s ON s.oid = c.castsource
    JOIN pg_type t ON t.oid = c.casttarget
    WHERE s.typname = 'varchar' AND t.typname = 'order_status_enum'
  ) THEN
    CREATE CAST (varchar AS public.order_status_enum) WITH INOUT AS IMPLICIT;
  END IF;
  IF NOT EXISTS (
    SELECT 1 FROM pg_cast c
    JOIN pg_type s ON s.oid = c.castsource
    JOIN pg_type t ON t.oid = c.casttarget
    WHERE s.typname = 'text' AND t.typname = 'order_status_enum'
  ) THEN
    CREATE CAST (text AS public.order_status_enum) WITH INOUT AS IMPLICIT;
  END IF;
  IF NOT EXISTS (
    SELECT 1 FROM pg_cast c
    JOIN pg_type s ON s.oid = c.castsource
    JOIN pg_type t ON t.oid = c.casttarget
    WHERE s.typname = 'varchar' AND t.typname = 'order_type_enum'
  ) THEN
    CREATE CAST (varchar AS public.order_type_enum) WITH INOUT AS IMPLICIT;
  END IF;
  IF NOT EXISTS (
    SELECT 1 FROM pg_cast c
    JOIN pg_type s ON s.oid = c.castsource
    JOIN pg_type t ON t.oid = c.casttarget
    WHERE s.typname = 'text' AND t.typname = 'order_type_enum'
  ) THEN
    CREATE CAST (text AS public.order_type_enum) WITH INOUT AS IMPLICIT;
  END IF;
  IF NOT EXISTS (
    SELECT 1 FROM pg_cast c
    JOIN pg_type s ON s.oid = c.castsource
    JOIN pg_type t ON t.oid = c.casttarget
    WHERE s.typname = 'varchar' AND t.typname = 'jsonb'
  ) THEN
    CREATE CAST (varchar AS jsonb) WITH INOUT AS IMPLICIT;
  END IF;
  IF NOT EXISTS (
    SELECT 1 FROM pg_cast c
    JOIN pg_type s ON s.oid = c.castsource
    JOIN pg_type t ON t.oid = c.casttarget
    WHERE s.typname = 'text' AND t.typname = 'jsonb'
  ) THEN
    CREATE CAST (text AS jsonb) WITH INOUT AS IMPLICIT;
  END IF;
END $$;

-- 9) 旧表删除（已迁移后执行）
DROP VIEW IF EXISTS public.v_medical_order_drug_compat;
DROP VIEW IF EXISTS public.v_medical_order_lab_compat;
DROP TABLE IF EXISTS public.medical_order_drug;
DROP TABLE IF EXISTS public.medical_order_lab;

COMMIT;
