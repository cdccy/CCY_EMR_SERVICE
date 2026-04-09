-- 药品主数据字典初始化脚本
-- 说明：
-- 1) 创建药品字典表 emr_drug_dictionary（参照 ICD10 字典结构）
-- 2) 补齐 APIJSON Access 与 Request 配置
-- 3) 初始化真实药品通用名数据（基于国家基本药物目录常用条目，药品编码采用 ATC 标准编码）

CREATE TABLE IF NOT EXISTS public.emr_drug_dictionary (
    id BIGSERIAL PRIMARY KEY,
    drug_code VARCHAR(64) NOT NULL,
    drug_name VARCHAR(256) NOT NULL,
    pinyin_initials VARCHAR(64) NOT NULL,
    dosage_form VARCHAR(64),
    specification VARCHAR(128),
    status SMALLINT NOT NULL DEFAULT 1,
    sort_no INTEGER NOT NULL DEFAULT 0,
    create_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    update_time TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_emr_drug_dictionary_code UNIQUE (drug_code),
    CONSTRAINT ck_emr_drug_dictionary_status CHECK (status IN (0, 1))
);

COMMENT ON TABLE public.emr_drug_dictionary IS '药品主数据字典表';
COMMENT ON COLUMN public.emr_drug_dictionary.drug_code IS '药品编码（ATC标准编码）';
COMMENT ON COLUMN public.emr_drug_dictionary.drug_name IS '药品通用名';
COMMENT ON COLUMN public.emr_drug_dictionary.pinyin_initials IS '拼音首字母';
COMMENT ON COLUMN public.emr_drug_dictionary.dosage_form IS '剂型';
COMMENT ON COLUMN public.emr_drug_dictionary.specification IS '规格';
COMMENT ON COLUMN public.emr_drug_dictionary.status IS '状态（1启用，0停用）';
COMMENT ON COLUMN public.emr_drug_dictionary.sort_no IS '排序号';

CREATE INDEX IF NOT EXISTS idx_emr_drug_dictionary_name ON public.emr_drug_dictionary (drug_name);
CREATE INDEX IF NOT EXISTS idx_emr_drug_dictionary_pinyin ON public.emr_drug_dictionary (pinyin_initials);
CREATE INDEX IF NOT EXISTS idx_emr_drug_dictionary_status ON public.emr_drug_dictionary (status);

-- APIJSON Access
INSERT INTO "Access" (name, alias, get, head, gets, heads, post, put, delete)
VALUES (
    'emr_drug_dictionary',
    'DrugDictionary',
    '["UNKNOWN","LOGIN","ADMIN"]',
    '["UNKNOWN","LOGIN","ADMIN"]',
    '["UNKNOWN","LOGIN","ADMIN"]',
    '["UNKNOWN","LOGIN","ADMIN"]',
    '["ADMIN"]',
    '["ADMIN"]',
    '["ADMIN"]'
)
ON CONFLICT (name) DO UPDATE SET
    alias = EXCLUDED.alias,
    get = EXCLUDED.get,
    head = EXCLUDED.head,
    gets = EXCLUDED.gets,
    heads = EXCLUDED.heads,
    post = EXCLUDED.post,
    put = EXCLUDED.put,
    delete = EXCLUDED.delete;

-- APIJSON Request
DELETE FROM "Request"
WHERE tag = 'DrugDictionary'
  AND version = 1
  AND method IN ('GET', 'GETS', 'POST', 'PUT', 'DELETE');

INSERT INTO "Request" (version, method, tag, structure, detail)
VALUES
(
    1,
    'GET',
    'DrugDictionary',
    '{"REMOVE":"[]","DrugDictionary":{"@column":"id,drug_code,drug_name,pinyin_initials,dosage_form,specification,status,sort_no,create_time,update_time","id{}":[],"drug_code$":"","drug_name$":"","pinyin_initials$":"","status{}":[0,1]}}',
    'DrugDictionary 单条查询校验'
),
(
    1,
    'GETS',
    'DrugDictionary',
    '{"MUST":"[]","[]":{"MUST":"DrugDictionary","DrugDictionary":{"@column":"id,drug_code,drug_name,pinyin_initials,dosage_form,specification,status,sort_no,create_time,update_time","drug_code$":"","drug_name$":"","pinyin_initials$":"","status{}":[0,1],"@order":"sort_no+,id+"},"count":0,"page":0,"query":2}}',
    'DrugDictionary 列表查询校验'
),
(
    1,
    'POST',
    'DrugDictionary',
    '{"MUST":"drug_code,drug_name,pinyin_initials","REFUSE":"id","drug_code":"^[A-Z0-9\\.\\-]{2,64}$","drug_name":"^.{1,256}$","pinyin_initials":"^[A-Z]{1,64}$","status{0,1}":1}',
    'DrugDictionary 新增校验'
),
(
    1,
    'PUT',
    'DrugDictionary',
    '{"MUST":"id","REFUSE":"create_time","drug_code":"^[A-Z0-9\\.\\-]{2,64}$","drug_name":"^.{1,256}$","pinyin_initials":"^[A-Z]{1,64}$","status{0,1}":1}',
    'DrugDictionary 修改校验'
),
(
    1,
    'DELETE',
    'DrugDictionary',
    '{"MUST":"id"}',
    'DrugDictionary 删除校验'
);

INSERT INTO public.emr_drug_dictionary (drug_code, drug_name, pinyin_initials, dosage_form, specification, status, sort_no) VALUES
('A02BC01', '奥美拉唑', 'AMLZ', '肠溶胶囊', '20mg*14粒', 1, 1),
('A02BC05', '埃索美拉唑', 'ASMLZ', '肠溶片', '20mg*7片', 1, 2),
('A02BA02', '雷尼替丁', 'LNTD', '胶囊', '0.15g*30粒', 1, 3),
('A03FA01', '甲氧氯普胺', 'JYLPAT', '片剂', '5mg*100片', 1, 4),
('A07AA02', '制霉菌素', 'ZMJS', '片剂', '50万IU*100片', 1, 5),
('A07EC02', '美沙拉嗪', 'MSLQ', '肠溶片', '0.25g*24片', 1, 6),
('A10BA02', '二甲双胍', 'EJSG', '片剂', '0.5g*60片', 1, 7),
('A10BB12', '格列美脲', 'GLMN', '片剂', '2mg*30片', 1, 8),
('A10AB01', '门冬胰岛素', 'MDYDS', '注射液', '3ml:300IU*1支', 1, 9),
('A10AE04', '甘精胰岛素', 'GJYDS', '注射液', '3ml:300IU*1支', 1, 10),
('B01AA03', '华法林', 'HFL', '片剂', '3mg*100片', 1, 11),
('B01AC06', '阿司匹林', 'ASPL', '肠溶片', '100mg*30片', 1, 12),
('B01AC04', '氯吡格雷', 'LBGL', '片剂', '75mg*7片', 1, 13),
('B01AF01', '利伐沙班', 'LFSB', '片剂', '10mg*10片', 1, 14),
('B02BA01', '维生素K1', 'WSSK1', '注射液', '1ml:10mg*10支', 1, 15),
('C01AA05', '地高辛', 'DGX', '片剂', '0.25mg*30片', 1, 16),
('C01BD01', '胺碘酮', 'ADT', '片剂', '0.2g*10片', 1, 17),
('C02AC01', '可乐定', 'KLD', '片剂', '75ug*100片', 1, 18),
('C03CA01', '呋塞米', 'FSM', '片剂', '20mg*100片', 1, 19),
('C03AA03', '氢氯噻嗪', 'QLSQ', '片剂', '25mg*100片', 1, 20),
('C07AB02', '美托洛尔', 'MTLE', '片剂', '25mg*20片', 1, 21),
('C07AG02', '卡维地洛', 'KWDL', '片剂', '12.5mg*24片', 1, 22),
('C08CA01', '氨氯地平', 'ALDP', '片剂', '5mg*28片', 1, 23),
('C09AA02', '依那普利', 'YNPL', '片剂', '10mg*14片', 1, 24),
('C09CA01', '氯沙坦', 'LST', '片剂', '50mg*14片', 1, 25),
('C10AA05', '阿托伐他汀', 'ATFTT', '片剂', '20mg*7片', 1, 26),
('C10AA01', '辛伐他汀', 'XFTT', '片剂', '20mg*7片', 1, 27),
('D07AC01', '倍他米松', 'BTMS', '乳膏', '15g:15mg', 1, 28),
('D10AE01', '过氧苯甲酰', 'GYBJX', '凝胶', '15g:0.75g', 1, 29),
('G03CA03', '雌二醇', 'CEC', '片剂', '1mg*21片', 1, 30),
('G04CA02', '坦索罗辛', 'TSLX', '缓释胶囊', '0.2mg*14粒', 1, 31),
('H02AB06', '泼尼松', 'PBS', '片剂', '5mg*100片', 1, 32),
('H02AB07', '泼尼松龙', 'PBSL', '片剂', '5mg*100片', 1, 33),
('J01CA04', '阿莫西林', 'AMXL', '胶囊', '0.25g*24粒', 1, 34),
('J01CR02', '阿莫西林克拉维酸钾', 'AMXLKLWSJ', '片剂', '0.375g*12片', 1, 35),
('J01DB01', '头孢氨苄', 'TBAA', '胶囊', '0.25g*24粒', 1, 36),
('J01DD04', '头孢曲松', 'TBQS', '注射粉针', '1g*1瓶', 1, 37),
('J01DH02', '美罗培南', 'MLPN', '注射粉针', '0.5g*1瓶', 1, 38),
('J01FA10', '阿奇霉素', 'AQMS', '片剂', '0.25g*6片', 1, 39),
('J01MA02', '环丙沙星', 'HBSX', '片剂', '0.25g*12片', 1, 40),
('J01XD01', '甲硝唑', 'JXZ', '片剂', '0.2g*100片', 1, 41),
('J02AC01', '氟康唑', 'FKZ', '胶囊', '50mg*7粒', 1, 42),
('J04AC01', '异烟肼', 'YYJ', '片剂', '0.1g*100片', 1, 43),
('J04AK01', '利福平', 'LFP', '胶囊', '0.15g*100粒', 1, 44),
('J04AM02', '异烟肼利福平', 'YYJLFP', '胶囊', '0.15g/0.3g*60粒', 1, 45),
('L01BC06', '卡培他滨', 'KPTB', '片剂', '0.5g*12片', 1, 46),
('L04AA06', '硫唑嘌呤', 'LZPL', '片剂', '50mg*100片', 1, 47),
('M01AE01', '布洛芬', 'BLF', '片剂', '0.3g*20片', 1, 48),
('M01AH01', '塞来昔布', 'SLXB', '胶囊', '0.2g*6粒', 1, 49),
('M05BA04', '阿仑膦酸钠', 'ALLSN', '片剂', '70mg*1片', 1, 50),
('N02AA05', '羟考酮', 'QKT', '缓释片', '10mg*10片', 1, 51),
('N02BE01', '对乙酰氨基酚', 'DYXAJF', '片剂', '0.5g*24片', 1, 52),
('N03AX09', '拉莫三嗪', 'LMSQ', '片剂', '50mg*30片', 1, 53),
('N05BA01', '地西泮', 'DXP', '片剂', '2.5mg*100片', 1, 54),
('N06AB03', '氟西汀', 'FXT', '胶囊', '20mg*14粒', 1, 55),
('R03AC02', '沙丁胺醇', 'SDAC', '吸入气雾剂', '100ug*200揿', 1, 56),
('R03BA02', '布地奈德', 'BDND', '吸入混悬液', '2ml:1mg*10支', 1, 57),
('R03AK06', '沙美特罗替卡松', 'SMTLTKS', '吸入粉雾剂', '50ug/250ug*60吸', 1, 58),
('R06AE07', '西替利嗪', 'XTLQ', '片剂', '10mg*12片', 1, 59),
('S01AA01', '氯霉素', 'LMS', '滴眼液', '8ml:20mg', 1, 60),
('S01ED01', '噻吗洛尔', 'SMLE', '滴眼液', '5ml:25mg', 1, 61),
('V03AB15', '纳洛酮', 'NLT', '注射液', '1ml:0.4mg*5支', 1, 62),
('V04CC02', '葡萄糖', 'PTT', '注射液', '500ml:25g', 1, 63),
('A11CC05', '骨化三醇', 'GHSC', '软胶囊', '0.25ug*10粒', 1, 64),
('B03AA07', '硫酸亚铁', 'LSYT', '片剂', '0.3g*60片', 1, 65),
('B03BA01', '氰钴胺', 'QGA', '注射液', '1ml:0.5mg*10支', 1, 66),
('N07XX02', '利鲁唑', 'LRZ', '片剂', '50mg*56片', 1, 67),
('C01EB17', '伊伐布雷定', 'YFBLD', '片剂', '5mg*14片', 1, 68),
('A10BJ06', '利拉鲁肽', 'LLLT', '注射液', '3ml:18mg*1支', 1, 69),
('R03DC03', '孟鲁司特', 'MLST', '片剂', '10mg*5片', 1, 70)
ON CONFLICT (drug_code) DO UPDATE SET
    drug_name = EXCLUDED.drug_name,
    pinyin_initials = EXCLUDED.pinyin_initials,
    dosage_form = EXCLUDED.dosage_form,
    specification = EXCLUDED.specification,
    status = EXCLUDED.status,
    sort_no = EXCLUDED.sort_no,
    update_time = CURRENT_TIMESTAMP;

