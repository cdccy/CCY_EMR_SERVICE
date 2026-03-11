

-- ============================================================
-- 医生管理与系统用户联动视图 + INSTEAD OF 触发器
-- 数据库: PostgreSQL 16+
-- 说明:
--   1) 通过可更新视图统一维护 doctor 与 sys_user
--   2) DELETE 为软删除: doctor.enabled=false, sys_user.is_deleted=1
--   3) username 在 UPDATE 中不可修改
-- ============================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE OR REPLACE VIEW public.v_doctor_user_manage AS
SELECT
    d.id AS id,
    d.id AS doctor_id,
    u.id AS user_id,
    d.doctor_code,
    d.doctor_name,
    d.dept_code,
    d.title_code,
    d.license_no,
    d.user_username AS username,
    NULL::varchar(100) AS password,
    d.enabled AS doctor_enabled,
    u.status AS user_status,
    u.is_deleted AS user_is_deleted,
    d.create_time AS doctor_create_time,
    d.update_time AS doctor_update_time,
    u.create_time AS user_create_time,
    u.update_time AS user_update_time
FROM public.doctor d
JOIN public.sys_user u ON u.username = d.user_username;

COMMENT ON VIEW public.v_doctor_user_manage IS '医生与系统用户联动管理视图';

CREATE OR REPLACE FUNCTION public.fn_v_doctor_user_manage_iud()
RETURNS trigger
LANGUAGE plpgsql
AS $$
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
$$;

DROP TRIGGER IF EXISTS trg_v_doctor_user_manage_iud ON public.v_doctor_user_manage;

CREATE TRIGGER trg_v_doctor_user_manage_iud
INSTEAD OF INSERT OR UPDATE OR DELETE ON public.v_doctor_user_manage
FOR EACH ROW
EXECUTE FUNCTION public.fn_v_doctor_user_manage_iud();

-- Access 配置（按当前联调需求全部放开）
INSERT INTO public."Access" (name, alias, "get", head, gets, heads, post, put, delete)
VALUES (
    'v_doctor_user_manage',
    'DoctorUserManage',
    '["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]',
    '["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]',
    '["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]',
    '["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]',
    '["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]',
    '["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]',
    '["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]'
)
ON CONFLICT (name) DO UPDATE SET
    alias = EXCLUDED.alias,
    "get" = EXCLUDED."get",
    head = EXCLUDED.head,
    gets = EXCLUDED.gets,
    heads = EXCLUDED.heads,
    post = EXCLUDED.post,
    put = EXCLUDED.put,
    delete = EXCLUDED.delete;

-- Request 校验（version=1）
DELETE FROM public."Request"
WHERE tag = 'DoctorUserManage'
  AND version = 1
  AND method IN ('POST', 'PUT', 'DELETE');

INSERT INTO public."Request" (version, method, tag, structure, detail)
VALUES
(
    1,
    'POST',
    'DoctorUserManage',
    '{"MUST":"doctor_code,doctor_name,dept_code,username,password","REFUSE":"doctor_id,user_id,user_is_deleted","doctor_name":"^[\\u4e00-\\u9fa5a-zA-Z]{2,20}$","username":"^[a-zA-Z0-9_]{4,32}$","password":"^.{6,64}$","user_status{0,1}":1}',
    'DoctorUserManage 新增校验'
),
(
    1,
    'PUT',
    'DoctorUserManage',
    '{"MUST":"id","REFUSE":"username,user_id,user_is_deleted","doctor_name":"^[\\u4e00-\\u9fa5a-zA-Z]{2,20}$","password":"^.{6,64}$","user_status{0,1}":1}',
    'DoctorUserManage 修改校验(PUT必须传id，禁止改username)'
),
(
    1,
    'DELETE',
    'DoctorUserManage',
    '{"MUST":"doctor_id"}',
    'DoctorUserManage 删除校验(软删)'
);

