-- ============================================================
-- 标准数据管理二次完善：药品规格化 + 检查/检验主数据 + 检查部位约束
-- ============================================================

BEGIN;

-- ----------------------------
-- 1) 药品主数据分层模型
-- ----------------------------
CREATE TABLE IF NOT EXISTS public.emr_drug_unit_dict (
  unit_code VARCHAR(32) PRIMARY KEY,
  unit_name VARCHAR(64) NOT NULL,
  unit_type VARCHAR(32) NOT NULL DEFAULT 'COUNT',
  status SMALLINT NOT NULL DEFAULT 1,
  sort_no INTEGER NOT NULL DEFAULT 0,
  create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT ck_emr_drug_unit_status CHECK (status IN (0,1))
);

CREATE TABLE IF NOT EXISTS public.emr_drug_form_dict (
  form_code VARCHAR(32) PRIMARY KEY,
  form_name VARCHAR(64) NOT NULL,
  status SMALLINT NOT NULL DEFAULT 1,
  sort_no INTEGER NOT NULL DEFAULT 0,
  create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT ck_emr_drug_form_status CHECK (status IN (0,1))
);

CREATE TABLE IF NOT EXISTS public.emr_drug_master (
  id BIGSERIAL PRIMARY KEY,
  master_code VARCHAR(64) NOT NULL,
  drug_name VARCHAR(256) NOT NULL,
  pinyin_initials VARCHAR(64) NOT NULL,
  status SMALLINT NOT NULL DEFAULT 1,
  sort_no INTEGER NOT NULL DEFAULT 0,
  create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uk_emr_drug_master_code UNIQUE (master_code),
  CONSTRAINT uk_emr_drug_master_name UNIQUE (drug_name),
  CONSTRAINT ck_emr_drug_master_status CHECK (status IN (0,1))
);

CREATE TABLE IF NOT EXISTS public.emr_drug_spec (
  id BIGSERIAL PRIMARY KEY,
  spec_code VARCHAR(80) NOT NULL,
  master_id BIGINT NOT NULL,
  form_code VARCHAR(32) NOT NULL,
  spec_name VARCHAR(256) NOT NULL,
  pack_size NUMERIC(12,2),
  min_unit_code VARCHAR(32) NOT NULL,
  pack_unit_code VARCHAR(32) NOT NULL,
  dose_value NUMERIC(12,3),
  dose_unit_code VARCHAR(32),
  status SMALLINT NOT NULL DEFAULT 1,
  sort_no INTEGER NOT NULL DEFAULT 0,
  create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uk_emr_drug_spec_code UNIQUE (spec_code),
  CONSTRAINT ck_emr_drug_spec_status CHECK (status IN (0,1)),
  CONSTRAINT fk_emr_drug_spec_master FOREIGN KEY (master_id) REFERENCES public.emr_drug_master(id) ON DELETE RESTRICT,
  CONSTRAINT fk_emr_drug_spec_form FOREIGN KEY (form_code) REFERENCES public.emr_drug_form_dict(form_code) ON DELETE RESTRICT,
  CONSTRAINT fk_emr_drug_spec_min_unit FOREIGN KEY (min_unit_code) REFERENCES public.emr_drug_unit_dict(unit_code) ON DELETE RESTRICT,
  CONSTRAINT fk_emr_drug_spec_pack_unit FOREIGN KEY (pack_unit_code) REFERENCES public.emr_drug_unit_dict(unit_code) ON DELETE RESTRICT,
  CONSTRAINT fk_emr_drug_spec_dose_unit FOREIGN KEY (dose_unit_code) REFERENCES public.emr_drug_unit_dict(unit_code) ON DELETE RESTRICT
);

CREATE INDEX IF NOT EXISTS idx_emr_drug_master_name ON public.emr_drug_master(drug_name);
CREATE INDEX IF NOT EXISTS idx_emr_drug_master_pinyin ON public.emr_drug_master(pinyin_initials);
CREATE INDEX IF NOT EXISTS idx_emr_drug_spec_master ON public.emr_drug_spec(master_id);
CREATE INDEX IF NOT EXISTS idx_emr_drug_spec_form ON public.emr_drug_spec(form_code);

-- ----------------------------
-- 2) 检查/检验主数据模型
-- ----------------------------
CREATE TABLE IF NOT EXISTS public.emr_exam_type_dict (
  type_code VARCHAR(32) PRIMARY KEY,
  type_name VARCHAR(64) NOT NULL,
  status SMALLINT NOT NULL DEFAULT 1,
  sort_no INTEGER NOT NULL DEFAULT 0,
  create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT ck_emr_exam_type_status CHECK (status IN (0,1))
);

CREATE TABLE IF NOT EXISTS public.emr_exam_body_part_dict (
  part_code VARCHAR(64) PRIMARY KEY,
  part_name VARCHAR(128) NOT NULL,
  pinyin_initials VARCHAR(64) NOT NULL,
  status SMALLINT NOT NULL DEFAULT 1,
  sort_no INTEGER NOT NULL DEFAULT 0,
  create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT ck_emr_exam_part_status CHECK (status IN (0,1))
);

CREATE TABLE IF NOT EXISTS public.emr_exam_item_dict (
  id BIGSERIAL PRIMARY KEY,
  item_code VARCHAR(64) NOT NULL,
  item_name VARCHAR(128) NOT NULL,
  pinyin_initials VARCHAR(64) NOT NULL,
  type_code VARCHAR(32) NOT NULL,
  supports_part BOOLEAN NOT NULL DEFAULT TRUE,
  supports_enhanced BOOLEAN NOT NULL DEFAULT FALSE,
  status SMALLINT NOT NULL DEFAULT 1,
  sort_no INTEGER NOT NULL DEFAULT 0,
  create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uk_emr_exam_item_code UNIQUE (item_code),
  CONSTRAINT ck_emr_exam_item_status CHECK (status IN (0,1)),
  CONSTRAINT fk_emr_exam_item_type FOREIGN KEY (type_code) REFERENCES public.emr_exam_type_dict(type_code) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS public.emr_exam_item_part_map (
  id BIGSERIAL PRIMARY KEY,
  item_code VARCHAR(64) NOT NULL,
  part_code VARCHAR(64) NOT NULL,
  status SMALLINT NOT NULL DEFAULT 1,
  sort_no INTEGER NOT NULL DEFAULT 0,
  create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_emr_exam_item_part UNIQUE (item_code, part_code),
  CONSTRAINT fk_emr_exam_item_part_item FOREIGN KEY (item_code) REFERENCES public.emr_exam_item_dict(item_code) ON DELETE CASCADE,
  CONSTRAINT fk_emr_exam_item_part_part FOREIGN KEY (part_code) REFERENCES public.emr_exam_body_part_dict(part_code) ON DELETE RESTRICT,
  CONSTRAINT ck_emr_exam_item_part_status CHECK (status IN (0,1))
);

CREATE INDEX IF NOT EXISTS idx_emr_exam_item_name ON public.emr_exam_item_dict(item_name);
CREATE INDEX IF NOT EXISTS idx_emr_exam_item_py ON public.emr_exam_item_dict(pinyin_initials);
CREATE INDEX IF NOT EXISTS idx_emr_exam_item_type ON public.emr_exam_item_dict(type_code);

CREATE TABLE IF NOT EXISTS public.emr_lab_item_dict (
  id BIGSERIAL PRIMARY KEY,
  item_code VARCHAR(64) NOT NULL,
  item_name VARCHAR(128) NOT NULL,
  pinyin_initials VARCHAR(64) NOT NULL,
  specimen_type VARCHAR(64),
  unit VARCHAR(32),
  ref_range VARCHAR(128),
  status SMALLINT NOT NULL DEFAULT 1,
  sort_no INTEGER NOT NULL DEFAULT 0,
  create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uk_emr_lab_item_code UNIQUE (item_code),
  CONSTRAINT ck_emr_lab_item_status CHECK (status IN (0,1))
);

CREATE INDEX IF NOT EXISTS idx_emr_lab_item_name ON public.emr_lab_item_dict(item_name);
CREATE INDEX IF NOT EXISTS idx_emr_lab_item_py ON public.emr_lab_item_dict(pinyin_initials);

-- ----------------------------
-- 3) 医嘱明细结构升级
-- ----------------------------
ALTER TABLE public.medical_order_drug
  ADD COLUMN IF NOT EXISTS drug_master_id BIGINT,
  ADD COLUMN IF NOT EXISTS drug_spec_id BIGINT,
  ADD COLUMN IF NOT EXISTS dose_value NUMERIC(12,3),
  ADD COLUMN IF NOT EXISTS dose_unit_code VARCHAR(32),
  ADD COLUMN IF NOT EXISTS qty_value NUMERIC(12,3),
  ADD COLUMN IF NOT EXISTS qty_unit_code VARCHAR(32),
  ADD COLUMN IF NOT EXISTS frequency_code VARCHAR(64),
  ADD COLUMN IF NOT EXISTS route_code VARCHAR(64),
  ADD COLUMN IF NOT EXISTS duration_days INTEGER,
  ADD COLUMN IF NOT EXISTS drug_name_snapshot VARCHAR(256),
  ADD COLUMN IF NOT EXISTS spec_snapshot VARCHAR(256);

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_medical_order_drug_master') THEN
    ALTER TABLE public.medical_order_drug ADD CONSTRAINT fk_medical_order_drug_master FOREIGN KEY (drug_master_id) REFERENCES public.emr_drug_master(id);
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_medical_order_drug_spec') THEN
    ALTER TABLE public.medical_order_drug ADD CONSTRAINT fk_medical_order_drug_spec FOREIGN KEY (drug_spec_id) REFERENCES public.emr_drug_spec(id);
  END IF;
END $$;

ALTER TABLE public.medical_order_exam
  ADD COLUMN IF NOT EXISTS exam_item_id BIGINT,
  ADD COLUMN IF NOT EXISTS exam_type_code VARCHAR(32),
  ADD COLUMN IF NOT EXISTS supports_part BOOLEAN,
  ADD COLUMN IF NOT EXISTS supports_enhanced BOOLEAN,
  ADD COLUMN IF NOT EXISTS exam_item_snapshot VARCHAR(256);

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_medical_order_exam_item_id') THEN
    ALTER TABLE public.medical_order_exam ADD CONSTRAINT fk_medical_order_exam_item_id FOREIGN KEY (exam_item_id) REFERENCES public.emr_exam_item_dict(id);
  END IF;
END $$;

ALTER TABLE public.medical_order_lab
  ADD COLUMN IF NOT EXISTS lab_item_id BIGINT,
  ADD COLUMN IF NOT EXISTS code_system VARCHAR(32) DEFAULT 'LAB',
  ADD COLUMN IF NOT EXISTS lab_item_snapshot VARCHAR(256);

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'fk_medical_order_lab_item_id') THEN
    ALTER TABLE public.medical_order_lab ADD CONSTRAINT fk_medical_order_lab_item_id FOREIGN KEY (lab_item_id) REFERENCES public.emr_lab_item_dict(id);
  END IF;
END $$;

CREATE TABLE IF NOT EXISTS public.medical_order_exam_part (
  id BIGSERIAL PRIMARY KEY,
  order_exam_id BIGINT NOT NULL,
  part_code VARCHAR(64) NOT NULL,
  part_name VARCHAR(128) NOT NULL,
  sort_no INTEGER NOT NULL DEFAULT 0,
  create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_medical_order_exam_part UNIQUE (order_exam_id, part_code),
  CONSTRAINT fk_medical_order_exam_part_exam FOREIGN KEY (order_exam_id) REFERENCES public.medical_order_exam(id) ON DELETE CASCADE,
  CONSTRAINT fk_medical_order_exam_part_dict FOREIGN KEY (part_code) REFERENCES public.emr_exam_body_part_dict(part_code)
);

CREATE INDEX IF NOT EXISTS idx_medical_order_exam_part_exam ON public.medical_order_exam_part(order_exam_id);
CREATE INDEX IF NOT EXISTS idx_medical_order_exam_part_code ON public.medical_order_exam_part(part_code);

CREATE OR REPLACE FUNCTION public.fn_check_medical_order_exam_part_valid()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_item_code VARCHAR(64);
  v_supports_part BOOLEAN;
BEGIN
  SELECT exam_item_code INTO v_item_code
  FROM public.medical_order_exam
  WHERE id = NEW.order_exam_id;

  IF v_item_code IS NULL THEN
    RAISE EXCEPTION 'order_exam_id=% not found or missing exam_item_code', NEW.order_exam_id;
  END IF;

  SELECT supports_part INTO v_supports_part
  FROM public.emr_exam_item_dict
  WHERE item_code = v_item_code;

  IF COALESCE(v_supports_part, FALSE) = FALSE THEN
    RAISE EXCEPTION 'exam item % does not support body part selection', v_item_code;
  END IF;

  IF NOT EXISTS (
    SELECT 1
    FROM public.emr_exam_item_part_map m
    WHERE m.item_code = v_item_code
      AND m.part_code = NEW.part_code
      AND m.status = 1
  ) THEN
    RAISE EXCEPTION 'part % is not allowed for exam item %', NEW.part_code, v_item_code;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_medical_order_exam_part_valid ON public.medical_order_exam_part;
CREATE TRIGGER trg_medical_order_exam_part_valid
BEFORE INSERT OR UPDATE ON public.medical_order_exam_part
FOR EACH ROW
EXECUTE FUNCTION public.fn_check_medical_order_exam_part_valid();

CREATE OR REPLACE FUNCTION public.fn_check_medical_order_exam_item_valid()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_item RECORD;
BEGIN
  SELECT
    id,
    item_code,
    item_name,
    type_code,
    supports_part,
    supports_enhanced,
    status
  INTO v_item
  FROM public.emr_exam_item_dict
  WHERE item_code = NEW.exam_item_code;

  IF v_item.id IS NULL THEN
    RAISE EXCEPTION 'exam item % not found in emr_exam_item_dict', NEW.exam_item_code;
  END IF;

  IF COALESCE(v_item.status, 0) <> 1 THEN
    RAISE EXCEPTION 'exam item % is disabled', NEW.exam_item_code;
  END IF;

  IF COALESCE(NEW.is_enhanced, FALSE) = TRUE AND COALESCE(v_item.supports_enhanced, FALSE) = FALSE THEN
    RAISE EXCEPTION 'exam item % does not support enhanced mode', NEW.exam_item_code;
  END IF;

  IF COALESCE(v_item.supports_part, FALSE) = TRUE THEN
    IF NOT EXISTS (
      SELECT 1
      FROM public.emr_exam_item_part_map m
      WHERE m.item_code = NEW.exam_item_code
        AND m.status = 1
    ) THEN
      RAISE EXCEPTION 'exam item % has no active body-part mapping', NEW.exam_item_code;
    END IF;
  ELSE
    IF NEW.id IS NOT NULL AND EXISTS (
      SELECT 1
      FROM public.medical_order_exam_part p
      WHERE p.order_exam_id = NEW.id
    ) THEN
      RAISE EXCEPTION 'exam item % does not support body part but parts already exist', NEW.exam_item_code;
    END IF;
  END IF;

  NEW.exam_item_id := v_item.id;
  NEW.exam_type_code := v_item.type_code;
  NEW.supports_part := v_item.supports_part;
  NEW.supports_enhanced := v_item.supports_enhanced;
  NEW.exam_item_snapshot := v_item.item_name;
  NEW.exam_item_name := v_item.item_name;

  IF COALESCE(v_item.supports_part, FALSE) = FALSE THEN
    NEW.exam_part := NULL;
  END IF;

  RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_medical_order_exam_item_valid ON public.medical_order_exam;
CREATE TRIGGER trg_medical_order_exam_item_valid
BEFORE INSERT OR UPDATE ON public.medical_order_exam
FOR EACH ROW
EXECUTE FUNCTION public.fn_check_medical_order_exam_item_valid();

-- ----------------------------
-- 4) 初始化字典数据
-- ----------------------------
INSERT INTO public.emr_drug_unit_dict(unit_code, unit_name, unit_type, sort_no) VALUES
('PIAN','片','COUNT',1),('LI','粒','COUNT',2),('ZHI','支','COUNT',3),('PING','瓶','COUNT',4),('HE','盒','COUNT',5),('DAI','袋','COUNT',6),
('MG','mg','DOSE',11),('G','g','DOSE',12),('ML','ml','DOSE',13),('UG','ug','DOSE',14),('IU','IU','DOSE',15)
ON CONFLICT (unit_code) DO UPDATE SET unit_name = EXCLUDED.unit_name, unit_type = EXCLUDED.unit_type, sort_no = EXCLUDED.sort_no, update_time = CURRENT_TIMESTAMP;

INSERT INTO public.emr_drug_form_dict(form_code, form_name, sort_no) VALUES
('TAB','片剂',1),('CAP','胶囊',2),('INJ','注射液',3),('GRA','颗粒剂',4),('DRO','滴眼液',5),('SUS','混悬液',6),('POW','粉针',7),('AER','气雾剂',8)
ON CONFLICT (form_code) DO UPDATE SET form_name = EXCLUDED.form_name, sort_no = EXCLUDED.sort_no, update_time = CURRENT_TIMESTAMP;

WITH src AS (
  SELECT
    drug_name,
    pinyin_initials,
    MIN(drug_code) AS min_code,
    MAX(status) AS status
  FROM public.emr_drug_dictionary
  GROUP BY drug_name, pinyin_initials
), base AS (
  SELECT
    ROW_NUMBER() OVER (ORDER BY drug_name, min_code) AS rn,
    drug_name,
    pinyin_initials,
    status
  FROM src
)
INSERT INTO public.emr_drug_master(master_code, drug_name, pinyin_initials, status, sort_no)
SELECT 'DM' || LPAD(rn::TEXT, 5, '0'), drug_name, pinyin_initials, status, rn
FROM base
ON CONFLICT (drug_name) DO UPDATE SET
  pinyin_initials = EXCLUDED.pinyin_initials,
  status = EXCLUDED.status,
  sort_no = EXCLUDED.sort_no,
  update_time = CURRENT_TIMESTAMP;

-- 先清理由旧模板生成的规格（每药固定 5 条），再按新规则重建
DELETE FROM public.emr_drug_spec
WHERE spec_code ~ '^DM[0-9]{5}-S[0-9]{2}$';

WITH base AS (
  SELECT
    id,
    master_code,
    drug_name,
    ROW_NUMBER() OVER (ORDER BY sort_no, id) AS rn
  FROM public.emr_drug_master
), variant_seed AS (
  SELECT
    b.id,
    b.master_code,
    b.drug_name,
    v.n AS variant_no
  FROM base b
  JOIN generate_series(1, 5) AS v(n)
    ON v.n <= CASE WHEN b.rn <= 20 THEN 5 ELSE 4 END
)
INSERT INTO public.emr_drug_spec(
  spec_code, master_id, form_code, spec_name, pack_size,
  min_unit_code, pack_unit_code, dose_value, dose_unit_code,
  status, sort_no
)
SELECT
  s.master_code || '-S' || LPAD(s.variant_no::TEXT, 2, '0') AS spec_code,
  s.id AS master_id,
  CASE s.variant_no
    WHEN 1 THEN 'TAB'
    WHEN 2 THEN 'TAB'
    WHEN 3 THEN 'CAP'
    WHEN 4 THEN 'SUS'
    ELSE 'INJ'
  END AS form_code,
  s.drug_name || CASE s.variant_no
    WHEN 1 THEN ' 片剂 5mg*5片/盒'
    WHEN 2 THEN ' 片剂 10mg*10片/盒'
    WHEN 3 THEN ' 胶囊 25mg*12粒/盒'
    WHEN 4 THEN ' 瓶装 1mg/ml*100ml/瓶'
    ELSE ' 注射液 2mg/ml*2ml/支'
  END AS spec_name,
  CASE s.variant_no
    WHEN 1 THEN 5
    WHEN 2 THEN 10
    WHEN 3 THEN 12
    WHEN 4 THEN 100
    ELSE 2
  END AS pack_size,
  CASE s.variant_no
    WHEN 1 THEN 'PIAN'
    WHEN 2 THEN 'PIAN'
    WHEN 3 THEN 'LI'
    ELSE 'ML'
  END AS min_unit_code,
  CASE s.variant_no
    WHEN 1 THEN 'HE'
    WHEN 2 THEN 'HE'
    WHEN 3 THEN 'HE'
    WHEN 4 THEN 'PING'
    ELSE 'ZHI'
  END AS pack_unit_code,
  CASE s.variant_no
    WHEN 1 THEN 5
    WHEN 2 THEN 10
    WHEN 3 THEN 25
    WHEN 4 THEN 1
    ELSE 2
  END AS dose_value,
  'MG' AS dose_unit_code,
  1 AS status,
  s.variant_no AS sort_no
FROM variant_seed s
ON CONFLICT (spec_code) DO UPDATE SET
  form_code = EXCLUDED.form_code,
  spec_name = EXCLUDED.spec_name,
  pack_size = EXCLUDED.pack_size,
  min_unit_code = EXCLUDED.min_unit_code,
  pack_unit_code = EXCLUDED.pack_unit_code,
  dose_value = EXCLUDED.dose_value,
  dose_unit_code = EXCLUDED.dose_unit_code,
  status = EXCLUDED.status,
  sort_no = EXCLUDED.sort_no,
  update_time = CURRENT_TIMESTAMP;

-- 检查项目与检查部位使用国家标准编码重建
-- 来源：WS 538—2017《医学数字影像通信基本数据集》
-- 1) 表4 CV04.30.003 模态（检查类型）代码
-- 2) 表6 CV04.30.005 检查部位代码（说明列为 DICOM 编码）
DELETE FROM public.emr_exam_item_part_map;
DELETE FROM public.emr_exam_item_dict;
DELETE FROM public.emr_exam_body_part_dict;

INSERT INTO public.emr_exam_type_dict(type_code, type_name, sort_no) VALUES
('CT','计算机断层摄影术',1),
('MR','磁共振',2),
('PT','正电子发射断层成像',3),
('US','超声波',4),
('XA','X线心血管造影',5),
('DX','数字放射影像（DR）',6),
('ECG','心电图',7)
ON CONFLICT (type_code) DO UPDATE SET
  type_name = EXCLUDED.type_name,
  status = 1,
  sort_no = EXCLUDED.sort_no,
  update_time = CURRENT_TIMESTAMP;

DELETE FROM public.emr_exam_type_dict
WHERE type_code NOT IN ('CT','MR','PT','US','XA','DX','ECG');

INSERT INTO public.emr_exam_body_part_dict(part_code, part_name, pinyin_initials, status, sort_no) VALUES
('SKULL','头部','TB',1,1),
('CSPINE','颈椎','JZ',1,2),
('TSPINE','胸椎','XZ',1,3),
('LSPINE','腰椎','YZ',1,4),
('SSPINE','骶椎','DZ',1,5),
('COCCYX','尾椎','WZ',1,6),
('CHEST','胸部','XB',1,7),
('CLAVICLE','锁骨','SG',1,8),
('BREAST','乳房','RF',1,9),
('ABDOMEN','腹部','FB',1,10),
('PELVIS','骨盆','GP',1,11),
('HIP','髋','K',1,12),
('SHOULDER','肩部','JB',1,13),
('ELBOW','肘','Z',1,14),
('KNEE','膝','X',1,15),
('ANKLE','脚踝','JH',1,16),
('HAND','手','S',1,17),
('FOOT','足','Z',1,18),
('EXTREMITY','下肢','XZ',1,19),
('HEAD','头','T',1,20),
('HEART','心脏','XZ',1,21),
('NECK','颈部','JB',1,22),
('LEG','腿','T',1,23),
('ARM','胳臂','GB',1,24),
('JAW','颌','H',1,25),
('KIDNEY','肾脏','SZ',1,26),
('ADRENAL','肾上腺','SSX',1,27),
('SELLA','垂体','CT',1,28),
('NASOPHARYNX','鼻咽部','BYB',1,29),
('ORBITS','眼眶','YK',1,30),
('INNER_EAR','内听道','NTD',1,31),
('MASTOID','乳突','RT',1,32),
('SINUS','鼻窦','BD',1,33),
('PAROTID','腮腺','SX',1,34),
('LARYNX','喉','H',1,35),
('HYPOTHYROID','甲状腺','JZX',1,36)
ON CONFLICT (part_code) DO UPDATE SET
  part_name = EXCLUDED.part_name,
  pinyin_initials = EXCLUDED.pinyin_initials,
  status = EXCLUDED.status,
  sort_no = EXCLUDED.sort_no,
  update_time = CURRENT_TIMESTAMP;

INSERT INTO public.emr_exam_item_dict(item_code, item_name, pinyin_initials, type_code, supports_part, supports_enhanced, status, sort_no) VALUES
('CT','CT','CT','CT',TRUE,TRUE,1,1),
('MR','MR','MR','MR',TRUE,TRUE,1,2),
('PT','PET-CT','PETCT','PT',TRUE,FALSE,1,3),
('US','超声','CS','US',TRUE,FALSE,1,4),
('XA','造影','ZY','XA',TRUE,FALSE,1,5),
('DX','X线（DR）','XDDR','DX',TRUE,FALSE,1,6),
('CV04.30.007','心电图','XDT','ECG',FALSE,FALSE,1,7)
ON CONFLICT (item_code) DO UPDATE SET
  item_name = EXCLUDED.item_name,
  pinyin_initials = EXCLUDED.pinyin_initials,
  type_code = EXCLUDED.type_code,
  supports_part = EXCLUDED.supports_part,
  supports_enhanced = EXCLUDED.supports_enhanced,
  status = EXCLUDED.status,
  sort_no = EXCLUDED.sort_no,
  update_time = CURRENT_TIMESTAMP;

INSERT INTO public.emr_exam_item_part_map(item_code, part_code, sort_no)
SELECT
  x.item_code,
  x.part_code,
  ROW_NUMBER() OVER (PARTITION BY x.item_code ORDER BY x.base_sort_no, x.part_code) AS sort_no
FROM (
  SELECT 'CT'::VARCHAR(64) AS item_code, p.part_code, p.sort_no AS base_sort_no
  FROM public.emr_exam_body_part_dict p
  UNION ALL
  SELECT 'MR', p.part_code, p.sort_no
  FROM public.emr_exam_body_part_dict p
  UNION ALL
  SELECT 'DX', p.part_code, p.sort_no
  FROM public.emr_exam_body_part_dict p
  UNION ALL
  SELECT 'US', p.part_code, p.sort_no
  FROM public.emr_exam_body_part_dict p
  WHERE p.part_code IN ('NECK','CHEST','BREAST','ABDOMEN','PELVIS','HEART','KIDNEY','HYPOTHYROID')
  UNION ALL
  SELECT 'XA', p.part_code, p.sort_no
  FROM public.emr_exam_body_part_dict p
  WHERE p.part_code IN ('HEAD','NECK','CHEST','ABDOMEN','PELVIS','HEART','ARM','LEG')
  UNION ALL
  SELECT 'PT', p.part_code, p.sort_no
  FROM public.emr_exam_body_part_dict p
  WHERE p.part_code IN ('HEAD','NECK','CHEST','ABDOMEN','PELVIS','HEART')
) x
ON CONFLICT (item_code, part_code) DO UPDATE SET
  status = 1,
  sort_no = EXCLUDED.sort_no,
  update_time = CURRENT_TIMESTAMP;

INSERT INTO public.emr_lab_item_dict(item_code, item_name, pinyin_initials, specimen_type, unit, ref_range, sort_no) VALUES
('LOINC_718-7','血红蛋白','XHDB','全血','g/L','130-175',1),
('LOINC_789-8','红细胞计数','HXBJS','全血','10^12/L','4.3-5.8',2),
('LOINC_6690-2','白细胞计数','BXBJS','全血','10^9/L','3.5-9.5',3),
('LOINC_777-3','血小板计数','XXBJS','全血','10^9/L','125-350',4),
('LOINC_4548-4','糖化血红蛋白','THXHDB','全血','%','4.0-6.0',5),
('LOINC_2339-0','葡萄糖','PTT','血清','mmol/L','3.9-6.1',6),
('LOINC_2345-7','血糖(血清)','XT','血清','mg/dL','70-110',7),
('LOINC_2160-0','肌酐','JG','血清','umol/L','57-111',8),
('LOINC_3094-0','尿素氮','NSD','血清','mmol/L','2.9-8.2',9),
('LOINC_2823-3','钾','J','血清','mmol/L','3.5-5.3',10),
('LOINC_2951-2','钠','N','血清','mmol/L','137-147',11),
('LOINC_2075-0','氯','L','血清','mmol/L','99-110',12),
('LOINC_17861-6','钙','G','血清','mmol/L','2.1-2.6',13),
('LOINC_14804-9','镁','MEI','血清','mmol/L','0.75-1.02',14),
('LOINC_1742-6','丙氨酸氨基转移酶','BASAJZMY','血清','U/L','9-50',15),
('LOINC_1920-8','天门冬氨酸氨基转移酶','TMDASAJZMY','血清','U/L','15-40',16),
('LOINC_6768-6','碱性磷酸酶','JXLSM','血清','U/L','45-125',17),
('LOINC_1975-2','总胆红素','ZDHS','血清','umol/L','5-21',18),
('LOINC_2885-2','总蛋白','ZDB','血清','g/L','65-85',19),
('LOINC_1751-7','白蛋白','BDB','血清','g/L','40-55',20),
('LOINC_14957-5','甘油三酯','GYSZ','血清','mmol/L','0.3-1.7',21),
('LOINC_2093-3','总胆固醇','ZDGC','血清','mmol/L','2.8-5.2',22),
('LOINC_2089-1','高密度脂蛋白胆固醇','GMDZDBDGC','血清','mmol/L','>1.0',23),
('LOINC_13457-7','低密度脂蛋白胆固醇','DMDZDBDGC','血清','mmol/L','<3.4',24),
('LOINC_1988-5','C反应蛋白','CFYDB','血清','mg/L','0-10',25),
('LOINC_34714-6','降钙素原','JGYY','血清','ng/mL','0-0.05',26),
('LOINC_3173-2','活化部分凝血活酶时间','HHBFNXHMSJ','血浆','s','25-35',27),
('LOINC_5902-2','凝血酶原时间','NXMYSJ','血浆','s','11-14',28),
('LOINC_6301-6','国际标准化比值','GJBZHBZ','血浆','INR','0.8-1.2',29),
('LOINC_14749-6','D-二聚体','DEJT','血浆','mg/L','0-0.5',30)
ON CONFLICT (item_code) DO UPDATE SET
  item_name = EXCLUDED.item_name,
  pinyin_initials = EXCLUDED.pinyin_initials,
  specimen_type = EXCLUDED.specimen_type,
  unit = EXCLUDED.unit,
  ref_range = EXCLUDED.ref_range,
  sort_no = EXCLUDED.sort_no,
  update_time = CURRENT_TIMESTAMP;

-- ----------------------------
-- 5) 兼容视图
-- ----------------------------
CREATE OR REPLACE VIEW public.v_medical_order_drug_compat AS
SELECT
  d.id,
  d.order_code,
  COALESCE(d.drug_name_snapshot, m.drug_name, d.drug_name) AS drug_name,
  d.drug_code,
  d.dose_value,
  d.dose_unit_code,
  d.qty_value,
  d.qty_unit_code,
  d.frequency_code,
  d.route_code,
  d.duration_days,
  d.create_time,
  d.update_time
FROM public.medical_order_drug d
LEFT JOIN public.emr_drug_master m ON m.id = d.drug_master_id;

-- ----------------------------
-- 6) APIJSON Access 配置
-- ----------------------------
DO $$
DECLARE
  access_configs TEXT[][] := ARRAY[
    ARRAY['emr_drug_unit_dict','DrugUnitDict','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["ADMIN"]','["ADMIN"]','["ADMIN"]'],
    ARRAY['emr_drug_form_dict','DrugFormDict','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["ADMIN"]','["ADMIN"]','["ADMIN"]'],
    ARRAY['emr_drug_master','DrugMaster','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["ADMIN"]','["ADMIN"]','["ADMIN"]'],
    ARRAY['emr_drug_spec','DrugSpec','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["ADMIN"]','["ADMIN"]','["ADMIN"]'],
    ARRAY['emr_exam_type_dict','ExamTypeDict','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["ADMIN"]','["ADMIN"]','["ADMIN"]'],
    ARRAY['emr_exam_body_part_dict','ExamBodyPartDict','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["ADMIN"]','["ADMIN"]','["ADMIN"]'],
    ARRAY['emr_exam_item_dict','ExamItemDict','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["ADMIN"]','["ADMIN"]','["ADMIN"]'],
    ARRAY['emr_exam_item_part_map','ExamItemPartMap','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["ADMIN"]','["ADMIN"]','["ADMIN"]'],
    ARRAY['emr_lab_item_dict','LabItemDict','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["UNKNOWN","LOGIN","ADMIN"]','["ADMIN"]','["ADMIN"]','["ADMIN"]'],
    ARRAY['medical_order_exam_part','MedicalOrderExamPart','["LOGIN","ADMIN"]','["LOGIN","ADMIN"]','["LOGIN","ADMIN"]','["LOGIN","ADMIN"]','["LOGIN","ADMIN"]','["LOGIN","ADMIN"]','["ADMIN"]']
  ];
  config TEXT[];
BEGIN
  FOREACH config SLICE 1 IN ARRAY access_configs
  LOOP
    INSERT INTO "Access" (name, alias, get, head, gets, heads, post, put, delete)
    VALUES (config[1], config[2], config[3], config[4], config[5], config[6], config[7], config[8], config[9])
    ON CONFLICT (name) DO UPDATE SET
      alias = EXCLUDED.alias,
      get = EXCLUDED.get,
      head = EXCLUDED.head,
      gets = EXCLUDED.gets,
      heads = EXCLUDED.heads,
      post = EXCLUDED.post,
      put = EXCLUDED.put,
      delete = EXCLUDED.delete;
  END LOOP;
END $$;

-- ----------------------------
-- 7) APIJSON Request 配置
-- ----------------------------
DELETE FROM "Request"
WHERE tag IN ('DrugMaster','DrugSpec','ExamItemDict','ExamItemPartMap','LabItemDict')
  AND version = 1
  AND method IN ('GET','GETS','POST','PUT','DELETE');

INSERT INTO "Request" (version, method, tag, structure, detail) VALUES
(1,'GETS','DrugMaster','{"MUST":"[]","[]":{"MUST":"DrugMaster","DrugMaster":{"drug_name$":"","pinyin_initials$":"","status{}":[0,1],"@order":"sort_no+,id+"},"count":0,"page":0,"query":2}}','DrugMaster 列表查询'),
(1,'POST','DrugMaster','{"MUST":"master_code,drug_name,pinyin_initials"}','DrugMaster 新增'),
(1,'PUT','DrugMaster','{"MUST":"id"}','DrugMaster 修改'),
(1,'DELETE','DrugMaster','{"MUST":"id"}','DrugMaster 删除'),

(1,'GETS','DrugSpec','{"MUST":"[]","[]":{"MUST":"DrugSpec","DrugSpec":{"master_id":0,"status{}":[0,1],"@order":"sort_no+,id+"},"count":0,"page":0,"query":2}}','DrugSpec 列表查询'),
(1,'POST','DrugSpec','{"MUST":"spec_code,master_id,form_code,spec_name,min_unit_code,pack_unit_code"}','DrugSpec 新增'),
(1,'PUT','DrugSpec','{"MUST":"id"}','DrugSpec 修改'),
(1,'DELETE','DrugSpec','{"MUST":"id"}','DrugSpec 删除'),

(1,'GETS','ExamItemDict','{"MUST":"[]","[]":{"MUST":"ExamItemDict","ExamItemDict":{"item_name$":"","pinyin_initials$":"","type_code":"","status{}":[0,1],"@order":"sort_no+,id+"},"count":0,"page":0,"query":2}}','ExamItemDict 列表查询'),
(1,'POST','ExamItemDict','{"MUST":"item_code,item_name,pinyin_initials,type_code"}','ExamItemDict 新增'),
(1,'PUT','ExamItemDict','{"MUST":"id"}','ExamItemDict 修改'),
(1,'DELETE','ExamItemDict','{"MUST":"id"}','ExamItemDict 删除'),

(1,'GETS','ExamItemPartMap','{"MUST":"[]","[]":{"MUST":"ExamItemPartMap","ExamItemPartMap":{"item_code":"","status{}":[0,1],"@order":"sort_no+,id+"},"count":0,"page":0,"query":2}}','ExamItemPartMap 列表查询'),
(1,'POST','ExamItemPartMap','{"MUST":"item_code,part_code"}','ExamItemPartMap 新增'),
(1,'PUT','ExamItemPartMap','{"MUST":"id"}','ExamItemPartMap 修改'),
(1,'DELETE','ExamItemPartMap','{"MUST":"id"}','ExamItemPartMap 删除'),

(1,'GETS','LabItemDict','{"MUST":"[]","[]":{"MUST":"LabItemDict","LabItemDict":{"item_name$":"","pinyin_initials$":"","status{}":[0,1],"@order":"sort_no+,id+"},"count":0,"page":0,"query":2}}','LabItemDict 列表查询'),
(1,'POST','LabItemDict','{"MUST":"item_code,item_name,pinyin_initials"}','LabItemDict 新增'),
(1,'PUT','LabItemDict','{"MUST":"id"}','LabItemDict 修改'),
(1,'DELETE','LabItemDict','{"MUST":"id"}','LabItemDict 删除');

COMMIT;

-- ----------------------------
-- 8) 验收查询
-- ----------------------------
SELECT 'emr_drug_master' AS table_name, COUNT(*) AS cnt FROM public.emr_drug_master
UNION ALL SELECT 'emr_drug_spec', COUNT(*) FROM public.emr_drug_spec
UNION ALL SELECT 'emr_exam_item_dict', COUNT(*) FROM public.emr_exam_item_dict
UNION ALL SELECT 'emr_exam_item_part_map', COUNT(*) FROM public.emr_exam_item_part_map
UNION ALL SELECT 'emr_lab_item_dict', COUNT(*) FROM public.emr_lab_item_dict;
