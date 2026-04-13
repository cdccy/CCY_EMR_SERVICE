BEGIN;

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

  SELECT *
    INTO v_encounter
    FROM public.outpatient_encounter_data
   WHERE visit_code = COALESCE(NEW.visit_code, OLD.visit_code)
   FOR UPDATE;

  IF NOT FOUND THEN
    RAISE EXCEPTION '保存失败：visit_code=% 未找到就诊数据，请先创建空 JSONB 记录', COALESCE(NEW.visit_code, OLD.visit_code);
  END IF;

  SELECT *
    INTO v_record
    FROM public.emr_record
   WHERE visit_code = v_encounter.visit_code
     AND emr_type = COALESCE(NULLIF(NEW.emr_type, ''), 'OUTPATIENT')
   FOR UPDATE;
  v_record_exists := FOUND;

  IF v_record_exists AND v_record.emr_status = 'SIGNED' THEN
    RAISE EXCEPTION '保存失败：病历已签署，禁止修改（visit_code=%）', v_encounter.visit_code;
  END IF;

  UPDATE public.outpatient_encounter_data
     SET encounter_json = COALESCE(NEW.encounter_json, '{}'::jsonb),
         update_time = v_now
   WHERE id = v_encounter.id;

  IF NOT v_record_exists THEN
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

  IF v_sign_action THEN
    INSERT INTO public.emr_record_history (
      emr_code,
      visit_code,
      patient_code,
      doctor_code,
      template_code,
      emr_type,
      version_no,
      emr_content,
      encounter_json,
      signed_flag,
      signed_at,
      emr_status,
      create_time,
      update_time,
      archived_at
    )
    SELECT
      er.emr_code,
      er.visit_code,
      er.patient_code,
      er.doctor_code,
      er.template_code,
      er.emr_type,
      v_next_version,
      COALESCE(NEW.emr_content, '{}'::jsonb),
      COALESCE(NEW.encounter_json, '{}'::jsonb),
      true,
      v_now,
      'SIGNED',
      er.create_time,
      v_now,
      v_now
    FROM public.emr_record er
    WHERE er.emr_code = v_emr_code
    ON CONFLICT (emr_code, version_no) DO UPDATE SET
      emr_content = EXCLUDED.emr_content,
      encounter_json = EXCLUDED.encounter_json,
      signed_at = EXCLUDED.signed_at,
      archived_at = EXCLUDED.archived_at,
      update_time = EXCLUDED.update_time;
  END IF;

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

COMMIT;
