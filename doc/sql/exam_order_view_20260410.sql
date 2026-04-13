-- =============================================================================
-- 检查医嘱视图 + medical_order_exam 部位字段补充
-- 说明：
--   1. medical_order_exam 本身有 exam_part(VARCHAR) 存部位名称，
--      补充 exam_part_code(VARCHAR) 存部位编码，废弃 medical_order_exam_part 关联表。
--   2. 创建 v_exam_order_list 视图，join 检查类型字典展示完整信息。
--   3. APIJSON Access 注册。
-- =============================================================================

BEGIN;

-- 1) medical_order_exam 补充 exam_part_code 字段
ALTER TABLE public.medical_order_exam
  ADD COLUMN IF NOT EXISTS exam_part_code VARCHAR(64);

-- 建立外键（可选，不强制，因为旧数据可能为空）
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'fk_medical_order_exam_part_code'
  ) THEN
    ALTER TABLE public.medical_order_exam
      ADD CONSTRAINT fk_medical_order_exam_part_code
      FOREIGN KEY (exam_part_code)
      REFERENCES public.emr_exam_body_part_dict(part_code)
      ON DELETE SET NULL;
  END IF;
END $$;

-- 2) 检查医嘱完整视图
CREATE OR REPLACE VIEW public.v_exam_order_list AS
SELECT
  e.id,
  e.order_code,
  e.exam_item_code,
  e.exam_item_name,
  e.exam_type_code,
  t.type_name        AS exam_type_name,
  e.exam_part_code,
  p.part_name        AS exam_part_name,
  COALESCE(e.exam_part, p.part_name) AS exam_part_display,
  e.is_enhanced,
  e.clinical_purpose,
  e.supports_part,
  e.supports_enhanced,
  e.exam_item_snapshot,
  e.create_time,
  e.update_time
FROM public.medical_order_exam e
LEFT JOIN public.emr_exam_type_dict t
  ON t.type_code = e.exam_type_code
LEFT JOIN public.emr_exam_body_part_dict p
  ON p.part_code = e.exam_part_code;

-- 3) APIJSON Access 注册（只读，视图不允许写入）
INSERT INTO "Access" (name, alias, get, head, gets, heads, post, put, delete)
VALUES (
  'v_exam_order_list', 'VExamOrderList',
  '["LOGIN","ADMIN"]',
  '["LOGIN","ADMIN"]',
  '["LOGIN","ADMIN"]',
  '["LOGIN","ADMIN"]',
  '["ADMIN"]',
  '["ADMIN"]',
  '["ADMIN"]'
)
ON CONFLICT (name) DO UPDATE SET
  alias  = EXCLUDED.alias,
  get    = EXCLUDED.get,
  head   = EXCLUDED.head,
  gets   = EXCLUDED.gets,
  heads  = EXCLUDED.heads;

COMMIT;

-- 验收
SELECT
  e.id,
  e.order_code,
  e.exam_item_code,
  e.exam_item_name,
  e.exam_type_code,
  t.type_name  AS exam_type_name,
  e.exam_part_code,
  p.part_name  AS exam_part_name
FROM public.medical_order_exam e
LEFT JOIN public.emr_exam_type_dict t ON t.type_code = e.exam_type_code
LEFT JOIN public.emr_exam_body_part_dict p ON p.part_code = e.exam_part_code
LIMIT 20;
