-- 先执行：outpatient_visit_active_history_migration.sql
-- 本测试验证：
-- 1) registration 两状态：REGISTERED / CANCELLED_UNSEEN
-- 2) active 三状态：REGISTERED / IN_CONSULTATION / COMPLETED

-- 用例A：挂号后自动创建 active(REGISTERED) + encounter({})
WITH reg AS (
  INSERT INTO public.registration (
    patient_code, dept_code, doctor_code, reg_date, time_slot, reg_status
  ) VALUES (
    (SELECT patient_code FROM public.patient ORDER BY id LIMIT 1),
    (SELECT dept_code FROM public.sys_department ORDER BY id LIMIT 1),
    'DOC_TEST_A',
    20260311,
    'AM',
    'REGISTERED'
  )
  RETURNING reg_code
)
SELECT r.reg_code, r2.reg_status, v.visit_code, v.visit_status::text AS visit_status, e.encounter_json
FROM reg r
JOIN public.registration r2 ON r2.reg_code = r.reg_code
LEFT JOIN public.outpatient_visit_active v ON v.reg_code = r.reg_code
LEFT JOIN public.outpatient_encounter_data e ON e.visit_code = v.visit_code;
-- 预期：reg_status=REGISTERED, visit_status=REGISTERED, encounter_json={}

-- 用例B：REGISTERED -> IN_CONSULTATION
UPDATE public.outpatient_visit_active
SET visit_status = 'IN_CONSULTATION', update_time = CURRENT_TIMESTAMP
WHERE id = (
  SELECT id FROM public.outpatient_visit_active
  WHERE doctor_code = 'DOC_TEST_A'
  ORDER BY id DESC
  LIMIT 1
)
RETURNING reg_code, visit_code, visit_status;

-- 用例C：IN_CONSULTATION -> COMPLETED，归档并删除 active+encounter
UPDATE public.outpatient_encounter_data e
SET encounter_json = '{"chiefComplaint":"咽痛","diagnosis":["急性咽炎"]}'::jsonb,
    update_time = CURRENT_TIMESTAMP
WHERE e.visit_code = (
  SELECT visit_code FROM public.outpatient_visit_active
  WHERE doctor_code = 'DOC_TEST_A'
  ORDER BY id DESC
  LIMIT 1
);

UPDATE public.outpatient_visit_active
SET visit_status = 'COMPLETED',
    end_time = CURRENT_TIMESTAMP,
    update_time = CURRENT_TIMESTAMP
WHERE id = (
  SELECT id FROM public.outpatient_visit_active
  WHERE doctor_code = 'DOC_TEST_A'
  ORDER BY id DESC
  LIMIT 1
)
RETURNING reg_code, visit_code, visit_status;

SELECT COUNT(*)::int AS active_cnt
FROM public.outpatient_visit_active
WHERE doctor_code = 'DOC_TEST_A';

SELECT COUNT(*)::int AS encounter_cnt
FROM public.outpatient_encounter_data
WHERE visit_code IN (
  SELECT visit_code FROM public.outpatient_visit_history
  WHERE doctor_code = 'DOC_TEST_A'
);

SELECT reg_code, visit_code, visit_status::text AS visit_status, archive_reason, encounter_json
FROM public.outpatient_visit_history
WHERE doctor_code = 'DOC_TEST_A'
ORDER BY id DESC
LIMIT 1;
-- 预期：active_cnt=0, encounter_cnt=0, history新增1条(archive_reason=COMPLETED)

-- 用例D：未就诊取消（REGISTERED -> CANCELLED_UNSEEN）删除 active+encounter，不归档
WITH reg AS (
  INSERT INTO public.registration (
    patient_code, dept_code, doctor_code, reg_date, time_slot, reg_status
  ) VALUES (
    (SELECT patient_code FROM public.patient ORDER BY id LIMIT 1),
    (SELECT dept_code FROM public.sys_department ORDER BY id LIMIT 1),
    'DOC_TEST_B',
    20260311,
    'PM',
    'REGISTERED'
  )
  RETURNING reg_code
)
UPDATE public.registration
SET reg_status = 'CANCELLED_UNSEEN', update_time = CURRENT_TIMESTAMP
WHERE reg_code = (SELECT reg_code FROM reg)
RETURNING reg_code, reg_status;

SELECT COUNT(*)::int AS active_cnt
FROM public.outpatient_visit_active
WHERE doctor_code = 'DOC_TEST_B';

SELECT COUNT(*)::int AS history_cnt
FROM public.outpatient_visit_history
WHERE doctor_code = 'DOC_TEST_B';
-- 预期：active_cnt=0, history_cnt=0

-- 用例E：已进入就诊流程后，不允许未就诊取消
WITH reg AS (
  INSERT INTO public.registration (
    patient_code, dept_code, doctor_code, reg_date, time_slot, reg_status
  ) VALUES (
    (SELECT patient_code FROM public.patient ORDER BY id LIMIT 1),
    (SELECT dept_code FROM public.sys_department ORDER BY id LIMIT 1),
    'DOC_TEST_C',
    20260311,
    'AM',
    'REGISTERED'
  )
  RETURNING reg_code
)
SELECT reg_code FROM reg;

UPDATE public.outpatient_visit_active
SET visit_status = 'IN_CONSULTATION', update_time = CURRENT_TIMESTAMP
WHERE id = (
  SELECT id FROM public.outpatient_visit_active
  WHERE doctor_code = 'DOC_TEST_C'
  ORDER BY id DESC
  LIMIT 1
);

-- 下面语句应报错：当前就诊已进入流程，不允许未就诊取消
UPDATE public.registration
SET reg_status = 'CANCELLED_UNSEEN', update_time = CURRENT_TIMESTAMP
WHERE reg_code = (
  SELECT reg_code FROM public.outpatient_visit_active
  WHERE doctor_code = 'DOC_TEST_C'
  ORDER BY id DESC
  LIMIT 1
);
