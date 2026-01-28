-- 电子病历标准化字典数据导入
-- 生成日期: 2026-01-28 10:57:33
BEGIN;

-- 字典: 医疗保险类别代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV02.01.204', '医疗保险类别代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV02.01.204', '1', '城镇职工基本医疗保险', 1),
('CV02.01.204', '2', '城镇居民基本医疗保险', 2),
('CV02.01.204', '3', '新型农村合作医疗', 3),
('CV02.01.204', '4', '公务员医疗补助', 4),
('CV02.01.204', '5', '企业补充医疗保险', 5),
('CV02.01.204', '6', '大额补充医疗保险', 6),
('CV02.01.204', '7', '商业医疗保险', 7),
('CV02.01.204', '99', '其他', 99)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 地址类别代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV02.01.205', '地址类别代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV02.01.205', '1', '户籍住址', 1),
('CV02.01.205', '2', '工作场所地址', 2),
('CV02.01.205', '3', '家庭常住住址', 3),
('CV02.01.205', '4', '通讯地址', 4),
('CV02.01.205', '5', '暂住地址', 5),
('CV02.01.205', '6', '出生地址', 6),
('CV02.01.205', '7', '产后修养地址', 7),
('CV02.01.205', '8', '变迁地址', 8),
('CV02.01.205', '9', '现住址', 9),
('CV02.01.205', '99', '其他地址', 99)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: Rh(D)血型代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV04.50.020', 'Rh(D)血型代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV04.50.020', '1', '阴性', 1),
('CV04.50.020', '2', '阳性', 2),
('CV04.50.020', '3', '不详', 3),
('CV04.50.020', '4', '未查', 4)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 输血品种代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV04.50.021', '输血品种代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV04.50.021', '1', '红细胞', 1),
('CV04.50.021', '2', '全血', 2),
('CV04.50.021', '3', '血小板', 3),
('CV04.50.021', '4', '血浆', 4),
('CV04.50.021', '5', '冷沉淀', 5),
('CV04.50.021', '6', '机采浓缩白细胞悬液', 6),
('CV04.50.021', '9', '其他', 9),
('CV04.50.021', '11', '浓缩红细胞', 11),
('CV04.50.021', '12', '滤白红细胞', 12),
('CV04.50.021', '13', '红细胞悬液', 13),
('CV04.50.021', '14', '洗涤红细胞', 14),
('CV04.50.021', '15', '冰冻红细胞', 15),
('CV04.50.021', '16', '冰冻解冻去甘油红细胞', 16),
('CV04.50.021', '17', 'Rh阴性悬浮红细胞', 17),
('CV04.50.021', '21', '滤白全血', 21),
('CV04.50.021', '22', '重组全血', 22),
('CV04.50.021', '23', 'Rh阴性全血', 23),
('CV04.50.021', '31', '手工分离浓缩血小板', 31),
('CV04.50.021', '32', '机采血小板', 32),
('CV04.50.021', '33', '滤白机采血小板', 33),
('CV04.50.021', '34', '冷冻机采血小板', 34),
('CV04.50.021', '41', '新鲜液体血浆', 41),
('CV04.50.021', '42', '新鲜冰冻血浆', 42),
('CV04.50.021', '43', '普通冰冻血浆', 43),
('CV04.50.021', '44', '滤白病毒灭活冰冻血浆', 44),
('CV04.50.021', '45', '滤白新鲜冰冻血浆', 45),
('CV04.50.021', '46', '滤白普通冰冻血浆', 46),
('CV04.50.021', '51', '滤白冷沉淀', 51)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 输血反应类型代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV05.01.040', '输血反应类型代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV05.01.040', '1', '发热', 1),
('CV05.01.040', '2', '过敏', 2),
('CV05.01.040', '3', '溶血', 3),
('CV05.01.040', '9', '其他', 9)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 美国麻醉医师协会（ASA)分级标准代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV05.10.021', '美国麻醉医师协会（ASA)分级标准代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV05.10.021', '1', 'I', 1),
('CV05.10.021', '2', 'n', 2),
('CV05.10.021', '3', 'm', 3),
('CV05.10.021', '4', 'w', 4),
('CV05.10.021', '5', 'V', 5)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 手术级别代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV05.10.024', '手术级别代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV05.10.024', '1', '一级手术', 1),
('CV05.10.024', '2', '二级手术', 2),
('CV05.10.024', '3', '三级手术', 3),
('CV05.10.024', '4', '四级手术', 4)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 麻醉方法代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV06.00.103', '麻醉方法代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV06.00.103', '1', '全身麻醉', 1),
('CV06.00.103', '2', '椎管内麻醉', 2),
('CV06.00.103', '3', '局部麻醉', 3),
('CV06.00.103', '4', '复合麻醉', 4),
('CV06.00.103', '9', '其他麻醉方法', 9),
('CV06.00.103', '11', '吸入麻醉', 11),
('CV06.00.103', '12', '静脉麻醉', 12),
('CV06.00.103', '13', '基础麻醉', 13),
('CV06.00.103', '21', '蛛网膜下腔阻滞麻醉', 21),
('CV06.00.103', '22', '硬脊膜外腔阻滞麻醉', 22),
('CV06.00.103', '31', '神经丛阻滞麻醉', 31),
('CV06.00.103', '32', '神经节阻滞麻醉', 32),
('CV06.00.103', '33', '神经阻滞麻醉', 33),
('CV06.00.103', '34', '区域阻滞麻醉', 34),
('CV06.00.103', '35', '局部浸润麻醉', 35),
('CV06.00.103', '36', '表面麻醉', 36),
('CV06.00.103', '41', '静吸复合麻醉', 41),
('CV06.00.103', '42', '针药复合麻醉', 42),
('CV06.00.103', '43', '神经丛与硬膜外阻滞复合麻醉', 43),
('CV06.00.103', '44', '全麻复合全身降温', 44),
('CV06.00.103', '45', '全麻复合控制性降压', 45)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 手术体位代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV06.00.223', '手术体位代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV06.00.223', '1', '仰卧位', 1),
('CV06.00.223', '2', '俯卧位', 2),
('CV06.00.223', '3', '左侧卧位', 3),
('CV06.00.223', '4', '右侧卧位', 4),
('CV06.00.223', '5', '截石位', 5),
('CV06.00.223', '6', '屈氏位', 6),
('CV06.00.223', '9', '其他', 9)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 操作部位代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV06.00.227', '操作部位代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV06.00.227', '1', '双侧鼻孔', 1),
('CV06.00.227', '2', '臀部', 2),
('CV06.00.227', '3', '左臂', 3),
('CV06.00.227', '4', '左前胸', 4),
('CV06.00.227', '5', '左肘前窝', 5),
('CV06.00.227', '6', '左三角肌', 6),
('CV06.00.227', '7', '左耳', 7),
('CV06.00.227', '8', '左外颈', 8),
('CV06.00.227', '9', '左足', 9),
('CV06.00.227', '10', '左臀中肌', 10),
('CV06.00.227', '11', '左手', 11),
('CV06.00.227', '12', '左内颈', 12),
('CV06.00.227', '13', '左下腹', 13),
('CV06.00.227', '14', '左下臂', 14),
('CV06.00.227', '15', '左中臂', 15),
('CV06.00.227', '16', '左侧鼻孔', 16),
('CV06.00.227', '17', '左后胸', 17),
('CV06.00.227', '18', '左锁骨下', 18),
('CV06.00.227', '19', '左大腿', 19),
('CV06.00.227', '20', '左上臂', 20),
('CV06.00.227', '21', '左上腹', 21),
('CV06.00.227', '22', '左腹侧臀肌', 22),
('CV06.00.227', '23', '左股外肌', 23),
('CV06.00.227', '24', '右眼', 24),
('CV06.00.227', '25', '左眼', 25),
('CV06.00.227', '26', '双眼', 26),
('CV06.00.227', '27', '肛门', 27),
('CV06.00.227', '28', '会阴', 28),
('CV06.00.227', '29', '右臂', 29),
('CV06.00.227', '30', '右前胸', 30),
('CV06.00.227', '31', '右肘前窝', 31),
('CV06.00.227', '32', '右侧三角肌', 32),
('CV06.00.227', '33', '右耳', 33),
('CV06.00.227', '34', '右外颈', 34),
('CV06.00.227', '35', '右足', 35),
('CV06.00.227', '36', '右臀中肌', 36),
('CV06.00.227', '37', '右手', 37),
('CV06.00.227', '38', '右内颈', 38),
('CV06.00.227', '39', '右下腹', 39),
('CV06.00.227', '40', '右下臂', 40),
('CV06.00.227', '41', '右中臂', 41),
('CV06.00.227', '42', '右后胸', 42),
('CV06.00.227', '43', '右锁骨下', 43),
('CV06.00.227', '44', '右大腿', 44),
('CV06.00.227', '45', '右上臂', 45),
('CV06.00.227', '46', '右上腹', 46),
('CV06.00.227', '47', '右腹侧臀肌', 47),
('CV06.00.227', '48', '右股外侧肌', 48),
('CV06.00.227', '99', '其他', 99)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 药物使用频次代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV06.00.228', '药物使用频次代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV06.00.228', '1', 'bid', 1),
('CV06.00.228', '2', 'biw', 2),
('CV06.00.228', '3', 'Hs', 3),
('CV06.00.228', '4', 'ql2h', 4),
('CV06.00.228', '5', 'qlh', 5),
('CV06.00.228', '6', 'q3h', 6),
('CV06.00.228', '7', 'q6h', 7),
('CV06.00.228', '8', 'q8h', 8),
('CV06.00.228', '9', 'qd', 9),
('CV06.00.228', '10', 'qid', 10),
('CV06.00.228', '11', 'qod', 11),
('CV06.00.228', '12', 'qw', 12),
('CV06.00.228', '13', 'St', 13),
('CV06.00.228', '99', '其他', 99)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 医嘱项目类型代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV06.00.229', '医嘱项目类型代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV06.00.229', '1', '药品类医嘱', 1),
('CV06.00.229', '2', '检查类医嘱', 2),
('CV06.00.229', '3', '检验类医嘱', 3),
('CV06.00.229', '4', '手术类医嘱', 4),
('CV06.00.229', '5', '处置类医嘱', 5),
('CV06.00.229', '6', '材料类医嘱', 6),
('CV06.00.229', '7', '嘱托医嘱', 7),
('CV06.00.229', '8', '输血类医嘱', 8),
('CV06.00.229', '99', '其他医嘱', 99)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 医疗付费方式代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV07.10.005', '医疗付费方式代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV07.10.005', '1', '城镇职工基本医疗保险', 1),
('CV07.10.005', '2', '城镇居民基本医疗保险', 2),
('CV07.10.005', '3', '新型农村合作医疗', 3),
('CV07.10.005', '4', '贫困救助', 4),
('CV07.10.005', '5', '商业医疗保险', 5),
('CV07.10.005', '6', '全公费', 6),
('CV07.10.005', '7', '全自费', 7),
('CV07.10.005', '8', '其他社会保险', 8),
('CV07.10.005', '99', '其他', 99)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 患者类型代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('CV09.00.404', '患者类型代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('CV09.00.404', '1', '门诊', 1),
('CV09.00.404', '2', '急诊', 2),
('CV09.00.404', '3', '住院', 3),
('CV09.00.404', '9', '其他', 9)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 出院情况
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('EMR01.01.001', '出院情况', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('EMR01.01.001', '1', '治愈', 1),
('EMR01.01.001', '2', '好转', 2),
('EMR01.01.001', '3', '未愈', 3),
('EMR01.01.001', '4', '死亡', 4),
('EMR01.01.001', '5', '其他', 5)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 是否
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('EMR01.01.002', '是否', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('EMR01.01.002', '1', '是', 1),
('EMR01.01.002', '2', '否', 2)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 有无
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('EMR01.01.003', '有无', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('EMR01.01.003', '1', '无', 1),
('EMR01.01.003', '2', '有', 2)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 检验结果（阴/阳）
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('EMR01.01.004', '检验结果（阴/阳）', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('EMR01.01.004', '1', '阳性', 1),
('EMR01.01.004', '2', '阴性', 2),
('EMR01.01.004', '3', '未做', 3)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 手术并发症名称代码表
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('EMR01.01.005', '手术并发症名称代码表', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('EMR01.01.005', '1', '伤口裂开、出血或者血肿', 1),
('EMR01.01.005', '2', '手术过程中异物遗留', 2),
('EMR01.01.005', '3', '医源性气胸', 3),
('EMR01.01.005', '4', '医源性撕裂伤', 4),
('EMR01.01.005', '6', '肺部感染', 6),
('EMR01.01.005', '7', '肺栓塞', 7),
('EMR01.01.005', '8', '深静脉血栓', 8),
('EMR01.01.005', '9', '髋关节血栓', 9),
('EMR01.01.005', '10', '生理与代谢絮乱', 10),
('EMR01.01.005', '11', '呼吸衰竭', 11),
('EMR01.01.005', '12', '败血症', 12),
('EMR01.01.005', '90', '其他', 90)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 肿瘤（TNM）分期
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('EMR01.01.006', '肿瘤（TNM）分期', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('EMR01.01.006', '1', '0期', 1),
('EMR01.01.006', '2', 'Ⅰ期', 2),
('EMR01.01.006', '3', 'Ⅱ期', 3),
('EMR01.01.006', '4', 'Ⅲ期', 4),
('EMR01.01.006', '5', 'Ⅳ期', 5),
('EMR01.01.006', '6', '不详', 6)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 身份证件类别
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.000', '身份证件类别', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.000', '1', '身份证', 1),
('WT01.01.000', '2', '军官证', 2),
('WT01.01.000', '3', '港澳台居民通行证', 3),
('WT01.01.000', '4', '护照', 4)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 性别代码
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.001', '性别代码', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.001', '0', '未知的性别', 1),
('WT01.01.001', '1', '男', 2),
('WT01.01.001', '2', '女', 3),
('WT01.01.001', '9', '未说明的性别', 4)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 民族代码
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.002', '民族代码', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.002', '01', '汉族', 1),
('WT01.01.002', '02', '蒙古族', 2),
('WT01.01.002', '03', '回族', 3),
('WT01.01.002', '04', '藏族', 4),
('WT01.01.002', '05', '维吾尔族', 5),
('WT01.01.002', '06', '苗族', 6),
('WT01.01.002', '07', '彝族', 7),
('WT01.01.002', '08', '壮族', 8),
('WT01.01.002', '09', '布依族', 9),
('WT01.01.002', '10', '朝鲜族', 10),
('WT01.01.002', '11', '满族', 11),
('WT01.01.002', '12', '侗族', 12),
('WT01.01.002', '13', '瑶族', 13),
('WT01.01.002', '14', '白族', 14),
('WT01.01.002', '15', '土家族', 15),
('WT01.01.002', '16', '哈尼族', 16),
('WT01.01.002', '17', '哈萨克族', 17),
('WT01.01.002', '18', '傣族', 18),
('WT01.01.002', '19', '黎族', 19),
('WT01.01.002', '20', '傈僳族', 20),
('WT01.01.002', '21', '佤族', 21),
('WT01.01.002', '22', '畲族', 22),
('WT01.01.002', '23', '高山族', 23),
('WT01.01.002', '24', '拉祜族', 24),
('WT01.01.002', '25', '水族', 25),
('WT01.01.002', '26', '东乡族', 26),
('WT01.01.002', '27', '纳西族', 27),
('WT01.01.002', '28', '景颇族', 28),
('WT01.01.002', '29', '柯尔克孜', 29),
('WT01.01.002', '30', '土族', 30),
('WT01.01.002', '31', '达斡尔族', 31),
('WT01.01.002', '32', '仫佬族', 32),
('WT01.01.002', '33', '羌族', 33),
('WT01.01.002', '34', '布朗族', 34),
('WT01.01.002', '35', '撒拉族', 35),
('WT01.01.002', '36', '毛南族', 36),
('WT01.01.002', '37', '仡佬族', 37),
('WT01.01.002', '38', '锡伯族', 38),
('WT01.01.002', '39', '阿昌族', 39),
('WT01.01.002', '40', '普米族', 40),
('WT01.01.002', '41', '塔吉克族', 41),
('WT01.01.002', '42', '怒族', 42),
('WT01.01.002', '43', '乌孜别克', 43),
('WT01.01.002', '44', '俄罗斯族', 44),
('WT01.01.002', '45', '鄂温克族', 45),
('WT01.01.002', '46', '崩龙族', 46),
('WT01.01.002', '47', '保安族', 47),
('WT01.01.002', '48', '裕固族', 48),
('WT01.01.002', '49', '京族', 49),
('WT01.01.002', '50', '塔塔尔族', 50),
('WT01.01.002', '51', '独龙族', 51),
('WT01.01.002', '52', '鄂伦春族', 52),
('WT01.01.002', '53', '赫哲族', 53),
('WT01.01.002', '54', '门巴族', 54),
('WT01.01.002', '55', '珞巴族', 55),
('WT01.01.002', '56', '基诺族', 56),
('WT01.01.002', '88', '其他民族', 57),
('WT01.01.002', '99', '外国籍', 58)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 从事专业类别代码
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.003', '从事专业类别代码', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.003', '11', '执业医师', 1),
('WT01.01.003', '12', '执业助理医师', 2),
('WT01.01.003', '13', '见习医师', 3),
('WT01.01.003', '21', '注册护士', 4),
('WT01.01.003', '22', '助产士', 5),
('WT01.01.003', '31', '西药师（士）', 6),
('WT01.01.003', '32', '中药师（士）', 7),
('WT01.01.003', '41', '检验技师（士）', 8),
('WT01.01.003', '42', '影像技师（士）', 9),
('WT01.01.003', '43', '康复技师', 10),
('WT01.01.003', '44', '其他技师', 11),
('WT01.01.003', '50', '卫生监督员', 12),
('WT01.01.003', '60', '乡村医生', 13),
('WT01.01.003', '69', '其他卫生技术人员', 14),
('WT01.01.003', '70', '其他技术人员', 15),
('WT01.01.003', '80', '管理人员', 16),
('WT01.01.003', '90', '工勤技能人员', 17)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 医师执业类别代码
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.004', '医师执业类别代码', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.004', '1', '临床', 1),
('WT01.01.004', '2', '口腔', 2),
('WT01.01.004', '3', '公共卫生', 3),
('WT01.01.004', '4', '中医', 4)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 国籍代码
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.005', '国籍代码', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.005', 'ABW', '阿鲁巴', 1),
('WT01.01.005', 'AFG', '阿富汗', 2),
('WT01.01.005', 'AGO', '安哥拉', 3),
('WT01.01.005', 'AIA', '安圭拉', 4),
('WT01.01.005', 'ALB', '阿尔巴尼亚', 5),
('WT01.01.005', 'AND', '安道尔', 6),
('WT01.01.005', 'ANT', '荷属安的列斯', 7),
('WT01.01.005', 'ARE', '阿联酋', 8),
('WT01.01.005', 'ARG', '阿根廷', 9),
('WT01.01.005', 'ARM', '亚美尼亚', 10),
('WT01.01.005', 'ASM', '美属萨摩亚', 11),
('WT01.01.005', 'ATA', '南极洲', 12),
('WT01.01.005', 'ATF', '法属南部领土', 13),
('WT01.01.005', 'ATG', '安提瓜和巴布达', 14),
('WT01.01.005', 'AUS', '澳大利亚', 15),
('WT01.01.005', 'AUT', '奥地利', 16),
('WT01.01.005', 'AZE', '阿塞拜疆', 17),
('WT01.01.005', 'BDI', '布隆迪', 18),
('WT01.01.005', 'BEL', '比利时', 19),
('WT01.01.005', 'BEN', '贝宁', 20),
('WT01.01.005', 'BFA', '布基纳法索', 21),
('WT01.01.005', 'BGD', '孟加拉国', 22),
('WT01.01.005', 'BGR', '保加利亚', 23),
('WT01.01.005', 'BHR', '巴林', 24),
('WT01.01.005', 'BHS', '巴哈马', 25),
('WT01.01.005', 'BIH', '波斯尼亚和黑塞哥维那', 26),
('WT01.01.005', 'BLR', '白俄罗斯', 27),
('WT01.01.005', 'BLZ', '伯利兹', 28),
('WT01.01.005', 'BMU', '百幕大', 29),
('WT01.01.005', 'BOL', '玻利维亚', 30),
('WT01.01.005', 'BRA', '巴西', 31),
('WT01.01.005', 'BRB', '巴巴多斯', 32),
('WT01.01.005', 'BRN', '文莱', 33),
('WT01.01.005', 'BTN', '不丹', 34),
('WT01.01.005', 'BVT', '布维岛', 35),
('WT01.01.005', 'BWA', '博茨瓦纳', 36),
('WT01.01.005', 'CAF', '中非', 37),
('WT01.01.005', 'CAN', '加拿大', 38),
('WT01.01.005', 'CCK', '科科斯群岛', 39),
('WT01.01.005', 'CHE', '瑞士', 40),
('WT01.01.005', 'CHL', '智利', 41),
('WT01.01.005', 'CHN', '中国', 42),
('WT01.01.005', 'CIV', '科特迪瓦', 43),
('WT01.01.005', 'CMR', '喀麦隆', 44),
('WT01.01.005', 'COD', '刚果民主共和国', 45),
('WT01.01.005', 'COG', '刚果', 46),
('WT01.01.005', 'COK', '库克群岛', 47),
('WT01.01.005', 'COL', '哥伦比亚', 48),
('WT01.01.005', 'COM', '科摩罗', 49),
('WT01.01.005', 'CPV', '佛得角', 50),
('WT01.01.005', 'CRI', '哥斯达黎加', 51),
('WT01.01.005', 'CUB', '古巴', 52),
('WT01.01.005', 'CXR', '圣诞岛', 53),
('WT01.01.005', 'CYM', '开曼群岛', 54),
('WT01.01.005', 'CYP', '塞浦路斯', 55),
('WT01.01.005', 'CZE', '捷克', 56),
('WT01.01.005', 'DEU', '德国', 57),
('WT01.01.005', 'DJI', '吉布提', 58),
('WT01.01.005', 'DMA', '多米尼加', 59),
('WT01.01.005', 'DNK', '丹麦', 60),
('WT01.01.005', 'DOM', '多米尼家共和国', 61),
('WT01.01.005', 'DZA', '阿尔及利亚', 62),
('WT01.01.005', 'ECU', '厄瓜多尔', 63),
('WT01.01.005', 'EGY', '埃及', 64),
('WT01.01.005', 'ERI', '厄立特里亚', 65),
('WT01.01.005', 'ESH', '西撒哈拉', 66),
('WT01.01.005', 'ESP', '西班牙', 67),
('WT01.01.005', 'EST', '爱沙尼亚', 68),
('WT01.01.005', 'ETH', '埃塞俄比亚', 69),
('WT01.01.005', 'FIN', '芬兰', 70),
('WT01.01.005', 'FJI', '斐济', 71),
('WT01.01.005', 'FLK', '马尔维纳斯群岛', 72),
('WT01.01.005', 'FRA', '法国', 73),
('WT01.01.005', 'FRO', '法罗群岛', 74),
('WT01.01.005', 'FSM', '密克罗尼西亚', 75),
('WT01.01.005', 'GAB', '加蓬', 76),
('WT01.01.005', 'GBD', '英国（独立领土公民、出国不用）', 77),
('WT01.01.005', 'GBN', '英国（海外国民，出国不用）', 78),
('WT01.01.005', 'GBO', '英国（海外公民，出国不用）', 79),
('WT01.01.005', 'GBP', '英国（保护公民，出国不用）', 80),
('WT01.01.005', 'GBR', '英国', 81),
('WT01.01.005', 'GBS', '英国（隶属，出国不用）', 82),
('WT01.01.005', 'GEO', '格鲁吉亚', 83),
('WT01.01.005', 'GHA', '加纳', 84),
('WT01.01.005', 'GIB', '直布罗陀', 85),
('WT01.01.005', 'GIN', '几内亚', 86),
('WT01.01.005', 'GLP', '瓜德罗普', 87),
('WT01.01.005', 'GMB', '冈比亚', 88),
('WT01.01.005', 'GNB', '几内亚比绍', 89),
('WT01.01.005', 'GNQ', '赤道几内亚', 90),
('WT01.01.005', 'GRC', '希腊', 91),
('WT01.01.005', 'GRD', '格林纳达', 92),
('WT01.01.005', 'GRL', '格陵兰', 93),
('WT01.01.005', 'GTM', '危地马拉', 94),
('WT01.01.005', 'GUF', '法属圭亚那', 95),
('WT01.01.005', 'GUM', '关岛', 96),
('WT01.01.005', 'GUY', '圭亚那', 97),
('WT01.01.005', 'HMD', '赫德岛和麦克唐纳岛', 98),
('WT01.01.005', 'HND', '洪都拉斯', 99),
('WT01.01.005', 'HRV', '克罗地亚', 100),
('WT01.01.005', 'HTI', '海地', 101),
('WT01.01.005', 'HUN', '匈牙利', 102),
('WT01.01.005', 'IDN', '印度尼西亚', 103),
('WT01.01.005', 'IND', '印度', 104),
('WT01.01.005', 'IOT', '英属印度洋领土', 105),
('WT01.01.005', 'IRL', '爱尔兰', 106),
('WT01.01.005', 'IRN', '伊朗', 107),
('WT01.01.005', 'IRQ', '伊拉克', 108),
('WT01.01.005', 'ISL', '冰岛', 109),
('WT01.01.005', 'ISR', '以色列', 110),
('WT01.01.005', 'ITA', '意大利', 111),
('WT01.01.005', 'JAM', '牙买加', 112),
('WT01.01.005', 'JOR', '约旦', 113),
('WT01.01.005', 'JPN', '日本', 114),
('WT01.01.005', 'JTN', '约翰斯顿岛', 115),
('WT01.01.005', 'KAZ', '哈萨克斯坦', 116),
('WT01.01.005', 'KEN', '肯尼亚', 117),
('WT01.01.005', 'KGZ', '吉尔吉斯斯坦', 118),
('WT01.01.005', 'KHM', '柬埔寨', 119),
('WT01.01.005', 'KIR', '基里巴斯', 120),
('WT01.01.005', 'KNA', '圣基茨和尼维斯', 121),
('WT01.01.005', 'KOR', '韩国（南朝鲜）', 122),
('WT01.01.005', 'KWT', '科威特', 123),
('WT01.01.005', 'LAO', '老挝', 124),
('WT01.01.005', 'LBN', '黎巴嫩', 125),
('WT01.01.005', 'LBR', '利比里亚', 126),
('WT01.01.005', 'LBY', '利比亚', 127),
('WT01.01.005', 'LCA', '圣卢西亚', 128),
('WT01.01.005', 'LIE', '列支敦土登', 129),
('WT01.01.005', 'LKA', '斯里兰卡', 130),
('WT01.01.005', 'LSO', '莱索托', 131),
('WT01.01.005', 'LTU', '立陶宛', 132),
('WT01.01.005', 'LUX', '卢森堡', 133),
('WT01.01.005', 'LVA', '拉脱维亚', 134),
('WT01.01.005', 'MAR', '摩洛哥', 135),
('WT01.01.005', 'MCO', '摩纳哥', 136),
('WT01.01.005', 'MDA', '摩尔多瓦', 137),
('WT01.01.005', 'MDG', '马达加斯加', 138),
('WT01.01.005', 'MDV', '马尔代夫', 139),
('WT01.01.005', 'MEX', '墨西哥', 140),
('WT01.01.005', 'MHL', '马绍尔群岛', 141),
('WT01.01.005', 'MID', '中途岛', 142),
('WT01.01.005', 'MKD', '马其顿', 143),
('WT01.01.005', 'MLI', '马里', 144),
('WT01.01.005', 'MLT', '马耳他', 145),
('WT01.01.005', 'MMR', '缅甸', 146),
('WT01.01.005', 'MNG', '蒙古', 147),
('WT01.01.005', 'MNP', '北马里亚纳', 148),
('WT01.01.005', 'MOZ', '莫桑比克', 149),
('WT01.01.005', 'MRT', '毛里塔尼亚', 150),
('WT01.01.005', 'MSR', '蒙特塞拉特', 151),
('WT01.01.005', 'MTQ', '马提尼克', 152),
('WT01.01.005', 'MUS', '毛里求斯', 153),
('WT01.01.005', 'MWI', '马拉维', 154),
('WT01.01.005', 'MYS', '马来西亚', 155),
('WT01.01.005', 'MYT', '马约特', 156),
('WT01.01.005', 'NAM', '纳米比亚', 157),
('WT01.01.005', 'NCL', '新喀里多尼亚', 158),
('WT01.01.005', 'NER', '尼日尔', 159),
('WT01.01.005', 'NFK', '诺福克岛', 160),
('WT01.01.005', 'NGA', '尼日利亚', 161),
('WT01.01.005', 'NIC', '尼加拉瓜', 162),
('WT01.01.005', 'NIU', '纽埃', 163),
('WT01.01.005', 'NLD', '荷兰', 164),
('WT01.01.005', 'NOR', '挪威', 165),
('WT01.01.005', 'NPL', '尼波尔', 166),
('WT01.01.005', 'NRU', '瑙鲁', 167),
('WT01.01.005', 'NTZ', '中间地带', 168),
('WT01.01.005', 'NZL', '新西兰', 169),
('WT01.01.005', 'OMN', '阿曼', 170),
('WT01.01.005', 'PAK', '巴基斯坦', 171),
('WT01.01.005', 'PAN', '巴拿马', 172),
('WT01.01.005', 'PCN', '皮特凯恩群岛', 173),
('WT01.01.005', 'PER', '秘鲁', 174),
('WT01.01.005', 'PHL', '菲律宾', 175),
('WT01.01.005', 'PLW', '贝劳', 176),
('WT01.01.005', 'PNG', '巴布亚新几内亚', 177),
('WT01.01.005', 'POL', '波兰', 178),
('WT01.01.005', 'PRI', '波多黎各', 179),
('WT01.01.005', 'PRK', '朝鲜', 180),
('WT01.01.005', 'PRT', '葡萄牙', 181),
('WT01.01.005', 'PRY', '巴拉圭', 182),
('WT01.01.005', 'PST', '巴勒斯坦', 183),
('WT01.01.005', 'PYF', '法属菠利尼西亚', 184),
('WT01.01.005', 'QAT', '卡塔尔', 185),
('WT01.01.005', 'REU', '留尼汪', 186),
('WT01.01.005', 'ROM', '罗马尼亚', 187),
('WT01.01.005', 'RUS', '俄罗斯', 188),
('WT01.01.005', 'RWA', '卢旺达', 189),
('WT01.01.005', 'SAU', '沙特阿拉伯', 190),
('WT01.01.005', 'SDN', '苏丹', 191),
('WT01.01.005', 'SEN', '塞内加尔', 192),
('WT01.01.005', 'SGP', '新加坡', 193),
('WT01.01.005', 'SGS', '南乔治亚岛和南桑德韦奇岛', 194),
('WT01.01.005', 'SHN', '圣赫勒拿', 195),
('WT01.01.005', 'SJM', '斯瓦尔巴群岛', 196),
('WT01.01.005', 'SLB', '所罗门群岛', 197),
('WT01.01.005', 'SLE', '塞拉利昂', 198),
('WT01.01.005', 'SLV', '萨尔瓦多', 199),
('WT01.01.005', 'SMR', '圣马力诺', 200),
('WT01.01.005', 'SOM', '索马里', 201),
('WT01.01.005', 'SPM', '圣皮埃尔和密克隆', 202),
('WT01.01.005', 'SS', '塞班', 203),
('WT01.01.005', 'STP', '圣多美和普林西比', 204),
('WT01.01.005', 'SUR', '苏里南', 205),
('WT01.01.005', 'SVK', '斯洛伐克', 206),
('WT01.01.005', 'SVN', '斯洛文尼亚', 207),
('WT01.01.005', 'SWE', '瑞典', 208),
('WT01.01.005', 'SWZ', '斯威士兰', 209),
('WT01.01.005', 'SX', '锡金', 210),
('WT01.01.005', 'SF', '塞尔维亚', 211),
('WT01.01.005', 'SYC', '塞舌尔', 212),
('WT01.01.005', 'SYR', '叙利亚', 213),
('WT01.01.005', 'TCA', '特克斯和凯科斯群岛', 214),
('WT01.01.005', 'TCD', '乍得', 215),
('WT01.01.005', 'TGO', '多哥', 216),
('WT01.01.005', 'THA', '泰国', 217),
('WT01.01.005', 'TJK', '塔吉克斯坦', 218),
('WT01.01.005', 'TKL', '托克劳', 219),
('WT01.01.005', 'TKM', '土库曼斯坦', 220),
('WT01.01.005', 'TMP', '东帝汶', 221),
('WT01.01.005', 'TON', '汤加', 222),
('WT01.01.005', 'TTO', '特立尼达和多巴哥', 223),
('WT01.01.005', 'TUN', '突尼斯', 224),
('WT01.01.005', 'TUR', '土耳其', 225),
('WT01.01.005', 'TUV', '图瓦卢', 226),
('WT01.01.005', 'TZA', '坦桑尼亚', 227),
('WT01.01.005', 'UGA', '乌干达', 228),
('WT01.01.005', 'UKR', '乌克兰', 229),
('WT01.01.005', 'UMI', '美属太平洋各群岛', 230),
('WT01.01.005', 'UN', '联合国', 231),
('WT01.01.005', 'UNA', '联合国', 232),
('WT01.01.005', 'UNO', '联合国', 233),
('WT01.01.005', 'URY', '乌拉圭', 234),
('WT01.01.005', 'USA', '美国', 235),
('WT01.01.005', 'UZB', '乌兹别克斯坦', 236),
('WT01.01.005', 'VAT', '梵蒂冈', 237),
('WT01.01.005', 'VCT', '圣文森特和格林纳丁斯', 238),
('WT01.01.005', 'VEN', '委内瑞拉', 239),
('WT01.01.005', 'VGB', '英属维尔京群岛', 240),
('WT01.01.005', 'VIR', '美属维尔京群岛', 241),
('WT01.01.005', 'VNM', '越南', 242),
('WT01.01.005', 'VUT', '瓦努阿图', 243),
('WT01.01.005', 'WAK', '威克岛', 244),
('WT01.01.005', 'WLF', '瓦利斯和富图纳群岛', 245),
('WT01.01.005', 'WSM', '西萨摩亚', 246),
('WT01.01.005', 'XXA', '无国籍（无国籍人）', 247),
('WT01.01.005', 'XXB', '无国籍（难民）', 248),
('WT01.01.005', 'XXX', '无国籍（未声明国籍）', 249),
('WT01.01.005', 'YEM', '也门', 250),
('WT01.01.005', 'YUG', '南斯拉夫', 251),
('WT01.01.005', 'ZAF', '南非', 252),
('WT01.01.005', 'ZAR', '扎伊尔', 253),
('WT01.01.005', 'ZMB', '赞比亚', 254),
('WT01.01.005', 'ZWE', '津巴布韦', 255),
('WT01.01.005', 'ZZZ', '国籍不详', 256)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 职业代码
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.006', '职业代码', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.006', '11', '国家公务员', 1),
('WT01.01.006', '13', '专业技术人员', 2),
('WT01.01.006', '17', '职员', 3),
('WT01.01.006', '21', '企业管理人员', 4),
('WT01.01.006', '24', '工人', 5),
('WT01.01.006', '27', '农民', 6),
('WT01.01.006', '31', '学生', 7),
('WT01.01.006', '37', '现役军人', 8),
('WT01.01.006', '51', '自由职业者', 9),
('WT01.01.006', '54', '个体经营者', 10),
('WT01.01.006', '70', '无业人员', 11),
('WT01.01.006', '80', '退(离)休人员', 12),
('WT01.01.006', '90', '其他', 13)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 婚姻状况代码
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.007', '婚姻状况代码', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.007', '10', '未婚', 1),
('WT01.01.007', '20', '已婚', 2),
('WT01.01.007', '21', '初婚', 3),
('WT01.01.007', '22', '再婚', 4),
('WT01.01.007', '23', '复婚', 5),
('WT01.01.007', '30', '丧偶', 6),
('WT01.01.007', '40', '离婚', 7),
('WT01.01.007', '90', '其他', 8)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 联系人关系代码
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.008', '联系人关系代码', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.008', '0', '本人或户主', 1),
('WT01.01.008', '1', '配偶', 2),
('WT01.01.008', '2', '子', 3),
('WT01.01.008', '3', '女', 4),
('WT01.01.008', '4', '孙子、孙女或外孙子、外孙女', 5),
('WT01.01.008', '5', '父母', 6),
('WT01.01.008', '6', '祖父母或外祖父母', 7),
('WT01.01.008', '7', '兄、弟、姐、妹', 8),
('WT01.01.008', '8', '其他', 9)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 入院途径
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.009', '入院途径', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.009', '1', '急诊', 1),
('WT01.01.009', '2', '门诊', 2),
('WT01.01.009', '3', '其他医疗机构转入', 3),
('WT01.01.009', '9', '其他', 4)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 入院病情代码
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.010', '入院病情代码', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.010', '1', '有', 1),
('WT01.01.010', '2', '临床未确定', 2),
('WT01.01.010', '3', '情况不明', 3),
('WT01.01.010', '4', '无', 4)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 血型编码
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.011', '血型编码', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.011', '1', 'A型', 1),
('WT01.01.011', '2', 'B型', 2),
('WT01.01.011', '3', 'O型', 3),
('WT01.01.011', '4', 'AB型', 4),
('WT01.01.011', '5', '不详', 5),
('WT01.01.011', '6', '未查', 6)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 病案质量
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.012', '病案质量', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.012', '1', '甲', 1),
('WT01.01.012', '2', '乙', 2),
('WT01.01.012', '3', '丙', 3)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 切口愈合等级
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.014', '切口愈合等级', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.014', '1', '0', 1),
('WT01.01.014', '2', 'Ⅰ', 2),
('WT01.01.014', '3', 'Ⅱ', 3),
('WT01.01.014', '4', 'Ⅲ', 4)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 切口愈合类别
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.015', '切口愈合类别', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.015', '1', '甲', 1),
('WT01.01.015', '2', '乙', 2),
('WT01.01.015', '3', '丙', 3),
('WT01.01.015', '9', '未知', 4)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 离院方式
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.017', '离院方式', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.017', '1', '医嘱离院', 1),
('WT01.01.017', '2', '医嘱转院', 2),
('WT01.01.017', '3', '医嘱转社区卫生服务机构/乡镇卫生院', 3),
('WT01.01.017', '4', '非医嘱离院', 4),
('WT01.01.017', '5', '死亡', 5),
('WT01.01.017', '9', '其他', 6)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 有无
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.018', '有无', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.018', '1', '无', 1),
('WT01.01.018', '2', '有', 2)
ON CONFLICT (domain_code, item_code) DO NOTHING;

-- 字典: 实施临床路径
INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) 
VALUES ('WT01.01.019', '实施临床路径', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;
INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES
('WT01.01.019', '1', '中医', 1),
('WT01.01.019', '2', '西医', 2),
('WT01.01.019', '3', '否', 3)
ON CONFLICT (domain_code, item_code) DO NOTHING;

COMMIT;
