--
-- PostgreSQL database dump
--

\restrict nb02gnCTIfZO3BQnaSMojTRTcZgZcs4WXYSyqU8MDM63g65vxclmayDhaF2ip5K

-- Dumped from database version 16.13
-- Dumped by pg_dump version 16.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: visit_status_enum; Type: TYPE; Schema: public; Owner: emr_user
--

CREATE TYPE public.visit_status_enum AS ENUM (
    'REGISTERED',
    'IN_CONSULTATION',
    'COMPLETED'
);


ALTER TYPE public.visit_status_enum OWNER TO emr_user;

--
-- Name: fn_emr_record_guard_bu(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.fn_emr_record_guard_bu() RETURNS trigger
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


ALTER FUNCTION public.fn_emr_record_guard_bu() OWNER TO emr_user;

--
-- Name: fn_emr_record_version_guard_bi(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.fn_emr_record_version_guard_bi() RETURNS trigger
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


ALTER FUNCTION public.fn_emr_record_version_guard_bi() OWNER TO emr_user;

--
-- Name: fn_emr_record_version_guard_bud(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.fn_emr_record_version_guard_bud() RETURNS trigger
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


ALTER FUNCTION public.fn_emr_record_version_guard_bud() OWNER TO emr_user;

--
-- Name: fn_outpatient_encounter_guard_bu(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.fn_outpatient_encounter_guard_bu() RETURNS trigger
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


ALTER FUNCTION public.fn_outpatient_encounter_guard_bu() OWNER TO emr_user;

--
-- Name: fn_v_doctor_user_manage_iud(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.fn_v_doctor_user_manage_iud() RETURNS trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    v_username varchar(50);
    v_doctor_name varchar(128);
    v_dept_code varchar(64);
    v_title_code varchar(32);
    v_license_no varchar(64);
    v_password_hash varchar(100);
    v_rc integer;
BEGIN
    IF TG_OP = 'INSERT' THEN
        IF NEW.doctor_code IS NULL OR btrim(NEW.doctor_code) = '' THEN
            RAISE EXCEPTION 'doctor_code 不能为空';
        END IF;
        IF NEW.doctor_name IS NULL OR btrim(NEW.doctor_name) = '' THEN
            RAISE EXCEPTION 'doctor_name 不能为空';
        END IF;
        IF NEW.dept_code IS NULL OR btrim(NEW.dept_code) = '' THEN
            RAISE EXCEPTION 'dept_code 不能为空';
        END IF;
        IF NEW.username IS NULL OR btrim(NEW.username) = '' THEN
            RAISE EXCEPTION 'username 不能为空';
        END IF;
        IF NEW.password IS NULL OR btrim(NEW.password) = '' THEN
            RAISE EXCEPTION 'password 不能为空';
        END IF;
        IF length(btrim(NEW.password)) < 6 THEN
            RAISE EXCEPTION 'password 长度不能小于 6';
        END IF;
        IF NEW.user_status IS NOT NULL AND NEW.user_status NOT IN (0, 1) THEN
            RAISE EXCEPTION 'user_status 仅允许 0 或 1';
        END IF;

        v_username := btrim(NEW.username);
        v_doctor_name := btrim(NEW.doctor_name);
        v_dept_code := btrim(NEW.dept_code);
        v_title_code := NULLIF(btrim(COALESCE(NEW.title_code, '')), '');
        v_license_no := NULLIF(btrim(COALESCE(NEW.license_no, '')), '');
        v_password_hash := CASE
            WHEN NEW.password ~ '^\$2[aby]\$\d{2}\$[./A-Za-z0-9]{53}$' THEN NEW.password
            ELSE crypt(NEW.password, gen_salt('bf', 10))
        END;

        IF EXISTS (SELECT 1 FROM public.sys_user u WHERE u.username = v_username) THEN
            RAISE EXCEPTION 'username 已存在: %', v_username;
        END IF;
        IF EXISTS (SELECT 1 FROM public.doctor d WHERE d.doctor_code = btrim(NEW.doctor_code)) THEN
            RAISE EXCEPTION 'doctor_code 已存在: %', btrim(NEW.doctor_code);
        END IF;

        INSERT INTO public.sys_user (
            username,
            password,
            name,
            status,
            create_time,
            update_time,
            is_deleted
        )
        VALUES (
            v_username,
            v_password_hash,
            COALESCE(NULLIF(v_doctor_name, ''), v_username),
            COALESCE(NEW.user_status, 1),
            CURRENT_TIMESTAMP,
            CURRENT_TIMESTAMP,
            0
        );

        INSERT INTO public.doctor (
            doctor_code,
            doctor_name,
            dept_code,
            title_code,
            license_no,
            user_username,
            enabled,
            create_time,
            update_time
        )
        VALUES (
            btrim(NEW.doctor_code),
            v_doctor_name,
            v_dept_code,
            v_title_code,
            v_license_no,
            v_username,
            COALESCE(NEW.doctor_enabled, true),
            CURRENT_TIMESTAMP,
            CURRENT_TIMESTAMP
        );

        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        IF COALESCE(NEW.username, '') <> COALESCE(OLD.username, '') THEN
            RAISE EXCEPTION 'username 不允许修改';
        END IF;
        IF NEW.user_status IS NOT NULL AND NEW.user_status NOT IN (0, 1) THEN
            RAISE EXCEPTION 'user_status 仅允许 0 或 1';
        END IF;
        IF NEW.password IS NOT NULL
           AND btrim(NEW.password) <> ''
           AND length(btrim(NEW.password)) < 6 THEN
            RAISE EXCEPTION 'password 长度不能小于 6';
        END IF;

        UPDATE public.doctor d
        SET doctor_name = COALESCE(NULLIF(btrim(NEW.doctor_name), ''), d.doctor_name),
            dept_code = COALESCE(NULLIF(btrim(NEW.dept_code), ''), d.dept_code),
            title_code = CASE
                WHEN NEW.title_code IS NULL THEN d.title_code
                ELSE NULLIF(btrim(NEW.title_code), '')
            END,
            license_no = CASE
                WHEN NEW.license_no IS NULL THEN d.license_no
                ELSE NULLIF(btrim(NEW.license_no), '')
            END,
            enabled = COALESCE(NEW.doctor_enabled, d.enabled),
            update_time = CURRENT_TIMESTAMP
        WHERE d.id = OLD.doctor_id;
        GET DIAGNOSTICS v_rc = ROW_COUNT;
        IF v_rc = 0 THEN
            RAISE EXCEPTION 'doctor 记录不存在或已被并发修改, doctor_id=%', OLD.doctor_id;
        END IF;

        UPDATE public.sys_user u
        SET name = COALESCE(NULLIF(btrim(NEW.doctor_name), ''), u.name),
            status = COALESCE(NEW.user_status, u.status),
            password = CASE
                WHEN NEW.password IS NULL OR btrim(NEW.password) = '' THEN u.password
                WHEN NEW.password ~ '^\$2[aby]\$\d{2}\$[./A-Za-z0-9]{53}$' THEN NEW.password
                ELSE crypt(NEW.password, gen_salt('bf', 10))
            END,
            update_time = CURRENT_TIMESTAMP
        WHERE u.id = OLD.user_id;
        GET DIAGNOSTICS v_rc = ROW_COUNT;
        IF v_rc = 0 THEN
            RAISE EXCEPTION 'sys_user 记录不存在或已被并发修改, user_id=%', OLD.user_id;
        END IF;

        RETURN NEW;
    ELSIF TG_OP = 'DELETE' THEN
        UPDATE public.doctor
        SET enabled = false,
            update_time = CURRENT_TIMESTAMP
        WHERE id = OLD.doctor_id;
        GET DIAGNOSTICS v_rc = ROW_COUNT;
        IF v_rc = 0 THEN
            RAISE EXCEPTION 'doctor 记录不存在, doctor_id=%', OLD.doctor_id;
        END IF;

        UPDATE public.sys_user
        SET is_deleted = 1,
            update_time = CURRENT_TIMESTAMP
        WHERE id = OLD.user_id;
        GET DIAGNOSTICS v_rc = ROW_COUNT;
        IF v_rc = 0 THEN
            RAISE EXCEPTION 'sys_user 记录不存在, user_id=%', OLD.user_id;
        END IF;

        RETURN OLD;
    END IF;

    RETURN NULL;
END;
$_$;


ALTER FUNCTION public.fn_v_doctor_user_manage_iud() OWNER TO emr_user;

--
-- Name: fn_v_emr_template_manage_iou(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.fn_v_emr_template_manage_iou() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_template_id BIGINT;
BEGIN
  IF TG_OP = 'INSERT' THEN
    IF NEW.template_scope = 'DEPARTMENT' AND NEW.selected_dept_id IS NULL THEN
      RAISE EXCEPTION '科室范围模板必须传入 selected_dept_id';
    END IF;

    INSERT INTO public.emr_template (
      template_code,
      template_name,
      emr_type,
      template_scope,
      template_structure,
      enabled,
      create_time,
      update_time
    )
    VALUES (
      NEW.template_code,
      NEW.template_name,
      NEW.emr_type,
      NEW.template_scope,
      COALESCE(NEW.template_structure, '{}'::jsonb),
      COALESCE(NEW.enabled, TRUE),
      COALESCE(NEW.create_time, NOW()),
      NOW()
    )
    RETURNING id INTO v_template_id;

    IF NEW.template_scope = 'DEPARTMENT' THEN
      INSERT INTO public.emr_template_department (
        template_id,
        dept_id,
        create_time,
        update_time
      )
      VALUES (
        v_template_id,
        NEW.selected_dept_id,
        NOW(),
        NOW()
      )
      ON CONFLICT (template_id, dept_id)
      DO UPDATE SET update_time = EXCLUDED.update_time;
    END IF;

    NEW.id := v_template_id;
    NEW.update_time := NOW();
    RETURN NEW;
  END IF;

  IF TG_OP = 'UPDATE' THEN
    IF COALESCE(NEW.id, OLD.id) IS NULL THEN
      RAISE EXCEPTION '更新模板时必须指定 id';
    END IF;

    IF NEW.template_scope = 'DEPARTMENT' AND NEW.selected_dept_id IS NULL THEN
      RAISE EXCEPTION '科室范围模板必须传入 selected_dept_id';
    END IF;

    v_template_id := COALESCE(NEW.id, OLD.id);

    UPDATE public.emr_template
    SET
      template_code = NEW.template_code,
      template_name = NEW.template_name,
      emr_type = NEW.emr_type,
      template_scope = NEW.template_scope,
      template_structure = COALESCE(NEW.template_structure, '{}'::jsonb),
      enabled = COALESCE(NEW.enabled, TRUE),
      update_time = NOW()
    WHERE id = v_template_id;

    IF NEW.template_scope = 'HOSPITAL' THEN
      DELETE FROM public.emr_template_department
      WHERE template_id = v_template_id;
    ELSE
      DELETE FROM public.emr_template_department
      WHERE template_id = v_template_id
        AND dept_id <> NEW.selected_dept_id;

      INSERT INTO public.emr_template_department (
        template_id,
        dept_id,
        create_time,
        update_time
      )
      VALUES (
        v_template_id,
        NEW.selected_dept_id,
        NOW(),
        NOW()
      )
      ON CONFLICT (template_id, dept_id)
      DO UPDATE SET update_time = EXCLUDED.update_time;
    END IF;

    NEW.id := v_template_id;
    NEW.update_time := NOW();
    RETURN NEW;
  END IF;

  RAISE EXCEPTION '不支持的触发动作: %', TG_OP;
END;
$$;


ALTER FUNCTION public.fn_v_emr_template_manage_iou() OWNER TO emr_user;

--
-- Name: fn_v_outpatient_emr_bundle_u(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.fn_v_outpatient_emr_bundle_u() RETURNS trigger
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


ALTER FUNCTION public.fn_v_outpatient_emr_bundle_u() OWNER TO emr_user;

--
-- Name: gen_reg_code(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.gen_reg_code() RETURNS character varying
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


ALTER FUNCTION public.gen_reg_code() OWNER TO emr_user;

--
-- Name: gen_visit_code(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.gen_visit_code() RETURNS character varying
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


ALTER FUNCTION public.gen_visit_code() OWNER TO emr_user;

--
-- Name: trg_active_visit_create_encounter(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.trg_active_visit_create_encounter() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO public.outpatient_encounter_data (visit_code, encounter_json, create_time, update_time)
  VALUES (NEW.visit_code, '{}'::jsonb, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
  ON CONFLICT (visit_code) DO NOTHING;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trg_active_visit_create_encounter() OWNER TO emr_user;

--
-- Name: trg_active_visit_finalize(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.trg_active_visit_finalize() RETURNS trigger
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


ALTER FUNCTION public.trg_active_visit_finalize() OWNER TO emr_user;

--
-- Name: trg_active_visit_status_validate(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.trg_active_visit_status_validate() RETURNS trigger
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


ALTER FUNCTION public.trg_active_visit_status_validate() OWNER TO emr_user;

--
-- Name: trg_registration_cancel_to_visit(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.trg_registration_cancel_to_visit() RETURNS trigger
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


ALTER FUNCTION public.trg_registration_cancel_to_visit() OWNER TO emr_user;

--
-- Name: trg_registration_create_active_visit(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.trg_registration_create_active_visit() RETURNS trigger
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


ALTER FUNCTION public.trg_registration_create_active_visit() OWNER TO emr_user;

--
-- Name: trg_registration_fill_reg_code(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.trg_registration_fill_reg_code() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.reg_code IS NULL OR btrim(NEW.reg_code) = '' THEN
    NEW.reg_code := public.gen_reg_code();
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trg_registration_fill_reg_code() OWNER TO emr_user;

--
-- Name: trg_registration_status_validate(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.trg_registration_status_validate() RETURNS trigger
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


ALTER FUNCTION public.trg_registration_status_validate() OWNER TO emr_user;

--
-- Name: trg_visit_history_readonly(); Type: FUNCTION; Schema: public; Owner: emr_user
--

CREATE FUNCTION public.trg_visit_history_readonly() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RAISE EXCEPTION 'outpatient_visit_history 仅允许INSERT，不允许%操作', TG_OP;
END;
$$;


ALTER FUNCTION public.trg_visit_history_readonly() OWNER TO emr_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Access; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public."Access" (
    id bigint NOT NULL,
    debug integer DEFAULT 0,
    name character varying(50) NOT NULL,
    alias character varying(50),
    get character varying(500) DEFAULT '["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]'::character varying,
    head character varying(500) DEFAULT '["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]'::character varying,
    gets character varying(500) DEFAULT '["LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]'::character varying,
    heads character varying(500) DEFAULT '["LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]'::character varying,
    post character varying(500) DEFAULT '["OWNER","ADMIN"]'::character varying,
    put character varying(500) DEFAULT '["OWNER","ADMIN"]'::character varying,
    delete character varying(500) DEFAULT '["OWNER","ADMIN"]'::character varying,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public."Access" OWNER TO emr_user;

--
-- Name: Access_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public."Access_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Access_id_seq" OWNER TO emr_user;

--
-- Name: Access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public."Access_id_seq" OWNED BY public."Access".id;


--
-- Name: Document; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public."Document" (
    id bigint NOT NULL,
    debug integer DEFAULT 0,
    user_id bigint NOT NULL,
    version integer DEFAULT 1,
    name character varying(50) NOT NULL,
    type character varying(20) NOT NULL,
    url character varying(255) NOT NULL,
    request text NOT NULL,
    apijson text,
    sql text,
    result text,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public."Document" OWNER TO emr_user;

--
-- Name: Document_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public."Document_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Document_id_seq" OWNER TO emr_user;

--
-- Name: Document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public."Document_id_seq" OWNED BY public."Document".id;


--
-- Name: Function; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public."Function" (
    id bigint NOT NULL,
    debug integer DEFAULT 0,
    name character varying(50) NOT NULL,
    arguments character varying(100),
    demo text NOT NULL,
    detail character varying(1000),
    version integer DEFAULT 0,
    tag character varying(20) DEFAULT 'Function'::character varying,
    methods character varying(50) DEFAULT 'GET'::character varying,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public."Function" OWNER TO emr_user;

--
-- Name: TABLE "Function"; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public."Function" IS 'APIJSON 远程函数配置表';


--
-- Name: COLUMN "Function".id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Function".id IS '主键ID';


--
-- Name: COLUMN "Function".debug; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Function".debug IS '调试模式(0:关闭 1:开启)';


--
-- Name: COLUMN "Function".name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Function".name IS '函数名称';


--
-- Name: COLUMN "Function".arguments; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Function".arguments IS '参数列表';


--
-- Name: COLUMN "Function".demo; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Function".demo IS '函数示例';


--
-- Name: COLUMN "Function".detail; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Function".detail IS '函数说明';


--
-- Name: COLUMN "Function".version; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Function".version IS '版本号';


--
-- Name: COLUMN "Function".tag; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Function".tag IS '标签';


--
-- Name: COLUMN "Function".methods; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Function".methods IS '允许的请求方法';


--
-- Name: COLUMN "Function".date; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Function".date IS '创建时间';


--
-- Name: Function_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public."Function_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Function_id_seq" OWNER TO emr_user;

--
-- Name: Function_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public."Function_id_seq" OWNED BY public."Function".id;


--
-- Name: Request; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public."Request" (
    id bigint NOT NULL,
    debug integer DEFAULT 0,
    version integer DEFAULT 1,
    method character varying(20),
    tag character varying(20) NOT NULL,
    structure text NOT NULL,
    detail character varying(100),
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public."Request" OWNER TO emr_user;

--
-- Name: Request_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public."Request_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Request_id_seq" OWNER TO emr_user;

--
-- Name: Request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public."Request_id_seq" OWNED BY public."Request".id;


--
-- Name: Script; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public."Script" (
    id bigint NOT NULL,
    debug integer DEFAULT 0,
    name character varying(50) NOT NULL,
    language character varying(50) DEFAULT 'JavaScript'::character varying NOT NULL,
    script text NOT NULL,
    simple integer DEFAULT 0,
    version integer DEFAULT 0,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public."Script" OWNER TO emr_user;

--
-- Name: TABLE "Script"; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public."Script" IS 'APIJSON 脚本配置表';


--
-- Name: COLUMN "Script".id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Script".id IS '主键ID';


--
-- Name: COLUMN "Script".debug; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Script".debug IS '调试模式(0:关闭 1:开启)';


--
-- Name: COLUMN "Script".name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Script".name IS '脚本名称';


--
-- Name: COLUMN "Script".language; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Script".language IS '脚本语言';


--
-- Name: COLUMN "Script".script; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Script".script IS '脚本内容';


--
-- Name: COLUMN "Script".simple; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Script".simple IS '是否简化(0:否 1:是)';


--
-- Name: COLUMN "Script".version; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Script".version IS '版本号';


--
-- Name: COLUMN "Script".date; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public."Script".date IS '创建时间';


--
-- Name: Script_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public."Script_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Script_id_seq" OWNER TO emr_user;

--
-- Name: Script_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public."Script_id_seq" OWNED BY public."Script".id;


--
-- Name: doctor; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.doctor (
    id bigint NOT NULL,
    doctor_code character varying(64) NOT NULL,
    doctor_name character varying(128) NOT NULL,
    dept_code character varying(64) NOT NULL,
    title_code character varying(32),
    license_no character varying(64),
    user_username character varying(50) NOT NULL,
    enabled boolean DEFAULT true,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.doctor OWNER TO emr_user;

--
-- Name: TABLE doctor; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.doctor IS '医生主数据表：描述医疗业务中的医生实体，与系统用户账号解耦';


--
-- Name: COLUMN doctor.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor.id IS '主键ID';


--
-- Name: COLUMN doctor.doctor_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor.doctor_code IS '医生业务编码：全院唯一，用于所有业务表关联';


--
-- Name: COLUMN doctor.doctor_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor.doctor_name IS '医生姓名';


--
-- Name: COLUMN doctor.dept_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor.dept_code IS '所属科室编码';


--
-- Name: COLUMN doctor.title_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor.title_code IS '职称编码：如主任医师/主治医师';


--
-- Name: COLUMN doctor.license_no; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor.license_no IS '执业医师证号';


--
-- Name: COLUMN doctor.user_username; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor.user_username IS '绑定的系统登录账号（sys_user.username）';


--
-- Name: COLUMN doctor.enabled; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor.enabled IS '是否在岗启用';


--
-- Name: COLUMN doctor.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor.create_time IS '创建时间';


--
-- Name: COLUMN doctor.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor.update_time IS '更新时间';


--
-- Name: doctor_favorite_template; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.doctor_favorite_template (
    id bigint NOT NULL,
    doctor_code character varying(64) NOT NULL,
    template_code character varying(64) NOT NULL,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.doctor_favorite_template OWNER TO emr_user;

--
-- Name: TABLE doctor_favorite_template; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.doctor_favorite_template IS '医生个人收藏的病历模板关系表';


--
-- Name: COLUMN doctor_favorite_template.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor_favorite_template.id IS '主键ID';


--
-- Name: COLUMN doctor_favorite_template.doctor_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor_favorite_template.doctor_code IS '医生编码';


--
-- Name: COLUMN doctor_favorite_template.template_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor_favorite_template.template_code IS '病历模板编码';


--
-- Name: COLUMN doctor_favorite_template.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.doctor_favorite_template.create_time IS '收藏时间';


--
-- Name: doctor_favorite_template_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.doctor_favorite_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctor_favorite_template_id_seq OWNER TO emr_user;

--
-- Name: doctor_favorite_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.doctor_favorite_template_id_seq OWNED BY public.doctor_favorite_template.id;


--
-- Name: doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.doctor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctor_id_seq OWNER TO emr_user;

--
-- Name: doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.doctor_id_seq OWNED BY public.doctor.id;


--
-- Name: emr_data_element; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.emr_data_element (
    id bigint NOT NULL,
    element_code character varying(64) NOT NULL,
    element_name character varying(128) NOT NULL,
    element_desc character varying(256),
    storage_type character varying(16) NOT NULL,
    value_format character varying(16) DEFAULT 'NONE'::character varying,
    value_length integer,
    value_domain_code character varying(64),
    is_required boolean DEFAULT false,
    default_value character varying(128),
    enabled boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.emr_data_element OWNER TO emr_user;

--
-- Name: TABLE emr_data_element; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.emr_data_element IS '电子病历数据元定义表，用于描述病历字段的结构、类型和校验规则';


--
-- Name: COLUMN emr_data_element.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.id IS '主键';


--
-- Name: COLUMN emr_data_element.element_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.element_code IS '数据元编码（全系统唯一）';


--
-- Name: COLUMN emr_data_element.element_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.element_name IS '数据元名称';


--
-- Name: COLUMN emr_data_element.element_desc; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.element_desc IS '数据元说明';


--
-- Name: COLUMN emr_data_element.storage_type; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.storage_type IS '存储数据类型：S，S1，S2.....';


--
-- Name: COLUMN emr_data_element.value_format; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.value_format IS '表示格式：A(字母)/N(数字)/AN(字母数字)/NONE(不限制)';


--
-- Name: COLUMN emr_data_element.value_length; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.value_length IS '最大长度或精度限制';


--
-- Name: COLUMN emr_data_element.value_domain_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.value_domain_code IS '值域编码（枚举型数据使用，如性别、血型）';


--
-- Name: COLUMN emr_data_element.is_required; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.is_required IS '是否必填';


--
-- Name: COLUMN emr_data_element.default_value; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.default_value IS '默认值';


--
-- Name: COLUMN emr_data_element.enabled; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.enabled IS '是否启用';


--
-- Name: COLUMN emr_data_element.created_at; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.created_at IS '创建时间';


--
-- Name: COLUMN emr_data_element.updated_at; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_element.updated_at IS '更新时间';


--
-- Name: emr_data_element_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.emr_data_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emr_data_element_id_seq OWNER TO emr_user;

--
-- Name: emr_data_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.emr_data_element_id_seq OWNED BY public.emr_data_element.id;


--
-- Name: emr_data_set; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.emr_data_set (
    id bigint NOT NULL,
    dataset_code character varying(64) NOT NULL,
    dataset_name character varying(128) NOT NULL,
    dataset_desc character varying(256),
    enabled boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.emr_data_set OWNER TO emr_user;

--
-- Name: TABLE emr_data_set; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.emr_data_set IS '电子病历数据集定义表（多个数据元的集合）';


--
-- Name: COLUMN emr_data_set.dataset_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_set.dataset_code IS '数据集编码';


--
-- Name: COLUMN emr_data_set.dataset_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_set.dataset_name IS '数据集名称';


--
-- Name: COLUMN emr_data_set.dataset_desc; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_set.dataset_desc IS '数据集说明';


--
-- Name: COLUMN emr_data_set.enabled; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_set.enabled IS '是否启用';


--
-- Name: emr_data_set_element; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.emr_data_set_element (
    id bigint NOT NULL,
    dataset_code character varying(64) NOT NULL,
    element_code character varying(64) NOT NULL,
    display_order integer DEFAULT 0,
    is_required boolean DEFAULT false,
    is_readonly boolean DEFAULT false,
    default_value character varying(128),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    element_name character varying(128) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.emr_data_set_element OWNER TO emr_user;

--
-- Name: TABLE emr_data_set_element; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.emr_data_set_element IS '数据集与数据元关系表';


--
-- Name: COLUMN emr_data_set_element.dataset_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_set_element.dataset_code IS '数据集编码';


--
-- Name: COLUMN emr_data_set_element.element_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_set_element.element_code IS '数据元编码';


--
-- Name: COLUMN emr_data_set_element.display_order; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_set_element.display_order IS '展示顺序';


--
-- Name: COLUMN emr_data_set_element.is_required; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_set_element.is_required IS '是否必填';


--
-- Name: COLUMN emr_data_set_element.is_readonly; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_set_element.is_readonly IS '是否只读';


--
-- Name: COLUMN emr_data_set_element.default_value; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_data_set_element.default_value IS '默认值';


--
-- Name: emr_data_set_element_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.emr_data_set_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emr_data_set_element_id_seq OWNER TO emr_user;

--
-- Name: emr_data_set_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.emr_data_set_element_id_seq OWNED BY public.emr_data_set_element.id;


--
-- Name: emr_data_set_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.emr_data_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emr_data_set_id_seq OWNER TO emr_user;

--
-- Name: emr_data_set_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.emr_data_set_id_seq OWNED BY public.emr_data_set.id;


--
-- Name: emr_icd10_diagnosis; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.emr_icd10_diagnosis (
    id bigint NOT NULL,
    diag_code character varying(32) NOT NULL,
    diag_name character varying(256) NOT NULL,
    pinyin_initials character varying(64) NOT NULL,
    status smallint DEFAULT 1 NOT NULL,
    sort_no integer DEFAULT 0 NOT NULL,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ck_emr_icd10_status CHECK ((status = ANY (ARRAY[0, 1])))
);


ALTER TABLE public.emr_icd10_diagnosis OWNER TO emr_user;

--
-- Name: TABLE emr_icd10_diagnosis; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.emr_icd10_diagnosis IS 'ICD-10 疾病诊断字典表（精简版）';


--
-- Name: COLUMN emr_icd10_diagnosis.diag_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_icd10_diagnosis.diag_code IS '疾病诊断编码（ICD-10）';


--
-- Name: COLUMN emr_icd10_diagnosis.diag_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_icd10_diagnosis.diag_name IS '疾病诊断中文名称';


--
-- Name: COLUMN emr_icd10_diagnosis.pinyin_initials; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_icd10_diagnosis.pinyin_initials IS '疾病名称拼音首字母';


--
-- Name: COLUMN emr_icd10_diagnosis.status; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_icd10_diagnosis.status IS '状态（1启用，0停用）';


--
-- Name: COLUMN emr_icd10_diagnosis.sort_no; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_icd10_diagnosis.sort_no IS '排序号';


--
-- Name: emr_icd10_diagnosis_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.emr_icd10_diagnosis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emr_icd10_diagnosis_id_seq OWNER TO emr_user;

--
-- Name: emr_icd10_diagnosis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.emr_icd10_diagnosis_id_seq OWNED BY public.emr_icd10_diagnosis.id;


--
-- Name: emr_record; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.emr_record (
    id bigint NOT NULL,
    emr_code character varying(64) NOT NULL,
    visit_code character varying(64) NOT NULL,
    patient_code character varying(64) NOT NULL,
    doctor_code character varying(64) NOT NULL,
    template_code character varying(64) NOT NULL,
    emr_type character varying(32) NOT NULL,
    emr_status character varying(32) DEFAULT 'DRAFT'::character varying,
    current_version integer DEFAULT 1,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ck_emr_record_status CHECK (((emr_status)::text = ANY ((ARRAY['DRAFT'::character varying, 'SIGNED'::character varying])::text[])))
);


ALTER TABLE public.emr_record OWNER TO emr_user;

--
-- Name: TABLE emr_record; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.emr_record IS '电子病历实例主表（一次就诊可生成多份病历）';


--
-- Name: COLUMN emr_record.emr_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record.emr_code IS '病历实例编码';


--
-- Name: COLUMN emr_record.visit_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record.visit_code IS '门诊就诊编码';


--
-- Name: COLUMN emr_record.patient_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record.patient_code IS '患者编码';


--
-- Name: COLUMN emr_record.doctor_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record.doctor_code IS '医生编码';


--
-- Name: COLUMN emr_record.template_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record.template_code IS '病历模板编码';


--
-- Name: COLUMN emr_record.emr_type; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record.emr_type IS '病历类型（初诊、复诊）';


--
-- Name: COLUMN emr_record.emr_status; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record.emr_status IS '病历状态';


--
-- Name: COLUMN emr_record.current_version; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record.current_version IS '当前病历版本号';


--
-- Name: COLUMN emr_record.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record.create_time IS '创建时间';


--
-- Name: COLUMN emr_record.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record.update_time IS '更新时间';


--
-- Name: emr_record_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.emr_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emr_record_id_seq OWNER TO emr_user;

--
-- Name: emr_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.emr_record_id_seq OWNED BY public.emr_record.id;


--
-- Name: emr_record_version; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.emr_record_version (
    id bigint NOT NULL,
    emr_code character varying(64) NOT NULL,
    version_no integer NOT NULL,
    emr_content jsonb NOT NULL,
    signed_flag boolean DEFAULT false,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.emr_record_version OWNER TO emr_user;

--
-- Name: TABLE emr_record_version; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.emr_record_version IS '电子病历版本表（支持多版本、签署冻结）';


--
-- Name: COLUMN emr_record_version.emr_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record_version.emr_code IS '病历实例编码';


--
-- Name: COLUMN emr_record_version.version_no; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record_version.version_no IS '病历版本号';


--
-- Name: COLUMN emr_record_version.emr_content; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record_version.emr_content IS '病历内容(JSON)，含医嘱/检查快照';


--
-- Name: COLUMN emr_record_version.signed_flag; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record_version.signed_flag IS '是否已签署';


--
-- Name: COLUMN emr_record_version.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record_version.create_time IS '创建时间';


--
-- Name: COLUMN emr_record_version.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_record_version.update_time IS '更新时间';


--
-- Name: emr_record_version_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.emr_record_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emr_record_version_id_seq OWNER TO emr_user;

--
-- Name: emr_record_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.emr_record_version_id_seq OWNED BY public.emr_record_version.id;


--
-- Name: emr_template; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.emr_template (
    id bigint NOT NULL,
    template_code character varying(64) NOT NULL,
    template_name character varying(128) NOT NULL,
    emr_type character varying(32) NOT NULL,
    template_scope character varying(16) NOT NULL,
    template_structure jsonb DEFAULT '{}'::jsonb NOT NULL,
    enabled boolean DEFAULT true,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ck_emr_template_scope CHECK (((template_scope)::text = ANY ((ARRAY['HOSPITAL'::character varying, 'DEPARTMENT'::character varying])::text[])))
);


ALTER TABLE public.emr_template OWNER TO emr_user;

--
-- Name: TABLE emr_template; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.emr_template IS '电子病历模板主表（定义病历结构）';


--
-- Name: COLUMN emr_template.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template.id IS '模板主键ID';


--
-- Name: COLUMN emr_template.template_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template.template_code IS '病历模板编码（全局唯一）';


--
-- Name: COLUMN emr_template.template_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template.template_name IS '病历模板名称';


--
-- Name: COLUMN emr_template.emr_type; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template.emr_type IS '病历类型（初诊、复诊、病程记录）';


--
-- Name: COLUMN emr_template.template_scope; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template.template_scope IS '模板范围（HOSPITAL 全院 / DEPARTMENT 科室）';


--
-- Name: COLUMN emr_template.template_structure; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template.template_structure IS '病历模板结构定义(JSON，包含数据元占位)';


--
-- Name: COLUMN emr_template.enabled; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template.enabled IS '是否启用';


--
-- Name: COLUMN emr_template.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template.create_time IS '创建时间';


--
-- Name: COLUMN emr_template.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template.update_time IS '更新时间';


--
-- Name: emr_template_department; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.emr_template_department (
    id bigint NOT NULL,
    template_id bigint NOT NULL,
    dept_id bigint NOT NULL,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.emr_template_department OWNER TO emr_user;

--
-- Name: TABLE emr_template_department; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.emr_template_department IS '病历模板-科室关联表（适用于科室模板）';


--
-- Name: COLUMN emr_template_department.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template_department.id IS '主键ID';


--
-- Name: COLUMN emr_template_department.template_id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template_department.template_id IS '病历模板ID';


--
-- Name: COLUMN emr_template_department.dept_id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template_department.dept_id IS '科室ID';


--
-- Name: COLUMN emr_template_department.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template_department.create_time IS '创建时间';


--
-- Name: COLUMN emr_template_department.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_template_department.update_time IS '更新时间';


--
-- Name: emr_template_department_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.emr_template_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emr_template_department_id_seq OWNER TO emr_user;

--
-- Name: emr_template_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.emr_template_department_id_seq OWNED BY public.emr_template_department.id;


--
-- Name: emr_template_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.emr_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emr_template_id_seq OWNER TO emr_user;

--
-- Name: emr_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.emr_template_id_seq OWNED BY public.emr_template.id;


--
-- Name: emr_value_domain; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.emr_value_domain (
    id bigint NOT NULL,
    domain_code character varying(64) NOT NULL,
    domain_name character varying(128) NOT NULL,
    domain_type character varying(32) DEFAULT 'ENUM'::character varying,
    description character varying(255),
    status smallint DEFAULT 1,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.emr_value_domain OWNER TO emr_user;

--
-- Name: TABLE emr_value_domain; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.emr_value_domain IS '电子病历数据元值域定义表，用于描述数据元可选取值范围';


--
-- Name: COLUMN emr_value_domain.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain.id IS '主键ID';


--
-- Name: COLUMN emr_value_domain.domain_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain.domain_code IS '值域编码，全系统唯一';


--
-- Name: COLUMN emr_value_domain.domain_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain.domain_name IS '值域名称';


--
-- Name: COLUMN emr_value_domain.domain_type; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain.domain_type IS '值域类型（ENUM 枚举 / RANGE 范围 / REF 引用）';


--
-- Name: COLUMN emr_value_domain.description; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain.description IS '值域说明';


--
-- Name: COLUMN emr_value_domain.status; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain.status IS '状态（1 启用，0 停用）';


--
-- Name: COLUMN emr_value_domain.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain.create_time IS '创建时间';


--
-- Name: emr_value_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.emr_value_domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emr_value_domain_id_seq OWNER TO emr_user;

--
-- Name: emr_value_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.emr_value_domain_id_seq OWNED BY public.emr_value_domain.id;


--
-- Name: emr_value_domain_item; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.emr_value_domain_item (
    id bigint NOT NULL,
    domain_code character varying(64) NOT NULL,
    item_code character varying(64) NOT NULL,
    item_name character varying(128) NOT NULL,
    item_order integer DEFAULT 0,
    is_default smallint DEFAULT 0,
    status smallint DEFAULT 1,
    remark character varying(255),
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.emr_value_domain_item OWNER TO emr_user;

--
-- Name: TABLE emr_value_domain_item; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.emr_value_domain_item IS '电子病历数据元值域项表，用于存储值域下的可选取值';


--
-- Name: COLUMN emr_value_domain_item.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain_item.id IS '主键ID';


--
-- Name: COLUMN emr_value_domain_item.domain_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain_item.domain_code IS '所属值域编码，对应数据元的值域定义';


--
-- Name: COLUMN emr_value_domain_item.item_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain_item.item_code IS '值域项编码';


--
-- Name: COLUMN emr_value_domain_item.item_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain_item.item_name IS '值域项名称';


--
-- Name: COLUMN emr_value_domain_item.item_order; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain_item.item_order IS '显示顺序';


--
-- Name: COLUMN emr_value_domain_item.is_default; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain_item.is_default IS '是否默认值（0 否，1 是）';


--
-- Name: COLUMN emr_value_domain_item.status; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain_item.status IS '状态（1 启用，0 停用）';


--
-- Name: COLUMN emr_value_domain_item.remark; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain_item.remark IS '备注说明';


--
-- Name: COLUMN emr_value_domain_item.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.emr_value_domain_item.create_time IS '创建时间';


--
-- Name: emr_value_domain_item_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.emr_value_domain_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.emr_value_domain_item_id_seq OWNER TO emr_user;

--
-- Name: emr_value_domain_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.emr_value_domain_item_id_seq OWNED BY public.emr_value_domain_item.id;


--
-- Name: exam_result; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.exam_result (
    id bigint NOT NULL,
    order_code character varying(64) NOT NULL,
    report_content jsonb NOT NULL,
    image_url character varying(256),
    report_time timestamp without time zone,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.exam_result OWNER TO emr_user;

--
-- Name: TABLE exam_result; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.exam_result IS '检查结果表（报告+影像引用）';


--
-- Name: COLUMN exam_result.order_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.exam_result.order_code IS '医嘱编码';


--
-- Name: COLUMN exam_result.report_content; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.exam_result.report_content IS '检查报告内容(JSON)';


--
-- Name: COLUMN exam_result.image_url; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.exam_result.image_url IS '影像存储地址(MinIO)';


--
-- Name: COLUMN exam_result.report_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.exam_result.report_time IS '报告完成时间';


--
-- Name: COLUMN exam_result.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.exam_result.create_time IS '创建时间';


--
-- Name: COLUMN exam_result.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.exam_result.update_time IS '更新时间';


--
-- Name: exam_result_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.exam_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exam_result_id_seq OWNER TO emr_user;

--
-- Name: exam_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.exam_result_id_seq OWNED BY public.exam_result.id;


--
-- Name: lab_result; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.lab_result (
    id bigint NOT NULL,
    order_code character varying(64) NOT NULL,
    result_json jsonb NOT NULL,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.lab_result OWNER TO emr_user;

--
-- Name: TABLE lab_result; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.lab_result IS '检验结果表（结构化存储）';


--
-- Name: COLUMN lab_result.order_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.lab_result.order_code IS '医嘱编码';


--
-- Name: COLUMN lab_result.result_json; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.lab_result.result_json IS '检验结果(JSON)';


--
-- Name: COLUMN lab_result.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.lab_result.create_time IS '创建时间';


--
-- Name: COLUMN lab_result.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.lab_result.update_time IS '更新时间';


--
-- Name: lab_result_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.lab_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lab_result_id_seq OWNER TO emr_user;

--
-- Name: lab_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.lab_result_id_seq OWNED BY public.lab_result.id;


--
-- Name: medical_order; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.medical_order (
    id bigint NOT NULL,
    order_code character varying(64) NOT NULL,
    visit_code character varying(64) NOT NULL,
    patient_code character varying(64) NOT NULL,
    doctor_code character varying(64) NOT NULL,
    order_type character varying(32) NOT NULL,
    order_status character varying(32) NOT NULL,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.medical_order OWNER TO emr_user;

--
-- Name: TABLE medical_order; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.medical_order IS '医嘱主表（统一医嘱生命周期管理）';


--
-- Name: COLUMN medical_order.order_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order.order_code IS '医嘱编码';


--
-- Name: COLUMN medical_order.visit_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order.visit_code IS '就诊编码';


--
-- Name: COLUMN medical_order.patient_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order.patient_code IS '患者编码';


--
-- Name: COLUMN medical_order.doctor_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order.doctor_code IS '医生编码';


--
-- Name: COLUMN medical_order.order_type; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order.order_type IS '医嘱类型（药品/检查/检验）';


--
-- Name: COLUMN medical_order.order_status; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order.order_status IS '医嘱状态';


--
-- Name: COLUMN medical_order.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order.create_time IS '创建时间';


--
-- Name: COLUMN medical_order.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order.update_time IS '更新时间';


--
-- Name: medical_order_drug; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.medical_order_drug (
    id bigint NOT NULL,
    order_code character varying(64) NOT NULL,
    drug_code character varying(64) NOT NULL,
    drug_name character varying(128) NOT NULL,
    dosage character varying(64),
    frequency character varying(64),
    route character varying(64),
    days integer,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.medical_order_drug OWNER TO emr_user;

--
-- Name: TABLE medical_order_drug; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.medical_order_drug IS '药品医嘱明细表';


--
-- Name: COLUMN medical_order_drug.order_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_drug.order_code IS '医嘱编码';


--
-- Name: COLUMN medical_order_drug.drug_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_drug.drug_code IS '药品编码';


--
-- Name: COLUMN medical_order_drug.drug_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_drug.drug_name IS '药品名称';


--
-- Name: COLUMN medical_order_drug.dosage; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_drug.dosage IS '单次剂量';


--
-- Name: COLUMN medical_order_drug.frequency; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_drug.frequency IS '用药频次';


--
-- Name: COLUMN medical_order_drug.route; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_drug.route IS '用药途径';


--
-- Name: COLUMN medical_order_drug.days; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_drug.days IS '用药天数';


--
-- Name: COLUMN medical_order_drug.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_drug.create_time IS '创建时间';


--
-- Name: COLUMN medical_order_drug.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_drug.update_time IS '更新时间';


--
-- Name: medical_order_drug_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.medical_order_drug_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medical_order_drug_id_seq OWNER TO emr_user;

--
-- Name: medical_order_drug_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.medical_order_drug_id_seq OWNED BY public.medical_order_drug.id;


--
-- Name: medical_order_exam; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.medical_order_exam (
    id bigint NOT NULL,
    order_code character varying(64) NOT NULL,
    exam_item_code character varying(64) NOT NULL,
    exam_item_name character varying(128) NOT NULL,
    exam_part character varying(128),
    is_enhanced boolean,
    clinical_purpose text,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.medical_order_exam OWNER TO emr_user;

--
-- Name: TABLE medical_order_exam; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.medical_order_exam IS '检查医嘱明细表';


--
-- Name: COLUMN medical_order_exam.order_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_exam.order_code IS '医嘱编码';


--
-- Name: COLUMN medical_order_exam.exam_item_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_exam.exam_item_code IS '检查项目编码';


--
-- Name: COLUMN medical_order_exam.exam_item_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_exam.exam_item_name IS '检查项目名称';


--
-- Name: COLUMN medical_order_exam.exam_part; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_exam.exam_part IS '检查部位';


--
-- Name: COLUMN medical_order_exam.is_enhanced; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_exam.is_enhanced IS '是否增强';


--
-- Name: COLUMN medical_order_exam.clinical_purpose; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_exam.clinical_purpose IS '临床目的';


--
-- Name: COLUMN medical_order_exam.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_exam.create_time IS '创建时间';


--
-- Name: COLUMN medical_order_exam.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_exam.update_time IS '更新时间';


--
-- Name: medical_order_exam_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.medical_order_exam_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medical_order_exam_id_seq OWNER TO emr_user;

--
-- Name: medical_order_exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.medical_order_exam_id_seq OWNED BY public.medical_order_exam.id;


--
-- Name: medical_order_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.medical_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medical_order_id_seq OWNER TO emr_user;

--
-- Name: medical_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.medical_order_id_seq OWNED BY public.medical_order.id;


--
-- Name: medical_order_lab; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.medical_order_lab (
    id bigint NOT NULL,
    order_code character varying(64) NOT NULL,
    lab_item_code character varying(64) NOT NULL,
    lab_item_name character varying(128) NOT NULL,
    specimen_type character varying(64),
    clinical_diagnosis text,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.medical_order_lab OWNER TO emr_user;

--
-- Name: TABLE medical_order_lab; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.medical_order_lab IS '检验医嘱明细表';


--
-- Name: COLUMN medical_order_lab.order_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_lab.order_code IS '医嘱编码';


--
-- Name: COLUMN medical_order_lab.lab_item_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_lab.lab_item_code IS '检验项目编码';


--
-- Name: COLUMN medical_order_lab.lab_item_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_lab.lab_item_name IS '检验项目名称';


--
-- Name: COLUMN medical_order_lab.specimen_type; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_lab.specimen_type IS '标本类型';


--
-- Name: COLUMN medical_order_lab.clinical_diagnosis; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_lab.clinical_diagnosis IS '临床诊断';


--
-- Name: COLUMN medical_order_lab.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_lab.create_time IS '创建时间';


--
-- Name: COLUMN medical_order_lab.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.medical_order_lab.update_time IS '更新时间';


--
-- Name: medical_order_lab_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.medical_order_lab_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.medical_order_lab_id_seq OWNER TO emr_user;

--
-- Name: medical_order_lab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.medical_order_lab_id_seq OWNED BY public.medical_order_lab.id;


--
-- Name: outpatient_encounter_data; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.outpatient_encounter_data (
    id bigint NOT NULL,
    visit_code character varying(64) NOT NULL,
    encounter_json jsonb NOT NULL,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.outpatient_encounter_data OWNER TO emr_user;

--
-- Name: TABLE outpatient_encounter_data; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.outpatient_encounter_data IS '门诊就诊过程事实表：存储本次就诊（初诊或复诊）的独立事实数据';


--
-- Name: COLUMN outpatient_encounter_data.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_encounter_data.id IS '主键ID';


--
-- Name: COLUMN outpatient_encounter_data.visit_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_encounter_data.visit_code IS '就诊编码：1:1 绑定单次就诊';


--
-- Name: COLUMN outpatient_encounter_data.encounter_json; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_encounter_data.encounter_json IS '结构化诊疗数据 (DE 编码集合)';


--
-- Name: COLUMN outpatient_encounter_data.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_encounter_data.create_time IS '创建时间';


--
-- Name: COLUMN outpatient_encounter_data.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_encounter_data.update_time IS '更新时间';


--
-- Name: outpatient_encounter_data_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.outpatient_encounter_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.outpatient_encounter_data_id_seq OWNER TO emr_user;

--
-- Name: outpatient_encounter_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.outpatient_encounter_data_id_seq OWNED BY public.outpatient_encounter_data.id;


--
-- Name: outpatient_visit_active; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.outpatient_visit_active (
    id bigint NOT NULL,
    visit_code character varying(64) NOT NULL,
    reg_code character varying(64) NOT NULL,
    patient_code character varying(64) NOT NULL,
    dept_code character varying(64) NOT NULL,
    doctor_code character varying(64) NOT NULL,
    visit_type character varying(32) DEFAULT 'FIRST'::character varying,
    visit_status public.visit_status_enum DEFAULT 'REGISTERED'::public.visit_status_enum NOT NULL,
    start_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    end_time timestamp without time zone,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.outpatient_visit_active OWNER TO emr_user;

--
-- Name: TABLE outpatient_visit_active; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.outpatient_visit_active IS '门诊就诊主表：记录单次诊疗行为，区分初复诊类别';


--
-- Name: COLUMN outpatient_visit_active.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.id IS '主键ID';


--
-- Name: COLUMN outpatient_visit_active.visit_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.visit_code IS '就诊编码：单次诊疗所有事实数据的根键';


--
-- Name: COLUMN outpatient_visit_active.reg_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.reg_code IS '关联挂号单 (1:1)';


--
-- Name: COLUMN outpatient_visit_active.patient_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.patient_code IS '患者编码';


--
-- Name: COLUMN outpatient_visit_active.dept_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.dept_code IS '接诊科室';


--
-- Name: COLUMN outpatient_visit_active.doctor_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.doctor_code IS '接诊医生';


--
-- Name: COLUMN outpatient_visit_active.visit_type; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.visit_type IS '诊疗类型：FIRST-初诊, FOLLOW_UP-复诊 (DE06.00.062.00)';


--
-- Name: COLUMN outpatient_visit_active.visit_status; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.visit_status IS '就诊状态';


--
-- Name: COLUMN outpatient_visit_active.start_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.start_time IS '接诊开始时间';


--
-- Name: COLUMN outpatient_visit_active.end_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.end_time IS '接诊完成时间';


--
-- Name: COLUMN outpatient_visit_active.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.create_time IS '创建时间';


--
-- Name: COLUMN outpatient_visit_active.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.outpatient_visit_active.update_time IS '更新时间';


--
-- Name: outpatient_visit_history; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.outpatient_visit_history (
    id bigint NOT NULL,
    visit_code character varying(64) NOT NULL,
    reg_code character varying(64) NOT NULL,
    patient_code character varying(64) NOT NULL,
    dept_code character varying(64) NOT NULL,
    doctor_code character varying(64) NOT NULL,
    visit_type character varying(32) DEFAULT 'FIRST'::character varying,
    visit_status public.visit_status_enum NOT NULL,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    encounter_json jsonb DEFAULT '{}'::jsonb NOT NULL,
    archived_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    archive_reason character varying(32) NOT NULL
);


ALTER TABLE public.outpatient_visit_history OWNER TO emr_user;

--
-- Name: outpatient_visit_history_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.outpatient_visit_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.outpatient_visit_history_id_seq OWNER TO emr_user;

--
-- Name: outpatient_visit_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.outpatient_visit_history_id_seq OWNED BY public.outpatient_visit_history.id;


--
-- Name: outpatient_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.outpatient_visit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.outpatient_visit_id_seq OWNER TO emr_user;

--
-- Name: outpatient_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.outpatient_visit_id_seq OWNED BY public.outpatient_visit_active.id;


--
-- Name: patient; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.patient (
    id bigint NOT NULL,
    patient_code character varying(64) NOT NULL,
    patient_name character varying(64) NOT NULL,
    gender_code character varying(32),
    birthday integer,
    id_card character varying(18),
    phone character varying(20),
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.patient OWNER TO emr_user;

--
-- Name: TABLE patient; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.patient IS '患者主数据表：存储患者唯一档案';


--
-- Name: COLUMN patient.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.patient.id IS '主键ID';


--
-- Name: COLUMN patient.patient_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.patient.patient_code IS '患者唯一编码 (DE02.01.039.00)';


--
-- Name: COLUMN patient.patient_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.patient.patient_name IS '患者姓名';


--
-- Name: COLUMN patient.gender_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.patient.gender_code IS '性别代码 (DE02.01.040.00)';


--
-- Name: COLUMN patient.birthday; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.patient.birthday IS '出生日期(yyyyMMdd)';


--
-- Name: COLUMN patient.id_card; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.patient.id_card IS '身份证号';


--
-- Name: COLUMN patient.phone; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.patient.phone IS '联系电话';


--
-- Name: COLUMN patient.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.patient.create_time IS '创建时间';


--
-- Name: COLUMN patient.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.patient.update_time IS '更新时间';


--
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.patient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patient_id_seq OWNER TO emr_user;

--
-- Name: patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.patient_id_seq OWNED BY public.patient.id;


--
-- Name: registration; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.registration (
    id bigint NOT NULL,
    reg_code character varying(64) DEFAULT public.gen_reg_code() NOT NULL,
    patient_code character varying(64) NOT NULL,
    dept_code character varying(64) NOT NULL,
    doctor_code character varying(64) NOT NULL,
    reg_date integer NOT NULL,
    time_slot character varying(16),
    seq_no integer,
    reg_status character varying(32) DEFAULT 'REGISTERED'::character varying,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.registration OWNER TO emr_user;

--
-- Name: TABLE registration; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.registration IS '门诊挂号表：单次就诊的号源凭证，每次就诊（含复诊）均需新记录';


--
-- Name: COLUMN registration.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.registration.id IS '主键ID';


--
-- Name: COLUMN registration.reg_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.registration.reg_code IS '挂号流水号：本次就诊的唯一入场券';


--
-- Name: COLUMN registration.patient_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.registration.patient_code IS '患者编码';


--
-- Name: COLUMN registration.dept_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.registration.dept_code IS '挂号科室编码';


--
-- Name: COLUMN registration.doctor_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.registration.doctor_code IS '挂号医生编码';


--
-- Name: COLUMN registration.reg_date; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.registration.reg_date IS '计划就诊日期(yyyyMMdd)';


--
-- Name: COLUMN registration.time_slot; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.registration.time_slot IS '就诊时段：AM/PM';


--
-- Name: COLUMN registration.seq_no; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.registration.seq_no IS '排队号序';


--
-- Name: COLUMN registration.reg_status; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.registration.reg_status IS '挂号状态';


--
-- Name: COLUMN registration.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.registration.create_time IS '创建时间';


--
-- Name: COLUMN registration.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.registration.update_time IS '更新时间';


--
-- Name: registration_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.registration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.registration_id_seq OWNER TO emr_user;

--
-- Name: registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.registration_id_seq OWNED BY public.registration.id;


--
-- Name: sys_department; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.sys_department (
    id bigint NOT NULL,
    dept_code character varying(64) NOT NULL,
    dept_name character varying(128) NOT NULL,
    parent_code character varying(64),
    dept_type character varying(32),
    enabled boolean DEFAULT true,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.sys_department OWNER TO emr_user;

--
-- Name: TABLE sys_department; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.sys_department IS '科室信息表：定义医疗机构的科室逻辑结构';


--
-- Name: COLUMN sys_department.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_department.id IS '主键ID';


--
-- Name: COLUMN sys_department.dept_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_department.dept_code IS '科室编码：国家规范或院内唯一编码';


--
-- Name: COLUMN sys_department.dept_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_department.dept_name IS '科室名称';


--
-- Name: COLUMN sys_department.parent_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_department.parent_code IS '上级科室编码';


--
-- Name: COLUMN sys_department.dept_type; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_department.dept_type IS '科室类型：门诊/住院/医技/行政';


--
-- Name: COLUMN sys_department.enabled; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_department.enabled IS '启用状态';


--
-- Name: COLUMN sys_department.create_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_department.create_time IS '创建时间';


--
-- Name: COLUMN sys_department.update_time; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_department.update_time IS '更新时间';


--
-- Name: sys_department_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.sys_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_department_id_seq OWNER TO emr_user;

--
-- Name: sys_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.sys_department_id_seq OWNED BY public.sys_department.id;


--
-- Name: sys_login_log; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.sys_login_log (
    id bigint NOT NULL,
    username character varying(50),
    ip_addr character varying(50),
    status integer,
    msg character varying(255),
    login_time timestamp without time zone DEFAULT now(),
    CONSTRAINT sys_login_log_status_check CHECK ((status = ANY (ARRAY[0, 1])))
);


ALTER TABLE public.sys_login_log OWNER TO emr_user;

--
-- Name: TABLE sys_login_log; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.sys_login_log IS '登录日志表';


--
-- Name: sys_login_log_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.sys_login_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_login_log_id_seq OWNER TO emr_user;

--
-- Name: sys_login_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.sys_login_log_id_seq OWNED BY public.sys_login_log.id;


--
-- Name: sys_menu; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.sys_menu (
    id bigint NOT NULL,
    parent_id bigint DEFAULT 0,
    name character varying(50) NOT NULL,
    type integer NOT NULL,
    path character varying(200),
    component character varying(200),
    perms character varying(200),
    icon character varying(100),
    sort_value integer DEFAULT 0,
    status integer DEFAULT 1,
    create_time timestamp without time zone DEFAULT now(),
    update_time timestamp without time zone DEFAULT now(),
    is_deleted integer DEFAULT 0,
    CONSTRAINT sys_menu_is_deleted_check CHECK ((is_deleted = ANY (ARRAY[0, 1]))),
    CONSTRAINT sys_menu_status_check CHECK ((status = ANY (ARRAY[0, 1]))),
    CONSTRAINT sys_menu_type_check CHECK ((type = ANY (ARRAY[1, 2, 3])))
);


ALTER TABLE public.sys_menu OWNER TO emr_user;

--
-- Name: TABLE sys_menu; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.sys_menu IS '系统菜单/权限表';


--
-- Name: COLUMN sys_menu.parent_id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_menu.parent_id IS '父级ID';


--
-- Name: COLUMN sys_menu.name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_menu.name IS '菜单名称';


--
-- Name: COLUMN sys_menu.type; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_menu.type IS '类型(1:目录 2:菜单 3:按钮)';


--
-- Name: COLUMN sys_menu.path; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_menu.path IS '路由路径';


--
-- Name: COLUMN sys_menu.component; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_menu.component IS '组件路径';


--
-- Name: COLUMN sys_menu.perms; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_menu.perms IS '权限标识';


--
-- Name: COLUMN sys_menu.icon; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_menu.icon IS '图标';


--
-- Name: COLUMN sys_menu.sort_value; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_menu.sort_value IS '排序值';


--
-- Name: sys_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.sys_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_menu_id_seq OWNER TO emr_user;

--
-- Name: sys_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.sys_menu_id_seq OWNED BY public.sys_menu.id;


--
-- Name: sys_oper_log; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.sys_oper_log (
    id bigint NOT NULL,
    title character varying(50),
    method character varying(200),
    request_method character varying(10),
    operator_type integer,
    oper_name character varying(50),
    oper_url character varying(500),
    oper_ip character varying(50),
    oper_param text,
    json_result text,
    status integer,
    error_msg text,
    oper_time timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sys_oper_log OWNER TO emr_user;

--
-- Name: TABLE sys_oper_log; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.sys_oper_log IS '操作日志表';


--
-- Name: sys_oper_log_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.sys_oper_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_oper_log_id_seq OWNER TO emr_user;

--
-- Name: sys_oper_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.sys_oper_log_id_seq OWNED BY public.sys_oper_log.id;


--
-- Name: sys_role; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.sys_role (
    id bigint NOT NULL,
    role_name character varying(50) NOT NULL,
    role_code character varying(50) NOT NULL,
    description character varying(255),
    status integer DEFAULT 1,
    create_time timestamp without time zone DEFAULT now(),
    update_time timestamp without time zone DEFAULT now(),
    is_deleted integer DEFAULT 0,
    CONSTRAINT sys_role_is_deleted_check CHECK ((is_deleted = ANY (ARRAY[0, 1]))),
    CONSTRAINT sys_role_status_check CHECK ((status = ANY (ARRAY[0, 1])))
);


ALTER TABLE public.sys_role OWNER TO emr_user;

--
-- Name: TABLE sys_role; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.sys_role IS '系统角色表';


--
-- Name: COLUMN sys_role.role_name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_role.role_name IS '角色名称';


--
-- Name: COLUMN sys_role.role_code; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_role.role_code IS '角色编码';


--
-- Name: COLUMN sys_role.description; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_role.description IS '角色描述';


--
-- Name: sys_role_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.sys_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_role_id_seq OWNER TO emr_user;

--
-- Name: sys_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.sys_role_id_seq OWNED BY public.sys_role.id;


--
-- Name: sys_role_menu; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.sys_role_menu (
    id bigint NOT NULL,
    role_id bigint NOT NULL,
    menu_id bigint NOT NULL,
    create_time timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sys_role_menu OWNER TO emr_user;

--
-- Name: TABLE sys_role_menu; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.sys_role_menu IS '角色菜单关联表';


--
-- Name: sys_role_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.sys_role_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_role_menu_id_seq OWNER TO emr_user;

--
-- Name: sys_role_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.sys_role_menu_id_seq OWNED BY public.sys_role_menu.id;


--
-- Name: sys_user; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.sys_user (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    name character varying(50),
    phone character varying(20),
    email character varying(100),
    avatar character varying(255),
    status integer DEFAULT 1,
    create_time timestamp without time zone DEFAULT now(),
    update_time timestamp without time zone DEFAULT now(),
    is_deleted integer DEFAULT 0,
    CONSTRAINT sys_user_is_deleted_check CHECK ((is_deleted = ANY (ARRAY[0, 1]))),
    CONSTRAINT sys_user_status_check CHECK ((status = ANY (ARRAY[0, 1])))
);


ALTER TABLE public.sys_user OWNER TO emr_user;

--
-- Name: TABLE sys_user; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.sys_user IS '系统用户表';


--
-- Name: COLUMN sys_user.id; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_user.id IS '主键ID';


--
-- Name: COLUMN sys_user.username; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_user.username IS '用户名';


--
-- Name: COLUMN sys_user.password; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_user.password IS '密码(BCrypt加密)';


--
-- Name: COLUMN sys_user.name; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_user.name IS '姓名';


--
-- Name: COLUMN sys_user.phone; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_user.phone IS '手机号';


--
-- Name: COLUMN sys_user.email; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_user.email IS '邮箱';


--
-- Name: COLUMN sys_user.avatar; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_user.avatar IS '头像地址';


--
-- Name: COLUMN sys_user.status; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_user.status IS '状态(1:正常 0:禁用)';


--
-- Name: COLUMN sys_user.is_deleted; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON COLUMN public.sys_user.is_deleted IS '逻辑删除(0:未删除 1:已删除)';


--
-- Name: sys_user_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.sys_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_user_id_seq OWNER TO emr_user;

--
-- Name: sys_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.sys_user_id_seq OWNED BY public.sys_user.id;


--
-- Name: sys_user_role; Type: TABLE; Schema: public; Owner: emr_user
--

CREATE TABLE public.sys_user_role (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL,
    create_time timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sys_user_role OWNER TO emr_user;

--
-- Name: TABLE sys_user_role; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON TABLE public.sys_user_role IS '用户角色关联表';


--
-- Name: sys_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: emr_user
--

CREATE SEQUENCE public.sys_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sys_user_role_id_seq OWNER TO emr_user;

--
-- Name: sys_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emr_user
--

ALTER SEQUENCE public.sys_user_role_id_seq OWNED BY public.sys_user_role.id;


--
-- Name: v_doctor_user_manage; Type: VIEW; Schema: public; Owner: emr_user
--

CREATE VIEW public.v_doctor_user_manage AS
 SELECT d.id,
    d.id AS doctor_id,
    u.id AS user_id,
    d.doctor_code,
    d.doctor_name,
    d.dept_code,
    d.title_code,
    d.license_no,
    d.user_username AS username,
    NULL::character varying(100) AS password,
    d.enabled AS doctor_enabled,
    u.status AS user_status,
    u.is_deleted AS user_is_deleted,
    d.create_time AS doctor_create_time,
    d.update_time AS doctor_update_time,
    u.create_time AS user_create_time,
    u.update_time AS user_update_time
   FROM (public.doctor d
     JOIN public.sys_user u ON (((u.username)::text = (d.user_username)::text)));


ALTER VIEW public.v_doctor_user_manage OWNER TO emr_user;

--
-- Name: VIEW v_doctor_user_manage; Type: COMMENT; Schema: public; Owner: emr_user
--

COMMENT ON VIEW public.v_doctor_user_manage IS '医生与系统用户联动管理视图';


--
-- Name: v_emr_template_manage; Type: VIEW; Schema: public; Owner: emr_user
--

CREATE VIEW public.v_emr_template_manage AS
 SELECT t.id,
    t.template_code,
    t.template_name,
    t.emr_type,
    t.template_scope,
    t.template_structure,
    t.enabled,
    t.create_time,
    t.update_time,
    td.dept_id AS selected_dept_id
   FROM (public.emr_template t
     LEFT JOIN public.emr_template_department td ON ((td.template_id = t.id)));


ALTER VIEW public.v_emr_template_manage OWNER TO emr_user;

--
-- Name: v_emr_template_scope; Type: VIEW; Schema: public; Owner: emr_user
--

CREATE VIEW public.v_emr_template_scope AS
 SELECT t.id,
    t.template_code,
    t.template_name,
    t.emr_type,
    t.template_scope,
        CASE
            WHEN ((t.template_scope)::text = 'HOSPITAL'::text) THEN '全院'::character varying
            WHEN ((t.template_scope)::text = 'DEPARTMENT'::text) THEN '科室'::character varying
            ELSE t.template_scope
        END AS scope_label,
    t.template_structure,
    t.enabled,
    t.create_time,
    t.update_time,
    td.dept_id,
    d.dept_code,
    d.dept_name
   FROM ((public.emr_template t
     LEFT JOIN public.emr_template_department td ON ((td.template_id = t.id)))
     LEFT JOIN public.sys_department d ON ((d.id = td.dept_id)));


ALTER VIEW public.v_emr_template_scope OWNER TO emr_user;

--
-- Name: v_outpatient_emr_bundle; Type: VIEW; Schema: public; Owner: emr_user
--

CREATE VIEW public.v_outpatient_emr_bundle AS
 SELECT oed.id,
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
    false AS sign_action,
    er.template_code
   FROM ((public.outpatient_encounter_data oed
     LEFT JOIN public.emr_record er ON ((((er.visit_code)::text = (oed.visit_code)::text) AND ((er.emr_type)::text = 'OUTPATIENT'::text))))
     LEFT JOIN public.emr_record_version rv ON ((((rv.emr_code)::text = (er.emr_code)::text) AND (rv.version_no = er.current_version))));


ALTER VIEW public.v_outpatient_emr_bundle OWNER TO emr_user;

--
-- Name: v_outpatient_emr_bundle_latest; Type: VIEW; Schema: public; Owner: emr_user
--

CREATE VIEW public.v_outpatient_emr_bundle_latest AS
 SELECT oed.id,
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
    GREATEST(COALESCE(oed.update_time, '1970-01-01 00:00:00'::timestamp without time zone), COALESCE(er.update_time, '1970-01-01 00:00:00'::timestamp without time zone), COALESCE(rv.update_time, '1970-01-01 00:00:00'::timestamp without time zone)) AS update_time
   FROM ((public.outpatient_encounter_data oed
     LEFT JOIN public.emr_record er ON ((((er.visit_code)::text = (oed.visit_code)::text) AND ((er.emr_type)::text = 'OUTPATIENT'::text))))
     LEFT JOIN public.emr_record_version rv ON ((((rv.emr_code)::text = (er.emr_code)::text) AND (rv.version_no = er.current_version))));


ALTER VIEW public.v_outpatient_emr_bundle_latest OWNER TO emr_user;

--
-- Name: Access id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Access" ALTER COLUMN id SET DEFAULT nextval('public."Access_id_seq"'::regclass);


--
-- Name: Document id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Document" ALTER COLUMN id SET DEFAULT nextval('public."Document_id_seq"'::regclass);


--
-- Name: Function id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Function" ALTER COLUMN id SET DEFAULT nextval('public."Function_id_seq"'::regclass);


--
-- Name: Request id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Request" ALTER COLUMN id SET DEFAULT nextval('public."Request_id_seq"'::regclass);


--
-- Name: Script id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Script" ALTER COLUMN id SET DEFAULT nextval('public."Script_id_seq"'::regclass);


--
-- Name: doctor id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.doctor ALTER COLUMN id SET DEFAULT nextval('public.doctor_id_seq'::regclass);


--
-- Name: doctor_favorite_template id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.doctor_favorite_template ALTER COLUMN id SET DEFAULT nextval('public.doctor_favorite_template_id_seq'::regclass);


--
-- Name: emr_data_element id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_data_element ALTER COLUMN id SET DEFAULT nextval('public.emr_data_element_id_seq'::regclass);


--
-- Name: emr_data_set id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_data_set ALTER COLUMN id SET DEFAULT nextval('public.emr_data_set_id_seq'::regclass);


--
-- Name: emr_data_set_element id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_data_set_element ALTER COLUMN id SET DEFAULT nextval('public.emr_data_set_element_id_seq'::regclass);


--
-- Name: emr_icd10_diagnosis id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_icd10_diagnosis ALTER COLUMN id SET DEFAULT nextval('public.emr_icd10_diagnosis_id_seq'::regclass);


--
-- Name: emr_record id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_record ALTER COLUMN id SET DEFAULT nextval('public.emr_record_id_seq'::regclass);


--
-- Name: emr_record_version id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_record_version ALTER COLUMN id SET DEFAULT nextval('public.emr_record_version_id_seq'::regclass);


--
-- Name: emr_template id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_template ALTER COLUMN id SET DEFAULT nextval('public.emr_template_id_seq'::regclass);


--
-- Name: emr_template_department id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_template_department ALTER COLUMN id SET DEFAULT nextval('public.emr_template_department_id_seq'::regclass);


--
-- Name: emr_value_domain id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_value_domain ALTER COLUMN id SET DEFAULT nextval('public.emr_value_domain_id_seq'::regclass);


--
-- Name: emr_value_domain_item id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_value_domain_item ALTER COLUMN id SET DEFAULT nextval('public.emr_value_domain_item_id_seq'::regclass);


--
-- Name: exam_result id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.exam_result ALTER COLUMN id SET DEFAULT nextval('public.exam_result_id_seq'::regclass);


--
-- Name: lab_result id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.lab_result ALTER COLUMN id SET DEFAULT nextval('public.lab_result_id_seq'::regclass);


--
-- Name: medical_order id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order ALTER COLUMN id SET DEFAULT nextval('public.medical_order_id_seq'::regclass);


--
-- Name: medical_order_drug id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order_drug ALTER COLUMN id SET DEFAULT nextval('public.medical_order_drug_id_seq'::regclass);


--
-- Name: medical_order_exam id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order_exam ALTER COLUMN id SET DEFAULT nextval('public.medical_order_exam_id_seq'::regclass);


--
-- Name: medical_order_lab id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order_lab ALTER COLUMN id SET DEFAULT nextval('public.medical_order_lab_id_seq'::regclass);


--
-- Name: outpatient_encounter_data id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_encounter_data ALTER COLUMN id SET DEFAULT nextval('public.outpatient_encounter_data_id_seq'::regclass);


--
-- Name: outpatient_visit_active id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_visit_active ALTER COLUMN id SET DEFAULT nextval('public.outpatient_visit_id_seq'::regclass);


--
-- Name: outpatient_visit_history id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_visit_history ALTER COLUMN id SET DEFAULT nextval('public.outpatient_visit_history_id_seq'::regclass);


--
-- Name: patient id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.patient ALTER COLUMN id SET DEFAULT nextval('public.patient_id_seq'::regclass);


--
-- Name: registration id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.registration ALTER COLUMN id SET DEFAULT nextval('public.registration_id_seq'::regclass);


--
-- Name: sys_department id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_department ALTER COLUMN id SET DEFAULT nextval('public.sys_department_id_seq'::regclass);


--
-- Name: sys_login_log id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_login_log ALTER COLUMN id SET DEFAULT nextval('public.sys_login_log_id_seq'::regclass);


--
-- Name: sys_menu id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_menu ALTER COLUMN id SET DEFAULT nextval('public.sys_menu_id_seq'::regclass);


--
-- Name: sys_oper_log id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_oper_log ALTER COLUMN id SET DEFAULT nextval('public.sys_oper_log_id_seq'::regclass);


--
-- Name: sys_role id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_role ALTER COLUMN id SET DEFAULT nextval('public.sys_role_id_seq'::regclass);


--
-- Name: sys_role_menu id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_role_menu ALTER COLUMN id SET DEFAULT nextval('public.sys_role_menu_id_seq'::regclass);


--
-- Name: sys_user id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_user ALTER COLUMN id SET DEFAULT nextval('public.sys_user_id_seq'::regclass);


--
-- Name: sys_user_role id; Type: DEFAULT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_user_role ALTER COLUMN id SET DEFAULT nextval('public.sys_user_role_id_seq'::regclass);


--
-- Name: Access Access_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Access"
    ADD CONSTRAINT "Access_pkey" PRIMARY KEY (id);


--
-- Name: Document Document_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Document"
    ADD CONSTRAINT "Document_pkey" PRIMARY KEY (id);


--
-- Name: Function Function_name_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Function"
    ADD CONSTRAINT "Function_name_key" UNIQUE (name);


--
-- Name: Function Function_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Function"
    ADD CONSTRAINT "Function_pkey" PRIMARY KEY (id);


--
-- Name: Request Request_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_pkey" PRIMARY KEY (id);


--
-- Name: Script Script_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Script"
    ADD CONSTRAINT "Script_pkey" PRIMARY KEY (id);


--
-- Name: doctor doctor_doctor_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_doctor_code_key UNIQUE (doctor_code);


--
-- Name: doctor_favorite_template doctor_favorite_template_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.doctor_favorite_template
    ADD CONSTRAINT doctor_favorite_template_pkey PRIMARY KEY (id);


--
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id);


--
-- Name: doctor doctor_user_username_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_user_username_key UNIQUE (user_username);


--
-- Name: emr_data_element emr_data_element_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_data_element
    ADD CONSTRAINT emr_data_element_pkey PRIMARY KEY (id);


--
-- Name: emr_data_set_element emr_data_set_element_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_data_set_element
    ADD CONSTRAINT emr_data_set_element_pkey PRIMARY KEY (id);


--
-- Name: emr_data_set emr_data_set_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_data_set
    ADD CONSTRAINT emr_data_set_pkey PRIMARY KEY (id);


--
-- Name: emr_icd10_diagnosis emr_icd10_diagnosis_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_icd10_diagnosis
    ADD CONSTRAINT emr_icd10_diagnosis_pkey PRIMARY KEY (id);


--
-- Name: emr_record emr_record_emr_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_record
    ADD CONSTRAINT emr_record_emr_code_key UNIQUE (emr_code);


--
-- Name: emr_record emr_record_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_record
    ADD CONSTRAINT emr_record_pkey PRIMARY KEY (id);


--
-- Name: emr_record_version emr_record_version_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_record_version
    ADD CONSTRAINT emr_record_version_pkey PRIMARY KEY (id);


--
-- Name: emr_template_department emr_template_department_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_template_department
    ADD CONSTRAINT emr_template_department_pkey PRIMARY KEY (id);


--
-- Name: emr_template emr_template_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_template
    ADD CONSTRAINT emr_template_pkey PRIMARY KEY (id);


--
-- Name: emr_template emr_template_template_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_template
    ADD CONSTRAINT emr_template_template_code_key UNIQUE (template_code);


--
-- Name: emr_value_domain_item emr_value_domain_item_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_value_domain_item
    ADD CONSTRAINT emr_value_domain_item_pkey PRIMARY KEY (id);


--
-- Name: emr_value_domain emr_value_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_value_domain
    ADD CONSTRAINT emr_value_domain_pkey PRIMARY KEY (id);


--
-- Name: exam_result exam_result_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.exam_result
    ADD CONSTRAINT exam_result_pkey PRIMARY KEY (id);


--
-- Name: lab_result lab_result_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.lab_result
    ADD CONSTRAINT lab_result_pkey PRIMARY KEY (id);


--
-- Name: medical_order_drug medical_order_drug_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order_drug
    ADD CONSTRAINT medical_order_drug_pkey PRIMARY KEY (id);


--
-- Name: medical_order_exam medical_order_exam_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order_exam
    ADD CONSTRAINT medical_order_exam_pkey PRIMARY KEY (id);


--
-- Name: medical_order_lab medical_order_lab_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order_lab
    ADD CONSTRAINT medical_order_lab_pkey PRIMARY KEY (id);


--
-- Name: medical_order medical_order_order_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order
    ADD CONSTRAINT medical_order_order_code_key UNIQUE (order_code);


--
-- Name: medical_order medical_order_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order
    ADD CONSTRAINT medical_order_pkey PRIMARY KEY (id);


--
-- Name: outpatient_encounter_data outpatient_encounter_data_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_encounter_data
    ADD CONSTRAINT outpatient_encounter_data_pkey PRIMARY KEY (id);


--
-- Name: outpatient_encounter_data outpatient_encounter_data_visit_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_encounter_data
    ADD CONSTRAINT outpatient_encounter_data_visit_code_key UNIQUE (visit_code);


--
-- Name: outpatient_visit_history outpatient_visit_history_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_visit_history
    ADD CONSTRAINT outpatient_visit_history_pkey PRIMARY KEY (id);


--
-- Name: outpatient_visit_history outpatient_visit_history_visit_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_visit_history
    ADD CONSTRAINT outpatient_visit_history_visit_code_key UNIQUE (visit_code);


--
-- Name: outpatient_visit_active outpatient_visit_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_visit_active
    ADD CONSTRAINT outpatient_visit_pkey PRIMARY KEY (id);


--
-- Name: outpatient_visit_active outpatient_visit_reg_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_visit_active
    ADD CONSTRAINT outpatient_visit_reg_code_key UNIQUE (reg_code);


--
-- Name: outpatient_visit_active outpatient_visit_visit_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_visit_active
    ADD CONSTRAINT outpatient_visit_visit_code_key UNIQUE (visit_code);


--
-- Name: patient patient_patient_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_patient_code_key UNIQUE (patient_code);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: registration registration_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_pkey PRIMARY KEY (id);


--
-- Name: registration registration_reg_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT registration_reg_code_key UNIQUE (reg_code);


--
-- Name: sys_department sys_department_dept_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_department
    ADD CONSTRAINT sys_department_dept_code_key UNIQUE (dept_code);


--
-- Name: sys_department sys_department_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_department
    ADD CONSTRAINT sys_department_pkey PRIMARY KEY (id);


--
-- Name: sys_login_log sys_login_log_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_login_log
    ADD CONSTRAINT sys_login_log_pkey PRIMARY KEY (id);


--
-- Name: sys_menu sys_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT sys_menu_pkey PRIMARY KEY (id);


--
-- Name: sys_oper_log sys_oper_log_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_oper_log
    ADD CONSTRAINT sys_oper_log_pkey PRIMARY KEY (id);


--
-- Name: sys_role_menu sys_role_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_role_menu
    ADD CONSTRAINT sys_role_menu_pkey PRIMARY KEY (id);


--
-- Name: sys_role_menu sys_role_menu_role_id_menu_id_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_role_menu
    ADD CONSTRAINT sys_role_menu_role_id_menu_id_key UNIQUE (role_id, menu_id);


--
-- Name: sys_role sys_role_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_role
    ADD CONSTRAINT sys_role_pkey PRIMARY KEY (id);


--
-- Name: sys_role sys_role_role_code_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_role
    ADD CONSTRAINT sys_role_role_code_key UNIQUE (role_code);


--
-- Name: sys_user sys_user_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT sys_user_pkey PRIMARY KEY (id);


--
-- Name: sys_user_role sys_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_user_role
    ADD CONSTRAINT sys_user_role_pkey PRIMARY KEY (id);


--
-- Name: sys_user_role sys_user_role_user_id_role_id_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_user_role
    ADD CONSTRAINT sys_user_role_user_id_role_id_key UNIQUE (user_id, role_id);


--
-- Name: sys_user sys_user_username_key; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT sys_user_username_key UNIQUE (username);


--
-- Name: Access uk_access_name; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Access"
    ADD CONSTRAINT uk_access_name UNIQUE (name);


--
-- Name: doctor_favorite_template uk_doctor_template; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.doctor_favorite_template
    ADD CONSTRAINT uk_doctor_template UNIQUE (doctor_code, template_code);


--
-- Name: emr_icd10_diagnosis uk_emr_icd10_diag_code; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_icd10_diagnosis
    ADD CONSTRAINT uk_emr_icd10_diag_code UNIQUE (diag_code);


--
-- Name: Script uk_script_name; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public."Script"
    ADD CONSTRAINT uk_script_name UNIQUE (name);


--
-- Name: emr_data_set_element uq_dataset_element; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_data_set_element
    ADD CONSTRAINT uq_dataset_element UNIQUE (dataset_code, element_code);


--
-- Name: emr_data_element uq_emr_data_element_code; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_data_element
    ADD CONSTRAINT uq_emr_data_element_code UNIQUE (element_code);


--
-- Name: emr_data_set uq_emr_dataset_code; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_data_set
    ADD CONSTRAINT uq_emr_dataset_code UNIQUE (dataset_code);


--
-- Name: emr_template_department uq_template_dept; Type: CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_template_department
    ADD CONSTRAINT uq_template_dept UNIQUE (template_id, dept_id);


--
-- Name: idx_doctor_dept_code; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_doctor_dept_code ON public.doctor USING btree (dept_code);


--
-- Name: idx_doctor_user_username; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_doctor_user_username ON public.doctor USING btree (user_username);


--
-- Name: idx_drug_order; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_drug_order ON public.medical_order_drug USING btree (order_code);


--
-- Name: idx_emr_icd10_diag_name; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_emr_icd10_diag_name ON public.emr_icd10_diagnosis USING btree (diag_name);


--
-- Name: idx_emr_icd10_pinyin_initials; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_emr_icd10_pinyin_initials ON public.emr_icd10_diagnosis USING btree (pinyin_initials);


--
-- Name: idx_emr_record_patient; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_emr_record_patient ON public.emr_record USING btree (patient_code);


--
-- Name: idx_emr_record_visit; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_emr_record_visit ON public.emr_record USING btree (visit_code);


--
-- Name: idx_emr_version_emr; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_emr_version_emr ON public.emr_record_version USING btree (emr_code);


--
-- Name: idx_encounter_json_gin; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_encounter_json_gin ON public.outpatient_encounter_data USING gin (encounter_json);


--
-- Name: idx_exam_order; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_exam_order ON public.medical_order_exam USING btree (order_code);


--
-- Name: idx_exam_result_order; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_exam_result_order ON public.exam_result USING btree (order_code);


--
-- Name: idx_fav_doctor_code; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_fav_doctor_code ON public.doctor_favorite_template USING btree (doctor_code);


--
-- Name: idx_fav_template_code; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_fav_template_code ON public.doctor_favorite_template USING btree (template_code);


--
-- Name: idx_lab_order; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_lab_order ON public.medical_order_lab USING btree (order_code);


--
-- Name: idx_lab_result_order; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_lab_result_order ON public.lab_result USING btree (order_code);


--
-- Name: idx_order_patient; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_order_patient ON public.medical_order USING btree (patient_code);


--
-- Name: idx_order_visit; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_order_visit ON public.medical_order USING btree (visit_code);


--
-- Name: idx_sys_menu_parent; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_sys_menu_parent ON public.sys_menu USING btree (parent_id);


--
-- Name: idx_sys_role_code; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_sys_role_code ON public.sys_role USING btree (role_code);


--
-- Name: idx_sys_role_menu_menu; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_sys_role_menu_menu ON public.sys_role_menu USING btree (menu_id);


--
-- Name: idx_sys_role_menu_role; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_sys_role_menu_role ON public.sys_role_menu USING btree (role_id);


--
-- Name: idx_sys_user_deleted; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_sys_user_deleted ON public.sys_user USING btree (is_deleted);


--
-- Name: idx_sys_user_role_role; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_sys_user_role_role ON public.sys_user_role USING btree (role_id);


--
-- Name: idx_sys_user_role_user; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_sys_user_role_user ON public.sys_user_role USING btree (user_id);


--
-- Name: idx_sys_user_username; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_sys_user_username ON public.sys_user USING btree (username);


--
-- Name: idx_visit_history_archived_at; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_visit_history_archived_at ON public.outpatient_visit_history USING btree (archived_at DESC);


--
-- Name: idx_visit_history_patient_code; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_visit_history_patient_code ON public.outpatient_visit_history USING btree (patient_code);


--
-- Name: idx_visit_history_reg_code; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE INDEX idx_visit_history_reg_code ON public.outpatient_visit_history USING btree (reg_code);


--
-- Name: uk_emr_value_domain_code; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE UNIQUE INDEX uk_emr_value_domain_code ON public.emr_value_domain USING btree (domain_code);


--
-- Name: uk_emr_value_domain_item_code; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE UNIQUE INDEX uk_emr_value_domain_item_code ON public.emr_value_domain_item USING btree (domain_code, item_code);


--
-- Name: uk_emr_value_domain_item_default; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE UNIQUE INDEX uk_emr_value_domain_item_default ON public.emr_value_domain_item USING btree (domain_code) WHERE (is_default = 1);


--
-- Name: uk_emr_version; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE UNIQUE INDEX uk_emr_version ON public.emr_record_version USING btree (emr_code, version_no);


--
-- Name: uq_emr_record_visit_type; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE UNIQUE INDEX uq_emr_record_visit_type ON public.emr_record USING btree (visit_code, emr_type);


--
-- Name: uq_emr_template_department_template_id; Type: INDEX; Schema: public; Owner: emr_user
--

CREATE UNIQUE INDEX uq_emr_template_department_template_id ON public.emr_template_department USING btree (template_id);


--
-- Name: outpatient_visit_active trg_active_visit_create_encounter; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_active_visit_create_encounter AFTER INSERT ON public.outpatient_visit_active FOR EACH ROW EXECUTE FUNCTION public.trg_active_visit_create_encounter();


--
-- Name: outpatient_visit_active trg_active_visit_finalize; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_active_visit_finalize AFTER UPDATE OF visit_status ON public.outpatient_visit_active FOR EACH ROW EXECUTE FUNCTION public.trg_active_visit_finalize();


--
-- Name: outpatient_visit_active trg_active_visit_status_validate; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_active_visit_status_validate BEFORE UPDATE OF visit_status ON public.outpatient_visit_active FOR EACH ROW EXECUTE FUNCTION public.trg_active_visit_status_validate();


--
-- Name: emr_record trg_emr_record_guard_bu; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_emr_record_guard_bu BEFORE UPDATE ON public.emr_record FOR EACH ROW EXECUTE FUNCTION public.fn_emr_record_guard_bu();


--
-- Name: emr_record_version trg_emr_record_version_guard_bd; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_emr_record_version_guard_bd BEFORE DELETE ON public.emr_record_version FOR EACH ROW EXECUTE FUNCTION public.fn_emr_record_version_guard_bud();


--
-- Name: emr_record_version trg_emr_record_version_guard_bi; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_emr_record_version_guard_bi BEFORE INSERT ON public.emr_record_version FOR EACH ROW EXECUTE FUNCTION public.fn_emr_record_version_guard_bi();


--
-- Name: emr_record_version trg_emr_record_version_guard_bu; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_emr_record_version_guard_bu BEFORE UPDATE ON public.emr_record_version FOR EACH ROW EXECUTE FUNCTION public.fn_emr_record_version_guard_bud();


--
-- Name: outpatient_encounter_data trg_outpatient_encounter_guard_bu; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_outpatient_encounter_guard_bu BEFORE UPDATE ON public.outpatient_encounter_data FOR EACH ROW EXECUTE FUNCTION public.fn_outpatient_encounter_guard_bu();


--
-- Name: registration trg_registration_cancel_to_visit; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_registration_cancel_to_visit AFTER UPDATE OF reg_status ON public.registration FOR EACH ROW EXECUTE FUNCTION public.trg_registration_cancel_to_visit();


--
-- Name: registration trg_registration_create_active_visit; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_registration_create_active_visit AFTER INSERT ON public.registration FOR EACH ROW EXECUTE FUNCTION public.trg_registration_create_active_visit();


--
-- Name: registration trg_registration_fill_reg_code; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_registration_fill_reg_code BEFORE INSERT ON public.registration FOR EACH ROW EXECUTE FUNCTION public.trg_registration_fill_reg_code();


--
-- Name: registration trg_registration_status_validate; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_registration_status_validate BEFORE INSERT OR UPDATE OF reg_status ON public.registration FOR EACH ROW EXECUTE FUNCTION public.trg_registration_status_validate();


--
-- Name: v_doctor_user_manage trg_v_doctor_user_manage_iud; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_v_doctor_user_manage_iud INSTEAD OF INSERT OR DELETE OR UPDATE ON public.v_doctor_user_manage FOR EACH ROW EXECUTE FUNCTION public.fn_v_doctor_user_manage_iud();


--
-- Name: v_emr_template_manage trg_v_emr_template_manage_iou; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_v_emr_template_manage_iou INSTEAD OF INSERT OR UPDATE ON public.v_emr_template_manage FOR EACH ROW EXECUTE FUNCTION public.fn_v_emr_template_manage_iou();


--
-- Name: v_outpatient_emr_bundle trg_v_outpatient_emr_bundle_u; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_v_outpatient_emr_bundle_u INSTEAD OF UPDATE ON public.v_outpatient_emr_bundle FOR EACH ROW EXECUTE FUNCTION public.fn_v_outpatient_emr_bundle_u();


--
-- Name: outpatient_visit_history trg_visit_history_readonly; Type: TRIGGER; Schema: public; Owner: emr_user
--

CREATE TRIGGER trg_visit_history_readonly BEFORE DELETE OR UPDATE ON public.outpatient_visit_history FOR EACH ROW EXECUTE FUNCTION public.trg_visit_history_readonly();


--
-- Name: doctor fk_doctor_dept; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT fk_doctor_dept FOREIGN KEY (dept_code) REFERENCES public.sys_department(dept_code);


--
-- Name: doctor fk_doctor_user; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT fk_doctor_user FOREIGN KEY (user_username) REFERENCES public.sys_user(username);


--
-- Name: medical_order_drug fk_drug_order; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order_drug
    ADD CONSTRAINT fk_drug_order FOREIGN KEY (order_code) REFERENCES public.medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: outpatient_encounter_data fk_encounter_visit; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_encounter_data
    ADD CONSTRAINT fk_encounter_visit FOREIGN KEY (visit_code) REFERENCES public.outpatient_visit_active(visit_code) ON DELETE CASCADE;


--
-- Name: medical_order_exam fk_exam_order; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order_exam
    ADD CONSTRAINT fk_exam_order FOREIGN KEY (order_code) REFERENCES public.medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: exam_result fk_exam_res_order; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.exam_result
    ADD CONSTRAINT fk_exam_res_order FOREIGN KEY (order_code) REFERENCES public.medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: doctor_favorite_template fk_fav_doctor; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.doctor_favorite_template
    ADD CONSTRAINT fk_fav_doctor FOREIGN KEY (doctor_code) REFERENCES public.doctor(doctor_code) ON DELETE CASCADE;


--
-- Name: doctor_favorite_template fk_fav_template; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.doctor_favorite_template
    ADD CONSTRAINT fk_fav_template FOREIGN KEY (template_code) REFERENCES public.emr_template(template_code) ON DELETE CASCADE;


--
-- Name: medical_order_lab fk_lab_order; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.medical_order_lab
    ADD CONSTRAINT fk_lab_order FOREIGN KEY (order_code) REFERENCES public.medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: lab_result fk_lab_res_order; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.lab_result
    ADD CONSTRAINT fk_lab_res_order FOREIGN KEY (order_code) REFERENCES public.medical_order(order_code) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: registration fk_reg_dept; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT fk_reg_dept FOREIGN KEY (dept_code) REFERENCES public.sys_department(dept_code);


--
-- Name: registration fk_reg_patient; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.registration
    ADD CONSTRAINT fk_reg_patient FOREIGN KEY (patient_code) REFERENCES public.patient(patient_code);


--
-- Name: emr_template_department fk_template_dept_department; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_template_department
    ADD CONSTRAINT fk_template_dept_department FOREIGN KEY (dept_id) REFERENCES public.sys_department(id);


--
-- Name: emr_template_department fk_template_dept_template; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.emr_template_department
    ADD CONSTRAINT fk_template_dept_template FOREIGN KEY (template_id) REFERENCES public.emr_template(id) ON DELETE CASCADE;


--
-- Name: outpatient_visit_active fk_visit_dept; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_visit_active
    ADD CONSTRAINT fk_visit_dept FOREIGN KEY (dept_code) REFERENCES public.sys_department(dept_code);


--
-- Name: outpatient_visit_active fk_visit_patient; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_visit_active
    ADD CONSTRAINT fk_visit_patient FOREIGN KEY (patient_code) REFERENCES public.patient(patient_code);


--
-- Name: outpatient_visit_active fk_visit_reg; Type: FK CONSTRAINT; Schema: public; Owner: emr_user
--

ALTER TABLE ONLY public.outpatient_visit_active
    ADD CONSTRAINT fk_visit_reg FOREIGN KEY (reg_code) REFERENCES public.registration(reg_code);


--
-- PostgreSQL database dump complete
--

\unrestrict nb02gnCTIfZO3BQnaSMojTRTcZgZcs4WXYSyqU8MDM63g65vxclmayDhaF2ip5K

