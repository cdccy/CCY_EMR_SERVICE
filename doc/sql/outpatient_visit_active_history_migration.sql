BEGIN;

-- =====================================================
-- 设计目标
-- registration.reg_status: REGISTERED / CANCELLED_UNSEEN
-- outpatient_visit_active.visit_status: REGISTERED / IN_CONSULTATION / COMPLETED
-- =====================================================

-- 1) 就诊活跃状态枚举（3种）
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1
    FROM pg_type t
    JOIN pg_namespace n ON n.oid = t.typnamespace
    WHERE n.nspname = 'public'
      AND t.typname = 'visit_status_enum'
  ) THEN
    CREATE TYPE public.visit_status_enum AS ENUM (
      'REGISTERED',
      'IN_CONSULTATION',
      'COMPLETED'
    );
  END IF;
END $$;

-- 历史兼容：若旧枚举已存在但缺 REGISTERED，则补上
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM pg_type t
    JOIN pg_namespace n ON n.oid = t.typnamespace
    WHERE n.nspname = 'public' AND t.typname = 'visit_status_enum'
  ) AND NOT EXISTS (
    SELECT 1
    FROM pg_type t
    JOIN pg_enum e ON e.enumtypid = t.oid
    JOIN pg_namespace n ON n.oid = t.typnamespace
    WHERE n.nspname = 'public'
      AND t.typname = 'visit_status_enum'
      AND e.enumlabel = 'REGISTERED'
  ) THEN
    ALTER TYPE public.visit_status_enum ADD VALUE 'REGISTERED';
  END IF;
END $$;

-- 2) 编码生成函数
CREATE OR REPLACE FUNCTION public.gen_reg_code()
RETURNS varchar
LANGUAGE plpgsql
AS $$
DECLARE
  v_code varchar;
  v_try  int := 0;
BEGIN
  LOOP
    v_try := v_try + 1;
    v_code := 'R' || to_char(clock_timestamp(), 'YYYYMMDDHH24MISSMS')
      || upper(substr(md5(random()::text || clock_timestamp()::text), 1, 6));

    IF NOT EXISTS (SELECT 1 FROM public.registration WHERE reg_code = v_code) THEN
      RETURN v_code;
    END IF;

    IF v_try >= 20 THEN
      RAISE EXCEPTION '无法生成唯一reg_code';
    END IF;
  END LOOP;
END;
$$;

ALTER TABLE public.registration
  ALTER COLUMN reg_code SET DEFAULT public.gen_reg_code();

CREATE OR REPLACE FUNCTION public.gen_visit_code()
RETURNS varchar
LANGUAGE plpgsql
AS $$
DECLARE
  v_code varchar;
  v_try  int := 0;
BEGIN
  LOOP
    v_try := v_try + 1;
    v_code := 'V' || to_char(clock_timestamp(), 'YYYYMMDDHH24MISSMS')
      || upper(substr(md5(random()::text || clock_timestamp()::text), 1, 6));

    IF NOT EXISTS (SELECT 1 FROM public.outpatient_visit_active WHERE visit_code = v_code)
       AND NOT EXISTS (SELECT 1 FROM public.outpatient_visit_history WHERE visit_code = v_code) THEN
      RETURN v_code;
    END IF;

    IF v_try >= 20 THEN
      RAISE EXCEPTION '无法生成唯一visit_code';
    END IF;
  END LOOP;
END;
$$;

-- 3) 活跃表重命名（首次迁移）
DO $$
BEGIN
  IF EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = 'public' AND table_name = 'outpatient_visit'
  ) AND NOT EXISTS (
    SELECT 1 FROM information_schema.tables
    WHERE table_schema = 'public' AND table_name = 'outpatient_visit_active'
  ) THEN
    ALTER TABLE public.outpatient_visit RENAME TO outpatient_visit_active;
  END IF;
END $$;

-- 4) active.status 改造为3状态
ALTER TABLE public.outpatient_visit_active
  ALTER COLUMN visit_status DROP DEFAULT;

ALTER TABLE public.outpatient_visit_active
  ALTER COLUMN visit_status TYPE public.visit_status_enum
  USING (
    CASE
      WHEN visit_status IN ('WAITING', 'REGISTERED', 'DEFAULT', 'IN_PROGRESS') THEN 'REGISTERED'::public.visit_status_enum
      WHEN visit_status IN ('IN_CONSULTATION') THEN 'IN_CONSULTATION'::public.visit_status_enum
      WHEN visit_status IN ('COMPLETED', 'FINISHED') THEN 'COMPLETED'::public.visit_status_enum
      ELSE 'REGISTERED'::public.visit_status_enum
    END
  ),
  ALTER COLUMN visit_status SET NOT NULL,
  ALTER COLUMN visit_status SET DEFAULT 'REGISTERED';

-- 5) history 表（只记录完成就诊）
CREATE TABLE IF NOT EXISTS public.outpatient_visit_history (
  id             bigserial PRIMARY KEY,
  visit_code     varchar(64) NOT NULL UNIQUE,
  reg_code       varchar(64) NOT NULL,
  patient_code   varchar(64) NOT NULL,
  dept_code      varchar(64) NOT NULL,
  doctor_code    varchar(64) NOT NULL,
  visit_type     varchar(32) DEFAULT 'FIRST',
  visit_status   public.visit_status_enum NOT NULL,
  start_time     timestamp without time zone,
  end_time       timestamp without time zone,
  create_time    timestamp without time zone,
  update_time    timestamp without time zone,
  encounter_json jsonb NOT NULL DEFAULT '{}'::jsonb,
  archived_at    timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
  archive_reason varchar(32) NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_visit_history_reg_code ON public.outpatient_visit_history(reg_code);
CREATE INDEX IF NOT EXISTS idx_visit_history_patient_code ON public.outpatient_visit_history(patient_code);
CREATE INDEX IF NOT EXISTS idx_visit_history_archived_at ON public.outpatient_visit_history(archived_at DESC);

-- 6) registration 状态归一与校验（2状态）
UPDATE public.registration SET reg_status = 'REGISTERED' WHERE reg_status IN ('WAITING', 'IN_PROGRESS');
UPDATE public.registration SET reg_status = 'CANCELLED_UNSEEN' WHERE reg_status = 'CANCELLED';

ALTER TABLE public.registration
  ALTER COLUMN reg_status SET DEFAULT 'REGISTERED';

CREATE OR REPLACE FUNCTION public.trg_registration_status_validate()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW.reg_status IS NULL OR btrim(NEW.reg_status) = '' THEN
    NEW.reg_status := 'REGISTERED';
  END IF;

  IF NEW.reg_status NOT IN ('REGISTERED', 'CANCELLED_UNSEEN') THEN
    RAISE EXCEPTION 'registration.reg_status 非法值: %', NEW.reg_status;
  END IF;

  IF TG_OP = 'UPDATE' AND OLD.reg_status = 'CANCELLED_UNSEEN' AND NEW.reg_status = 'REGISTERED' THEN
    RAISE EXCEPTION '已取消挂号不可恢复为已挂号';
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_registration_status_validate ON public.registration;
CREATE TRIGGER trg_registration_status_validate
BEFORE INSERT OR UPDATE OF reg_status ON public.registration
FOR EACH ROW EXECUTE FUNCTION public.trg_registration_status_validate();

-- 7) 基础触发器：补 reg_code、挂号建 active、active 建 encounter
CREATE OR REPLACE FUNCTION public.trg_registration_fill_reg_code()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW.reg_code IS NULL OR btrim(NEW.reg_code) = '' THEN
    NEW.reg_code := public.gen_reg_code();
  END IF;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_registration_fill_reg_code ON public.registration;
CREATE TRIGGER trg_registration_fill_reg_code
BEFORE INSERT ON public.registration
FOR EACH ROW EXECUTE FUNCTION public.trg_registration_fill_reg_code();

CREATE OR REPLACE FUNCTION public.trg_registration_create_active_visit()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF NEW.reg_status = 'REGISTERED' THEN
    INSERT INTO public.outpatient_visit_active (
      visit_code, reg_code, patient_code, dept_code, doctor_code,
      visit_type, visit_status, start_time, end_time, create_time, update_time
    ) VALUES (
      public.gen_visit_code(), NEW.reg_code, NEW.patient_code, NEW.dept_code, NEW.doctor_code,
      'FIRST', 'REGISTERED', CURRENT_TIMESTAMP, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    )
    ON CONFLICT (reg_code) DO NOTHING;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_registration_create_active_visit ON public.registration;
CREATE TRIGGER trg_registration_create_active_visit
AFTER INSERT ON public.registration
FOR EACH ROW EXECUTE FUNCTION public.trg_registration_create_active_visit();

CREATE OR REPLACE FUNCTION public.trg_active_visit_create_encounter()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO public.outpatient_encounter_data (visit_code, encounter_json, create_time, update_time)
  VALUES (NEW.visit_code, '{}'::jsonb, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
  ON CONFLICT (visit_code) DO NOTHING;
  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_active_visit_create_encounter ON public.outpatient_visit_active;
CREATE TRIGGER trg_active_visit_create_encounter
AFTER INSERT ON public.outpatient_visit_active
FOR EACH ROW EXECUTE FUNCTION public.trg_active_visit_create_encounter();

-- 8) 就诊流程状态机（3状态）
CREATE OR REPLACE FUNCTION public.trg_active_visit_status_validate()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF TG_OP = 'UPDATE' AND OLD.visit_status IS DISTINCT FROM NEW.visit_status THEN
    IF OLD.visit_status = 'REGISTERED' AND NEW.visit_status = 'IN_CONSULTATION' THEN
      RETURN NEW;
    ELSIF OLD.visit_status = 'IN_CONSULTATION' AND NEW.visit_status = 'COMPLETED' THEN
      RETURN NEW;
    ELSE
      RAISE EXCEPTION '非法状态流转: % -> %', OLD.visit_status, NEW.visit_status;
    END IF;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_active_visit_status_validate ON public.outpatient_visit_active;
CREATE TRIGGER trg_active_visit_status_validate
BEFORE UPDATE OF visit_status ON public.outpatient_visit_active
FOR EACH ROW EXECUTE FUNCTION public.trg_active_visit_status_validate();

CREATE OR REPLACE FUNCTION public.trg_active_visit_finalize()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_json jsonb := '{}'::jsonb;
BEGIN
  IF TG_OP = 'UPDATE' AND OLD.visit_status IS DISTINCT FROM NEW.visit_status THEN
    IF NEW.visit_status = 'COMPLETED' THEN
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
      );

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

-- 9) 挂号取消（未就诊）只允许删除 REGISTERED 的 active
CREATE OR REPLACE FUNCTION public.trg_registration_cancel_to_visit()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_status public.visit_status_enum;
BEGIN
  IF TG_OP = 'UPDATE'
     AND NEW.reg_status IS DISTINCT FROM OLD.reg_status
     AND NEW.reg_status = 'CANCELLED_UNSEEN' THEN

    SELECT visit_status INTO v_status
    FROM public.outpatient_visit_active
    WHERE reg_code = NEW.reg_code
    FOR UPDATE;

    IF v_status IS NULL THEN
      RETURN NEW;
    END IF;

    IF v_status <> 'REGISTERED' THEN
      RAISE EXCEPTION '当前就诊已进入流程(%)，不允许执行未就诊取消', v_status;
    END IF;

    DELETE FROM public.outpatient_visit_active WHERE reg_code = NEW.reg_code;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_registration_cancel_to_visit ON public.registration;
CREATE TRIGGER trg_registration_cancel_to_visit
AFTER UPDATE OF reg_status ON public.registration
FOR EACH ROW EXECUTE FUNCTION public.trg_registration_cancel_to_visit();

-- 10) history 防篡改（仅允许 INSERT）
CREATE OR REPLACE FUNCTION public.trg_visit_history_readonly()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  RAISE EXCEPTION 'outpatient_visit_history 仅允许INSERT，不允许%操作', TG_OP;
END;
$$;

DROP TRIGGER IF EXISTS trg_visit_history_readonly ON public.outpatient_visit_history;
CREATE TRIGGER trg_visit_history_readonly
BEFORE UPDATE OR DELETE ON public.outpatient_visit_history
FOR EACH ROW EXECUTE FUNCTION public.trg_visit_history_readonly();

COMMIT;
