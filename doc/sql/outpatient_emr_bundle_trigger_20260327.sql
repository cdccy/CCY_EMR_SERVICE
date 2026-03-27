BEGIN;

-- 0) 基础约束：病历状态仅允许 DRAFT / SIGNED
ALTER TABLE public.emr_record
  DROP CONSTRAINT IF EXISTS ck_emr_record_status;

ALTER TABLE public.emr_record
  ADD CONSTRAINT ck_emr_record_status
  CHECK (emr_status IN ('DRAFT', 'SIGNED'));

-- 1) 同一次就诊同类型病历仅一条主记录
CREATE UNIQUE INDEX IF NOT EXISTS uq_emr_record_visit_type
  ON public.emr_record(visit_code, emr_type);

-- 2) 读取视图：按 visit_code 输出最新病历版本 + 就诊数据
CREATE OR REPLACE VIEW public.v_outpatient_emr_bundle_latest AS
SELECT
  oed.id AS id,
  oed.id AS encounter_id,
  oed.visit_code,
  oed.encounter_json,
  er.id AS emr_record_id,
  er.emr_code,
  er.patient_code,
  er.doctor_code,
  er.emr_type,
  er.emr_status,
  er.current_version,
  rv.id AS version_id,
  rv.emr_content,
  rv.signed_flag,
  rv.version_no,
  GREATEST(
    COALESCE(oed.update_time, TIMESTAMP '1970-01-01'),
    COALESCE(er.update_time, TIMESTAMP '1970-01-01'),
    COALESCE(rv.update_time, TIMESTAMP '1970-01-01')
  ) AS update_time
FROM public.outpatient_encounter_data oed
LEFT JOIN public.emr_record er
  ON er.visit_code = oed.visit_code
 AND er.emr_type = 'OUTPATIENT'
LEFT JOIN public.emr_record_version rv
  ON rv.emr_code = er.emr_code
 AND rv.version_no = er.current_version;

-- 3) 写入视图：APIJSON 通过该视图 PUT，实现三表同事务保存
CREATE OR REPLACE VIEW public.v_outpatient_emr_bundle AS
SELECT
  oed.id AS id,
  oed.id AS encounter_id,
  oed.visit_code,
  oed.encounter_json,
  er.emr_code,
  er.patient_code,
  er.doctor_code,
  er.emr_type,
  er.emr_status,
  er.current_version,
  rv.emr_content,
  rv.signed_flag,
  false::boolean AS sign_action,
  er.template_code
FROM public.outpatient_encounter_data oed
LEFT JOIN public.emr_record er
  ON er.visit_code = oed.visit_code
 AND er.emr_type = 'OUTPATIENT'
LEFT JOIN public.emr_record_version rv
  ON rv.emr_code = er.emr_code
 AND rv.version_no = er.current_version;

-- 4) 视图更新触发器函数：仅支持 UPDATE（首次空 JSONB 已由其他逻辑创建）
CREATE OR REPLACE FUNCTION public.fn_v_outpatient_emr_bundle_u()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_encounter public.outpatient_encounter_data%ROWTYPE;
  v_record public.emr_record%ROWTYPE;
  v_record_exists boolean := false;
  v_emr_code varchar(64);
  v_next_version integer;
  v_now timestamp := NOW();
  v_sign_action boolean := COALESCE(NEW.sign_action, false) OR COALESCE(NEW.signed_flag, false);
BEGIN
  IF TG_OP <> 'UPDATE' THEN
    RAISE EXCEPTION 'v_outpatient_emr_bundle 仅支持 UPDATE';
  END IF;

  IF COALESCE(NEW.visit_code, OLD.visit_code) IS NULL THEN
    RAISE EXCEPTION '保存失败：visit_code 不能为空';
  END IF;

  -- 4.1 锁定并更新就诊结构化数据（记录必须预先存在）
  SELECT *
    INTO v_encounter
    FROM public.outpatient_encounter_data
   WHERE visit_code = COALESCE(NEW.visit_code, OLD.visit_code)
   FOR UPDATE;

  IF NOT FOUND THEN
    RAISE EXCEPTION '保存失败：visit_code=% 未找到就诊数据，请先创建空 JSONB 记录', COALESCE(NEW.visit_code, OLD.visit_code);
  END IF;

  -- 4.2 锁定病历主记录
  SELECT *
    INTO v_record
    FROM public.emr_record
   WHERE visit_code = v_encounter.visit_code
     AND emr_type = COALESCE(NULLIF(NEW.emr_type, ''), 'OUTPATIENT')
   FOR UPDATE;
  v_record_exists := FOUND;

  -- 4.3 已签署则禁止写入
  IF v_record_exists AND v_record.emr_status = 'SIGNED' THEN
    RAISE EXCEPTION '保存失败：病历已签署，禁止修改（visit_code=%）', v_encounter.visit_code;
  END IF;

  UPDATE public.outpatient_encounter_data
     SET encounter_json = COALESCE(NEW.encounter_json, '{}'::jsonb),
         update_time = v_now
   WHERE id = v_encounter.id;

  IF NOT v_record_exists THEN
    -- 首次建立 emr_record
    v_emr_code := COALESCE(NULLIF(NEW.emr_code, ''), 'EMR_' || v_encounter.visit_code || '_' || to_char(clock_timestamp(), 'YYYYMMDDHH24MISSMS'));
    v_next_version := 1;

    INSERT INTO public.emr_record (
      emr_code,
      visit_code,
      patient_code,
      doctor_code,
      template_code,
      emr_type,
      emr_status,
      current_version,
      create_time,
      update_time
    )
    VALUES (
      v_emr_code,
      v_encounter.visit_code,
      COALESCE(NULLIF(NEW.patient_code, ''), ''),
      COALESCE(NULLIF(NEW.doctor_code, ''), ''),
      COALESCE(NULLIF(NEW.template_code, ''), 'OUTPATIENT_RUNTIME'),
      COALESCE(NULLIF(NEW.emr_type, ''), 'OUTPATIENT'),
      CASE WHEN v_sign_action THEN 'SIGNED' ELSE 'DRAFT' END,
      v_next_version,
      v_now,
      v_now
    );
  ELSE
    v_emr_code := v_record.emr_code;
    v_next_version := COALESCE(v_record.current_version, 0) + 1;

    UPDATE public.emr_record
       SET current_version = v_next_version,
           emr_status = CASE WHEN v_sign_action THEN 'SIGNED' ELSE 'DRAFT' END,
           update_time = v_now
     WHERE id = v_record.id;
  END IF;

  -- 4.4 每次保存都新增版本（版本表只允许新增，不允许修改）
  INSERT INTO public.emr_record_version (
    emr_code,
    version_no,
    emr_content,
    signed_flag,
    create_time,
    update_time
  )
  VALUES (
    v_emr_code,
    v_next_version,
    COALESCE(NEW.emr_content, '{}'::jsonb),
    v_sign_action,
    v_now,
    v_now
  );

  -- 4.5 签署时，删除同 emr_code 历史未签署版本，仅保留最新签署版本
  IF v_sign_action THEN
    PERFORM set_config('app.allow_version_purge', 'on', true);
    DELETE FROM public.emr_record_version
     WHERE emr_code = v_emr_code
       AND version_no <> v_next_version
       AND COALESCE(signed_flag, false) = false;
  END IF;

  NEW.emr_code := v_emr_code;
  NEW.current_version := v_next_version;
  NEW.emr_status := CASE WHEN v_sign_action THEN 'SIGNED' ELSE 'DRAFT' END;
  NEW.signed_flag := v_sign_action;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_v_outpatient_emr_bundle_u ON public.v_outpatient_emr_bundle;

CREATE TRIGGER trg_v_outpatient_emr_bundle_u
INSTEAD OF UPDATE
ON public.v_outpatient_emr_bundle
FOR EACH ROW
EXECUTE FUNCTION public.fn_v_outpatient_emr_bundle_u();

-- 5) 写保护：emr_record 签署后不可改；只允许 DRAFT -> SIGNED
CREATE OR REPLACE FUNCTION public.fn_emr_record_guard_bu()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF OLD.emr_status = 'SIGNED' THEN
    IF NEW IS DISTINCT FROM OLD THEN
      RAISE EXCEPTION 'emr_record 已签署，禁止修改（emr_code=%）', OLD.emr_code;
    END IF;
  END IF;

  IF COALESCE(OLD.emr_status, 'DRAFT') <> COALESCE(NEW.emr_status, 'DRAFT')
     AND NOT (OLD.emr_status = 'DRAFT' AND NEW.emr_status = 'SIGNED') THEN
    RAISE EXCEPTION '非法状态流转：% -> %（emr_code=%）', OLD.emr_status, NEW.emr_status, OLD.emr_code;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_emr_record_guard_bu ON public.emr_record;

CREATE TRIGGER trg_emr_record_guard_bu
BEFORE UPDATE
ON public.emr_record
FOR EACH ROW
EXECUTE FUNCTION public.fn_emr_record_guard_bu();

-- 6) 写保护：版本表只允许 INSERT，禁止 UPDATE/DELETE
CREATE OR REPLACE FUNCTION public.fn_emr_record_version_guard_bud()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF TG_OP = 'UPDATE' THEN
    RAISE EXCEPTION 'emr_record_version 只允许新增，禁止更新（id=%）', OLD.id;
  ELSIF TG_OP = 'DELETE' THEN
    IF current_setting('app.allow_version_purge', true) = 'on' THEN
      RETURN OLD;
    END IF;
    RAISE EXCEPTION 'emr_record_version 只允许新增，禁止删除（id=%）', OLD.id;
  END IF;
  RETURN NULL;
END;
$$;

DROP TRIGGER IF EXISTS trg_emr_record_version_guard_bu ON public.emr_record_version;
DROP TRIGGER IF EXISTS trg_emr_record_version_guard_bd ON public.emr_record_version;

CREATE TRIGGER trg_emr_record_version_guard_bu
BEFORE UPDATE
ON public.emr_record_version
FOR EACH ROW
EXECUTE FUNCTION public.fn_emr_record_version_guard_bud();

CREATE TRIGGER trg_emr_record_version_guard_bd
BEFORE DELETE
ON public.emr_record_version
FOR EACH ROW
EXECUTE FUNCTION public.fn_emr_record_version_guard_bud();

-- 6.1 插入保护：signed_flag 与主表状态联动约束
CREATE OR REPLACE FUNCTION public.fn_emr_record_version_guard_bi()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_status varchar(32);
  v_current integer;
BEGIN
  SELECT emr_status, current_version
    INTO v_status, v_current
    FROM public.emr_record
   WHERE emr_code = NEW.emr_code;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'emr_record_version 插入失败：emr_code=% 对应主记录不存在', NEW.emr_code;
  END IF;

  IF COALESCE(v_status, 'DRAFT') = 'SIGNED' AND COALESCE(NEW.signed_flag, false) = false THEN
    RAISE EXCEPTION 'emr_record 已签署时，禁止写入未签署版本（emr_code=%）', NEW.emr_code;
  END IF;

  IF COALESCE(NEW.signed_flag, false) = true THEN
    IF v_status <> 'SIGNED' THEN
      RAISE EXCEPTION 'signed_flag=true 时主记录必须为 SIGNED（emr_code=%）', NEW.emr_code;
    END IF;
    IF NEW.version_no <> v_current THEN
      RAISE EXCEPTION 'signed_flag=true 时 version_no 必须等于 current_version（emr_code=%）', NEW.emr_code;
    END IF;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_emr_record_version_guard_bi ON public.emr_record_version;

CREATE TRIGGER trg_emr_record_version_guard_bi
BEFORE INSERT
ON public.emr_record_version
FOR EACH ROW
EXECUTE FUNCTION public.fn_emr_record_version_guard_bi();

-- 7) 写保护：关联病历已签署时，不允许改就诊 JSON
CREATE OR REPLACE FUNCTION public.fn_outpatient_encounter_guard_bu()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_signed boolean;
BEGIN
  SELECT EXISTS (
    SELECT 1
      FROM public.emr_record er
     WHERE er.visit_code = OLD.visit_code
       AND er.emr_type = 'OUTPATIENT'
       AND er.emr_status = 'SIGNED'
  ) INTO v_signed;

  IF v_signed AND (NEW.encounter_json IS DISTINCT FROM OLD.encounter_json) THEN
    RAISE EXCEPTION '就诊数据禁止修改：对应病历已签署（visit_code=%）', OLD.visit_code;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_outpatient_encounter_guard_bu ON public.outpatient_encounter_data;

CREATE TRIGGER trg_outpatient_encounter_guard_bu
BEFORE UPDATE
ON public.outpatient_encounter_data
FOR EACH ROW
EXECUTE FUNCTION public.fn_outpatient_encounter_guard_bu();

-- 8) APIJSON Access 注册：提供读写视图能力
INSERT INTO "Access" (name, alias, get, head, gets, heads, post, put, delete)
VALUES
  (
    'v_outpatient_emr_bundle_latest',
    'VOutpatientEmrBundleLatest',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["ADMIN"]',
    '["ADMIN"]',
    '["ADMIN"]'
  ),
  (
    'v_outpatient_emr_bundle',
    'VOutpatientEmrBundle',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["ADMIN"]'
  )
ON CONFLICT (name) DO UPDATE
SET
  alias = EXCLUDED.alias,
  get = EXCLUDED.get,
  head = EXCLUDED.head,
  gets = EXCLUDED.gets,
  heads = EXCLUDED.heads,
  post = EXCLUDED.post,
  put = EXCLUDED.put,
  delete = EXCLUDED.delete;

COMMIT;
