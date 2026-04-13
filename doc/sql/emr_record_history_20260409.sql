-- =============================================================================
-- 电子病历历史归档表 + 触发器
-- 作者：CCY  日期：2026-04-09
--
-- 设计逻辑：
--   1. emr_record_history：综合 emr_record + emr_record_version + encounter_json，
--      在病历签署（emr_status 变为 SIGNED）时由触发器自动写入，只写不改。
--   2. trg_emr_record_archive：AFTER UPDATE OF emr_status ON emr_record，
--      当状态变为 SIGNED 时执行归档。
--   3. 升级 trg_active_visit_finalize：结算前校验 emr_record_history 已有该
--      visit_code 的签署记录，否则阻止。
--
-- 执行顺序：直接在目标数据库运行本文件（幂等，可重复执行）。
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 1. 电子病历历史归档表
-- -----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.emr_record_history (
  id               bigserial        PRIMARY KEY,
  emr_code         varchar(64)      NOT NULL,
  visit_code       varchar(64)      NOT NULL,
  patient_code     varchar(64)      NOT NULL,
  doctor_code      varchar(64)      NOT NULL,
  template_code    varchar(64)      NOT NULL,
  emr_type         varchar(32)      NOT NULL,
  version_no       integer          NOT NULL DEFAULT 1,
  -- 病历正文（DCWriter XML）+ 结构化就诊数据（JSONB）合并存储
  emr_content      jsonb            NOT NULL DEFAULT '{}'::jsonb,
  encounter_json   jsonb            NOT NULL DEFAULT '{}'::jsonb,
  signed_flag      boolean          NOT NULL DEFAULT true,
  signed_at        timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  emr_status       varchar(32)      NOT NULL DEFAULT 'SIGNED',
  create_time      timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  update_time      timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  archived_at      timestamp        NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_emr_record_history_emr_code_version UNIQUE (emr_code, version_no)
);

COMMENT ON TABLE  public.emr_record_history                 IS '电子病历归档历史表（签署时自动写入，只写不改）';
COMMENT ON COLUMN public.emr_record_history.emr_code        IS '病历实例编码';
COMMENT ON COLUMN public.emr_record_history.visit_code      IS '门诊就诊编码';
COMMENT ON COLUMN public.emr_record_history.patient_code    IS '患者编码';
COMMENT ON COLUMN public.emr_record_history.doctor_code     IS '医生编码';
COMMENT ON COLUMN public.emr_record_history.template_code   IS '病历模板编码';
COMMENT ON COLUMN public.emr_record_history.emr_type        IS '病历类型';
COMMENT ON COLUMN public.emr_record_history.version_no      IS '签署时的版本号';
COMMENT ON COLUMN public.emr_record_history.emr_content     IS '病历正文（DCWriter XML等）';
COMMENT ON COLUMN public.emr_record_history.encounter_json  IS '结构化就诊数据 JSONB（来自 outpatient_encounter_data）';
COMMENT ON COLUMN public.emr_record_history.signed_flag     IS '是否已签署（归档时恒为 true）';
COMMENT ON COLUMN public.emr_record_history.signed_at       IS '签署时间';
COMMENT ON COLUMN public.emr_record_history.archived_at     IS '归档时间';

CREATE INDEX IF NOT EXISTS idx_emr_record_history_visit_code
  ON public.emr_record_history(visit_code);

CREATE INDEX IF NOT EXISTS idx_emr_record_history_patient_code
  ON public.emr_record_history(patient_code);

CREATE INDEX IF NOT EXISTS idx_emr_record_history_archived_at
  ON public.emr_record_history(archived_at DESC);

-- -----------------------------------------------------------------------------
-- 2. 触发器：emr_record.emr_status 变为 SIGNED 时自动归档
--    归档数据来源：emr_record + emr_record_version（current_version）
--                + outpatient_encounter_data（encounter_json）
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.fn_emr_record_archive()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_emr_content   jsonb;
  v_encounter_json jsonb;
  v_version_no    integer;
BEGIN
  -- 只处理 emr_status 变为 SIGNED 的更新
  IF TG_OP <> 'UPDATE'
     OR NEW.emr_status IS NOT DISTINCT FROM OLD.emr_status
     OR NEW.emr_status <> 'SIGNED'
  THEN
    RETURN NEW;
  END IF;

  -- 读取当前版本的病历内容
  v_version_no := COALESCE(NEW.current_version, 1);

  SELECT emr_content INTO v_emr_content
  FROM public.emr_record_version
  WHERE emr_code   = NEW.emr_code
    AND version_no = v_version_no
  ORDER BY id DESC
  LIMIT 1;

  -- 读取结构化就诊数据
  SELECT encounter_json INTO v_encounter_json
  FROM public.outpatient_encounter_data
  WHERE visit_code = NEW.visit_code
  LIMIT 1;

  -- 插入归档记录（冲突则更新，以支持重复签署场景）
  INSERT INTO public.emr_record_history (
    emr_code, visit_code, patient_code, doctor_code, template_code,
    emr_type, version_no, emr_content, encounter_json,
    signed_flag, signed_at, emr_status, create_time, update_time, archived_at
  ) VALUES (
    NEW.emr_code, NEW.visit_code, NEW.patient_code, NEW.doctor_code, NEW.template_code,
    NEW.emr_type, v_version_no,
    COALESCE(v_emr_content, '{}'::jsonb),
    COALESCE(v_encounter_json, '{}'::jsonb),
    true, CURRENT_TIMESTAMP, 'SIGNED',
    NEW.create_time, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
  )
  ON CONFLICT (emr_code, version_no) DO UPDATE SET
    emr_content    = EXCLUDED.emr_content,
    encounter_json = EXCLUDED.encounter_json,
    signed_at      = EXCLUDED.signed_at,
    archived_at    = EXCLUDED.archived_at,
    update_time    = EXCLUDED.update_time;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_emr_record_archive ON public.emr_record;
CREATE TRIGGER trg_emr_record_archive
AFTER UPDATE OF emr_status ON public.emr_record
FOR EACH ROW EXECUTE FUNCTION public.fn_emr_record_archive();

-- -----------------------------------------------------------------------------
-- 3. 升级 trg_active_visit_finalize：结算前检查该就诊已有签署的病历归档
--    逻辑：outpatient_visit_active.visit_status → COMPLETED 时，
--    先查 emr_record_history（或 emr_record 的 emr_status=SIGNED），
--    若无签署记录则抛出异常阻止结算。
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.trg_active_visit_finalize()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_json         jsonb := '{}'::jsonb;
  v_signed_count integer;
BEGIN
  IF TG_OP = 'UPDATE' AND OLD.visit_status IS DISTINCT FROM NEW.visit_status THEN
    IF NEW.visit_status = 'COMPLETED' THEN

      -- 检查是否有已签署的病历归档记录
      SELECT COUNT(*) INTO v_signed_count
      FROM public.emr_record_history
      WHERE visit_code = NEW.visit_code
        AND signed_flag = true;

      -- 兼容：若归档表无记录，也检查 emr_record 的当前状态
      IF v_signed_count = 0 THEN
        SELECT COUNT(*) INTO v_signed_count
        FROM public.emr_record
        WHERE visit_code  = NEW.visit_code
          AND emr_status  = 'SIGNED';
      END IF;

      IF v_signed_count = 0 THEN
        RAISE EXCEPTION '就诊 % 尚无已签署的电子病历，请先签署病历再结算', NEW.visit_code;
      END IF;

      -- 获取就诊结构化数据存入历史
      SELECT encounter_json INTO v_json
      FROM public.outpatient_encounter_data
      WHERE visit_code = NEW.visit_code;

      INSERT INTO public.outpatient_visit_history (
        visit_code, reg_code, patient_code, dept_code, doctor_code,
        visit_type, visit_status, start_time, end_time, create_time, update_time,
        encounter_json, archived_at, archive_reason
      ) VALUES (
        NEW.visit_code, NEW.reg_code, NEW.patient_code, NEW.dept_code, NEW.doctor_code,
        NEW.visit_type, NEW.visit_status,
        NEW.start_time, COALESCE(NEW.end_time, CURRENT_TIMESTAMP), NEW.create_time, CURRENT_TIMESTAMP,
        COALESCE(v_json, '{}'::jsonb), CURRENT_TIMESTAMP, 'COMPLETED'
      )
      ON CONFLICT (visit_code) DO NOTHING;

      DELETE FROM public.outpatient_visit_active WHERE id = NEW.id;
    END IF;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_active_visit_finalize ON public.outpatient_visit_active;
CREATE TRIGGER trg_active_visit_finalize
AFTER UPDATE OF visit_status ON public.outpatient_visit_active
FOR EACH ROW EXECUTE FUNCTION public.trg_active_visit_finalize();

-- -----------------------------------------------------------------------------
-- 4. 历史表防篡改（只允许 INSERT）
-- -----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.fn_emr_record_history_readonly()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF TG_OP IN ('UPDATE', 'DELETE') THEN
    RAISE EXCEPTION '电子病历归档记录不允许修改或删除（visit_code=%）', OLD.visit_code;
  END IF;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_emr_record_history_readonly ON public.emr_record_history;
CREATE TRIGGER trg_emr_record_history_readonly
BEFORE UPDATE OR DELETE ON public.emr_record_history
FOR EACH ROW EXECUTE FUNCTION public.fn_emr_record_history_readonly();

-- -----------------------------------------------------------------------------
-- 5. APIJSON Access 配置（只读查询权限）
-- -----------------------------------------------------------------------------
INSERT INTO "apijson"."Access" (
  "name", "alias", "get", "gets", "head", "heads", "post", "put", "delete"
) VALUES (
  'emr_record_history', 'EmrRecordHistory',
  '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]', '["LOGIN","ADMIN"]',
  '["ADMIN"]', '["ADMIN"]', '["ADMIN"]'
) ON CONFLICT ("name") DO UPDATE SET
  "alias" = EXCLUDED."alias",
  "get"   = EXCLUDED."get",
  "gets"  = EXCLUDED."gets",
  "head"  = EXCLUDED."head",
  "heads" = EXCLUDED."heads";
