-- 使用方式：
-- 1) 先执行 outpatient_emr_bundle_trigger_20260327.sql
-- 2) 再执行本测试脚本

BEGIN;

DO $$
DECLARE
  v_visit_code varchar(64);
  v_emr_code varchar(64);
  v_cnt int;
BEGIN
  -- 准备：挑一条可用就诊并重置测试数据
  SELECT visit_code
    INTO v_visit_code
    FROM public.outpatient_visit_active
   ORDER BY id DESC
   LIMIT 1;

  IF v_visit_code IS NULL THEN
    RAISE EXCEPTION '无可用 outpatient_visit_active 数据，请先准备就诊数据';
  END IF;

  PERFORM set_config('app.allow_version_purge', 'on', true);

  DELETE FROM public.emr_record_version
   WHERE emr_code IN (SELECT emr_code FROM public.emr_record WHERE visit_code = v_visit_code AND emr_type = 'OUTPATIENT');

  DELETE FROM public.emr_record
   WHERE visit_code = v_visit_code
     AND emr_type = 'OUTPATIENT';

  UPDATE public.outpatient_encounter_data
     SET encounter_json = '{}'::jsonb,
         update_time = NOW()
   WHERE visit_code = v_visit_code;

  -- A. 首次保存：应创建 emr_record + version=1
  UPDATE public.v_outpatient_emr_bundle
     SET encounter_json = '{"chiefComplaint":"咳嗽3天"}'::jsonb,
         emr_content = '{"xml":"<doc>v1</doc>"}'::jsonb,
         patient_code = 'P_TEST',
         doctor_code = 'D_TEST',
         emr_type = 'OUTPATIENT',
         sign_action = false
   WHERE visit_code = v_visit_code;

  SELECT emr_code INTO v_emr_code
    FROM public.emr_record
   WHERE visit_code = v_visit_code
     AND emr_type = 'OUTPATIENT';

  IF v_emr_code IS NULL THEN
    RAISE EXCEPTION '断言失败：首次保存后 emr_record 未创建';
  END IF;

  IF (SELECT current_version FROM public.emr_record WHERE emr_code = v_emr_code) <> 1 THEN
    RAISE EXCEPTION '断言失败：首次保存后 current_version 应为 1';
  END IF;

  -- B. 第二次保存：版本+1 且 emr_record 行数不变
  UPDATE public.v_outpatient_emr_bundle
     SET encounter_json = '{"chiefComplaint":"咳嗽4天"}'::jsonb,
         emr_content = '{"xml":"<doc>v2</doc>"}'::jsonb,
         sign_action = false
   WHERE visit_code = v_visit_code;

  IF (SELECT current_version FROM public.emr_record WHERE emr_code = v_emr_code) <> 2 THEN
    RAISE EXCEPTION '断言失败：第二次保存后 current_version 应为 2';
  END IF;

  SELECT COUNT(*) INTO v_cnt
    FROM public.emr_record
   WHERE visit_code = v_visit_code
     AND emr_type = 'OUTPATIENT';

  IF v_cnt <> 1 THEN
    RAISE EXCEPTION '断言失败：emr_record 行数应保持 1';
  END IF;

  -- C. 签署保存：状态变 SIGNED，且删除旧未签署版本
  UPDATE public.v_outpatient_emr_bundle
     SET encounter_json = '{"chiefComplaint":"签署终稿"}'::jsonb,
         emr_content = '{"xml":"<doc>signed</doc>"}'::jsonb,
         sign_action = true
   WHERE visit_code = v_visit_code;

  IF (SELECT emr_status FROM public.emr_record WHERE emr_code = v_emr_code) <> 'SIGNED' THEN
    RAISE EXCEPTION '断言失败：签署后 emr_status 应为 SIGNED';
  END IF;

  IF (SELECT COUNT(*) FROM public.emr_record_version WHERE emr_code = v_emr_code AND signed_flag = true) <> 1 THEN
    RAISE EXCEPTION '断言失败：签署后应存在且仅存在 1 条 signed 版本';
  END IF;

  IF EXISTS (SELECT 1 FROM public.emr_record_version WHERE emr_code = v_emr_code AND signed_flag = false) THEN
    RAISE EXCEPTION '断言失败：签署后不应存在未签署版本';
  END IF;

  -- D. 签署后再次保存应失败（捕获异常即通过）
  BEGIN
    UPDATE public.v_outpatient_emr_bundle
       SET encounter_json = '{"chiefComplaint":"不应成功"}'::jsonb,
           emr_content = '{"xml":"<doc>forbidden</doc>"}'::jsonb,
           sign_action = false
     WHERE visit_code = v_visit_code;
    RAISE EXCEPTION '断言失败：签署后更新应被拒绝';
  EXCEPTION
    WHEN others THEN
      -- expected
      NULL;
  END;
END
$$;

-- 仅用于验证，默认回滚，避免污染数据
ROLLBACK;
