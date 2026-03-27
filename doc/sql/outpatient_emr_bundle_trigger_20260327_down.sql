BEGIN;

DROP TRIGGER IF EXISTS trg_v_outpatient_emr_bundle_u ON public.v_outpatient_emr_bundle;
DROP FUNCTION IF EXISTS public.fn_v_outpatient_emr_bundle_u();

DROP TRIGGER IF EXISTS trg_emr_record_guard_bu ON public.emr_record;
DROP FUNCTION IF EXISTS public.fn_emr_record_guard_bu();

DROP TRIGGER IF EXISTS trg_emr_record_version_guard_bu ON public.emr_record_version;
DROP TRIGGER IF EXISTS trg_emr_record_version_guard_bd ON public.emr_record_version;
DROP TRIGGER IF EXISTS trg_emr_record_version_guard_bi ON public.emr_record_version;
DROP FUNCTION IF EXISTS public.fn_emr_record_version_guard_bud();
DROP FUNCTION IF EXISTS public.fn_emr_record_version_guard_bi();

DROP TRIGGER IF EXISTS trg_outpatient_encounter_guard_bu ON public.outpatient_encounter_data;
DROP FUNCTION IF EXISTS public.fn_outpatient_encounter_guard_bu();

DROP VIEW IF EXISTS public.v_outpatient_emr_bundle;
DROP VIEW IF EXISTS public.v_outpatient_emr_bundle_latest;

DROP INDEX IF EXISTS public.uq_emr_record_visit_type;

ALTER TABLE public.emr_record
  DROP CONSTRAINT IF EXISTS ck_emr_record_status;

DELETE FROM "Access"
 WHERE name IN ('v_outpatient_emr_bundle', 'v_outpatient_emr_bundle_latest');

COMMIT;
