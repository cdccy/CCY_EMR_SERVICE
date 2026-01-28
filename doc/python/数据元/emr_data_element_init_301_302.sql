/* 电子病历数据元定义 - 初始化脚本 (emr_data_element_init_301_302.sql) */
BEGIN;

INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.70', '控制小便_5', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.71', '控制大便_1', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.72', '控制大便_2', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.73', '控制大便_3', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.74', '控制大便_4', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.75', '控制大便_5', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.76', '穿衣_1', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.77', '穿衣_2', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.78', '穿衣_3', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.79', '穿衣_4', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.80', '穿衣_5', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.81', '修饰_1', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.82', '修饰_2', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.83', '修饰_3', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.84', '修饰_4', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.85', '修饰_5', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.86', '洗澡_1', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.87', '洗澡_2', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.88', '洗澡_3', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;
INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('DE99.09.011.90', '签名1', '', 'S1', 'A', 50, NULL) ON CONFLICT (element_code) DO NOTHING;

COMMIT;