BEGIN;

-- 1) 模板范围值约束：仅允许全院/科室
ALTER TABLE public.emr_template
  DROP CONSTRAINT IF EXISTS ck_emr_template_scope;

ALTER TABLE public.emr_template
  ADD CONSTRAINT ck_emr_template_scope
  CHECK (template_scope IN ('HOSPITAL', 'DEPARTMENT'));

-- 2) 一模板最多关联一个科室（本需求为单选科室）
DO $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM public.emr_template_department
    GROUP BY template_id
    HAVING COUNT(*) > 1
  ) THEN
    RAISE EXCEPTION '发现 emr_template_department 中存在一个模板关联多个科室的数据，无法应用单科室约束';
  END IF;
END
$$;

CREATE UNIQUE INDEX IF NOT EXISTS uq_emr_template_department_template_id
  ON public.emr_template_department(template_id);

-- 3) 统一展示视图：支持全部/全院/科室维度列表
CREATE OR REPLACE VIEW public.v_emr_template_scope AS
SELECT
  t.id,
  t.template_code,
  t.template_name,
  t.emr_type,
  t.template_scope,
  CASE
    WHEN t.template_scope = 'HOSPITAL' THEN '全院'
    WHEN t.template_scope = 'DEPARTMENT' THEN '科室'
    ELSE t.template_scope
  END AS scope_label,
  t.template_structure,
  t.enabled,
  t.create_time,
  t.update_time,
  td.dept_id,
  d.dept_code,
  d.dept_name
FROM public.emr_template t
LEFT JOIN public.emr_template_department td
  ON td.template_id = t.id
LEFT JOIN public.sys_department d
  ON d.id = td.dept_id;

-- 4) 管理写入视图：通过 selected_dept_id 承接“科室范围”写入语义
CREATE OR REPLACE VIEW public.v_emr_template_manage AS
SELECT
  t.id,
  t.template_code,
  t.template_name,
  t.emr_type,
  t.template_scope,
  t.template_structure,
  t.enabled,
  t.create_time,
  t.update_time,
  td.dept_id AS selected_dept_id
FROM public.emr_template t
LEFT JOIN public.emr_template_department td
  ON td.template_id = t.id;

-- 5) INSTEAD OF 触发器函数：自动维护 emr_template_department
CREATE OR REPLACE FUNCTION public.fn_v_emr_template_manage_iou()
RETURNS trigger
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

DROP TRIGGER IF EXISTS trg_v_emr_template_manage_iou ON public.v_emr_template_manage;

CREATE TRIGGER trg_v_emr_template_manage_iou
INSTEAD OF INSERT OR UPDATE
ON public.v_emr_template_manage
FOR EACH ROW
EXECUTE FUNCTION public.fn_v_emr_template_manage_iou();

-- 6) APIJSON Access 注册（供前端直接读写视图）
INSERT INTO "Access" (name, alias, get, head, gets, heads, post, put, delete)
VALUES
  (
    'v_emr_template_scope',
    'VEmrTemplateScope',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["ADMIN"]',
    '["ADMIN"]',
    '["ADMIN"]'
  ),
  (
    'v_emr_template_manage',
    'VEmrTemplateManage',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["LOGIN","ADMIN"]',
    '["ADMIN"]',
    '["ADMIN"]',
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
