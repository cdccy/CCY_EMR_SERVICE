--
-- PostgreSQL database dump
--

\restrict FqZ8rbXauDCMn85yC15iBdXvwzKkfdb40dtQT3fIWN08I9LSkRNiDkkeGfzwgu2

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
-- Data for Name: Access; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public."Access" (id, debug, name, alias, get, head, gets, heads, post, put, delete, date) FROM stdin;
1	0	sys_user	User	["ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:45:45.018332
2	0	sys_role	Role	["ADMIN","USER"]	["ADMIN","USER"]	["ADMIN","USER"]	["ADMIN","USER"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:45:45.018332
3	0	sys_menu	Menu	["ADMIN","USER"]	["ADMIN","USER"]	["ADMIN","USER"]	["ADMIN","USER"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:45:45.018332
4	0	Function	Function	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.729994
5	0	Script	Script	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.729994
6	0	Request	Request	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.729994
7	0	Document	Document	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.729994
8	0	patient	Patient	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
9	0	registration	Registration	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
10	0	outpatient_visit	OutpatientVisit	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
11	0	outpatient_visit_active	OutpatientVisitActive	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
12	0	outpatient_visit_history	OutpatientVisitHistory	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
13	0	sys_department	Department	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
14	0	doctor	Doctor	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
18	0	emr_icd10_diagnosis	Icd10Diagnosis	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
19	0	emr_template	EmrTemplate	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
20	0	emr_record	EmrRecord	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
23	0	emr_template_department	EmrTemplateDepartment	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
24	0	emr_record_version	EmrRecordVersion	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
26	0	outpatient_encounter_data	OutpatientEncounterData	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
27	0	medical_order	MedicalOrder	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
28	0	medical_order_drug	MedicalOrderDrug	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
29	0	medical_order_exam	MedicalOrderExam	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
30	0	exam_result	ExamResult	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
31	0	medical_order_lab	MedicalOrderLab	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
32	0	lab_result	LabResult	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
33	0	v_doctor_user_manage	DoctorUserManage	["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]	["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]	["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]	["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]	["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]	["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]	["UNKNOWN","LOGIN","CONTACT","CIRCLE","OWNER","ADMIN"]	2026-03-25 18:47:24.881237
15	0	emr_data_element	EmrDataElement	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
16	0	emr_data_set	EmrDataSet	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
17	0	emr_data_set_element	EmrDataSetElement	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
21	0	emr_value_domain	EmrValueDomain	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
22	0	emr_value_domain_item	EmrValueDomainItem	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["UNKNOWN","LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-25 18:47:24.734309
34	0	v_emr_template_scope	VEmrTemplateScope	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-26 20:41:45.218652
35	0	v_emr_template_manage	VEmrTemplateManage	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-26 20:41:45.218652
25	0	doctor_favorite_template	DoctorFavoriteTemplate	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	2026-03-25 18:47:24.734309
37	0	v_outpatient_emr_bundle_latest	VOutpatientEmrBundleLatest	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	["ADMIN"]	["ADMIN"]	2026-03-27 14:40:50.440996
38	0	v_outpatient_emr_bundle	VOutpatientEmrBundle	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	["LOGIN","ADMIN"]	["ADMIN"]	2026-03-27 14:40:50.440996
\.


--
-- Data for Name: Document; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public."Document" (id, debug, user_id, version, name, type, url, request, apijson, sql, result, date) FROM stdin;
\.


--
-- Data for Name: Function; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public."Function" (id, debug, name, arguments, demo, detail, version, tag, methods, date) FROM stdin;
1	0	countArray	array	{"array": [1,2,3]}	统计数组长度	0	Function	GET	2026-03-25 18:47:24.731217
2	0	isContain	array,value	{"array": [1,2,3], "value": 2}	判断数组是否包含某个值	0	Function	GET	2026-03-25 18:47:24.731217
3	0	getFromArray	array,position	{"array": [1,2,3], "position": 0}	从数组中获取指定位置的元素	0	Function	GET	2026-03-25 18:47:24.731217
\.


--
-- Data for Name: Request; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public."Request" (id, debug, version, method, tag, structure, detail, date) FROM stdin;
1	0	1	POST	DoctorUserManage	{"MUST":"doctor_code,doctor_name,dept_code,username,password","REFUSE":"doctor_id,user_id,user_is_deleted","doctor_name":"^[\\\\u4e00-\\\\u9fa5a-zA-Z]{2,20}$","username":"^[a-zA-Z0-9_]{4,32}$","password":"^.{6,64}$","user_status{0,1}":1}	DoctorUserManage 新增校验	2026-03-25 18:47:24.882745
2	0	1	PUT	DoctorUserManage	{"MUST":"id","REFUSE":"username,user_id,user_is_deleted","doctor_name":"^[\\\\u4e00-\\\\u9fa5a-zA-Z]{2,20}$","password":"^.{6,64}$","user_status{0,1}":1}	DoctorUserManage 修改校验(PUT必须传id，禁止改username)	2026-03-25 18:47:24.882745
3	0	1	DELETE	DoctorUserManage	{"MUST":"doctor_id"}	DoctorUserManage 删除校验(软删)	2026-03-25 18:47:24.882745
\.


--
-- Data for Name: Script; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public."Script" (id, debug, name, language, script, simple, version, date) FROM stdin;
1	0	countArray	JavaScript	function countArray(array) { return array ? array.length : 0; }	0	0	2026-03-25 18:47:24.733547
2	0	isContain	JavaScript	function isContain(array, value) { return array ? array.indexOf(value) >= 0 : false; }	0	0	2026-03-25 18:47:24.733547
3	0	getFromArray	JavaScript	function getFromArray(array, position) { return array && array.length > position ? array[position] : null; }	0	0	2026-03-25 18:47:24.733547
\.


--
-- Data for Name: sys_department; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.sys_department (id, dept_code, dept_name, parent_code, dept_type, enabled, create_time, update_time) FROM stdin;
1	DEPT001	内科	\N	CLINIC	t	2026-03-25 18:47:24.808947	2026-03-25 18:47:24.808947
1774528708703	DEPT002	外科	\N	CLINIC	t	2026-03-26 20:38:28.73324	2026-03-26 20:38:28.73324
1774528726634	DEPT003	骨科	\N	CLINIC	t	2026-03-26 20:38:46.683794	2026-03-26 20:38:46.683794
\.


--
-- Data for Name: sys_user; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.sys_user (id, username, password, name, phone, email, avatar, status, create_time, update_time, is_deleted) FROM stdin;
1	admin	$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi	系统管理员	13800138000	admin@emr.com	\N	1	2026-03-25 18:45:45.016246	2026-03-25 18:47:24.802026	0
3	doctor01	$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVKIUi	张医生	13900139000	zhang@emr.com	\N	1	2026-03-25 18:47:24.802026	2026-03-25 18:47:24.802026	0
4	DOC002	$2a$10$1J4coQQEJfleaxfvjVVqveE7phL/ejHCYvqUTqDrEyZ9CDulrwo5e	李医生	\N	\N	\N	1	2026-03-26 21:18:00.783364	2026-03-26 21:18:00.783364	0
\.


--
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.doctor (id, doctor_code, doctor_name, dept_code, title_code, license_no, user_username, enabled, create_time, update_time) FROM stdin;
1	DOC001	张医生	DEPT001	\N	\N	doctor01	t	2026-03-25 18:47:24.809723	2026-03-25 18:47:24.809723
2	DOC002	李医生	DEPT003	\N	\N	DOC002	t	2026-03-26 21:18:00.783364	2026-03-26 21:18:00.783364
\.


--
-- Data for Name: emr_template; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.emr_template (id, template_code, template_name, emr_type, template_scope, template_structure, enabled, create_time, update_time) FROM stdin;
1	OUTPATIENT_DEFAULT_XML_20260326	门诊默认模板-入院记录通用测试	OUTPATIENT	HOSPITAL	{"xml": "\\n\\n<XTextDocument xmlns:xsd=\\"http://www.w3.org/2001/XMLSchema\\" xmlns:xsi=\\"http://www.w3.org/2001/XMLSchema-instance\\" EditorVersionString=\\"1.0.0.0\\">\\n   <Attributes>\\n      <Attribute>\\n         <Name>DCLocalDataSource</Name>\\n         <Value>&lt;DataSourceDocument xmlns:xsi=\\"http://www.w3.org/2001/XMLSchema-instance\\" xmlns:xsd=\\"http://www.w3.org/2001/XMLSchema\\" ID=\\"DataSource\\" Name=\\"DataSource\\" Guid=\\"9c34a38d-a29b-4685-83f9-db43397b4d3a\\" Title=\\"\\"&gt;&lt;Parameters /&gt;&lt;Nodes /&gt;&lt;/DataSourceDocument&gt;</Value>\\n      </Attribute>\\n   </Attributes>\\n   <XElements>\\n      <Element xsi:type=\\"XTextHeader\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"9\\" />\\n            <Element xsi:type=\\"XInputField\\" StyleIndex=\\"1\\">\\n               <ID>机构名称</ID>\\n               <XElements>\\n                  <Element xsi:type=\\"XString\\" StyleIndex=\\"2\\">\\n                     <Text>XXXXXX医院</Text>\\n                  </Element>\\n               </XElements>\\n               <Deleteable>false</Deleteable>\\n               <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n               <SpecifyWidth>1181.102</SpecifyWidth>\\n               <Alignment>Center</Alignment>\\n               <Name>机构名称</Name>\\n               <InnerValue>XXXXXX医院</InnerValue>\\n               <BackgroundText>机构名称</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"12\\" />\\n            <Element xsi:type=\\"XString\\">\\n               <Text>科别：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>科别</ID>\\n               <Name>科别</Name>\\n               <BackgroundText>科别</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>     床号：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>床号</ID>\\n               <Name>床号</Name>\\n               <BackgroundText>床号</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>床    姓名：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>姓名YM</ID>\\n               <Name>姓名</Name>\\n               <BackgroundText>姓名</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"3\\">\\n               <Text>    住院号：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\" StyleIndex=\\"3\\">\\n               <ID>住院号</ID>\\n               <Name>住院号</Name>\\n               <BackgroundText>住院号</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"11\\" />\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextBody\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>入</Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"5\\">\\n               <Text> </Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>院</Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"5\\">\\n               <Text> </Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>记</Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"5\\">\\n               <Text> </Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>录</Text>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"10\\" />\\n            <Element xsi:type=\\"XTextTable\\" NumOfRows=\\"6\\" NumOfColumns=\\"2\\">\\n               <ID>table1</ID>\\n               <XElements>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 姓名：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>姓名</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>Name333</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>姓名</Name>\\n                                 <BackgroundText>姓名</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>出生地：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>出生地</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>BirthPlace</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>出生地</Name>\\n                                 <BackgroundText>出生地</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 性别：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>性别</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>sex</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>性别</Name>\\n                                 <BackgroundText>性别</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DropdownList</EditStyle>\\n                                    <ListSource>\\n                                       <Items>\\n                                          <Item>\\n                                             <Text>男</Text>\\n                                             <Value>1</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>女</Text>\\n                                             <Value>2</Value>\\n                                          </Item>\\n                                       </Items>\\n                                    </ListSource>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>  </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>职业：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>职业</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>Job</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>职业</Name>\\n                                 <BackgroundText>职业</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 年龄：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>年龄</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                    <ValueType>Integer</ValueType>\\n                                    <CheckMaxValue>true</CheckMaxValue>\\n                                    <CheckMinValue>true</CheckMinValue>\\n                                    <MaxValue>120</MaxValue>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>Age</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>年龄</Name>\\n                                 <BackgroundText>年龄</BackgroundText>\\n                                 <FieldSettings>\\n                                    <EditStyle>Numeric</EditStyle>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>岁</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>入院时间：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>入院时间</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>indate</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>入院时间</Name>\\n                                 <DisplayFormat>\\n                                    <Style>DateTime</Style>\\n                                    <Format>yyyy-MM-dd HH:mm:ss</Format>\\n                                 </DisplayFormat>\\n                                 <BackgroundText>入院时间</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DateTime</EditStyle>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 民族：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\" StyleIndex=\\"7\\">\\n                                 <ID>民族</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>mingzu</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>民族</Name>\\n                                 <BackgroundText>民族</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DropdownList</EditStyle>\\n                                    <ListSource>\\n                                       <Items>\\n                                          <Item>\\n                                             <Text>汉族</Text>\\n                                             <Value>01</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>蒙古族</Text>\\n                                             <Value>02</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>回族</Text>\\n                                             <Value>03</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>藏族</Text>\\n                                             <Value>04</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>维吾尔族</Text>\\n                                             <Value>05</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>苗族</Text>\\n                                             <Value>06</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>彝族</Text>\\n                                             <Value>07</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>壮族</Text>\\n                                             <Value>08</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>布依族</Text>\\n                                             <Value>09</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>朝鲜族</Text>\\n                                             <Value>10</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>满族</Text>\\n                                             <Value>11</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>侗族</Text>\\n                                             <Value>12</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>瑶族</Text>\\n                                             <Value>13</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>白族</Text>\\n                                             <Value>14</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>土家族</Text>\\n                                             <Value>15</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>哈尼族</Text>\\n                                             <Value>16</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>哈萨克族</Text>\\n                                             <Value>17</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>傣族</Text>\\n                                             <Value>18</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>黎族</Text>\\n                                             <Value>19</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>傈僳族</Text>\\n                                             <Value>20</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>佤族</Text>\\n                                             <Value>21</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>畲族</Text>\\n                                             <Value>22</Value>\\n                                          </Item>\\n                                       </Items>\\n                                    </ListSource>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\" StyleIndex=\\"7\\">\\n                                 <Text> </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>记录时间：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>记录时间</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>recorddate</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>记录时间</Name>\\n                                 <BackgroundText>记录时间</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DateTime</EditStyle>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 婚姻：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>婚姻</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>marriage</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>婚姻</Name>\\n                                 <BackgroundText>婚姻</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DropdownList</EditStyle>\\n                                    <ListSource>\\n                                       <Items>\\n                                          <Item>\\n                                             <Text>未婚</Text>\\n                                             <Value>0</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>已婚</Text>\\n                                             <Value>1</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>离异</Text>\\n                                             <Value>2</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>丧偶</Text>\\n                                             <Value>3</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>其他</Text>\\n                                             <Value>4</Value>\\n                                          </Item>\\n                                       </Items>\\n                                    </ListSource>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>  </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>病史陈述者：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>病史陈述者</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>patientname</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>病史陈述者</Name>\\n                                 <BackgroundText>病史陈述者</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 发病节气：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>发病季节</ID>\\n                                 <Name>发病节气</Name>\\n                                 <BackgroundText>发病节气</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n               </XElements>\\n               <Columns>\\n                  <Element xsi:type=\\"XTextTableColumn\\">\\n                     <Width>937.375</Width>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableColumn\\">\\n                     <Width>957.375</Width>\\n                  </Element>\\n               </Columns>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"9\\" />\\n            <Element xsi:type=\\"XString\\">\\n               <Text>                                                     医师签名：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>医师签名</ID>\\n               <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n               <SpecifyWidth>236.22</SpecifyWidth>\\n               <Name>医师签名</Name>\\n               <BackgroundText>医师签名</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"9\\" />\\n            <Element xsi:type=\\"XParagraphFlag\\" />\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooter\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>                                   第</Text>\\n            </Element>\\n            <Element xsi:type=\\"XPageInfo\\" StyleIndex=\\"8\\">\\n               <Width>85</Width>\\n               <AutoHeight>true</AutoHeight>\\n               <Height>62.734</Height>\\n               <FormatString>[%PageIndex%]</FormatString>\\n            </Element>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>页</Text>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" />\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextHeaderForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"0\\">\\n               <AutoCreate>true</AutoCreate>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooterForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements />\\n      </Element>\\n   </XElements>\\n   <FileName>Test\\\\演示文档\\\\常规文档\\\\入院记录通用测试.xml</FileName>\\n   <FileFormat>XML</FileFormat>\\n   <ContentStyles>\\n      <Default xsi:type=\\"DocumentContentStyle\\">\\n         <FontName>宋体</FontName>\\n         <FontSize>12</FontSize>\\n      </Default>\\n      <Styles>\\n         <Style Index=\\"0\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"1\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>15</FontSize>\\n            <Bold>true</Bold>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"2\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>15</FontSize>\\n            <Bold>true</Bold>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"3\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <BorderLeft>true</BorderLeft>\\n            <BorderBottom>true</BorderBottom>\\n            <BorderTop>true</BorderTop>\\n            <BorderRight>true</BorderRight>\\n         </Style>\\n         <Style Index=\\"4\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>18</FontSize>\\n            <Bold>true</Bold>\\n         </Style>\\n         <Style Index=\\"5\\">\\n            <FontName>Times New Roman</FontName>\\n            <FontSize>18</FontSize>\\n            <Bold>true</Bold>\\n         </Style>\\n         <Style Index=\\"6\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <BorderWidth>1</BorderWidth>\\n            <PaddingLeft>15</PaddingLeft>\\n            <PaddingTop>10</PaddingTop>\\n            <PaddingRight>12.5</PaddingRight>\\n            <PaddingBottom>10</PaddingBottom>\\n         </Style>\\n         <Style Index=\\"7\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>10.5</FontSize>\\n         </Style>\\n         <Style Index=\\"8\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n         </Style>\\n         <Style Index=\\"9\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>Space1pt5</LineSpacingStyle>\\n         </Style>\\n         <Style Index=\\"10\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>Space1pt5</LineSpacingStyle>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"11\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>SpaceMultiple</LineSpacingStyle>\\n            <LineSpacing>1.2</LineSpacing>\\n         </Style>\\n         <Style Index=\\"12\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>SpaceMultiple</LineSpacingStyle>\\n            <LineSpacing>1.2</LineSpacing>\\n            <Align>Center</Align>\\n         </Style>\\n      </Styles>\\n   </ContentStyles>\\n   <DocumentContentVersion>8</DocumentContentVersion>\\n   <Info>\\n      <LicenseText>都昌:都昌WEB旗舰版演示</LicenseText>\\n      <CreationTime>1980-01-01T00:00:00+08:00</CreationTime>\\n      <LastModifiedTime>2026-03-26T19:34:04+08:00</LastModifiedTime>\\n      <LastPrintTime>1980-01-01T00:00:00+08:00</LastPrintTime>\\n      <Operator>DCSoft.Writer Version:1.2019.1.4</Operator>\\n      <NumOfPage>1</NumOfPage>\\n   </Info>\\n   <BodyText>入 院 记 录\\n\\n 姓名：姓名  出生地：出生地 \\n 性别：性别   职业：职业 \\n 年龄：年龄岁 入院时间：入院时间 \\n 民族：民族  记录时间：记录时间 \\n 婚姻：婚姻   病史陈述者：病史陈述者 \\n 发病节气：发病节气   \\n                                                     医师签名：医师签名\\n</BodyText>\\n   <PageSettings>\\n      <LeftMargin>95</LeftMargin>\\n      <RightMargin>95</RightMargin>\\n   </PageSettings>\\n</XTextDocument>", "meta": {"mode": "view", "editor": "dcwriter5", "version": "1.0", "imported_at": "2026-03-26T19:44:39", "source_file": "/Users/ccy/Downloads/入院记录通用测试.xml"}}	t	2026-03-26 19:44:31.660187	2026-03-26 19:44:39.723909
16	T_TEST_DEPT001	内科模版	OUTPATIENT	DEPARTMENT	{"xml": "\\n<XTextDocument xmlns:xsd=\\"http://www.w3.org/2001/XMLSchema\\" xmlns:xsi=\\"http://www.w3.org/2001/XMLSchema-instance\\" EditorVersionString=\\"1.0.0.0\\">\\n   <XElements>\\n      <Element xsi:type=\\"XTextHeader\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"0\\">\\n               <AutoCreate>true</AutoCreate>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextBody\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>内科测试</Text>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooter\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements />\\n      </Element>\\n      <Element xsi:type=\\"XTextHeaderForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"0\\">\\n               <AutoCreate>true</AutoCreate>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooterForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements />\\n      </Element>\\n   </XElements>\\n   <ContentStyles>\\n      <Default xsi:type=\\"DocumentContentStyle\\">\\n         <FontName>宋体</FontName>\\n         <FontSize>12</FontSize>\\n      </Default>\\n      <Styles>\\n         <Style Index=\\"0\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <Align>Center</Align>\\n         </Style>\\n      </Styles>\\n   </ContentStyles>\\n   <DocumentContentVersion>13</DocumentContentVersion>\\n   <Info>\\n      <CreationTime>1980-01-01T00:00:00+08:00</CreationTime>\\n      <LastModifiedTime>2026-03-26T21:40:29+08:00</LastModifiedTime>\\n      <LastPrintTime>1980-01-01T00:00:00+08:00</LastPrintTime>\\n      <Operator>DCSoft.Writer Version:1.0.0.0</Operator>\\n      <NumOfPage>1</NumOfPage>\\n   </Info>\\n   <BodyText>内科测试</BodyText>\\n   <PageSettings />\\n</XTextDocument>", "meta": {"mode": "edit", "editor": "dcwriter5", "version": "1.0", "bindings": [], "dragDropReady": true, "insertion_mode": "popup"}}	t	2026-03-26 21:40:30.075093	2026-03-26 21:40:30.075093
17	T_TEST_DEPT003	骨科测试模版	OUTPATIENT	DEPARTMENT	{"xml": "\\n<XTextDocument xmlns:xsd=\\"http://www.w3.org/2001/XMLSchema\\" xmlns:xsi=\\"http://www.w3.org/2001/XMLSchema-instance\\" EditorVersionString=\\"1.0.0.0\\">\\n   <XElements>\\n      <Element xsi:type=\\"XTextHeader\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"0\\">\\n               <AutoCreate>true</AutoCreate>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextBody\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>骨科1111111</Text>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooter\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements />\\n      </Element>\\n      <Element xsi:type=\\"XTextHeaderForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"0\\">\\n               <AutoCreate>true</AutoCreate>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooterForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements />\\n      </Element>\\n   </XElements>\\n   <ContentStyles>\\n      <Default xsi:type=\\"DocumentContentStyle\\">\\n         <FontName>宋体</FontName>\\n         <FontSize>12</FontSize>\\n      </Default>\\n      <Styles>\\n         <Style Index=\\"0\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <Align>Center</Align>\\n         </Style>\\n      </Styles>\\n   </ContentStyles>\\n   <DocumentContentVersion>25</DocumentContentVersion>\\n   <Info>\\n      <CreationTime>1980-01-01T00:00:00+08:00</CreationTime>\\n      <LastModifiedTime>2026-03-26T21:41:13+08:00</LastModifiedTime>\\n      <LastPrintTime>1980-01-01T00:00:00+08:00</LastPrintTime>\\n      <Operator>DCSoft.Writer Version:1.0.0.0</Operator>\\n      <NumOfPage>1</NumOfPage>\\n   </Info>\\n   <BodyText>骨科1111111</BodyText>\\n   <PageSettings />\\n</XTextDocument>", "meta": {"mode": "edit", "editor": "dcwriter5", "version": "1.0", "bindings": [], "dragDropReady": true, "insertion_mode": "popup"}}	t	2026-03-26 21:41:13.646439	2026-03-26 21:41:13.646439
18	T_TEST_DEPT003_02	骨科测试2	OUTPATIENT	DEPARTMENT	{"xml": "\\n<XTextDocument xmlns:xsd=\\"http://www.w3.org/2001/XMLSchema\\" xmlns:xsi=\\"http://www.w3.org/2001/XMLSchema-instance\\" EditorVersionString=\\"1.0.0.0\\">\\n   <XElements>\\n      <Element xsi:type=\\"XTextHeader\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"0\\">\\n               <AutoCreate>true</AutoCreate>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextBody\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>骨科测试222222</Text>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooter\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements />\\n      </Element>\\n      <Element xsi:type=\\"XTextHeaderForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"0\\">\\n               <AutoCreate>true</AutoCreate>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooterForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements />\\n      </Element>\\n   </XElements>\\n   <ContentStyles>\\n      <Default xsi:type=\\"DocumentContentStyle\\">\\n         <FontName>宋体</FontName>\\n         <FontSize>12</FontSize>\\n      </Default>\\n      <Styles>\\n         <Style Index=\\"0\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <Align>Center</Align>\\n         </Style>\\n      </Styles>\\n   </ContentStyles>\\n   <DocumentContentVersion>23</DocumentContentVersion>\\n   <Info>\\n      <CreationTime>1980-01-01T00:00:00+08:00</CreationTime>\\n      <LastModifiedTime>2026-03-26T21:41:44+08:00</LastModifiedTime>\\n      <LastPrintTime>1980-01-01T00:00:00+08:00</LastPrintTime>\\n      <Operator>DCSoft.Writer Version:1.0.0.0</Operator>\\n      <NumOfPage>1</NumOfPage>\\n   </Info>\\n   <BodyText>骨科测试222222</BodyText>\\n   <PageSettings />\\n</XTextDocument>", "meta": {"mode": "edit", "editor": "dcwriter5", "version": "1.0", "bindings": [], "dragDropReady": true, "insertion_mode": "popup"}}	t	2026-03-26 21:41:44.308373	2026-03-26 21:41:44.308373
1774525597818	TEMPLATE_TEST_01	测试模版01	OUTPATIENT	HOSPITAL	{"xml": "\\n<XTextDocument xmlns:xsd=\\"http://www.w3.org/2001/XMLSchema\\" xmlns:xsi=\\"http://www.w3.org/2001/XMLSchema-instance\\" EditorVersionString=\\"1.0.0.0\\">\\n   <XElements>\\n      <Element xsi:type=\\"XTextHeader\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"0\\">\\n               <AutoCreate>true</AutoCreate>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextBody\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>123123123</Text>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooter\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements />\\n      </Element>\\n      <Element xsi:type=\\"XTextHeaderForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"0\\">\\n               <AutoCreate>true</AutoCreate>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooterForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements />\\n      </Element>\\n   </XElements>\\n   <FileFormat>XML</FileFormat>\\n   <ContentStyles>\\n      <Default xsi:type=\\"DocumentContentStyle\\">\\n         <FontName>宋体</FontName>\\n         <FontSize>12</FontSize>\\n      </Default>\\n      <Styles>\\n         <Style Index=\\"0\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <Align>Center</Align>\\n         </Style>\\n      </Styles>\\n   </ContentStyles>\\n   <DocumentContentVersion>11</DocumentContentVersion>\\n   <Info>\\n      <CreationTime>1980-01-01T00:00:00+08:00</CreationTime>\\n      <LastModifiedTime>2026-03-26T21:07:14+08:00</LastModifiedTime>\\n      <LastPrintTime>1980-01-01T00:00:00+08:00</LastPrintTime>\\n      <Operator>DCSoft.Writer Version:1.0.0.0</Operator>\\n      <NumOfPage>1</NumOfPage>\\n   </Info>\\n   <BodyText>123123123</BodyText>\\n   <PageSettings />\\n</XTextDocument>", "meta": {"mode": "edit", "editor": "dcwriter5", "version": "1.0", "bindings": [], "dragDropReady": true, "insertion_mode": "popup"}}	f	2026-03-26 19:46:37.848454	2026-03-26 21:07:14.532184
\.


--
-- Data for Name: doctor_favorite_template; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.doctor_favorite_template (id, doctor_code, template_code, create_time) FROM stdin;
1774532637733	DOC002	T_TEST_DEPT003_02	2026-03-26 21:43:57.754272
\.


--
-- Data for Name: emr_data_element; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.emr_data_element (id, element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code, is_required, default_value, enabled, created_at, updated_at) FROM stdin;
62	DE99.09.011.70	控制小便_5		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
63	DE99.09.011.71	控制大便_1		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
64	DE99.09.011.72	控制大便_2		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
65	DE99.09.011.73	控制大便_3		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
66	DE99.09.011.74	控制大便_4		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
67	DE99.09.011.75	控制大便_5		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
68	DE99.09.011.76	穿衣_1		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
69	DE99.09.011.77	穿衣_2		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
70	DE99.09.011.78	穿衣_3		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
71	DE99.09.011.79	穿衣_4		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
72	DE99.09.011.80	穿衣_5		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
73	DE99.09.011.81	修饰_1		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
74	DE99.09.011.82	修饰_2		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
75	DE99.09.011.83	修饰_3		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
76	DE99.09.011.84	修饰_4		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
77	DE99.09.011.85	修饰_5		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
78	DE99.09.011.86	洗澡_1		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
79	DE99.09.011.87	洗澡_2		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
80	DE99.09.011.88	洗澡_3		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
81	DE99.09.011.90	签名1		S1	A	50	\N	f	\N	t	2026-03-25 18:52:58.748696	2026-03-25 18:52:58.748696
82	DE01.00.004.00	病案号	本医疗机构为患者住院病案设置的唯一性编码。原则上，同一患者在同一医疗机构多次住院应当使用同一病案号	S1	AN	18	\N	f	\N	t	2026-03-25 18:53:21.977736	2026-03-25 18:53:21.977736
83	DE01.00.005.00	病理号	按照一定的编码规则赋予病理标本的编号	S1	AN	18	\N	f	\N	t	2026-03-25 18:53:21.989223	2026-03-25 18:53:21.989223
84	DE01.00.008.00	电子申请单编号	按照某一特定编码规则赋予电子申请单的顺序号	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:21.990212	2026-03-25 18:53:21.990212
85	DE01.00.009.00	居民健康卡号	城乡居民个人健康档案的编号	S1	N	17	\N	f	\N	t	2026-03-25 18:53:21.990701	2026-03-25 18:53:21.990701
86	DE01.00.010.00	急诊号	按照某一特定编码规则赋予门（急）诊就诊对象的顺序号	S1	AN	18	\N	f	\N	t	2026-03-25 18:53:21.991062	2026-03-25 18:53:21.991062
87	DE01.00.014.00	住院号	按照某一特定编码规则赋予住院就诊对象的顺序号	S1	AN	18	\N	f	\N	t	2026-03-25 18:53:21.991485	2026-03-25 18:53:21.991485
88	DE01.00.016.00	参加麻醉安全保险标志	标识患者是否同意参加麻醉安全保险的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:21.991784	2026-03-25 18:53:21.991784
89	DE01.00.018.00	检查报告单编号	按照某一特定编码规则赋予检査报告单的顺序号	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:21.9921	2026-03-25 18:53:21.9921
90	DE01.00.018.00.001	检验报告单编号	按照某一特定编码规则赋予检验报告单的顺序号	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:21.992419	2026-03-25 18:53:21.992419
91	DE01.00.019.00	病房号	患者住院期间，所住病房对应的编号	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:21.992842	2026-03-25 18:53:21.992842
92	DE01.00.019.00.003	入院病房	患者人院时，所住病房对应的编号	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:21.994044	2026-03-25 18:53:21.994044
93	DE01.00.019.00.004	出院病房	患者出院时，所住病房对应的编号	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:21.994457	2026-03-25 18:53:21.994457
94	DE01.00.020.00	处方编号	按照某一特定编码规则赋予门（急）诊处方的顺序号	S1	N	30	\N	f	\N	t	2026-03-25 18:53:21.994825	2026-03-25 18:53:21.994825
95	DE01.00.021.00	健康卡号	患者持有的全国统一的居民健康卡的编号	S1	AN	18	\N	f	\N	t	2026-03-25 18:53:21.995465	2026-03-25 18:53:21.995465
96	DE01.00.023.00	血袋编码	按照特定编码规则赋予血袋的顺序号	S1	N	10	\N	f	\N	t	2026-03-25 18:53:21.996018	2026-03-25 18:53:21.996018
97	DE01.00.026.00	床位号	患者住院期间，所住床位对应的编号	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:21.996668	2026-03-25 18:53:21.996668
98	DE02.01.004.00	工作单位名称	患者在就诊前的工作单位名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:21.997183	2026-03-25 18:53:21.997183
99	DE02.01.005.01	出生日期	患者出生当日的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:21.99754	2026-03-25 18:53:21.99754
100	DE02.01.009.01	地址_省	患者本人或联系人地址中的省、自治区或直辖市名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:21.997957	2026-03-25 18:53:21.997957
101	DE02.01.009.01.007	出生地_省	患者出生时所在地点的省、自治区或直辖市名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:21.998381	2026-03-25 18:53:21.998381
102	DE02.01.009.01.008	籍贯_省	患者祖居地或原籍所在地的省、自治区或直辖市名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:21.998781	2026-03-25 18:53:21.998781
103	DE02.01.009.01.009	住址_省	患者来院前近期的常住地址的省、自治区或直辖市名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:21.999311	2026-03-25 18:53:21.999311
104	DE02.01.009.01.010	户籍_省	患者户籍登记所在地址的省、自治区或直辖市名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:21.999657	2026-03-25 18:53:21.999657
105	DE02.01.009.01.011	单位_省	患者当前所在的工作单位地址的省、自治区或直辖市名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.000088	2026-03-25 18:53:22.000088
106	DE02.01.009.01.012	联系人_省	联系人当前常驻地址或工作单位地址的省、自治区或直辖市名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.000576	2026-03-25 18:53:22.000576
107	DE02.01.009.02	地址_市	患者本人或联系人地址中的市、地区或州的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.000929	2026-03-25 18:53:22.000929
108	DE02.01.009.02.006	出生地_市	患者出生时所在地点的市、地区或州的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.001251	2026-03-25 18:53:22.001251
109	DE02.01.009.02.007	籍贯_市	患者祖居地或原籍所在地的市、地区或州的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.001777	2026-03-25 18:53:22.001777
110	DE02.01.009.02.008	住址_市	患者来院前近期的常住地址的市、地区或州的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.002113	2026-03-25 18:53:22.002113
111	DE02.01.009.02.009	户籍_市	患者户籍登记所在地址的市、地区或州的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.002439	2026-03-25 18:53:22.002439
112	DE02.01.009.02.010	单位_市	患者当前所在的工作单位地址的市、地区或州的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.002822	2026-03-25 18:53:22.002822
113	DE02.01.009.02.011	联系人_市	联系人当前常驻地址或工作单位地址的市、地区或州的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.003242	2026-03-25 18:53:22.003242
114	DE02.01.009.03	地址_县	患者本人或联系人地址中的县（区）的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.003677	2026-03-25 18:53:22.003677
115	DE02.01.009.03.005	联系人_县	联系人当前常驻地址或工作单位地址的县(区）的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.004221	2026-03-25 18:53:22.004221
116	DE02.01.009.03.006	出生地_县	患者出生时所在地点的县（区）的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.004519	2026-03-25 18:53:22.004519
117	DE02.01.009.03.007	住址_县	患者来院前近期的常住地址的县（区）的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.004873	2026-03-25 18:53:22.004873
118	DE02.01.009.03.008	户籍_县	患者户籍登记所在地址的县（区）的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.005456	2026-03-25 18:53:22.005456
119	DE02.01.009.03.009	单位_县	患者当前所在的工作单位地址的县（区）的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.005801	2026-03-25 18:53:22.005801
120	DE02.01.009.04	地址_乡	患者本人或联系人地址中的乡、镇或城市的街道办事处名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.00618	2026-03-25 18:53:22.00618
121	DE02.01.009.04.005	住址_乡	患者来院前近期的常住地址的乡、镇或城市的街道办事处名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.006507	2026-03-25 18:53:22.006507
122	DE02.01.009.04.006	户籍_乡	患者户籍登记所在地址的乡、镇或城市的街道办事处名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.006836	2026-03-25 18:53:22.006836
123	DE02.01.009.04.007	单位_乡	患者当前所在的工作单位地址的乡、镇或城市的街道办事处名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.007232	2026-03-25 18:53:22.007232
124	DE02.01.009.04.008	联系人地址_乡	联系人当前常驻地址或工作单位地址的乡、镇或城市的街道办事处名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.007629	2026-03-25 18:53:22.007629
125	DE02.01.009.05	地址_村	患者本人或联系人地址中的村或城市的街、路、里、弄等名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.007938	2026-03-25 18:53:22.007938
126	DE02.01.009.05.005	住址_村	患者来院前近期的常住地址的村或城市的街、路、里、弄等名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.008303	2026-03-25 18:53:22.008303
127	DE02.01.009.05.006	户籍_村	患者户籍登记所在地址的村或城市的街、路、里、弄等名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.008644	2026-03-25 18:53:22.008644
128	DE02.01.009.05.007	单位_村	患者当前所在的工作单位地址的村或城市的街、路、里、弄等名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.008992	2026-03-25 18:53:22.008992
129	DE02.01.009.05.008	联系人地址_村	联系人当前常驻地址或工作单位地址的村或城市的街、路、里、弄等名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.009416	2026-03-25 18:53:22.009416
130	DE02.01.009.06	地址_门牌号码	患者本人或联系人地址中的门牌号码	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.009813	2026-03-25 18:53:22.009813
131	DE02.01.009.06.002	户籍地址街道	患者户籍登记所在地址的门牌号码	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.010676	2026-03-25 18:53:22.010676
132	DE02.01.009.06.005	住址_门牌号码	患者来院前近期的常住地址的门牌号码	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.011095	2026-03-25 18:53:22.011095
133	DE02.01.009.06.007	单位_门牌号码	患者当前所在的工作单位地址的门牌号码	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.011417	2026-03-25 18:53:22.011417
134	DE02.01.009.06.008	联系人地址_门牌号码	联系人当前常驻地址或工作单位地址的门牌号码	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.011814	2026-03-25 18:53:22.011814
135	DE02.01.010.00	医疗机构联系电话	医疗机构的电话号码，包括国际、国内区号和分机号	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.012165	2026-03-25 18:53:22.012165
136	DE02.01.010.00.001	医疗机构负责人联系电话	医疗机构负责人的电话号码，包括国际、国内区号和分机号	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.012452	2026-03-25 18:53:22.012452
137	DE02.01.010.00.009	电话号码	患者本人或联系人的联系电话号码，包括国际、国内区号和分机号	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.012865	2026-03-25 18:53:22.012865
138	DE02.01.010.00.015	患者电话号码	患者本人的电话号码，包括国际、国内区号和分机号	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.0132	2026-03-25 18:53:22.0132
139	DE02.01.010.00.016	单位电话	患者当前所在的工作单位的电话号码，包括国际、国内区号和分机号	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.013484	2026-03-25 18:53:22.013484
140	DE02.01.010.00.017	联系人电话	联系人的电话号码，包括国际、国内区号和分机号	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.013916	2026-03-25 18:53:22.013916
141	DE02.01.012.00	患者电子邮件地址	患者的电子邮箱地址	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.014312	2026-03-25 18:53:22.014312
142	DE02.01.014.00	胎儿娩出日期时间	胎儿娩出时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.01464	2026-03-25 18:53:22.01464
143	DE02.01.018.00	婚姻状况代码	患者当前婚姻状况在特定编码体系中的代码	S3	N2	\N	WT01.01.007	f	\N	t	2026-03-25 18:53:22.015213	2026-03-25 18:53:22.015213
144	DE02.01.024.00	地址类别代码	患者本人或联系人地址类别在特定编码体系中的代码	S3	N2	\N	CV02.01.205	f	\N	t	2026-03-25 18:53:22.015682	2026-03-25 18:53:22.015682
145	DE02.01.025.00	民族	患者所厲民族在特定编码体系中的代码	S3	N2	\N	WT01.01.002	f	\N	t	2026-03-25 18:53:22.016208	2026-03-25 18:53:22.016208
146	DE02.01.026.00	年龄	患者年龄满1周岁的实足年龄，为患者出生后按照日历计算的历法年龄，以实足年龄的相应整数填写	N	N1	3	\N	f	\N	t	2026-03-25 18:53:22.016775	2026-03-25 18:53:22.016775
147	DE02.01.030.00	身份证号码	患者的身份证件上的唯一法定标识符	S1	AN	18	\N	f	\N	t	2026-03-25 18:53:22.01719	2026-03-25 18:53:22.01719
148	DE02.01.031.00	身份证件类别代码	患者身份证件所属类别在特定编码体系中的代码	S3	N2	\N	\N	f	\N	t	2026-03-25 18:53:22.01861	2026-03-25 18:53:22.01861
149	DE02.01.032.00	年龄_月	年龄不足1周岁的实足年龄的月龄，以分数形式表示:分数的整数部分代表实足月龄，分数部分分母为30,分子为不足1个月的天数	S1	AN	8	\N	f	\N	t	2026-03-25 18:53:22.019182	2026-03-25 18:53:22.019182
150	DE02.01.036.00	死亡日期时间	患者死亡时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.019753	2026-03-25 18:53:22.019753
151	DE02.01.039.00	姓名	患者本人在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.02022	2026-03-25 18:53:22.02022
152	DE02.01.039.00.015	接生人员签名	接生人员签署的在公安户籍管理部门正式登S注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.020744	2026-03-25 18:53:22.020744
153	DE02.01.039.00.018	交班者签名	交班者在文书上签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.021157	2026-03-25 18:53:22.021157
154	DE02.01.039.00.019	接班者签名	接班者签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.021588	2026-03-25 18:53:22.021588
155	DE02.01.039.00.020	责任医师姓名	负责患者诊疗的主治医师以上的医师在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.022142	2026-03-25 18:53:22.022142
156	DE02.01.039.00.023	转诊医师姓名	转诊医师在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.023075	2026-03-25 18:53:22.023075
157	DE02.01.039.00.025	医嘱审核者签名	对医嘱进行审核的人员签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.023847	2026-03-25 18:53:22.023847
158	DE02.01.039.00.031	医疗机构负责人_法人_姓名	医疗机构负责人在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.024339	2026-03-25 18:53:22.024339
159	DE02.01.039.00.032	转出医师签名	转出医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.024707	2026-03-25 18:53:22.024707
160	DE02.01.039.00.033	转入医师签名	患者转入科室的相关医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.02523	2026-03-25 18:53:22.02523
161	DE02.01.039.00.036	经治医师签名	经治医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.025612	2026-03-25 18:53:22.025612
162	DE02.01.039.00.044	检查技师签名	检査技师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.025956	2026-03-25 18:53:22.025956
163	DE02.01.039.00.045	检查医师签名	检查医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.026368	2026-03-25 18:53:22.026368
164	DE02.01.039.00.051	出院医嘱开立人签名	开立出院医嘱人员签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.026704	2026-03-25 18:53:22.026704
165	DE02.01.039.00.074	会诊申请医师签名	申请会诊的医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.027063	2026-03-25 18:53:22.027063
166	DE02.01.039.00.075	会诊医师签名	会诊医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.027389	2026-03-25 18:53:22.027389
167	DE02.01.039.00.092	记录人签名	记录单填写者签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.027731	2026-03-25 18:53:22.027731
168	DE02.01.039.00.095	医嘱开立者签名	开立医嘱的人员签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.028068	2026-03-25 18:53:22.028068
169	DE02.01.039.00.096	医嘱审核人签名	对医嘱进行审核的人员签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.02855	2026-03-25 18:53:22.02855
170	DE02.01.039.00.097	核对医嘱护士签名	核对护士签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.028869	2026-03-25 18:53:22.028869
171	DE02.01.039.00.099	停止医嘱者签名	停止医嘱人员签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.029303	2026-03-25 18:53:22.029303
172	DE02.01.039.00.100	取消医嘱者签名	取消医嘱的人员签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.029653	2026-03-25 18:53:22.029653
173	DE02.01.039.00.101	检验技师签名	检验技师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.029969	2026-03-25 18:53:22.029969
174	DE02.01.039.00.102	检验医师签名	检验医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.030325	2026-03-25 18:53:22.030325
175	DE02.01.039.00.103	报告医师签名	做出报告的医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.030685	2026-03-25 18:53:22.030685
176	DE02.01.039.00.104	审核医师签名	审核医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.031112	2026-03-25 18:53:22.031112
177	DE02.01.039.00.111	产妇姓名	产妇在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.031424	2026-03-25 18:53:22.031424
178	DE02.01.039.00.112	手术医生签名	为产妇实施手术的主要执行人员签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.031892	2026-03-25 18:53:22.031892
179	DE02.01.039.00.113	麻醉医生签名	对产妇实施麻醉的麻醉医生签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.032258	2026-03-25 18:53:22.032258
180	DE02.01.039.00.115	手术助手签名	手术助手签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.032624	2026-03-25 18:53:22.032624
181	DE02.01.039.00.116	儿科医生签名	儿科医生签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.033173	2026-03-25 18:53:22.033173
182	DE02.01.039.00.117	记录人员签名	记录单填写人员签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.033535	2026-03-25 18:53:22.033535
183	DE02.01.039.00.119	科主任签名	患者出院时所在科室的科主任签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.033854	2026-03-25 18:53:22.033854
184	DE02.01.039.00.120	主任_副主任_医师签名	患者出院时所在科室的具有副主任医师以上专业技术职务任职资格的医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.034225	2026-03-25 18:53:22.034225
185	DE02.01.039.00.124	进修医师签名	在患者出院时所在科室进修并参与患者诊治的进修医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.034556	2026-03-25 18:53:22.034556
186	DE02.01.039.00.125	实习医师签名	在患者出院时所在科室实习并参与患者诊治的实习医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.034968	2026-03-25 18:53:22.034968
187	DE02.01.039.00.126	编码员签名	负责病案编目的分类人员签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.035338	2026-03-25 18:53:22.035338
188	DE02.01.039.00.127	质控医师签名	对病案终末质量进行检查的医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.035869	2026-03-25 18:53:22.035869
189	DE02.01.039.00.128	质控护士签名	对病案终末质量进行检査的护士签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.03655	2026-03-25 18:53:22.03655
190	DE02.01.039.00.137	主持人姓名	疑难病例讨论的主持人在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.036969	2026-03-25 18:53:22.036969
191	DE02.01.039.00.140	患者_法定代理人签名	患者本人或法定代理人签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.037322	2026-03-25 18:53:22.037322
192	DE02.01.039.00.143	建档者姓名	首次为患者建立电子病历的人员在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.037632	2026-03-25 18:53:22.037632
193	DE02.01.039.00.144	联系人姓名	指联系人在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.038022	2026-03-25 18:53:22.038022
194	DE02.01.039.00.145	责任护士签名	患者出院时所在的，并已开展责任制护理的科室，负责患者整体护理的责任护士签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.038445	2026-03-25 18:53:22.038445
195	DE02.01.039.00.146	接诊护士签名	负责患者人院接诊的护士签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.038731	2026-03-25 18:53:22.038731
196	DE02.01.039.00.147	医嘱执行者签名	执行医嘱的人员签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.039111	2026-03-25 18:53:22.039111
473	DE05.10.065.00	麵眠状况	患者睡眠状况的描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.279711	2026-03-25 18:53:22.279711
197	DE02.01.039.00.149	上级医师签名	具有主治医师以上专业技术职务资格的主管医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.039512	2026-03-25 18:53:22.039512
198	DE02.01.039.00.153	器械护士姓名	器械护士在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.039901	2026-03-25 18:53:22.039901
199	DE02.01.039.00.154	巡台护士姓名	巡台护士在公安管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.040212	2026-03-25 18:53:22.040212
200	DE02.01.039.00.156	处方开立医师签名	开具门急诊处方的医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.040533	2026-03-25 18:53:22.040533
201	DE02.01.039.00.157	处方审核药剂师签名	对门急诊处方的适宜性、规范性等进行审核的药剂师(一般由具有药师以上专业技术职务资格的药师担任）签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.040944	2026-03-25 18:53:22.040944
202	DE02.01.039.00.158	处方调配药剂师签名	对门急诊处方进行调配的药剂师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.041225	2026-03-25 18:53:22.041225
203	DE02.01.039.00.159	处方核对药剂师签名	按照处方要求对调配的药物进行核对的药剂师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.041527	2026-03-25 18:53:22.041527
204	DE02.01.039.00.160	处方发药药剂师签名	按照审核、调配后的门急诊处方，给患者发药的药剂师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.041859	2026-03-25 18:53:22.041859
205	DE02.01.039.00.162	巡台护士签名	巡台护士签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.04225	2026-03-25 18:53:22.04225
206	DE02.01.039.00.163	器械护士签名	器械护士签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.042599	2026-03-25 18:53:22.042599
207	DE02.01.039.00.164	交接护士签名	病人交接时，交接护士签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.042934	2026-03-25 18:53:22.042934
208	DE02.01.039.00.165	转运者签名	病人交接时，转运者签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.043274	2026-03-25 18:53:22.043274
209	DE02.01.039.00.168	麻醉医师签名	对患者实施麻醉的麻醉医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.043616	2026-03-25 18:53:22.043616
210	DE02.01.039.00.169	病史陈述者姓名	患者病史的陈述人在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.04393	2026-03-25 18:53:22.04393
211	DE02.01.039.00.170	接诊医师签名	负责患者人院接诊的医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.044334	2026-03-25 18:53:22.044334
212	DE02.01.039.00.171	住院医师签名	患者死亡时所在科室具体负责诊治的，具有住院医师专业技术职务任职资格的医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.04462	2026-03-25 18:53:22.04462
213	DE02.01.039.00.172	主治医师签名	具有主治医师专业技术职务资格的医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.044953	2026-03-25 18:53:22.044953
214	DE02.01.039.00.173	主任医师签名	具有主任医师专业技术职务资格的医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.045517	2026-03-25 18:53:22.045517
215	DE02.01.039.00.174	手术者签名	拟对患者实施手术的医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.045921	2026-03-25 18:53:22.045921
216	DE02.01.039.00.176	患者签名	患者本人签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.04624	2026-03-25 18:53:22.04624
217	DE02.01.039.00.177	法定代理人签名	法定代理人签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.046561	2026-03-25 18:53:22.046561
218	DE02.01.039.00.178	医师签名	医师签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.046833	2026-03-25 18:53:22.046833
219	DE02.01.040.00	性别	患者生理件别在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.047184	2026-03-25 18:53:22.047184
220	DE02.01.040.00.002	新生儿性别代码	新生儿生理性别在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.047508	2026-03-25 18:53:22.047508
221	DE02.01.041.00	学历代码	患者本人受教育的最高程度类别在特定编码体系中的代码	S3	N2	\N	\N	f	\N	t	2026-03-25 18:53:22.0478	2026-03-25 18:53:22.0478
222	DE02.01.044.00	医疗保险类别代码	患者本人参加的医疗保险类别在特定编码体系中的代码	S3	N2	\N	CV02.01.204	f	\N	t	2026-03-25 18:53:22.048115	2026-03-25 18:53:22.048115
223	DE02.01.047.00	住址邮编	患者来院前近期的常住地址的邮政编码	S1	N	6	\N	f	\N	t	2026-03-25 18:53:22.048453	2026-03-25 18:53:22.048453
224	DE02.01.047.00.004	户籍邮编	患者户籍登记所在地址的邮政编码	S1	N	6	\N	f	\N	t	2026-03-25 18:53:22.049108	2026-03-25 18:53:22.049108
225	DE02.01.047.00.005	单位邮编	患者当前所在的工作单位地址的邮政编码	S1	N	6	\N	f	\N	t	2026-03-25 18:53:22.049619	2026-03-25 18:53:22.049619
226	DE02.01.047.00.006	邮政编码	由阿拉伯数字组成，用来表示与医疗机构地址对应的邮局及其投递区域的邮政通信代号	S1	N	6	\N	f	\N	t	2026-03-25 18:53:22.050086	2026-03-25 18:53:22.050086
227	DE02.01.052.00	职业类别代码	患者当前从事的职业类别在特定编码体系中的代码	S3	N2	\N	WT01.01.006	f	\N	t	2026-03-25 18:53:22.050456	2026-03-25 18:53:22.050456
228	DE02.01.060.00	患者类型代码	患者就诊类型的分类代码	S3	N1	\N	CV09.00.404	f	\N	t	2026-03-25 18:53:22.050892	2026-03-25 18:53:22.050892
229	DE02.01.079.00	特殊检查标志	标识患者有无特殊检査操作经历的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.051261	2026-03-25 18:53:22.051261
230	DE02.0l.039.00	产程检查者签名	进行产程记录的检査者签署的在公安户籍管理部门正式登记注册的姓氏和名称	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.051555	2026-03-25 18:53:22.051555
231	DE02.10.002.00	产次	产妇分娩总次数，包括28周后的引产，双多胎分娩只计1次	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.051867	2026-03-25 18:53:22.051867
232	DE02.10.008.00	传染病史	患者既往所患各种急性或慢性传染性疾病名称的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.052343	2026-03-25 18:53:22.052343
233	DE02.10.011.00	计划选取的分娩方式代码	计划选取的分娩方式类别在特定编码体系中的代码	S3	N	2	\N	f	\N	t	2026-03-25 18:53:22.052708	2026-03-25 18:53:22.052708
234	DE02.10.022.00	过敏药物	患者既往发生过敏情况的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.053157	2026-03-25 18:53:22.053157
235	DE02.10.023.00	药物过敏标志	标识患者有无过敏经历的标志	N	N	\N	EMR01.01.002	f	\N	t	2026-03-25 18:53:22.053509	2026-03-25 18:53:22.053509
236	DE02.10.024.00	陈述者与患者的关系代码	患者病史陈述人与患者的关系类别在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.053896	2026-03-25 18:53:22.053896
237	DE02.10.024.00.005	联系人与患者的关系代码	联系人与患者之间的关系类别代码	S3	N1	\N	WT01.01.008	f	\N	t	2026-03-25 18:53:22.054281	2026-03-25 18:53:22.054281
238	DE02.10.024.00.008	法定代理人与患者的关系代码	法定代理人与患者的关系类别在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.054742	2026-03-25 18:53:22.054742
239	DE02.10.026.00	疾病史_含外伤	对患者既往健康状况和疾病（含外伤）的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.055089	2026-03-25 18:53:22.055089
240	DE02.10.027.00	检查方法名称	患者接受医学检査项目所采用的检查方法名称	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.055523	2026-03-25 18:53:22.055523
241	DE02.10.027.00.001	检验方法名称	患者接受医学检查项目所采用的检验方法名称	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.056153	2026-03-25 18:53:22.056153
242	DE02.10.028.00	中医四诊观察结果	中医“四诊”观察结果的详细描述，包括望、闻、问、切四诊内容	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.056653	2026-03-25 18:53:22.056653
243	DE02.10.028.00.001	麻醉观察结果	多个麻醉观察项目结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.057079	2026-03-25 18:53:22.057079
244	DE02.10.028.00.007	护理观察结果	对护理观察项目结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.0575	2026-03-25 18:53:22.0575
245	DE02.10.031.00	护理观察项目名称	护理观察项目的名称，如患者神志状态、饮食情况，皮肤情况、氧疗情况、排尿排便情况，流量、出麗、人量等等，根据护理内容的不同选择不同的观察项目名称	S1	AN	30	\N	f	\N	t	2026-03-25 18:53:22.057807	2026-03-25 18:53:22.057807
246	DE02.10.051.00	末次月经日期	末次月经首日的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.058244	2026-03-25 18:53:22.058244
247	DE02.10.061.00	手术史	患者既往接受手术/操作经历的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.058546	2026-03-25 18:53:22.058546
248	DE02.10.062.00	手术史标志	标识患者有无手术经历的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.059005	2026-03-25 18:53:22.059005
249	DE02.10.071.00	现病史	对患者当前所患疾病情况的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.059318	2026-03-25 18:53:22.059318
250	DE02.10.090.00	住院次数	BP“第X次住院”指患者在本医疗机构住院诊治的次数	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.059639	2026-03-25 18:53:22.059639
251	DE02.10.097.00	个人史	患者个人生活习惯及有无烟、酒、药物等嗜好，职业与工作条件及有无工业毒物、粉尘、放射性物质接触史，有无冶游史的描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.060135	2026-03-25 18:53:22.060135
252	DE02.10.098.00	婚育史	患者婚育史的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.060432	2026-03-25 18:53:22.060432
253	DE02.10.098.00.001	既往孕产史	对产妇既往孕产史的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.060753	2026-03-25 18:53:22.060753
254	DE02.10.099.00	既往史	既往健康状况及重要相关病史的描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.061128	2026-03-25 18:53:22.061128
255	DE02.10.100.00	输血史	患者既往输血史的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.061438	2026-03-25 18:53:22.061438
256	DE02.10.101.00	预防接种史	患者预防接种情况的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.061773	2026-03-25 18:53:22.061773
257	DE02.10.102.00	月经史	患者月经史的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.062092	2026-03-25 18:53:22.062092
258	DE02.10.103.00	家族史	患者3代以内有血缘关系的家族成员中所患遗传疾病史的描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.062643	2026-03-25 18:53:22.062643
259	DE03.00.030.00	饮酒标志	标识患者是否饮酒的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.063087	2026-03-25 18:53:22.063087
260	DE03.00.053.00	日吸烟量_支	最近1个月内平均每天的吸烟量，计量单位为支	N	N	3	\N	f	\N	t	2026-03-25 18:53:22.063592	2026-03-25 18:53:22.063592
261	DE03.00.054.00	日饮酒量_mL	患者平均每天的饮酒量相当于白酒量，计量单位为mL	N	N	3	\N	f	\N	t	2026-03-25 18:53:22.063959	2026-03-25 18:53:22.063959
262	DE03.00.065.00	停止吸烟天数	患者停止吸烟的总天数，计量単位为d	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.07823	2026-03-25 18:53:22.07823
263	DE03.00.070.00	吸烟标志	标识患者是否吸烟的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.090848	2026-03-25 18:53:22.090848
264	DE03.00.073.00	吸烟状况代码	患者过去和现在吸烟情况的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.093077	2026-03-25 18:53:22.093077
265	DE03.00.076.00	饮酒频率代码	患者饮酒频率分类在特定编码体系中的代码	S3	N	2	\N	f	\N	t	2026-03-25 18:53:22.094538	2026-03-25 18:53:22.094538
266	DE03.00.080.00	饮食情况代码	患者饮食情况所M类别的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.117799	2026-03-25 18:53:22.117799
267	DE04.01.018.00	发病日期时间	疾病发病症状的首次出现的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.118513	2026-03-25 18:53:22.118513
268	DE04.01.048.00	呕吐标志	标识患者是否有呕吐症状的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.118985	2026-03-25 18:53:22.118985
269	DE04.01.051.00	排尿困难标志	标识患者是否有排尿困难症状的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.119331	2026-03-25 18:53:22.119331
270	DE04.01.108.00	孕次	妊娠次数的累计值，包括异位妊娠，计量单位为次	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.119686	2026-03-25 18:53:22.119686
271	DE04.01.117.00	相关症状	对患者相关症状的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.12008	2026-03-25 18:53:22.12008
272	DE04.01.117.00.002	症状描述	对患者出现症状的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.120443	2026-03-25 18:53:22.120443
273	DE04.01.117.00.004	出院时症状与体征	患者出院时症状和体征的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.120897	2026-03-25 18:53:22.120897
274	DE04.01.117.00.005	主要症状	患者出现的临床主要症状的描述	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.121359	2026-03-25 18:53:22.121359
275	DE04.01.118.00	症状名称	患者出现的临床主要症状的名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.121723	2026-03-25 18:53:22.121723
276	DE04.01.119.00	主诉	对患者本次疾病相关的主要症状及其持续时间的描述，一般由患者本人或监护人描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.122146	2026-03-25 18:53:22.122146
277	DE04.01.121.00	患者基础疾病	患者所患的基础疾病的描述	S1	AN	500	\N	f	\N	t	2026-03-25 18:53:22.122483	2026-03-25 18:53:22.122483
278	DE04.01.123.00	肠胀气标志	标识产妇是否有肠胀气情况的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.122833	2026-03-25 18:53:22.122833
279	DE04.10.012.00	产后出血量_mL	产妇产时和产后出血量的累计值，计量单位为mL	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.12343	2026-03-25 18:53:22.12343
280	DE04.10.012.00.001	术后出血量_mL	产妇术时和术后出血ffl的累计值，计量单位为mL	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.123725	2026-03-25 18:53:22.123725
281	DE04.10.013.00	产前检查标志	标识孕期产妇是否已进行产前检查的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.124098	2026-03-25 18:53:22.124098
282	DE04.10.018.00	新生儿出生身长	新生儿出生后第1小时内身长的测量值，计量単位为cm	N	N4	51	\N	f	\N	t	2026-03-25 18:53:22.124433	2026-03-25 18:53:22.124433
283	DE04.10.019.00	新生儿出生体重	新生儿出生后第1小时内第1次称得的重量，产妇病历和新生儿期住院的患儿都应填写产妇病历和新生儿期住院的患儿都应填写	N	N2	4	\N	f	\N	t	2026-03-25 18:53:22.124757	2026-03-25 18:53:22.124757
284	DE04.10.019.00.001	估计胎儿体重	待产吋胎儿体重的估计值。计量单位为g	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.125212	2026-03-25 18:53:22.125212
285	DE04.10.019.00.003	新生儿入院体重	新生儿患儿入院时称得的重ft，新生儿期住院的患儿应填写	N	N2	4	\N	f	\N	t	2026-03-25 18:53:22.125463	2026-03-25 18:53:22.125463
286	DE04.10.025.00	恶露状况	对产妇产后恶露检査结果的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.125863	2026-03-25 18:53:22.125863
287	DE04.10.031.00	肺部听诊结果	麻醉术前访视时，对患者肺部听诊检查结果的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.126174	2026-03-25 18:53:22.126174
288	DE04.10.042.00	腹腔探查附件	腹腔探査时附件情况的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.126473	2026-03-25 18:53:22.126473
289	DE04.10.046.00	腹部检查结果	对患者腹部（肝脾等）检査结果的详细描述，包括视触叩听的检査结果	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.127033	2026-03-25 18:53:22.127033
290	DE04.10.052.00	腹围_cm	患者腹部周长的测量值，计量单位为cm	N	N4	51	\N	f	\N	t	2026-03-25 18:53:22.127772	2026-03-25 18:53:22.127772
291	DE04.10.065.00	肛门指诊检查结果描述	对患者肛门指诊检查结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.128119	2026-03-25 18:53:22.128119
292	DE04.10.067.00	产后宫底高度_cm	产妇产后耻骨联合上缘至子宫底部距离的测量值，计量单位为cm	N	N3	4	\N	f	\N	t	2026-03-25 18:53:22.128563	2026-03-25 18:53:22.128563
293	DE04.10.067.00.001	宫底高度_cm	产妇耻骨联合上缘至子宫底部距离的测量值，计量单位为cm	N	N3	4	\N	f	\N	t	2026-03-25 18:53:22.134727	2026-03-25 18:53:22.134727
294	DE04.10.067.00.002	术后宫底高度_cm	产妇术后耻骨联合上缘至子宫底部距离的测量值，计量单位为cm	N	N3	41	\N	f	\N	t	2026-03-25 18:53:22.144173	2026-03-25 18:53:22.144173
295	DE04.10.081.00	呼吸频率_次_min	患者每分钟呼吸次数的测量•值，计量单位为次/min	N	N	3	\N	f	\N	t	2026-03-25 18:53:22.144767	2026-03-25 18:53:22.144767
296	DE04.10.093.00	脊柱检查结果	对患者脊柱检査结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.145438	2026-03-25 18:53:22.145438
297	DE04.10.114.00	全身浅表淋巴结检查结果	对患者皮肤和黏膜检査结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.14585	2026-03-25 18:53:22.14585
298	DE04.10.118.00	脉搏	患者每分钟脉搏次数的测量值，计量单位为次/min	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.146245	2026-03-25 18:53:22.146245
299	DE04.10.118.00.001	产后脉搏_次_min	产后每分钟脉搏的次数测量值，计量单位为次/min	. N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.146616	2026-03-25 18:53:22.146616
300	DE04.10.118.00.002	术后脉搏_次_min	术后每分钟脉搏的次数测M值，计单位为次/min	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.147034	2026-03-25 18:53:22.147034
301	DE04.10.126.00	皮肤和黏膜检查结果	对患者皮肤和黏膜检查结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.147384	2026-03-25 18:53:22.147384
302	DE04.10.126.00.001	皮肤检查描述	皮肤检査结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.147699	2026-03-25 18:53:22.147699
303	DE04.10.167.00	身高_cm	患者身髙的测量值，计量单位为cm	N	N4	51	\N	f	\N	t	2026-03-25 18:53:22.148086	2026-03-25 18:53:22.148086
304	DE04.10.174.00	收缩压_mmHg	收缩压的测量值，计量单位为mmHg	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.148479	2026-03-25 18:53:22.148479
305	DE04.10.174.00.001	产后收缩压_mmHg	产后收缩压的测量值，计量单位为mmHg	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.148852	2026-03-25 18:53:22.148852
306	DE04.10.174.00.002	术后收缩压_mmHg	术后收缩压的测量值，计量单位为mmHg	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.149429	2026-03-25 18:53:22.149429
307	DE04.10.175.00	骶耻外径_cm	产妇第5腰椎棘突下至耻骨联合上缘中点距离的测世值，计量单位为cm	N	N4	\N	\N	f	\N	t	2026-03-25 18:53:22.14984	2026-03-25 18:53:22.14984
308	DE04.10.176.00	舒张压_mmHg	舒张压的测量值，计量单位为mmHg	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.150284	2026-03-25 18:53:22.150284
309	DE04.10.176.00.001	产后舒张压_mmHg	产后舒张压的测量值，计量单位为mmHg	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.150647	2026-03-25 18:53:22.150647
310	DE04.10.176.00.002	术后舒张压_mmHg	术后舒张压的测量值，计fl单位为mmHg	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.151098	2026-03-25 18:53:22.151098
311	DE04.10.179.00	四肢检查结果	对患者四肢检査结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.151531	2026-03-25 18:53:22.151531
312	DE04.10.183.00	胎心率_次_min	每分钟胎儿胎心搏动的次数，计量单位为次/min	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.151876	2026-03-25 18:53:22.151876
313	DE04.10.186.00	体温	体温的测量值，计量单位为X：	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.152298	2026-03-25 18:53:22.152298
314	DE04.10.188.00	体重_kg	患者体重的测量值，计量单位为kg	N	N3	\N	\N	f	\N	t	2026-03-25 18:53:22.152799	2026-03-25 18:53:22.152799
315	DE04.10.188.00.001	孕前体重_kg	产妇孕前体重的测ffl值，计M单位为k g	N	N3	\N	\N	f	\N	t	2026-03-25 18:53:22.153274	2026-03-25 18:53:22.153274
316	DE04.10.188.00.002	分娩前体重_kg	产妇分娩前体重的测量值，计量单位为kg	N	N3	62	\N	f	\N	t	2026-03-25 18:53:22.153617	2026-03-25 18:53:22.153617
317	DE04.10.195.00	外生殖器检查结果	对患者外生殖器检查结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.154295	2026-03-25 18:53:22.154295
318	DE04.10.206.00	产后心率_次_min	产后心脏搏动频率的测量值，计11单位为次/min	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.155195	2026-03-25 18:53:22.155195
319	DE04.10.206.00.002	起搏器心率_次_min	患者佩戴起搏器后的心率，计量单位为次/min	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.156065	2026-03-25 18:53:22.156065
320	DE04.10.206.00.003	术后心率_次_min	术后心脏搏动频率的测量值，计量单位为次/min	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.156665	2026-03-25 18:53:22.156665
321	DE04.10.206.00.004	心率	心脏搏动频率的测量值，计量单位为次/min	N	N2	3	\N	f	\N	t	2026-03-25 18:53:22.157211	2026-03-25 18:53:22.157211
322	DE04.10.207.00	心脏听诊结果	麻醉术前访视时，对心脏听诊结果的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.157643	2026-03-25 18:53:22.157643
323	DE04.10.219.00	一般状况检查结果	对患者一般状况检査结果的详细描述，包括其发育状况、营养状况、体味、步态、面容与表情、意识，检査能否合作等等	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.158121	2026-03-25 18:53:22.158121
324	DE04.10.233.00	子宫情况	子宫情况的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.158655	2026-03-25 18:53:22.158655
325	DE04.10.233.00.001	腹腔探查子宫	腹腔探査时子宫情况的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.15923	2026-03-25 18:53:22.15923
326	DE04.10.236.00	总产程时长_min	产妇分娩过程中，从开始出现规律宫缩到胎盘娩出的时间长度，计量单位为min	N	N1	4	\N	f	\N	t	2026-03-25 18:53:22.159902	2026-03-25 18:53:22.159902
327	DE04.10.237.00	足背动脉搏动标志	标识患者是否存在足背动脉搏动的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.160322	2026-03-25 18:53:22.160322
328	DE04.10.239.00	坐骨结节间径_cm	产妇两坐骨结节内侧缘的距离的测量值，又称骨盆出口横径，计量单位为cm	N	N3	41	\N	f	\N	t	2026-03-25 18:53:22.160697	2026-03-25 18:53:22.160697
329	DE04.10.240.00	肛査	产妇分娩后肛査情况的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.161122	2026-03-25 18:53:22.161122
330	DE04.10.245.00	宫缩情况	对产妇宮缩强弱、频率、持续时间等情况的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.161461	2026-03-25 18:53:22.161461
331	DE04.10.245.00.001	产后宫缩	产妇分娩后宫缩强度等情况的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.162041	2026-03-25 18:53:22.162041
332	DE04.10.245.00.002	术后宫缩	产妇术后宫缩强度等情况的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.162521	2026-03-25 18:53:22.162521
333	DE04.10.246.00	产后检查时间_min	产后检査时，距离分娩结朿后的时间，计量单位为min	N	N	3	\N	f	\N	t	2026-03-25 18:53:22.16312	2026-03-25 18:53:22.16312
334	DE04.10.246.00.001	术后检查时间_min	术后检査时，距离分娩结束后的时间，计景单位为min	N	N	3	\N	f	\N	t	2026-03-25 18:53:22.163583	2026-03-25 18:53:22.163583
335	DE04.10.248.00	宫颈情况	产妇宫颈情况的详细描述	S1	A	100	\N	f	\N	t	2026-03-25 18:53:22.164204	2026-03-25 18:53:22.164204
336	DE04.10.249.00	宫颈裂伤标志	标识宫颈是否存在裂伤的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.164681	2026-03-25 18:53:22.164681
337	DE04.10.250.00	宫口开全日期时间	产妇宫口开全时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.165172	2026-03-25 18:53:22.165172
338	DE04.10.252.00	会阴切开位置	会阴切开位置的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.165524	2026-03-25 18:53:22.165524
339	DE04.10.253.00	会阴血肿标志	标识会阴是否存在血肿的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.165851	2026-03-25 18:53:22.165851
340	DE04.10.254.00	阴道血肿大小	阴道血肿大小的详细描述	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.16632	2026-03-25 18:53:22.16632
341	DE04.10.255.00	颈部检查结果	对患者颈部检査结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.16687	2026-03-25 18:53:22.16687
342	DE04.10.256.00	破膜方式代码	采用的破膜方式类别的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.167343	2026-03-25 18:53:22.167343
343	DE04.10.257.00	产后膀胱充盈标志	标识产后膀胱是否充盈的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.16774	2026-03-25 18:53:22.16774
344	DE04.10.257.00.001	膀胱充盈标志	标识膀胱是否充盈的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.168716	2026-03-25 18:53:22.168716
345	DE04.10.258.00	体格检查	由门急诊接诊医师对患者进行的体格检査项目及主要检査结果的描述，包括主要的阳性体征和必要的阴性体征	S1	AN	500	\N	f	\N	t	2026-03-25 18:53:22.169359	2026-03-25 18:53:22.169359
346	DE04.10.259.00	体位护理	标识体位护理的描述	S1	AN	30	\N	f	\N	t	2026-03-25 18:53:22.169963	2026-03-25 18:53:22.169963
347	DE04.10.260.00	麻醉体位	麻醉体位的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.170465	2026-03-25 18:53:22.170465
348	DE04.10.261.00	头部及其器官检查结果	对患者头部及其器官检查结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.171188	2026-03-25 18:53:22.171188
349	DE04.10.262.00	先露位置	先露位置的详细描述	S1	A	100	\N	f	\N	t	2026-03-25 18:53:22.171644	2026-03-25 18:53:22.171644
350	DE04.10.263.00	胸部检查结果	对患者胸部（胸廓、肺部、心脏、血管）检査结果的详细描述，包括视触叩听的检査结果	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.172264	2026-03-25 18:53:22.172264
351	DE04.10.264.00	牙齿检查结果	麻醉术前访视时，对牙齿检査结果的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.172671	2026-03-25 18:53:22.172671
352	DE04.10.265.00	宫口情况	产妇宫口扩张大小情况的详细描述	S1	A	100	\N	f	\N	t	2026-03-25 18:53:22.173066	2026-03-25 18:53:22.173066
353	DE04.30.002.00	B起检查结果	B超检査结果的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.173658	2026-03-25 18:53:22.173658
354	DE04.30.005.00	CT检查结采	CT检查结果的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.174019	2026-03-25 18:53:22.174019
355	DE04.30.009.00	辅助检查结果	患者辅助检查、检验结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.174513	2026-03-25 18:53:22.174513
356	DE04.30.009.00.001	检查_检验结果	患者检查/检验结果的描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.175775	2026-03-25 18:53:22.175775
357	DE04.30.009.00.002	MRI超检查结果	MRI检査结果的咩细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.17651	2026-03-25 18:53:22.17651
358	DE04.30.009.00.003	肺功能检查结果	患者肺功能检査结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.179748	2026-03-25 18:53:22.179748
359	DE04.30.010.00	辅助检杳项目	患者辅助检查、检验项目的通用名称	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.18331	2026-03-25 18:53:22.18331
360	DE04.30.010.00.001	辅助检查项目	患者辅助检査、检验项目的通用名称	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.186549	2026-03-25 18:53:22.186549
361	DE04.30.015.00	检查定量结果	患者检查结果的测量值(定量）	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.192264	2026-03-25 18:53:22.192264
362	DE04.30.015.00.001	检查_检验定量结果	患者检查/检验结果的测量值(定量）	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.193356	2026-03-25 18:53:22.193356
363	DE04.30.015.00.002	检验定量结果	患者检验结果的测量值(定量）	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.193827	2026-03-25 18:53:22.193827
364	DE04.30.016.00	检查定量结果计量单位	患者定量检査测量值的计量单位	S1	A	20	\N	f	\N	t	2026-03-25 18:53:22.194609	2026-03-25 18:53:22.194609
365	DE04.30.016.00.001	检验定量结果计M单位	患者定a检验测a值的计a单位	S1	A	20	\N	f	\N	t	2026-03-25 18:53:22.195798	2026-03-25 18:53:22.195798
366	DE04.30.017.00	检查结果代码	患者检查结果的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.197775	2026-03-25 18:53:22.197775
367	DE04.30.017.00.001	检查_检验结果代码	患者检査/检验结果的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.19859	2026-03-25 18:53:22.19859
368	DE04.30.017.00.002	检验结果代码	患者检验结果的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.199348	2026-03-25 18:53:22.199348
369	DE04.30.018.00	检查类别	患者检查项目所属的类别详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.200088	2026-03-25 18:53:22.200088
370	DE04.30.018.00.001	检验类别	患者检验项目所属的类别详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.201773	2026-03-25 18:53:22.201773
371	DE04.30.019.00	检查项目代码	患者检査项目在特定编码体系中的代码，如LOINC的代码值	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.202697	2026-03-25 18:53:22.202697
372	DE04.30.019.00.001	检验项目代码	患者检验项目在特定编码体系中的代码，如LOINC的代码值	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.203597	2026-03-25 18:53:22.203597
373	DE04.30.020.00	检丧_检验项目名称	患者检査/检验项目的正式名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.205178	2026-03-25 18:53:22.205178
374	DE04.30.043.00	心电图检查结果	对患者心电图检査结果的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.206168	2026-03-25 18:53:22.206168
375	DE04.30.045.00	胸部X线检查结果	对患者胸部X线检査结果的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.207183	2026-03-25 18:53:22.207183
376	DE04.30.052.00	宫腔探查处理情_况	宫腔探査后处理方式的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.207967	2026-03-25 18:53:22.207967
377	DE04.30.053.00	宫腔探査异常情况描述	标识宫腔探査异常情况的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.209214	2026-03-25 18:53:22.209214
378	DE04.30.055.00	脐带长度_cm	脐带的长度值，计量单位为cm	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.209786	2026-03-25 18:53:22.209786
379	DE04.30.057.00	前羊水ft_mL	前羊水fi的描述，单位为mL	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.210204	2026-03-25 18:53:22.210204
380	DE04.30.058.00	前羊水性状	前羊水性状的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.210599	2026-03-25 18:53:22.210599
381	DE04.30.059.00	绕颈身_周	脐带绕颈身的周数，计ffl:单位为周	N	N	3	\N	f	\N	t	2026-03-25 18:53:22.211009	2026-03-25 18:53:22.211009
382	DE04.30.060.00	术中病理标志	标识术中手术标本是否进行病理切片检査的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.211697	2026-03-25 18:53:22.211697
383	DE04.30.061.00	羊水量_mL	羊水量的描述，单位为tnL	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.2125	2026-03-25 18:53:22.2125
384	DE04.30.062.00	羊水情况	羊水情况的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.215035	2026-03-25 18:53:22.215035
385	DE04.30.063.00	羊水性状	羊水性状的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.215784	2026-03-25 18:53:22.215784
386	DE04.50.001.00	ABO血型代码	进行血型检査明确，或既往病历资料能够明确的患者ABO血型类别在特定编码体系中的代码	S3	N1	\N	WT01.01.011	f	\N	t	2026-03-25 18:53:22.216824	2026-03-25 18:53:22.216824
387	DE04.50.010.00	Rh血型代码	进行血型检查明确，或既往病历资料能够明确的患者Rh血型的类别代码	S3	N1	\N	CV04.50.020	f	\N	t	2026-03-25 18:53:22.217356	2026-03-25 18:53:22.217356
388	DE04.50.010.00.001	申请Rh血型代码	为患者申请的并实际输人的与患者本人相同的Rh血型类别在特定编码体系中的代码	S3	N1	\N	CV04.50.020	f	\N	t	2026-03-25 18:53:22.218199	2026-03-25 18:53:22.218199
389	DE04.50.026.00	肝功能检查结果	对患者肝功能检查结果的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.218671	2026-03-25 18:53:22.218671
390	DE04.50.048.00	尿常规检查结果	麻醉术前访视时，对患者尿常规检査结果的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.219068	2026-03-25 18:53:22.219068
391	DE04.50.068.00	皮肤护理	对患者进行皮肤护理的描述	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.219542	2026-03-25 18:53:22.219542
392	DE04.50.102.00	血糖检测值_mmol_L	空腹时血液中葡萄糖定量检测结果值，计量单位为mmol/L	N	N3	4	\N	f	\N	t	2026-03-25 18:53:22.220156	2026-03-25 18:53:22.220156
393	DE04.50.128.00	阳性辅助检查结果	涉及阳性结果的辅助检查结果的描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.2209	2026-03-25 18:53:22.2209
394	DE04.50.128.00.001	血常规检查结果	麻醉术前访视时，对患者血常规检查结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.221595	2026-03-25 18:53:22.221595
395	DE04.50.128.00.002	血气分析检查结果	麻醉术前访视吋，对患者血气分析检査结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.222426	2026-03-25 18:53:22.222426
396	DE04.50.130.00	检验报告结果	检验项目结果报告的客观说明	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.223773	2026-03-25 18:53:22.223773
397	DE04.50.132.00	检查报告结果_主观提示	检査项目结果报告的主观说明	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.224275	2026-03-25 18:53:22.224275
398	DE04.50.133.00	检查报告日期	检査报告当日的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.224765	2026-03-25 18:53:22.224765
399	DE04.50.133.00.001	检验报告日期	检验报告当日的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.225333	2026-03-25 18:53:22.225333
400	DE04.50.134.00	标本类别	对标本类别的描述	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.226071	2026-03-25 18:53:22.226071
401	DE04.50.135.00	标本状态	对受检标本状态的描述	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.226646	2026-03-25 18:53:22.226646
402	DE04.50.137.00	标本采样日期时间	采集标本时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.227226	2026-03-25 18:53:22.227226
403	DE04.50.138.00	存脐带血情况标志	标识是否留存脐带血的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.227999	2026-03-25 18:53:22.227999
404	DE04.50.139.00	检查方式代码	待产检查方式的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.228817	2026-03-25 18:53:22.228817
405	DE04.50.140.00	检查日期	检査项目执行当R的公元纪年F1期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.229845	2026-03-25 18:53:22.229845
406	DE04.50.140.00.001	检验日期	检验项目执行当日的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.230517	2026-03-25 18:53:22.230517
407	DE04.50.141.00	接收标本日期时间	检验科室实际接收标本时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.231248	2026-03-25 18:53:22.231248
408	DE04.50.142.00	凝血功能检查结果	麻醉术前访视时，对患者凝血功能检査结果的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.232119	2026-03-25 18:53:22.232119
409	DE04.50.147.00	输血性质代码	输血性质类别的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.233161	2026-03-25 18:53:22.233161
410	DE04.50.149.00	血氧饱和度	脉搏血氧饱和度的测量值，计量单位为％	N	N3	4	\N	f	\N	t	2026-03-25 18:53:22.233779	2026-03-25 18:53:22.233779
411	DE04.50_131.00	检查报告结果_客观所见	检査项目结果报告的客观说明	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.235279	2026-03-25 18:53:22.235279
412	DE04_50.001.00	申请ABO血型代码	为患者申请的并实际输入的与患者本人相同的ABO血型类别在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.236721	2026-03-25 18:53:22.236721
413	DE05.01.003.00	会阴裂伤情况代码	产妇会阴裂伤的程度类别在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.237658	2026-03-25 18:53:22.237658
414	DE05.01.021.00	根本死因代码	导致患者死亡的最根本疾病的诊断代码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.238973	2026-03-25 18:53:22.238973
415	DE05.01.021.00.001	直接死亡原因编码	直接导致患者死亡的最终疾病或原因在特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.239849	2026-03-25 18:53:22.239849
416	DE05.01.021.00.002	死亡诊断编码	死亡诊断在特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.240807	2026-03-25 18:53:22.240807
417	DE05.01.024.00	初步诊断_西医诊断编码	患者在门（急）诊就诊时初步作出的疾病诊断在西医诊断特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.241465	2026-03-25 18:53:22.241465
418	DE05.01.024.00.005	修正诊断_西医诊断编码	修正诊断在西医诊断特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.242472	2026-03-25 18:53:22.242472
419	DE05.01.024.00.006	确定诊断_西医诊断编码	确诊诊断在西医诊断特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.243482	2026-03-25 18:53:22.243482
420	DE05.01.024.00.007	补充诊断编码	补充诊断在特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.244231	2026-03-25 18:53:22.244231
421	DE05.01.024.00.033	西医诊断编码	患者所患疾病在西医诊断特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.245259	2026-03-25 18:53:22.245259
422	DE05.01.024.00.034	门急诊诊断_西医诊断疾病编码	门（急）诊诊断在西医诊断特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.246226	2026-03-25 18:53:22.246226
423	DE05.01.024.00.040	目前诊断_西医诊断编码	交接班时患者所患的疾病在西医诊断特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.246995	2026-03-25 18:53:22.246995
424	DE05.01.024.00.044	出院西医诊断_编码	出院诊断在西医诊断特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.247516	2026-03-25 18:53:22.247516
425	DE05.01.024.00.046	门急诊诊断疾病编码	门（急)诊诊断在特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.248142	2026-03-25 18:53:22.248142
426	DE05.01.024.00.049	损伤中毒的外部原因疾病编码	损伤中毒的外部原因在特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.248657	2026-03-25 18:53:22.248657
427	DE05.01.024.00.050	病理诊断疾病编码	病理诊断在特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.249251	2026-03-25 18:53:22.249251
428	DE05.01.024.00.058	术后诊断编码	术后诊断在特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.250541	2026-03-25 18:53:22.250541
1646	DE99.02.005.001	手术者姓名_1	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.895839	2026-03-25 18:53:22.895839
429	DE05.01.024.00.063	死亡诊断_西医诊断编码	死亡诊断在西医诊断特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.251137	2026-03-25 18:53:22.251137
430	DE05.01.024.00.064	术前诊断编码	术前诊断在特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.251628	2026-03-25 18:53:22.251628
431	DE05.01.024.00.065	疾病诊断编码	患者所患的疾病诊断特定编码体系中的编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.252365	2026-03-25 18:53:22.252365
432	DE05.01.025.00	初步诊断_西医诊断名称	由医师根据患者就诊时的情况，综合分析所作出的西医诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.253129	2026-03-25 18:53:22.253129
433	DE05.01.025.00.003	修正诊断_西医诊断名称	修正诊断的西医诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.253666	2026-03-25 18:53:22.253666
434	DE05.01.025.00.004	确定诊断_西医诊断名称	确定诊断的西医诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.254269	2026-03-25 18:53:22.254269
435	DE05.01.025.00.005	补充诊断名称	补充诊断的名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.254961	2026-03-25 18:53:22.254961
436	DE05.01.025.00.008	疾病诊断名称	患者所患疾病的西医诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.255902	2026-03-25 18:53:22.255902
437	DE05.01.025.00.009	出院西医诊断_名称	患者出院时所患主要疾病的西医诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.256641	2026-03-25 18:53:22.256641
438	DE05.01.025.00.010	西医诊断名称	患者所患疾病的西医诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.25736	2026-03-25 18:53:22.25736
439	DE05.01.025.00.011	门急诊诊断_西医诊断名称	患者在住院前，由门（急）诊接诊医师在住院证上填写的门（急)诊西医诊断	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.25804	2026-03-25 18:53:22.25804
440	DE05.01.025.00.015	术后诊断名称	在对患者进行手术操作后做出的西医诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.258806	2026-03-25 18:53:22.258806
441	DE05.01.025.00.016	门急诊诊断名称	患者在住院前，由门（急）诊接诊医师在住院证上填写的门（急）诊诊断	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.259744	2026-03-25 18:53:22.259744
442	DE05.01.025.00.019	病理诊断名称	各种活检、细胞学检査及尸检的诊断，包括术中冰冻的病理诊断结果	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.260819	2026-03-25 18:53:22.260819
443	DE05.01.025.00.020	直接死亡原因名称	直接导致患者死亡的最终疾病或原因名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.261527	2026-03-25 18:53:22.261527
444	DE05.01.025.00.021	死亡诊断名称	导致患者死亡的疾病诊断名称，如果有多个疾病诊断，这里指与其他疾病有因果关系的，并因其发生发展引起其他疾病，最终导致死亡的一系列疾病诊断中最初确定的疾病诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.262336	2026-03-25 18:53:22.262336
445	DE05.01.025.00.022	鉴别诊断_西医诊断名称	需要进行鉴别的西医疾病诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.263256	2026-03-25 18:53:22.263256
446	DE05.01.025.00.024	死亡诊断_西医诊断名称	导致病人死亡的主要疾病的西医诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.263828	2026-03-25 18:53:22.263828
447	DE05.01.044.00	胎方位代码	胎儿方位类别在特定编码体系中的代码	S3	N2	\N	\N	f	\N	t	2026-03-25 18:53:22.264397	2026-03-25 18:53:22.264397
448	DE05.01.058.00	初步诊断日期	初步诊断下达当日的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.265171	2026-03-25 18:53:22.265171
449	DE05.01.058.00.001	修正诊断日期	修正诊断下达当日的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.266169	2026-03-25 18:53:22.266169
450	DE05.01.058.00.002	确定诊断日期	确定诊断下达当日的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.267141	2026-03-25 18:53:22.267141
451	DE05.01.058.00.003	补充诊断日期	补充诊断下达当日的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.268096	2026-03-25 18:53:22.268096
452	DE05.01.058.00.005	诊断日期	对患者所患疾病作出诊断时当日的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.269843	2026-03-25 18:53:22.269843
453	DE05.01.070.00	诊断依据	疾病诊断的依据描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.271	2026-03-25 18:53:22.271
454	DE05.01.075.00	特殊检查及特殊治疗可能引起的并发症及风险	拟进行的特殊检査及特殊治疗项目可能引起的并发症及风险描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.271592	2026-03-25 18:53:22.271592
455	DE05.01.075.00.001	手术后可能出现的意外及并发症	手术后可能出现的意外及并发症的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.272222	2026-03-25 18:53:22.272222
456	DE05.01.075.00.002	麻醉中_麻醉后可能发生的意外及并发症	麻醉中、麻醉后可能发生的意外情况及并发症的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.272752	2026-03-25 18:53:22.272752
457	DE05.01.077.00	麻醉合并症标志代码	是否具有麻醉合并症的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.2732	2026-03-25 18:53:22.2732
458	DE05.01.07f3.00	术前合并疾病	患者在接受手术前，除与手术相关的诊断外，同时合并的其他疾病	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.273591	2026-03-25 18:53:22.273591
459	DE05.01.080.00	入院诊断顺位	表示人院诊断的顺位及其从属关系	S1	N2	\N	\N	f	\N	t	2026-03-25 18:53:22.273979	2026-03-25 18:53:22.273979
460	DE05.10.001.00	Apgar评分值	对新生儿娩出后呼吸、心率、皮肤颜色、肌张力及对刺激的反应等5项指标的评分结果值，计量单位为分	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.274392	2026-03-25 18:53:22.274392
461	DE05.10.007.00	产后诊断	对产妇产后诊断（包括孕产次数）的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.274793	2026-03-25 18:53:22.274793
462	DE05.10.007.00.001	术后诊断	对产妇术后诊断（包括孕产次数）的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.275415	2026-03-25 18:53:22.275415
463	DE05.10.014.00	处置计划	对产妇情况进行综合评估的基础上，为其制定的处置计划的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.275975	2026-03-25 18:53:22.275975
464	DE05.10.022.00	发育程度代码	发育情况评估结果的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.276451	2026-03-25 18:53:22.276451
465	DE05.10.031.00	一般健康状况标志	标识患者既往是否健康的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.276972	2026-03-25 18:53:22.276972
466	DE05.10.033.00	健康问题评估	根据患者疾病临床表现、实验室检查结果等作出的健康问题评估结果的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.277313	2026-03-25 18:53:22.277313
467	DE05.10.053.00	就诊原因	就诊原因的详细描述，如门（急）诊就诊原因、住院原因、转科原因等	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.277683	2026-03-25 18:53:22.277683
468	DE05.10.053.00.001	入院原因	因某种疾病或健康问题住院治疗的原因的描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.278002	2026-03-25 18:53:22.278002
469	DE05.10.063.00	穿刺过程	局部麻醉中穿刺过程的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.278328	2026-03-25 18:53:22.278328
470	DE05.10.063.00.002	手术过程	手术过程的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.278767	2026-03-25 18:53:22.278767
471	DE05.10.063.00.003	剖宫产手术过程	剖宫产手术过程的详细描述，如腹壁脂肪层厚度、腹膜分离情况、腹腔粘连枪口、腹水情况、腹壁缝合、缝合膀胱腹膜反折情况等	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.279065	2026-03-25 18:53:22.279065
472	DE05.10.063.00.004	手术过程描述	手术过程的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.279375	2026-03-25 18:53:22.279375
474	DE05.10.070.00	此次妊娠特殊情况	对产妇此次妊娠特殊情况的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.280125	2026-03-25 18:53:22.280125
475	DE05.10.084.00	心理状态代码	患者心理状况的分类在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.280535	2026-03-25 18:53:22.280535
476	DE05.10.097.00	营养状态代码	患者营养情况评估结果类别的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.281363	2026-03-25 18:53:22.281363
477	DE05.10.098.00	预产期	根据产妇末次月经首日推算的预产期的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.282275	2026-03-25 18:53:22.282275
478	DE05.10.099.00	死亡原因	患者死亡直接原因的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.28291	2026-03-25 18:53:22.28291
479	DE05.10.109.00.001	术前诊断	术前诊断的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.283348	2026-03-25 18:53:22.283348
480	DE05.10.109.00.002	输血前有关检查项目及结果	输血前与输血相关的检査项目及检査结果描述，如HBsAg、Anti_HBs、梅毒等	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.283937	2026-03-25 18:53:22.283937
481	DE05.10.113.00	病情转归代码	出院时患者所患的每种疾病的治疗结果类别在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.284408	2026-03-25 18:53:22.284408
482	DE05.10.119.00	患者传染性标志	标识患者是否具有传染性的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.284839	2026-03-25 18:53:22.284839
483	DE05.10.122.00	自理能力代码	患者本人的基本生活自我照料能力的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.285294	2026-03-25 18:53:22.285294
484	DE05.10.129.00	美国麻醉医师协会_ASA_分级标准代码	根据美同麻醉师协会（ASA)制定的分级标准，对病人体质状况和对手术危险性进行评估分级的结果在特定编码体系中的代码	S3	N1	\N	CV05.10.021	f	\N	t	2026-03-25 18:53:22.285631	2026-03-25 18:53:22.285631
485	DE05.10.130.00	初步诊断_中医病名代码	患者在门（急）诊就诊时初步作出的疾病诊断在中医病名特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.285934	2026-03-25 18:53:22.285934
486	DE05.10.130.00.003	修正诊断_中医病名代码	修正诊断在中医病名特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.286258	2026-03-25 18:53:22.286258
487	DE05.10.130.00.004	修正诊断_中医证候代码	修正诊断在中医证候特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.286553	2026-03-25 18:53:22.286553
488	DE05.10.130.00.005	确定诊断_中医病名代码	确定诊断在中医病名特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.287003	2026-03-25 18:53:22.287003
489	DE05.10.130.00.006	确定诊断_中医证候代码	确定诊断在中医证候特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.287351	2026-03-25 18:53:22.287351
490	DE05.10.130.00.026	中医病名代码	患者所患疾病在中医病名特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.287785	2026-03-25 18:53:22.287785
491	DE05.10.130.00.027	中医证候代码	患者所患疾病在中医证候特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.288278	2026-03-25 18:53:22.288278
492	DE05.10.130.00.028	门急诊诊断_中医诊断病名编码	门（急）诊诊断在中医病名特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.288935	2026-03-25 18:53:22.288935
493	DE05.10.130.00.029	门急诊诊断_中医证候证候编码	门（急）诊诊断在中医证候特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.289406	2026-03-25 18:53:22.289406
494	DE05.10.130.00.030	出院中医诊断_主病编码	出院诊断中的主要诊断在中医病名特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.289765	2026-03-25 18:53:22.289765
495	DE05.10.130.00.034	目前诊断_中医病名代码	交接班时患者所患的疾病在中医病名特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.290207	2026-03-25 18:53:22.290207
496	DE05.10.130.00.035	目前诊断_中医证候代码	交接班时患者所患的疾病在中医证候特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.290525	2026-03-25 18:53:22.290525
497	DE05.10.130.00.037	人皖诊断_中医证候代码	患者人院时作出的疾病诊断在中医证候特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.290888	2026-03-25 18:53:22.290888
498	DE05.10.130.00.038	出院中医诊断_病名代码	出院诊断在中医病名特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.291321	2026-03-25 18:53:22.291321
499	DE05.10.130.00.039	出院中医诊断_证候代码	出院诊断在中医证候特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.291805	2026-03-25 18:53:22.291805
500	DE05.10.130.00.040	初步诊断_中医证候代码	患者在门（急）诊就诊时初步作出的疾病诊断在中医证候特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.292348	2026-03-25 18:53:22.292348
501	DE05.10.130.00.043	死亡诊断_中医病名代码	死亡诊断在中医病名特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.292873	2026-03-25 18:53:22.292873
502	DE05.10.130.00.044	死亡诊断_中医证候代码	死亡诊断在中医证候特定分类体系中的代码	S3	AN	9	\N	f	\N	t	2026-03-25 18:53:22.293259	2026-03-25 18:53:22.293259
503	DE05.10.131.00	辨证论治详细描述	对辨证分型的名称、主要依据和采用的治则治法的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.293583	2026-03-25 18:53:22.293583
504	DE05.10.132.00	辨证依据	中医证候辨证分型主要依据的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.293971	2026-03-25 18:53:22.293971
505	DE05.10.133.00	病例特点	对病史、体格检査和辅助检査进行全面分析、归纳和整理后写出本病例特征，包括阳性发现和具有鉴别诊断意义的阴性症状和体征等	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.294313	2026-03-25 18:53:22.294313
506	DE05.10.134.00	病情变化情况	对患者病情变化的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.294602	2026-03-25 18:53:22.294602
507	DE05.10.134.00.001	手术时产妇情况	手术时产妇情况的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.294913	2026-03-25 18:53:22.294913
508	DE05.10.135.00	头位难产情况的评估	对头位难产情况的评估	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.295198	2026-03-25 18:53:22.295198
509	DE05.10.136.00	护理问题	患者人院后需要采取相应护理措施的问题描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.295544	2026-03-25 18:53:22.295544
510	DE05.10.138.01	颅脑损伤患者入院前昏迷时间_d	颅脑损伤患者人院前昏迷时间的天数	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.295933	2026-03-25 18:53:22.295933
511	DE05.10.138.01.002	颅脑损伤患者入院后昏迷时间_d	颅脑损伤患者入院后昏迷吋间的天数	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.296313	2026-03-25 18:53:22.296313
512	DE05.10.138.02	颅脑损伤患者入院前昏迷时间_h	颅脑损伤患者人院前昏迷时间的小时数	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.296954	2026-03-25 18:53:22.296954
513	DE05.10.138.02.002	颅脑损伤患者入院后昏迷时间_h	颅脑损伤患者入院后昏迷时间的小时数	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.297294	2026-03-25 18:53:22.297294
514	DE05.10.138.03	颅脑损伤患者入院前昏迷时间_min	颅脑损伤患者人院前昏迷时间的分钟数	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.297606	2026-03-25 18:53:22.297606
515	DE05.10.138.03.002	颅脑损伤患者入院后昏迷时间_min	颅脑损伤患者入院后昏迷时间的分钟数	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.297981	2026-03-25 18:53:22.297981
516	DE05.10.140.00	简要病史	对患者病史的简要描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.298292	2026-03-25 18:53:22.298292
517	DE05.10.141.00	手术禁忌症	拟实施手术的禁忌症的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.298646	2026-03-25 18:53:22.298646
518	DE05.10.142.00	精神状态正常标志	标识患者精神状态是否正常的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.29901	2026-03-25 18:53:22.29901
519	DE05.10.143.00	陈述内容可靠标志	标识陈述内容是否可信的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.299361	2026-03-25 18:53:22.299361
520	DE05.10.144.00	评估日期时间	患者入院后接受护理评估结束时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.304961	2026-03-25 18:53:22.304961
521	DE05.10.145.00	脐带异常情况描述	标识跻带是否存在异常情况的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.306176	2026-03-25 18:53:22.306176
522	DE05.10.146.00	基础疾病对麻醉可能产生的影响	患者所患的基础疾病可能对麻醉产生影响的特殊情况描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.30714	2026-03-25 18:53:22.30714
523	DE05.10.148.00	入院情况	对患者人院情况的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.307615	2026-03-25 18:53:22.307615
524	DE05.10.149.00	神经系统检查结果	对患者神经系统检查结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.308162	2026-03-25 18:53:22.308162
525	DE05.10.151.00	手术适应证	手术适应证的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.30897	2026-03-25 18:53:22.30897
526	DE05.10.152.00	损伤中毒的外部原因	造成损伤的外部原因及引起中毒的物质名称	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.309443	2026-03-25 18:53:22.309443
527	DE05.10.154.00	胎膜破裂Fi期时间	胎膜破裂时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.310039	2026-03-25 18:53:22.310039
528	DE05.10.155.00	胎膜情况代码	产妇胎膜是否已破裂的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.310424	2026-03-25 18:53:22.310424
529	DE05.10.156.00	胎膜完整情况标志	标识胎膜是否完整的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.310699	2026-03-25 18:53:22.310699
530	DE05.10.157.00	胎盘娩出情况	对胎盘娩出情况的描述，如娩出方式、胎盘重量、胎盘大小、胎盘完整情况、胎盘附着位置等	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.311027	2026-03-25 18:53:22.311027
531	DE05.10.158.00	特殊情况	对存在特殊情况的描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.311523	2026-03-25 18:53:22.311523
532	DE05.10.160.00	新生儿异常情况代码	新生儿异常情况类别在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.311894	2026-03-25 18:53:22.311894
533	DE05.10.161.00	产前检查异常情况	产妇产前检查异常情况的详细描述	S1	A	200	\N	f	\N	t	2026-03-25 18:53:22.313602	2026-03-25 18:53:22.313602
534	DE05.10.162.00	手术中可能出现的意外及风险	手术中可能发生的意外情况及风险描述	S1	A	200	\N	f	\N	t	2026-03-25 18:53:22.314651	2026-03-25 18:53:22.314651
535	DE05.10.163.00	阴道裂伤标忐	标识阴道是否存在裂伤的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.315225	2026-03-25 18:53:22.315225
536	DE05.10.164.00	阴道血肿标志	标识阴道是否存在血肿的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.315667	2026-03-25 18:53:22.315667
537	DE05.10.165.00	产妇会阴切开标志	标识产妇是否行会阴切开操作的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.316368	2026-03-25 18:53:22.316368
538	DE05.10.165.00.001	拔除气管插管标志	标识是否已拔除气管插管的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.317059	2026-03-25 18:53:22.317059
539	DE05.10.165.00.002	有创诊疗操作标志	标识患者是否接受过有创诊疗操作的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.317444	2026-03-25 18:53:22.317444
540	DE05.10.165.00.003	引流标志	标识术中是否有引流的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.317858	2026-03-25 18:53:22.317858
541	DE05.10.167.00	产瘤部位	产瘤部位的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.318336	2026-03-25 18:53:22.318336
542	DE05.10.167.00.001	产痫部位	产瘤部位的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.318712	2026-03-25 18:53:22.318712
543	DE05.10.168.00	产瘤大小	产瘤大小的详细描述，计量为单位cm	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.319545	2026-03-25 18:53:22.319545
544	DE05.10.172.00	初步诊断_中医病名名称	由医师根据患者就诊时的情况，综合分析所作出的中医诊断病名	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.320074	2026-03-25 18:53:22.320074
545	DE05.10.172.00.003	修正诊断_中医病名名称	修正诊断的中医病名	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.320497	2026-03-25 18:53:22.320497
546	DE05.10.172.00.004	修正诊断_中医证候名称	修正诊断的中医证候名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.320832	2026-03-25 18:53:22.320832
547	DE05.10.172.00.005	确定诊断_中医病名名称	确定诊断的中医病名	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.321237	2026-03-25 18:53:22.321237
548	DE05.10.172.00.006	确定诊断_中医证候名称	确定诊断的中医证候名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.321567	2026-03-25 18:53:22.321567
549	DE05.10.172.00.007	初步诊断_中医证候名称	由医师根据患者就诊时的情况，综合分析所作出的中医证候名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.321891	2026-03-25 18:53:22.321891
550	DE05.10.172.00.011	出院中医诊断_证候名称	患者出院时所患主要疾病的中医证候名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.322561	2026-03-25 18:53:22.322561
551	DE05.10.172.00.012	出院中医诊断_病名名称	患者出院时所患主要疾病的中医病名	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.322858	2026-03-25 18:53:22.322858
552	DE05.10.172.00.013	中医病名名称	患者所患疾病的中医病名	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.3233	2026-03-25 18:53:22.3233
553	DE05.10.172.00.014	中医证候名称	患者所患疾病的中医证候名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.323729	2026-03-25 18:53:22.323729
554	DE05.10.172.00.015	门急诊诊断_中医诊断名称	患者在住院前，由门（急）诊接诊医师在住院证上填写的门（急）诊中医病名	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.324357	2026-03-25 18:53:22.324357
555	DE05.10.172.00.016	门急诊诊断_中医证候名称	患者在住院前，由门（急）诊接诊医师在住院证上填写的门（急)诊中医证候	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.32563	2026-03-25 18:53:22.32563
556	DE05.10.172.00.017	出院中医诊断_主病名称	患者在住院期间确诊的主要中医病名	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.326357	2026-03-25 18:53:22.326357
557	DE05.10.172.00.018	出院中医诊断_主证名称	患者所患主病的主要中医证候	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.32678	2026-03-25 18:53:22.32678
558	DE05.10.172.00.019	鉴别诊断_中医病名名称	需要进行鉴别诊断的中医病名名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.327261	2026-03-25 18:53:22.327261
559	DE05.10.172.00.020	鉴别诊断_中医证候名称	需要进行鉴别诊断的中医证候名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.327613	2026-03-25 18:53:22.327613
560	DE05.10.172.00.023	死亡诊断_中医病名名称	导致病人死亡的主要疾病的中医病名名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.32828	2026-03-25 18:53:22.32828
561	DE05.10.172.00.024	死亡诊断_中医证候名称	导致病人死亡的主要疾病的中医证候名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.328719	2026-03-25 18:53:22.328719
562	DE05.10.173.00	胎儿娩出方式	胎儿娩出方式的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.329273	2026-03-25 18:53:22.329273
563	DE05.10.H5.00	胳带异常情况描述	标识脐带是否存在异常情况的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.329829	2026-03-25 18:53:22.329829
564	DE06.00.011.00	产妇会阴缝合针数	产妇会阴缝合针数的计数值	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.330988	2026-03-25 18:53:22.330988
565	DE06.00.017.00	预出院时间	患者实际办理出院手续时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.3511	2026-03-25 18:53:22.3511
566	DE06.00.018.00	医疗机构意见	在此诊疗活动过程中，医疗机构对患者应尽责任的陈述以及对可能面临的风险或意外情况所采取的应对措施的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.387201	2026-03-25 18:53:22.387201
567	DE06.00.018.00.004	讨论意见	疑难病历讨论过程中的具体讨论意见的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.388969	2026-03-25 18:53:22.388969
568	DE06.00.018.00.005	讨论结论	术前讨论结论性意见的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.39461	2026-03-25 18:53:22.39461
569	DE06.00.018.00.006	会诊怠见	由会诊医师填写患者会诊时的主要处置、指导意见的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.395288	2026-03-25 18:53:22.395288
570	DE06.00.018.00.007	主持人总结意见	主持人就疑难病例讨论过程总结意见的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.395778	2026-03-25 18:53:22.395778
571	DE06.00.018.00.009	处理及指导意见	对某事件进行处理及指导意见内容的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.39627	2026-03-25 18:53:22.39627
572	DE06.00.018.00.011	会诊意见	由会诊医师填写患者会诊吋的主要处置、指导意见的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.396822	2026-03-25 18:53:22.396822
573	DE06.00.018.00.012	患者_法定代理人意见	患者/法定代理人对手术同意书中告知内容的意见的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.397287	2026-03-25 18:53:22.397287
574	DE06.00.019.00	第2产程时长_min	产妇分娩过程中，从宫口开全到胎儿娩出的时长，计量单位为min	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.397653	2026-03-25 18:53:22.397653
575	DE06.00.020.00	第3产程吋长_min	产妇分娩过程中，从胎儿娩出到胎盘娩出的时长，计量单位为min	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.397997	2026-03-25 18:53:22.397997
576	DE06.00.021.00	第1产程时长_min	产妇分娩过程中，从开始出现间歇3 min〜4 min的规律宫缩到宫口开全的时长，计量单位为min	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.398501	2026-03-25 18:53:22.398501
577	DE06.00.026.00	分娩结局代码	胎儿分娩结局的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.398831	2026-03-25 18:53:22.398831
578	DE06.00.039.00	会诊原因	由会诊医师填写患者需会诊的主要情况的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.399211	2026-03-25 18:53:22.399211
579	DE06.00.062.00	就诊日期时间	患者在门（急）诊就诊结束时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.399521	2026-03-25 18:53:22.399521
580	DE06.00.066.00	康复措施指导	医师对患者实施康复措施指导的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.399829	2026-03-25 18:53:22.399829
581	DE06.00.073.00	麻醉方式代码	为产妇进行手术、操作时使用的麻醉方法在特定编码体系中的代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:22.400206	2026-03-25 18:53:22.400206
582	DE06.00.073.00.005	拟实施麻醉方法代码	为患者进行手术、操作时拟使用的麻醉方法在特定编码体系中的代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:22.400548	2026-03-25 18:53:22.400548
583	DE06.00.092.00	入院时间	患者实际办理入院手续时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.400874	2026-03-25 18:53:22.400874
584	DE06.00.093.00	手术及操作编码	患者住院期间实施的手术及操作在特定编码体系中的编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.401273	2026-03-25 18:53:22.401273
585	DE06.00.093.00.005	操作编码	为患者实施的手术及操作在特定编码体系中的编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.401818	2026-03-25 18:53:22.401818
586	DE06.00.093.00.007	拟实施手术及操作编码	拟为患者实施的手术及操作在特定编码体系中的编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.402175	2026-03-25 18:53:22.402175
587	DE06.00.094.00.004	操作名称	按照ICD-9-CM-3的名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.402541	2026-03-25 18:53:22.402541
588	DE06.00.094.00.005	手术名称	按照ICD~9-CM-3的名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.402864	2026-03-25 18:53:22.402864
589	DE06.00.094.00.006	拟实施手术及操作名称	按照ICD-9-CM-3的名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.403291	2026-03-25 18:53:22.403291
590	DE06.00.095.00	麻醉开始日期时间	麻醉开始时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.40366	2026-03-25 18:53:22.40366
591	DE06.00.095.00.002	操作日期时间	对患者实施的操作结束时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.404005	2026-03-25 18:53:22.404005
592	DE06.00.097.00	出血量_mL	手术中出血量的累计值，计量单位为mL	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.404353	2026-03-25 18:53:22.404353
593	DE06.00.106.00	输血史标识代码	既往有无输血经历的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.404734	2026-03-25 18:53:22.404734
594	DE06.00.107.00	输血原因	表示本次输血的原因	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.40516	2026-03-25 18:53:22.40516
595	DE06.00.108.00	随访方式代码	进行医学随访的方式类别在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.405509	2026-03-25 18:53:22.405509
596	DE06.00.109.00	随访日期	对患者进行随访时当日的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.405826	2026-03-25 18:53:22.405826
597	DE06.00.112.00	随访周期建议代码	患者接受医学随访的建议间隔时长在特定编码体系中的代码	S3	N	2	\N	f	\N	t	2026-03-25 18:53:22.406149	2026-03-25 18:53:22.406149
598	DE06.00.124.00	宣教内容	医护人员对服务对象进行相关宣传指导活动的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.406522	2026-03-25 18:53:22.406522
599	DE06.00.129.00	药物不良反应情况	对可能影响患者诊治的、严重的药物不良反应描述，包括：药物不良反应的表现、相关处理及结局	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.406891	2026-03-25 18:53:22.406891
600	DE06.00.133.00	药物使用频率	标识单位时间内药物使用的次数	S3	AN	2	CV06.00.228	f	\N	t	2026-03-25 18:53:22.407245	2026-03-25 18:53:22.407245
601	DE06.00.134.00	用药途径代码	药物使用途径在特定编码体系中的代码	S3	N	3	\N	f	\N	t	2026-03-25 18:53:22.407568	2026-03-25 18:53:22.407568
602	DE06.00.135.00	药物使用总剂量	服药者在一段时间内累计服用某药物的剂量总计	S1	N	\N	\N	f	\N	t	2026-03-25 18:53:22.407902	2026-03-25 18:53:22.407902
603	DE06.00.136.00	关键药物用法	与本次就诊相关的关键药物（含中药）治疗疾病具体用法的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.408325	2026-03-25 18:53:22.408325
604	DE06.00.136.00.001	麻醉前用药	在患者进行麻醉前给予的药品的具体描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.408804	2026-03-25 18:53:22.408804
605	DE06.00.136.00.005	用药指导	患者出院后用药指导的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.409228	2026-03-25 18:53:22.409228
606	DE06.00.136.00.012	宫缩剂使用方法	宫缩剂使用方法的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.409688	2026-03-25 18:53:22.409688
607	DE06.00.136.00.013	中药用药方法	中药的用药方法的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.410076	2026-03-25 18:53:22.410076
608	DE06.00.136.00.014	药物用法	药物(含中药）治疗疾病具体用法的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.410382	2026-03-25 18:53:22.410382
609	DE06.00.136.00.015	术前用药	对患者术前用药情况的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.410824	2026-03-25 18:53:22.410824
610	DE06.00.136.00.016	术中用药	对患者术中用药情况的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.411476	2026-03-25 18:53:22.411476
611	DE06.00.159.00	治疗方案	根据对转诊患者的临床表现、实验室检査结果等为患者制定的治疗方案的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.411895	2026-03-25 18:53:22.411895
612	DE06.00.164.00	中药使用类别代码	临床治疗中中药使用情况分类在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.412411	2026-03-25 18:53:22.412411
613	DE06.00.176.00	转诊_院_日期	患者转诊（院）当R的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.412954	2026-03-25 18:53:22.412954
614	DE06.00.177.00	转诊原因	对患者转诊原因的简要描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.413387	2026-03-25 18:53:22.413387
615	DE06.00.178.00	安全护理代码	安全护理类别的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.413733	2026-03-25 18:53:22.413733
616	DE06.00.179.00	医嘱备注信息	对下达医嘱的补充说明和注意事项提示	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.414042	2026-03-25 18:53:22.414042
617	DE06.00.179.00.002	检查报告备注	关于检査报告的其他描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.415574	2026-03-25 18:53:22.415574
618	DE06.00.179.00.003	检验报告备注	检验项目结果报告的主观说明	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.416233	2026-03-25 18:53:22.416233
619	DE06.00.179.00.004	其他用药情况	其他用药情况的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.416742	2026-03-25 18:53:22.416742
620	DE06.00.179.00.005	医嘱使用备注	医嘱执行过程中的注意事项	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.417189	2026-03-25 18:53:22.417189
621	DE06.00.179.00.006	处方备注信息	对处方信息的重要提示和补充说明	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.417578	2026-03-25 18:53:22.417578
622	DE06.00.180.00	辨证施护标志	标识是否进行辨证施护的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.417935	2026-03-25 18:53:22.417935
623	DE06.00.181.00	急诊留观病程记录	急诊留观病历中病程记录内容的详细描述，重点记录观察期间病情变化和诊疗措施	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.4186	2026-03-25 18:53:22.4186
624	DE06.00.181.00.002	急诊抢救记录	对急诊抢救过程的描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.41925	2026-03-25 18:53:22.41925
625	DE06.00.181.00.003	转诊记录	对患者转诊过程的描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.419565	2026-03-25 18:53:22.419565
626	DE06.00.181.00.004	输血过程记录	对患者输血过程的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.419888	2026-03-25 18:53:22.419888
627	DE06.00.181.00.005	查房记录	对患者査房结果和诊疗相关意见的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.420233	2026-03-25 18:53:22.420233
628	DE06.00.181.00.006	简要病情	对病人简要病情的描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.430656	2026-03-25 18:53:22.430656
629	DE06.00.181.00.007	死亡讨论记录	死亡讨论过程中的具体意见描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.435328	2026-03-25 18:53:22.435328
630	DE06.00.182.00	分娩过程特殊情况描述	产妇分娩过程中特殊情况的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.455488	2026-03-25 18:53:22.455488
631	DE06.00.182.00.002	病历摘要	对患者病情摘要的描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.457041	2026-03-25 18:53:22.457041
632	DE06.00.183.00	病情概括及主要抢救措施	病危(重）通知书中的病情概括及主要抢救措施的描述，包括神志、生命体征、主要器官功能的描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.461344	2026-03-25 18:53:22.461344
633	DE06.00.184.00	目前情况	对患者当前的情况的描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.462629	2026-03-25 18:53:22.462629
634	DE06.00.185.00	患者去向代码	患者当前诊疗过程结束后的去向在特定编码体系中的代码，这里指手术结束后的去向	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.463402	2026-03-25 18:53:22.463402
635	DE06.00.186.00	操作部位代码	检查(含病理）的人体部位在特定编码体系中的代码	S3	N	4	CV06.00.227	f	\N	t	2026-03-25 18:53:22.463924	2026-03-25 18:53:22.463924
636	DE06.00.187.00	手术及操作目标部位名称	实施手术及操作的人体部位名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.464484	2026-03-25 18:53:22.464484
637	DE06.00.187.00.003	操作目标部位名称	实施操作的人体部位名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.465098	2026-03-25 18:53:22.465098
638	DE06.00.187.00.005	手术目标部位名称	实施手术的人体部位名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.465499	2026-03-25 18:53:22.465499
639	DE06.00.187.00.006	拟实施手术目标部位名称	实施手术的人体部位名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.46598	2026-03-25 18:53:22.46598
640	DE06.00.189.00	査房日期时间	开始查房时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.466438	2026-03-25 18:53:22.466438
641	DE06.00.190.00	产程经过	产程经过的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.466846	2026-03-25 18:53:22.466846
642	DE06.00.191.00	出手术室日期时间	患者离开手术室时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.467245	2026-03-25 18:53:22.467245
643	DE06.00.193.00	出院情况	对患者出院情况的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.467539	2026-03-25 18:53:22.467539
644	DE06.00.194.00	出院31天内再住院标志	标识患者本次住院出院后31 d内是否有诊疗需要的再住院安排的标志	N	N	1	EMR01.01.003	f	\N	t	2026-03-25 18:53:22.467852	2026-03-25 18:53:22.467852
645	DE06.00.195.00	出院31天内再住院目的	患者计划在本次住院出院后31 d内再住院的目的	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.468269	2026-03-25 18:53:22.468269
646	DE06.00.196.00	初诊标志代码	患者是否因该疾病首次就诊的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.468573	2026-03-25 18:53:22.468573
647	DE06.00.197.00	待产日期时间	产妇进入产房时的公元纪年日期和吋间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.468893	2026-03-25 18:53:22.468893
648	DE06.00.200.00	宫颈缝合情况	产妇宫颈缝合情况的详细描述，如缝合针数等	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.469209	2026-03-25 18:53:22.469209
649	DE06.00.200.00.001	子宫壁缝合情况	产妇子宫壁缝合情况的详细描述，如子宫壁缝合层数、缝合线、缝合方法等	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.469531	2026-03-25 18:53:22.469531
650	DE06.00.201.00	隔离标志	标识对患者是否采取隔离措施的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.469855	2026-03-25 18:53:22.469855
651	DE06.00.202.00	隔离种类代码	对患者采取的隔离种类在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.470224	2026-03-25 18:53:22.470224
652	DE06.00.204.00	发出手术安全核对表标志	对接受手术治疗的患者，标识是否已发出手术安全核对表的标忠	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.470597	2026-03-25 18:53:22.470597
653	DE06.00.204.00.001	发出手术风险评估表标志	对接受手术治疗的患者，标识是否已发出手术风险评估表的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.471094	2026-03-25 18:53:22.471094
654	DE06.00.204.00.002	关前核对标志	标识手术切口缝合前对物品是否进行了清点核对的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.47146	2026-03-25 18:53:22.47146
655	DE06.00.204.00.003	关后核对标志	标识手术切口缝合后对物品是否进行了清点核对的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.471758	2026-03-25 18:53:22.471758
656	DE06.00.205.00	医嘱核对日期时间	对医嘱进行核对时的公元纪年日期和时间的详细描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.47213	2026-03-25 18:53:22.47213
657	DE06.00.206.00	病人交接核对项目	病人在进行交接吋需要核对的项目名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.472431	2026-03-25 18:53:22.472431
1647	DE99.02.005.002	手术者姓名_2	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.896171	2026-03-25 18:53:22.896171
658	DE06.00.207.00	呼吸机监护项目	对呼吸机监测项目的描述	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.472751	2026-03-25 18:53:22.472751
659	DE06.00.208.00	呼吸类型代码	呼吸类型的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.473119	2026-03-25 18:53:22.473119
660	DE06.00.209.00	护理操作结果	多个护理操作结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.47347	2026-03-25 18:53:22.47347
661	DE06.00.209.00.002	导管护理描述	对患者进行导管护理的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.473777	2026-03-25 18:53:22.473777
662	DE06.00.210.00	护理操作项目类目名称	多个护理操作项目的名称	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.47426	2026-03-25 18:53:22.47426
663	DE06.00.211.00	护理等级代码	护理级别的分类在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.474664	2026-03-25 18:53:22.474664
664	DE06.00.212.00	护理类型代码	护理类型的分类在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.474963	2026-03-25 18:53:22.474963
665	DE06.00.213.00	阴道血肿处理	阴道血肿处理情况的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.475499	2026-03-25 18:53:22.475499
666	DE06.00.214.00	会诊目的	申请会诊医师就患者目前存在问题提出会诊要达到的目的	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.475971	2026-03-25 18:53:22.475971
667	DE06.00.215.00	Apgar评分间隔时间代码	Apgar评分间隔时间的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.476385	2026-03-25 18:53:22.476385
668	DE06.00.215.00.001	Apgai评分间隔时间代码	Apgar评分间隔时间的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.476753	2026-03-25 18:53:22.476753
669	DE06.00.216.00	常规监测项目名称	麻醉过程中，需要常规监测项目的名称	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.477116	2026-03-25 18:53:22.477116
670	DE06.00.216.00.001	特殊监测项目名称	麻醉过程中，需要特殊监测项目的名称	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.477404	2026-03-25 18:53:22.477404
671	DE06.00.218.00	抢救结束日期时间	实施抢救的结束时间的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.477709	2026-03-25 18:53:22.477709
672	DE06.00.218.00.001	产后观察日期时间	产后观察结束吋间的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.477996	2026-03-25 18:53:22.477996
673	DE06.00.218.00.002	交班日期时间	交班结束时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.478298	2026-03-25 18:53:22.478298
674	DE06.00.218.00.003	接班日期时间	接班结束时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.478573	2026-03-25 18:53:22.478573
675	DE06.00.218.00.006	症状停止日期时间	当次症状停止时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.478852	2026-03-25 18:53:22.478852
676	DE06.00.218.00.007	输血日期时间	患者输血结束时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.479138	2026-03-25 18:53:22.479138
677	DE06.00.218.00.011	医嘱停止日期时间	医嘱停止时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.479425	2026-03-25 18:53:22.479425
678	DE06.00.218.00.013	术后观察日期时间	术后观察结束吋间的公元纪年R期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.479691	2026-03-25 18:53:22.479691
679	DE06.00.218.00.014	讨论日期时间	医学相关讨论结束时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.480015	2026-03-25 18:53:22.480015
680	DE06.00.218.00.015	建档日期时间	患者电子病历初次建档完成吋的公元纪年R期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.480349	2026-03-25 18:53:22.480349
681	DE06.00.218.00.017	手术结束日期时间	对患者结束手术操作时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.48064	2026-03-25 18:53:22.48064
682	DE06.00.218.00.018	小结日期时间	记录小结完成的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.480886	2026-03-25 18:53:22.480886
683	DE06.00.219.00	医嘱计划结束日期时间	医嘱计划结束时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.481193	2026-03-25 18:53:22.481193
684	DE06.00.220.00	医嘱开立日期时间	医嘱开立结朿时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.481581	2026-03-25 18:53:22.481581
685	DE06.00.220.00.001	出院医嘱开立日期时间	出院医嘱开立结束时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.482219	2026-03-25 18:53:22.482219
686	DE06.00.221.00	抢救开始日期时间	实施抢救的开始时间的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.482904	2026-03-25 18:53:22.482904
687	DE06.00.221.00.004	症状开始日期时间	当次症状开始发生时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.483404	2026-03-25 18:53:22.483404
688	DE06.00.221.00.007	手术日期时间	患者住院期间开始实施手术时的公元纪年曰期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.483825	2026-03-25 18:53:22.483825
689	DE06.00.221.00.008	手术及操作开始日期时间	对患者开始实施手术操作吋的公元纪年曰期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.484226	2026-03-25 18:53:22.484226
690	DE06.00.221.00.011	拟定输血日期时间	拟对患者开始进行输血时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.484574	2026-03-25 18:53:22.484574
691	DE06.00.221.00.013	手术开始日期时间	对患者开始手术操作时的公元纪年日期和吋间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.484829	2026-03-25 18:53:22.484829
692	DE06.00.221.00.015	拟实施手术及操作日期时间	拟对患者开始实施手术操作的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.485104	2026-03-25 18:53:22.485104
693	DE06.00.222.00	医嘱执行日期时间	医嘱执行结束时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.485492	2026-03-25 18:53:22.485492
694	DE06.00.222.00.001	医嘱计划开始日期时间	医嘱计划开始时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.485854	2026-03-25 18:53:22.485854
695	DE06.00.223.00	离院方式代码	患者本次住脘离开医院的方式在特定编码体系中的代码	S3	N1	\N	WT01.01.017	f	\N	t	2026-03-25 18:53:22.486223	2026-03-25 18:53:22.486223
696	DE06.00.224.00	临产日期时间	产妇规律宫缩开始时的公元纪年日期和吋间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.486551	2026-03-25 18:53:22.486551
697	DE06.00.225.00	麻醉恢复情况	对麻醉恢复情况的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.486835	2026-03-25 18:53:22.486835
698	DE06.00.226.00	麻醉描述	麻醉过程的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.487195	2026-03-25 18:53:22.487195
699	DE06.00.227.00	麻醉适应证	麻醉适应证的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.487651	2026-03-25 18:53:22.487651
700	DE06.00.228.00	气管插管分类	标识全身麻醉时气管插管分类的描述	S1	A	100	\N	f	\N	t	2026-03-25 18:53:22.487965	2026-03-25 18:53:22.487965
701	DE06.00.229.00	气管护理代码	气管护理类别的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.488468	2026-03-25 18:53:22.488468
702	DE06.00.230.00	气管检查结果	麻醉术前访视时，对气管检査结果的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.489031	2026-03-25 18:53:22.489031
703	DE06.00.231.00	抢救措施	进行抢救过程中采取的措施	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.489519	2026-03-25 18:53:22.489519
704	DE06.00.233.00	淸醒日期时间	麻醉后患者清醒时的公元纪年H期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.489935	2026-03-25 18:53:22.489935
705	DE06.00.234.00	医嘱取消日期时间	取消医嘱时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.490312	2026-03-25 18:53:22.490312
706	DE06.00.235.00	收人观察室日期时间	急诊患者被收入观察室或监护室的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.490685	2026-03-25 18:53:22.490685
707	DE06.00.236.00	入手术室日期时间	患者进人手术室时的公元纪年日期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.491053	2026-03-25 18:53:22.491053
708	DE06.00.237.00	入病房方式	患者进入病房吋采用的方式，如步行、轮椅等	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.491396	2026-03-25 18:53:22.491396
709	DE06.00.238.00	生活方式指导	对患者出院后进行生活方式指导	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.49179	2026-03-25 18:53:22.49179
710	DE06.00.239.00	使用呼吸机标志	标识患者是否同意使用呼吸机辅助通气的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.492099	2026-03-25 18:53:22.492099
711	DE06.00.240.00	使用麻醉钺痛泵标志	标识患者是否同意使用麻醉镇痛泵的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.492398	2026-03-25 18:53:22.492398
712	DE06.00.241.00	数量	高值耗材的实际使用数量	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.492684	2026-03-25 18:53:22.492684
713	DE06.00.242.00	使用途径	髙值耗材的使用途径	S1	AN	30	\N	f	\N	t	2026-03-25 18:53:22.493022	2026-03-25 18:53:22.493022
714	DE06.00.243.00	使用医疗机构中药制剂标志	标识是否使用了医疗机构中药制剂的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.493365	2026-03-25 18:53:22.493365
715	DE06.00.244.00	使用中医诊疗设备标志	标识是否使用了中医诊疗设备的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.493654	2026-03-25 18:53:22.493654
716	DE06.00.245.00	使用中医诊疗技术标志	标识是否使用了中医诊疗技术的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.494013	2026-03-25 18:53:22.494013
717	DE06.00.247.00	实施临床路径标志代码	是否实施临床路径或实施临床路径的中、西医类别的分类代码	S2	N1	\N	EMR01.01.002	f	\N	t	2026-03-25 18:53:22.494356	2026-03-25 18:53:22.494356
718	DE06.00.250.00	操作次数	实施手术及操作的次数	N	N	3	\N	f	\N	t	2026-03-25 18:53:22.494704	2026-03-25 18:53:22.494704
719	DE06.00.251.00	手术及操作方法	手术及操作方法的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.495125	2026-03-25 18:53:22.495125
720	DE06.00.251.00.001	其他医学处置	临床医师对患者实施的除检查/检验、用药、手术/操作以外的医学处置的描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.495457	2026-03-25 18:53:22.495457
721	DE06.00.251.00.003	操作方法	手术/操作方法的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.495866	2026-03-25 18:53:22.495866
722	DE06.00.251.00.004	操作方法描述	操作方法的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.496268	2026-03-25 18:53:22.496268
723	DE06.00.251.00.005	拟行有创操作和监测方法	麻醉过程中拟实施的有创操作和监测的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.496525	2026-03-25 18:53:22.496525
724	DE06.00.253.00	麻醉效果	实施麻醉效果的描述	S1	A	100	\N	f	\N	t	2026-03-25 18:53:22.496821	2026-03-25 18:53:22.496821
725	DE06.00.254.00	手术要点	手术要点的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.49713	2026-03-25 18:53:22.49713
726	DE06.00.255.00	手术级别代码	按照手术分级管理制度，根据风险性和难易程度不同划分的手术级别在特定编码体系中的代码	S3	N1	\N	CV05.10.024	f	\N	t	2026-03-25 18:53:22.497428	2026-03-25 18:53:22.497428
727	DE06.00.256.00	手术间编号	对患者实施手术操作时所在的手术室房间编号	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.497659	2026-03-25 18:53:22.497659
728	DE06.00.259.00	手术全程时间_min	手术全程所用的总时长，计量单位为min	N	N1	4	\N	f	\N	t	2026-03-25 18:53:22.497943	2026-03-25 18:53:22.497943
729	DE06.00.260.00	手术体位代码	手术时患者采取的体位在特定编码体系中的代码	S3	N1	\N	CV06.00.227	f	\N	t	2026-03-25 18:53:22.498224	2026-03-25 18:53:22.498224
730	DE06.00.261.00	受孕形式代码	受孕采取的形式的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.498507	2026-03-25 18:53:22.498507
731	DE06.00.262.00	输血成分	输血成分的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.498751	2026-03-25 18:53:22.498751
732	DE06.00.263.00	输血次数	输血次数的累计值	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.499008	2026-03-25 18:53:22.499008
733	DE06.00.264.00	输血反应标志	标识患者术中输血后是否发生了输血反应的标志	N	N	1	EMR01.01.003	f	\N	t	2026-03-25 18:53:22.499315	2026-03-25 18:53:22.499315
734	DE06.00.265.00	输血反应类型代码	患者发生输血反应的分类在特定编码体系中的代码	S3	N1	\N	CV05.01.040	f	\N	t	2026-03-25 18:53:22.499644	2026-03-25 18:53:22.499644
735	DE06.00.266.00	输血方式	输血同意书中本次输血方式的详细描述，如自体输血、异体输血	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.499983	2026-03-25 18:53:22.499983
736	DE06.00.267.00	输血量_mL	输人红细胞、血小板、血浆、全血等的数量，计量单位为mL	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.500581	2026-03-25 18:53:22.500581
737	DE06.00.268.00	输液最_mL	术中输液麗的描述，单位为mL	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.500938	2026-03-25 18:53:22.500938
738	DE06.00.268.00.001	输液量_mL	术中输液量的描述，单位为mL	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.501441	2026-03-25 18:53:22.501441
739	DE06.00.269.00	术中输液项目	手术过程中输人液体的描述	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.501719	2026-03-25 18:53:22.501719
740	DE06.00.270.00	手术或分娩后天数	截止当前记录日期为止，患者行手术或分娩后的天数	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.502018	2026-03-25 18:53:22.502018
741	DE06.00.271.00	术前准备	手术前准备工作的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.502279	2026-03-25 18:53:22.502279
742	DE06.00.273.00	胎盘娩出日期时间	胎盘娩出时的公元纪年R期和时间的完整描述	DT	DTI 5	\N	\N	f	\N	t	2026-03-25 18:53:22.502535	2026-03-25 18:53:22.502535
743	DE06.00.274.00	讨论地点	患者诊疗相关讨论的地点	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.502826	2026-03-25 18:53:22.502826
744	DE06.00.278.00	病危_重_通知内容	患者病情危、重时，由经治医师或值班医师向患者家属告知病情危重情况的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.503112	2026-03-25 18:53:22.503112
745	DE06.00.279.00	通知医师日期时间	通知负责医师时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.50341	2026-03-25 18:53:22.50341
746	DE06.00.280.00	通知医师标志	标识是否已通知医师的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.503703	2026-03-25 18:53:22.503703
747	DE06.00.281.00	常规监测项目结果	麻醉过程中，常规监测项3结果的详细〖己录	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.504007	2026-03-25 18:53:22.504007
748	DE06.00.281.00.001	特殊监测项目结果	麻醉过程中，特殊监测项目结果的详细记录	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.504279	2026-03-25 18:53:22.504279
749	DE06.00.283.00	心理护理代码	心理护理类别的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.504546	2026-03-25 18:53:22.504546
750	DE06.00.284.00	修补手术过程	修补手术过程情况的详细描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.504794	2026-03-25 18:53:22.504794
751	DE06.00.286.00	医嘱类别代码	表示临床医嘱类别的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.505108	2026-03-25 18:53:22.505108
752	DE06.00.287.00	中药处方医嘱内容	对中药处方医嘱内容的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.505391	2026-03-25 18:53:22.505391
753	DE06.00.287.00.005	出院医嘱	对患者出院医嘱的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.505658	2026-03-25 18:53:22.505658
754	DE06.00.287.00.006	医嘱内容	医嘱内容的详细描述，中医依据《中药处方格式及书写规范》描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.505979	2026-03-25 18:53:22.505979
755	DE06.00.287.00.007	术前麻醉医嘱	术前麻醉医师下达的医嘱	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.506297	2026-03-25 18:53:22.506297
756	DE06.00.288.00	医嘱项目内容	对医嘱项目具体内容的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.506551	2026-03-25 18:53:22.506551
757	DE06.00.289.00	医嘱项目类型代码	医嘱项目分类在特定编码体系中的代码	S3	N2	\N	CV06.00.229	f	\N	t	2026-03-25 18:53:22.506845	2026-03-25 18:53:22.506845
758	DE06.00.290.00	医嘱执行状态	显示医嘱执行状态的信息描述	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.507189	2026-03-25 18:53:22.507189
759	DE06.00.291.00	饮食指导代码	饮食指导类别在特定编码体系中的代码	S3	N2	\N	\N	f	\N	t	2026-03-25 18:53:22.507546	2026-03-25 18:53:22.507546
760	DE06.00.292.00	营养护理	营养护理的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.507849	2026-03-25 18:53:22.507849
761	DE06.00.293.00	手术用药量	手术用药用量的详细描述	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.508214	2026-03-25 18:53:22.508214
762	DE06.00.294.00	处方有效天数	门（急）诊医师开具的处方的有效天数	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.50856	2026-03-25 18:53:22.50856
763	DE06.00.296.00	诊疗过程描述	对患者诊疗过程的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.508868	2026-03-25 18:53:22.508868
764	DE06.00.297.00	诊疗过程名称	诊疗过程的名称描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.509195	2026-03-25 18:53:22.509195
765	DE06.00.298.00	接班诊疗计划	接班后的诊疗计划，具体的检査、中西医治疗措施及中医调护	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.509519	2026-03-25 18:53:22.509519
766	DE06.00.298.00.001	转入诊疗计划	患者转入科室后的诊疗计划，具体的检査、中西医治疗措施及中医调护	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.509865	2026-03-25 18:53:22.509865
767	DE06.00.298.00.003	诊疗计划	具体的检査、中西医治疗措施及中医调护	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.510253	2026-03-25 18:53:22.510253
768	DE06.00.299.00	复诊指导	患者出院后再次就诊情况指导	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.510811	2026-03-25 18:53:22.510811
769	DE06.00.300.00	治则治法	根据辨证结果采用的治则治法名称术语	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.511183	2026-03-25 18:53:22.511183
770	DE06.00.301.00	替代方案	医生即将为患者实施的手术或有创性操作方案之外的其他方案，供患者选择	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.511487	2026-03-25 18:53:22.511487
771	DE06.00.301.00.001	手术方案	手术方案的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.511771	2026-03-25 18:53:22.511771
772	DE06.00.302.00	手术方式	拟实施手术方式的描述	S1	A	30	\N	f	\N	t	2026-03-25 18:53:22.512086	2026-03-25 18:53:22.512086
773	DE06.00.304.00	治疗类别代码	对患者采用的医学治疗方法类别在特定编码体系中的代码	S3	N	3	\N	f	\N	t	2026-03-25 18:53:22.512332	2026-03-25 18:53:22.512332
774	DE06.00.305.00	特殊检查及特殊治疗目的	拟进行的特殊检査及特殊治疗的目的描述	S1	A	100	\N	f	\N	t	2026-03-25 18:53:22.51262	2026-03-25 18:53:22.51262
775	DE06.00.306.00	特殊检查及特殊治疗项目名称	拟进行的特殊检查及特殊治疗项目名称的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.512876	2026-03-25 18:53:22.512876
776	DE06.00.307.00	麻醉中西医标识代码	麻醉方法的中西医类别的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.513185	2026-03-25 18:53:22.513185
777	DE06.00.308.00	主要治疗措施	出现症状采取的主要措施，包含中医及民族医相关治疗措施	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.513571	2026-03-25 18:53:22.513571
778	DE06.00.309.00	住院病程	住院病历中病程记录内容的详细描述	S1	AN	2000	\N	f	\N	t	2026-03-25 18:53:22.513827	2026-03-25 18:53:22.513827
779	DE06.00.310.00	住院天数	患者当前实际的住院天数	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.514118	2026-03-25 18:53:22.514118
780	DE06.00.311.00	阴道助产标志	标识胎儿娩出是否采取阴道助产的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.514391	2026-03-25 18:53:22.514391
781	DE06.00.312.00	阴道助产方式	胎儿娩出时采取的阴迫助产方式的名称	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.514669	2026-03-25 18:53:22.514669
782	DE06.00.313.00	转出日期时间	患者转出时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.515022	2026-03-25 18:53:22.515022
783	DE06.00.314.00	转科记录类型	患者在院期间转科记录类别的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.515349	2026-03-25 18:53:22.515349
784	DE06.00.315.00	转科目的	对患者转科目的的详细描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.515622	2026-03-25 18:53:22.515622
785	DE06.00.316.00	转入日期时间	患者转入时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.515885	2026-03-25 18:53:22.515885
786	DE06.00.317.00	准备事项	针对病人实施手术的准备工作描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.516324	2026-03-25 18:53:22.516324
787	DE06.00.318.00	供氧时间_min	供氧时间的时长，计量单位为min	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.516586	2026-03-25 18:53:22.516586
788	DE06.00.319.00	会诊类型	申请会诊的类型描述，如：院内会诊、院外会诊、多学科会诊等	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.516845	2026-03-25 18:53:22.516845
789	DE06.00.321.00	手术切口描述	对手术中皮肤切口情况的具体描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.517176	2026-03-25 18:53:22.517176
790	DE06.00.338.00	收回手术安全核对表标志	对接受手术治疗的患者，标识是否已收回手术安全核对表的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.517551	2026-03-25 18:53:22.517551
791	DE06.00.338.00.001	收回手术风险评估表标志	对接受手术治疗的患者，标识是否已收回手术风险评估表的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.517819	2026-03-25 18:53:22.517819
792	DE06.00.339.00	入院途径代码	患者收治入院治疗的来源分类在特定编码体系中的代码	S3	N1	\N	WT01.01.009	f	\N	t	2026-03-25 18:53:22.518126	2026-03-25 18:53:22.518126
793	DE06.00.340.00	手术指征	患者具备的、适宜实施手术的主要症状和体征描述	S1	AN	500	\N	f	\N	t	2026-03-25 18:53:22.518429	2026-03-25 18:53:22.518429
794	DE06.00.340.00.002	输血指征	受血者接受输血治疗的指征描述	S1	AN	500	\N	f	\N	t	2026-03-25 18:53:22.518722	2026-03-25 18:53:22.518722
795	DE06.00.341.00	放置部位	引流管放置在病人体内的具体位置的描述	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.519009	2026-03-25 18:53:22.519009
796	DE06.00.342.00	护理操作名称	进行护理操作的具体名称	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.519288	2026-03-25 18:53:22.519288
797	DE06.00.343.00	会诊日期时间	会诊结束时的公元纪年R期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.519553	2026-03-25 18:53:22.519553
798	DE07.00.001.00	住院自付金额	以除全自费以外方式付费的患者的住院总费用中，由患者支付的费用金额，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.519811	2026-03-25 18:53:22.519811
799	DE07.00.004.00	处方药品金额	处方药品的计价金额，单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.520162	2026-03-25 18:53:22.520162
800	DE07.00.004.00.001	门诊总费用	患者门诊就诊所发生的费用金额，计量单位为人民币元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.520431	2026-03-25 18:53:22.520431
801	DE07.00.007.00	医疗付费方式代码	患者单次住院诊疗所发生费用的支付方式在特定编码体系中的代码	S3	N2	\N	CV07.10.005	f	\N	t	2026-03-25 18:53:22.520687	2026-03-25 18:53:22.520687
1648	DE99.02.005.003	手术者姓名_3	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.896501	2026-03-25 18:53:22.896501
802	DE07.00.010.00	住院总费用	患者在住院期间所有项目的费用之和，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.520994	2026-03-25 18:53:22.520994
803	DE07.00.010.00.002	中医辨证论治费	包括普通门诊、副主任医师门诊、主任医师门诊、国医大师门诊、急诊、门/急诊留观及住院中医辨证论治费	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.521321	2026-03-25 18:53:22.521321
804	DE07.00.010.00.003	中医辨证论治会诊费	包括院际、院内及远程中医辨证论治会诊费	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.521611	2026-03-25 18:53:22.521611
805	DE07.00.010.00.017	中医类_中医诊断费	经络穴位诊断、经络穴位分析、耳穴诊断、脉图诊断、舌象图诊断等中医诊断所产生的费用	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.52198	2026-03-25 18:53:22.52198
806	DE07.00.010.00.019	中医外治费	采用中医外治方法进行治疗产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.522265	2026-03-25 18:53:22.522265
807	DE07.00.010.00.020	中医骨伤费	采用中医骨伤整复技术进行治疗产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.522533	2026-03-25 18:53:22.522533
808	DE07.00.010.00.021	针刺与灸法费	采用中医针灸进行治疗产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.522842	2026-03-25 18:53:22.522842
809	DE07.00.010.00.022	中医推拿治疗费	采用中医推拿进行治疗产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.523194	2026-03-25 18:53:22.523194
810	DE07.00.010.00.023	中医肛肠治疗费	采用中医方法治疗肛肠疾病所产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.523481	2026-03-25 18:53:22.523481
811	DE07.00.010.00.024	中医特殊治疗费	采用中医特殊治疗产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.523917	2026-03-25 18:53:22.523917
812	DE07.00.010.00.025	中医类_中医其他费用	中医特殊调配加工费和辨证施膳费	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.524554	2026-03-25 18:53:22.524554
813	DE07.00.010.00.026	中药特殊调配加工费	中药调配、煎煮、加工等产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.52538	2026-03-25 18:53:22.52538
814	DE07.00.010.00.027	辨证施膳费	中医辨证施膳指导所产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.525966	2026-03-25 18:53:22.525966
815	DE07.00.010.00.031	医疗机构中药制剂费	患者住院期间使用医疗机构中药制剂所产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.526526	2026-03-25 18:53:22.526526
816	DE07.00.010.00.034	白蛋白类制品费	患者住院期间使用白蛋白的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.527169	2026-03-25 18:53:22.527169
817	DE07.00.010.00.042	综合医疗服务类_一般医疗服务费	各科室共同使用的医疗服务项目，包括诊查费、床位费、会诊费、营养咨询等的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.52762	2026-03-25 18:53:22.52762
818	DE07.00.010.00.043	综合医疗服务类_一般治疗操作费	各科室共同使用的医疗服务项目，包括注射、清创、换药、导尿、吸氧、抢救、重症监护等的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.528039	2026-03-25 18:53:22.528039
819	DE07.00.010.00.044	综合医疗服务类_护理费	患者住院期间等级护理费用及专项护理费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.528569	2026-03-25 18:53:22.528569
820	DE07.00.010.00.045	综合医疗服务类_其他费用	各科室共同使用的医疗服务项目，包括病房取暖费、病房空调费、救护车使用费、尸体料理费等的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.529051	2026-03-25 18:53:22.529051
821	DE07.00.010.00.046	诊断类_病理诊断费	患者住院期间进行病理学有关检査项目的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.530177	2026-03-25 18:53:22.530177
822	DE07.00.010.00.047	诊断类_实验室诊断费	患者住院期间进行各项实验室检验的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.530838	2026-03-25 18:53:22.530838
823	DE07.00.010.00.048	诊断类_影像学诊断费	患者住院期间进行透视、造影、CT、磁共振检査、B起检査、核索扫描、PET等影像学检査的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.531591	2026-03-25 18:53:22.531591
824	DE07.00.010.00.049	诊断类_临床诊断项目费	临床科室开展的其他用于诊断的各种检查项目的费用，包括有关内镜检查、肛门指诊、视力检测等项目费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.532443	2026-03-25 18:53:22.532443
825	DE07.00.010.00.050	治疗类_非手术治疗项目费	临床利用无创手段进行治疗的项目产生的费用包括高压氧舱、血液净化、精神治疗、临床物理治疗等，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.533328	2026-03-25 18:53:22.533328
826	DE07.00.010.00.051	临床物理治疗费	临床利用光、电、热等外界物理因素进行治疗的项目产生的费用，如放射治疗、放射性核素治疗、聚焦超声治疗等项目产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.534182	2026-03-25 18:53:22.534182
827	DE07.00.010.00.052	治疗类_手术治疗费	临床利用有创手段进行治疗的项目产生的费用包括麻醉费及各种介人、孕产、手术治疗等费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.535206	2026-03-25 18:53:22.535206
828	DE07.00.010.00.053	麻醉费	手术治疗费中麻醉产生的费用，计雄位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.536637	2026-03-25 18:53:22.536637
829	DE07.00.010.00.054	手术费	手术治疗费中手术产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.537225	2026-03-25 18:53:22.537225
830	DE07.00.010.00.055	康复类_康复费	对患者进行康复治疗产生的费用，包括康复评定和治疗，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.537756	2026-03-25 18:53:22.537756
831	DE07.00.010.00.056	中医类_中医治疗费	采用中医技术进行治疗产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.538362	2026-03-25 18:53:22.538362
832	DE07.00.010.00.057	西药类_西药费	患者住院期间使用西药所产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.539085	2026-03-25 18:53:22.539085
833	DE07.00.010.00.058	抗菌药物费用	患者住皖期间使用抗菌药物所产生的费用，包含于M药费中，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.539638	2026-03-25 18:53:22.539638
834	DE07.00.010.00.059	中药类_中成药费	患者住院期间使用中成药（含医疗机构中药制剂）所产生的费用，计童单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.540168	2026-03-25 18:53:22.540168
835	DE07.00.010.00.060	中草药费	患者住院期间使用中草药（含散装中药饮片、小包装中药饮片、中药配方颗粒）所产生的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.540602	2026-03-25 18:53:22.540602
836	DE07.00.010.00.061	血液和血液制品类_血费	患者住院期间使用临床用血所产生的费用，包括输注全血、红细胞、血小板、白细胞、血浆的费用医疗机构对患者临床用血的收费包括血站供应价格、配血费和储血费，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.541134	2026-03-25 18:53:22.541134
837	DE07.00.010.00.062	球蛋白类制品费	患者住院期间使用球蛋白的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.541477	2026-03-25 18:53:22.541477
838	DE07.00.010.00.063	凝血因子类制品费	患者住院期间使用凝血因子的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.54185	2026-03-25 18:53:22.54185
839	DE07.00.010.00.064	细胞因子类制品费	患者住院期间使用细胞因子的费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.54275	2026-03-25 18:53:22.54275
840	DE07.00.010.00.065	耗材类_检查用一次性医用材料费	患者住院期间检査检验所使用的一次性医用材料费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.543362	2026-03-25 18:53:22.543362
841	DE07.00.010.00.066	耗材类_治疗用一次性医用材料费	患者住院期间治疗所使用的一次性医用材料费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.543857	2026-03-25 18:53:22.543857
842	DE07.00.010.00.067	耗材类_手术用一次性医用材料费	患者住院期间进行手术、介人操作时所使用的一次性医用材料费用，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.544258	2026-03-25 18:53:22.544258
843	DE07.00.010.00.068	其他类_其他费用	患者住院期间未能归人以上各类的费用总和，计量单位为元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.544637	2026-03-25 18:53:22.544637
844	DE07.00.010.00.069	住院费用金额	住院者在住院期间所有项目的费用，计量单位为人民币元	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.545089	2026-03-25 18:53:22.545089
845	DE08.10.013.00	诊断机构名称	对患者所患疾病作出诊断的医疗机构的组织机构名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.545615	2026-03-25 18:53:22.545615
846	DE08.10.013.00.001	转入医疗机构名称	患者转入的医疗机构的组织机构名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.545915	2026-03-25 18:53:22.545915
847	DE08.10.013.00.003	检查申请机构名称	申请作检查项目的医疗机构名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.546245	2026-03-25 18:53:22.546245
848	DE08.10.013.00.004	检查报告机构名称	检査报告的机构的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.546614	2026-03-25 18:53:22.546614
849	DE08.10.013.00.005	会诊申请医疗机构名称	申请会诊医疗机构的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.546897	2026-03-25 18:53:22.546897
850	DE08.10.013.00.006	会诊医师所在医疗机构名称	会诊医师所在医疗机构名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.547329	2026-03-25 18:53:22.547329
851	DE08.10.013.00.007	会诊所在医疗机构名称	会诊所在医疗机构的组织机构名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.547672	2026-03-25 18:53:22.547672
852	DE08.10.013.00.009	拟接收医疗机构名称	患者本次住院所在的医疗机构根据诊疗需要，拟将患者转往的其他医疗机构的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.5481	2026-03-25 18:53:22.5481
853	DE08.10.013.00.010	检验申请机构名称	申请做检验项目的医疗机构名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.54845	2026-03-25 18:53:22.54845
854	DE08.10.013.00.011	检验报告机构名称	检验报告单的机构的名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.549102	2026-03-25 18:53:22.549102
855	DE08.10.013.00.012	医疗机构名称	患者就诊所在的医疗机构名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.549436	2026-03-25 18:53:22.549436
856	DE08.10.026.00	科室名称	患者在医疗机构就诊的科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.54984	2026-03-25 18:53:22.54984
857	DE08.10.026.00.003	医疗机构科室名称	患者就诊的医疗机构科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.550285	2026-03-25 18:53:22.550285
858	DE08.10.026.00.004	转出医疗机构科室名称	患者转出的医疗机构所属科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.550632	2026-03-25 18:53:22.550632
859	DE08.10.026.00.005	转入医疗机构科室名称	患者转入的医疗机构所属科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.551025	2026-03-25 18:53:22.551025
860	DE08.10.026.00.008	转出科室	患者转出去的科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.55141	2026-03-25 18:53:22.55141
861	DE08.10.026.00.009	转入科室	患者转入科室的名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.551798	2026-03-25 18:53:22.551798
862	DE08.10.026.00.011	检查申请科室	申请检查的科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.552114	2026-03-25 18:53:22.552114
863	DE08.10.026.00.012	检查报告科室	检査报告的科室的名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.552456	2026-03-25 18:53:22.552456
864	DE08.10.026.00.013	会诊申请科室	申请会诊的科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.552821	2026-03-25 18:53:22.552821
865	DE08.10.026.00.014	会诊科室名称	会诊科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.553165	2026-03-25 18:53:22.553165
866	DE08.10.026.00.018	医嘱开立科室	开立医嘱的科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.553454	2026-03-25 18:53:22.553454
867	DE08.10.026.00.019	医嘱执行科室	执行医嘱的科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.553737	2026-03-25 18:53:22.553737
868	DE08.10.026.00.020	检验申请科室	申请检验的科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.554139	2026-03-25 18:53:22.554139
869	DE08.10.026.00.021	检验报告科室	检验报告单的科室的名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.554422	2026-03-25 18:53:22.554422
870	DE08.10.026.00.022	入院科别	患者入院时，入住的科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.554759	2026-03-25 18:53:22.554759
871	DE08.10.026.00.023	转科科别	患者住院期间转科的转入科室名称，如果超过一次以上的转科，用“―”转接表示	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.555069	2026-03-25 18:53:22.555069
872	DE08.10.026.00.024	出院科别	患者出院时的科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.555398	2026-03-25 18:53:22.555398
873	DE08.10.026.00.025	处方开立科室名称	开具处方的门（急)诊科室名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.555747	2026-03-25 18:53:22.555747
874	DE08.10.042.00	产品生产厂家	医用耗材生产单位的单位名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.556182	2026-03-25 18:53:22.556182
875	DE08.10.052.00	组织机构代码	经《医疗机构执业许可证》登记的，并按照特定编码体系填写的代码	S3	AN	10	\N	f	\N	t	2026-03-25 18:53:22.556501	2026-03-25 18:53:22.556501
876	DE08.10.052.00.001	转出医疗机构代码	患者转出的医疗机构经《医疗机构执业许可证》登记的，并按照特定编码体系填写的代码	S3	AN	10	\N	f	\N	t	2026-03-25 18:53:22.556813	2026-03-25 18:53:22.556813
877	DE08.10.052.00.002	建档医疗机构组织机构	建档医疗机构经《医疗机构执业许可证》登记的，并按照特定编码体系填写的代码	S3	AN	10	\N	f	\N	t	2026-03-25 18:53:22.557164	2026-03-25 18:53:22.557164
878	DE08.10.054.00	病区名称	患者当前所在病区的名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.557512	2026-03-25 18:53:22.557512
879	DE08.10.061.00	专科情况	根据专科需要对患者进行专科特殊检査结果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.557806	2026-03-25 18:53:22.557806
880	DE08.30.031.00	专业技术职务类别代码	医护人员专业技术职务分类在特定编码体系中的代码	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.558211	2026-03-25 18:53:22.558211
881	DE08.30.032.00	参加抢救人员名单	所有参加抢救医务人员姓名列表	S1	A	200	\N	f	\N	t	2026-03-25 18:53:22.558545	2026-03-25 18:53:22.558545
882	DE08.30.032.00.003	参加讨论人员名单	参加术前讨论的人员姓名列表	S1	A	200	\N	f	\N	t	2026-03-25 18:53:22.558856	2026-03-25 18:53:22.558856
883	DE08.50.011.00	药物剂型代码	药物剂型类别在特定编码体系中的代码	S3	N2	\N	\N	f	\N	t	2026-03-25 18:53:22.559607	2026-03-25 18:53:22.559607
884	DE08.50.022.00	产时用药	产时所用药物的通用名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.560178	2026-03-25 18:53:22.560178
885	DE08.50.022.00.002	产后用药	产后所用药物的通用名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.560611	2026-03-25 18:53:22.560611
886	DE08.50.022.00.003	关键药物名称	与本次就诊相关的关键药物通用名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.561093	2026-03-25 18:53:22.561093
887	DE08.50.022.00.004	麻醉药物名称	所用麻醉药物的通用名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.56147	2026-03-25 18:53:22.56147
888	DE08.50.022.00.008	宫缩剂名称	所使用宫缩剂的名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.5618	2026-03-25 18:53:22.5618
889	DE08.50.022.00.009	手术用药	手术所用药物的通用名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.562219	2026-03-25 18:53:22.562219
890	DE08.50.022.00.010	其他用药	其他使用药物的通用名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.562549	2026-03-25 18:53:22.562549
891	DE08.50.022.00.012	药物名称	药物通用名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.562888	2026-03-25 18:53:22.562888
892	DE08.50.023.00	药物使用次剂量	单次使用药物的剂M	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.56329	2026-03-25 18:53:22.56329
893	DE08.50.024.00	药物使用剂量单位	标识药物剂量的计量单位	S1	AN	6	\N	f	\N	t	2026-03-25 18:53:22.56364	2026-03-25 18:53:22.56364
894	DE08.50.027.00	标本固定液名称	用于标本固定的液体的名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.563928	2026-03-25 18:53:22.563928
895	DE08.50.032.00	处方类别代码	门（急)诊处方的中药类别的分类代码	S2	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.564488	2026-03-25 18:53:22.564488
896	DE08.50.033.00	处方开立日期	门（急)诊医师开具处方当日的公元纪日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.564829	2026-03-25 18:53:22.564829
897	DE08.50.034.00	耗材单位	高值耗材的单位规格	S1	AN	6	\N	f	\N	t	2026-03-25 18:53:22.565202	2026-03-25 18:53:22.565202
898	DE08.50.035.00	产品供应商	医用耗材供应单位的单位名称	S1	AN	70	\N	f	\N	t	2026-03-25 18:53:22.565544	2026-03-25 18:53:22.565544
899	DE08.50.036.00	输血量计量单位	输人血液或血液成分的计量单位，可包含汉字的字符，如mL、单位、治疗量等	S1	A	10	\N	f	\N	t	2026-03-25 18:53:22.565949	2026-03-25 18:53:22.565949
900	DE08.50.037.00	介入物名称	实施手术操作时使用或放置的材料及药物的名称	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.566277	2026-03-25 18:53:22.566277
901	DE08.50.040.00	输血品种代码	褕人全血或血液成分类别在特定编码体系中的代码	S3	N	2	CV04.50.021	f	\N	t	2026-03-25 18:53:22.566707	2026-03-25 18:53:22.566707
902	DE08.50.042.00	术中所用物品名称	术中所用物品的名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.567025	2026-03-25 18:53:22.567025
903	DE08.50.043.00	药物规格	药物规格的描述，如〇.25g	S1	A	20	\N	f	\N	t	2026-03-25 18:53:22.567387	2026-03-25 18:53:22.567387
904	DE08.50.044.00	材料名称	高值耗材名称	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.567778	2026-03-25 18:53:22.567778
905	DE08.50.044.00.001	引流材料名称	对手术中引流材料名称的具体描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.568098	2026-03-25 18:53:22.568098
906	DE08.50.045,00	引流材料数目	对手术中引流材料数目的具体描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.568418	2026-03-25 18:53:22.568418
907	DE08.50.047.00	中药煎煮方法	中药煎煮的方法的描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.5688	2026-03-25 18:53:22.5688
908	DE08.50.047.00.001	中药饮片煎煮法	中药饮片煎煮方法描述	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:22.569333	2026-03-25 18:53:22.569333
909	DE08.50.049.00	中药饮片处方	中药饮片处方的详细描述	S1	AN	500	\N	f	\N	t	2026-03-25 18:53:22.569878	2026-03-25 18:53:22.569878
910	DE08.50.050.00	中药饮片剂数_剂	本次就诊给患者所开屮药饮片的剂数，计童单位为剂	N	N	2	\N	f	\N	t	2026-03-25 18:53:22.570328	2026-03-25 18:53:22.570328
911	DE08.50.055.00	产品编码	医用耗材出厂时的唯一代码/产品流水号	S1	N	20	\N	f	\N	t	2026-03-25 18:53:22.57068	2026-03-25 18:53:22.57068
912	DE08.50.056.00	处方药品组号	由系统从1开始根据自然递增的原则赋予每条新增医嘱的顺序号	S1	N	\N	\N	f	\N	t	2026-03-25 18:53:22.571008	2026-03-25 18:53:22.571008
913	DE08.50.057.00	皮肤消毒描述	对手术中皮肤消毒情况的具体描述	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.571368	2026-03-25 18:53:22.571368
914	DE08.50.058.00	植入性耗材标志	标识是否为植入性高值耗材的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.571685	2026-03-25 18:53:22.571685
915	DE09.00.053.00	记录日期时间	完成此项业务活动时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.572077	2026-03-25 18:53:22.572077
916	DE09.00.053.00.014	产程记录日期时间	产程记录完成时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.572396	2026-03-25 18:53:22.572396
917	DE09.00.053.00.022	病危_重_通知日期时间	病危(重）通知书下达时的公元纪年R期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.572718	2026-03-25 18:53:22.572718
918	DE09.00.053.00.023	法定代理人签名日期时间	法定代理人签名时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.57305	2026-03-25 18:53:22.57305
919	DE09.00.053.00.037	麻醉医师签名日期时间	麻醉医师进行电子签名时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.573375	2026-03-25 18:53:22.573375
920	DE09.00.053.00.038	签名日期时间	进行电子签名时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.573705	2026-03-25 18:53:22.573705
921	DE09.00.053.00.039	患者_法定代理人签名日期时间	患者/法定代理人签名时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.574063	2026-03-25 18:53:22.574063
922	DE09.00.053.00.040	医师签名日期时间	医师进行电子签名时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.574523	2026-03-25 18:53:22.574523
923	DE09.00.088.00	医嘱审核日期时间	对医嘱进行审核时的公元纪年日期和时间的详细描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.574893	2026-03-25 18:53:22.574893
924	DE09.00.103.00	病案质量代码	按照医院病案评审标准对病案终末质量所做的综合评价结果的分类代码	S2	N1	\N	WT01.01.012	f	\N	t	2026-03-25 18:53:22.575275	2026-03-25 18:53:22.575275
925	DE09.00.104.00	出院中医诊断_主病_入院病情代码	对出皖诊断在患者入脘时是否已具有的评估情况分类在特定编码体系中的代码。这里是指出院诊断的中医主病	S3	N1	\N	WT01.01.010	f	\N	t	2026-03-25 18:53:22.575585	2026-03-25 18:53:22.575585
926	DE09.00.104.00.001	出院中医诊断_主证_入院病情代码	对出院诊断在患者入院时是否已具有的评估情况分类在特定编码体系中的代码。这里是指出院诊断的中医主证	S3	N1	\N	WT01.01.010	f	\N	t	2026-03-25 18:53:22.575916	2026-03-25 18:53:22.575916
927	DE09.00.104.00.002	出院西医诊断_主要诊断_入院病情代码	对出院诊断在患者人院时是否已具有的评估情况分类在特定编码体系中的代码。这里是指出院诊断的西医主要诊断	S3	N1	\N	WT01.01.010	f	\N	t	2026-03-25 18:53:22.576343	2026-03-25 18:53:22.576343
928	DE09.00.107.00	交接日期时间	手术患者在转运过程（术前交接、术后交接及麻醉恢复后患者交接）中进行交接时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.576781	2026-03-25 18:53:22.576781
929	DE09.00.108.00	死亡患者尸检标志	是否对死亡患者的机体进行剖验，以明确死亡原因的标志。非死亡患者应当在“ □”内填写“一”	N	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:22.577126	2026-03-25 18:53:22.577126
930	DE09.00.111.00	术前清点标志	标识术前是否对即将使用的物品进行清点的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.577479	2026-03-25 18:53:22.577479
931	DE09.00.115.00	家属是否同意尸体解剖标志	标识患者家M是否同意进行尸体解剖的标志	L	T/F	\N	\N	f	\N	t	2026-03-25 18:53:22.577832	2026-03-25 18:53:22.577832
932	DE09.00.116.00	知情同意内容	知情同意书中涉及的诊疗项目在实施或应用过程中可能存在的风险及其他意外或不良后果的详细描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.578259	2026-03-25 18:53:22.578259
933	DE09.00.117.00	知情同意书名称	患者在医疗机构接受诊治过程中笛要被告知的知情同意书的名称	S1	AN	200	\N	f	\N	t	2026-03-25 18:53:22.578564	2026-03-25 18:53:22.578564
934	DE09.00.118.00	知情同意书编号	按照某一特定编码规则赋予患者本人的知情同意书的顺序号	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:22.578959	2026-03-25 18:53:22.578959
935	DE09.00.119.00	注意事项	对可能出现问题及采取相应措施的描述	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:22.57942	2026-03-25 18:53:22.57942
936	DE09.00.120.00	质控日期	对病案终末质量进行检査及评价的公元纪年日期的完整描述	D	D8	\N	\N	f	\N	t	2026-03-25 18:53:22.579809	2026-03-25 18:53:22.579809
937	DE99.00.001.01	抢救次数	抢救次数	S3	N	3	\N	f	\N	t	2026-03-25 18:53:22.580089	2026-03-25 18:53:22.580089
938	DE99.00.001.02	成功抢救次数	抢救次数	S3	N	3	\N	f	\N	t	2026-03-25 18:53:22.580456	2026-03-25 18:53:22.580456
939	DE99.00.001.03	住院期间是否告知病危或病重	住院期间是否告知病危或病重	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.580742	2026-03-25 18:53:22.580742
940	DE99.00.001.04	TNM分期	TNM分期	S3	AN	100	\N	f	\N	t	2026-03-25 18:53:22.581184	2026-03-25 18:53:22.581184
941	DE99.00.001.05	是否完成临床路径	是否完成临床路径	N1	N1	\N	EMR01.01.002	f	\N	t	2026-03-25 18:53:22.581642	2026-03-25 18:53:22.581642
942	DE99.00.001.06	临床路径是否变异	临床路径是否变异	N1	N1	\N	EMR01.01.002	f	\N	t	2026-03-25 18:53:22.581989	2026-03-25 18:53:22.581989
943	DE99.00.001.07	是否日间手术	是否日间手术	N1	N1	\N	\N	f	\N	t	2026-03-25 18:53:22.58289	2026-03-25 18:53:22.58289
944	DE99.00.001.08	临床路径退出原因	临床路径退出原因	S3	A	100	\N	f	\N	t	2026-03-25 18:53:22.583445	2026-03-25 18:53:22.583445
945	DE99.00.001.09	临床路径变异原因	临床路径变异原因	S3	A	100	\N	f	\N	t	2026-03-25 18:53:22.583821	2026-03-25 18:53:22.583821
946	DE99.00.001.10	是否同一病种再入院	是否同一病种再入院	N	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:22.584246	2026-03-25 18:53:22.584246
947	DE99.00.001.11	与上次出院日期间隔天数	与上次出院日期间隔天数	N	N	5	\N	f	\N	t	2026-03-25 18:53:22.584714	2026-03-25 18:53:22.584714
948	DE99.00.002.01	输血量_红细胞	输血量_红细胞	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.585669	2026-03-25 18:53:22.585669
949	DE99.00.002.02	输血量_血小板	输血量_血小板	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.586868	2026-03-25 18:53:22.586868
950	DE99.00.002.03	输血量_血浆	输血量_血浆	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.587942	2026-03-25 18:53:22.587942
951	DE99.00.002.04	输血量_全血	输血量_全血	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.588707	2026-03-25 18:53:22.588707
952	DE99.00.002.05	输血量_自体血回输	输血量_自体血回输	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.589647	2026-03-25 18:53:22.589647
953	DE99.00.002.06	输血量_白蛋白	输血量_白蛋白	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.590348	2026-03-25 18:53:22.590348
954	DE99.00.002.07	输血量_其他	输血量_其他	N	N	4	\N	f	\N	t	2026-03-25 18:53:22.591232	2026-03-25 18:53:22.591232
955	DE99.00.003.01	检查情况_CT	检查情况_CT	N	N	1	EMR01.01.004	f	\N	t	2026-03-25 18:53:22.591903	2026-03-25 18:53:22.591903
956	DE99.00.003.02	检查情况_PETCT	检查情况_PETCT	N	N	1	EMR01.01.004	f	\N	t	2026-03-25 18:53:22.592586	2026-03-25 18:53:22.592586
957	DE99.00.003.03	检查情况_双源CT	检查情况_双源CT	N	N	1	EMR01.01.004	f	\N	t	2026-03-25 18:53:22.593317	2026-03-25 18:53:22.593317
958	DE99.00.003.04	检查情况_X片	检查情况_X片	N	N	1	EMR01.01.004	f	\N	t	2026-03-25 18:53:22.593968	2026-03-25 18:53:22.593968
959	DE99.00.003.05	检查情况_B超	检查情况_B超	N	N	1	EMR01.01.004	f	\N	t	2026-03-25 18:53:22.594685	2026-03-25 18:53:22.594685
960	DE99.00.003.06	检查情况_超声心动图	检查情况_超声心动图	N	N	1	EMR01.01.004	f	\N	t	2026-03-25 18:53:22.596671	2026-03-25 18:53:22.596671
961	DE99.00.003.07	检查情况_MRI	检查情况_MRI	N	N	1	EMR01.01.004	f	\N	t	2026-03-25 18:53:22.597461	2026-03-25 18:53:22.597461
962	DE99.00.003.08	检查情况_同位素检查	检查情况_同位素检查	N	N	1	EMR01.01.004	f	\N	t	2026-03-25 18:53:22.5983	2026-03-25 18:53:22.5983
963	DE99.00.004.02	门诊自付金额	门诊自付金额	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.598924	2026-03-25 18:53:22.598924
964	DE99.00.004.03	统筹支付	统筹支付	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.599553	2026-03-25 18:53:22.599553
965	DE99.00.004.04	费用总额	费用总额	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.600313	2026-03-25 18:53:22.600313
966	DE99.00.004.05	医疗救助	企业救助	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.600948	2026-03-25 18:53:22.600948
967	DE99.00.004.06	公务员医疗补助	公务员医疗补助	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.601493	2026-03-25 18:53:22.601493
968	DE99.00.004.07	大额补助	大额补助	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.602476	2026-03-25 18:53:22.602476
969	DE99.00.004.08	企业补充	企业补充	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.6033	2026-03-25 18:53:22.6033
970	DE99.00.004.09	个人自付	个人自付	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.604251	2026-03-25 18:53:22.604251
971	DE99.00.004.10	个人自费	个人自费	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.605035	2026-03-25 18:53:22.605035
972	DE99.00.004.11	个人账户	个人账户	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.60566	2026-03-25 18:53:22.60566
973	DE99.00.004.12	个人现金	个人现金	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.606302	2026-03-25 18:53:22.606302
974	DE99.00.004.13	自付金额	门自付金额	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.606876	2026-03-25 18:53:22.606876
975	DE99.00.004.14	耗材费	耗材费	N	N	\N	\N	f	\N	t	2026-03-25 18:53:22.607464	2026-03-25 18:53:22.607464
976	DE99.00.010.00	门诊号	按照某一特定编码规则赋予门诊就诊对象的顺序号	S1	AN	18	\N	f	\N	t	2026-03-25 18:53:22.608377	2026-03-25 18:53:22.608377
977	DE99.00.053.00	记录时间	完成此项业务活动时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.610152	2026-03-25 18:53:22.610152
978	DE99.00.053.01	记录日期	完成此项业务活动时的公元纪年日期完整描述	DT	DT8	\N	\N	f	\N	t	2026-03-25 18:53:22.610892	2026-03-25 18:53:22.610892
979	DE99.00.092.00	入科时间	患者实际办理入院手续时的公元纪年日期和时间的完整描述	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.611645	2026-03-25 18:53:22.611645
980	DE99.00.104.00.001	出院中医诊断_主证_出院情况	出院中医医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.612202	2026-03-25 18:53:22.612202
981	DE99.00.104.00.002	出院中医诊断_主病_出院情况	出院中医诊断_主病_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.612943	2026-03-25 18:53:22.612943
982	DE99.00.104.00.003	出院西医诊断_主要诊断_出院情况	出院西医诊断_主要诊断_出院情况	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.613596	2026-03-25 18:53:22.613596
983	DE99.00.223.00	离院方式	患者本次住脘离开医院的方式在特定编码体系中的名称	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:22.614265	2026-03-25 18:53:22.614265
984	DE99.00.339.00	入院途径	患者收治入院治疗的来源分类在特定编码体系中的名称	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:22.614891	2026-03-25 18:53:22.614891
985	DE99.01.018.00	婚姻状况	患者当前婚姻状况在特定编码体系中的名称	S1	AN	5	\N	f	\N	t	2026-03-25 18:53:22.615803	2026-03-25 18:53:22.615803
986	DE99.01.024.00.055	入院西医诊断_编码	入院西医主诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.616923	2026-03-25 18:53:22.616923
987	DE99.01.024.00.056	入院西医诊断_名称	入院西医主诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.617831	2026-03-25 18:53:22.617831
988	DE99.01.024.000	出院西医诊断_其他诊断编码	出院西医诊断_其他诊断疾病编码（同步配置选此数据元，程序自动拼接下标）	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.618751	2026-03-25 18:53:22.618751
989	DE99.01.024.001	出院西医诊断_其他诊断编码_1	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.619612	2026-03-25 18:53:22.619612
990	DE99.01.024.002	出院西医诊断_其他诊断编码_2	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.62051	2026-03-25 18:53:22.62051
991	DE99.01.024.003	出院西医诊断_其他诊断编码_3	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.621086	2026-03-25 18:53:22.621086
992	DE99.01.024.004	出院西医诊断_其他诊断编码_4	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.62152	2026-03-25 18:53:22.62152
993	DE99.01.024.005	出院西医诊断_其他诊断编码_5	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.622063	2026-03-25 18:53:22.622063
994	DE99.01.024.006	出院西医诊断_其他诊断编码_6	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.622719	2026-03-25 18:53:22.622719
995	DE99.01.024.007	出院西医诊断_其他诊断编码_7	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.62327	2026-03-25 18:53:22.62327
996	DE99.01.024.008	出院西医诊断_其他诊断编码_8	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.62364	2026-03-25 18:53:22.62364
997	DE99.01.024.009	出院西医诊断_其他诊断编码_9	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.624025	2026-03-25 18:53:22.624025
998	DE99.01.024.010	出院西医诊断_其他诊断编码_10	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.624464	2026-03-25 18:53:22.624464
999	DE99.01.024.011	出院西医诊断_其他诊断编码_11	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.624868	2026-03-25 18:53:22.624868
1000	DE99.01.024.012	出院西医诊断_其他诊断编码_12	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.625334	2026-03-25 18:53:22.625334
1001	DE99.01.024.013	出院西医诊断_其他诊断编码_13	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.625693	2026-03-25 18:53:22.625693
1002	DE99.01.024.014	出院西医诊断_其他诊断编码_14	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.626692	2026-03-25 18:53:22.626692
1003	DE99.01.024.015	出院西医诊断_其他诊断编码_15	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.627237	2026-03-25 18:53:22.627237
1004	DE99.01.024.016	出院西医诊断_其他诊断编码_16	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.628503	2026-03-25 18:53:22.628503
1005	DE99.01.024.017	出院西医诊断_其他诊断编码_17	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.629911	2026-03-25 18:53:22.629911
1006	DE99.01.024.018	出院西医诊断_其他诊断编码_18	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.631224	2026-03-25 18:53:22.631224
1007	DE99.01.024.019	出院西医诊断_其他诊断编码_19	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.632087	2026-03-25 18:53:22.632087
1008	DE99.01.024.020	出院西医诊断_其他诊断编码_20	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.632896	2026-03-25 18:53:22.632896
1009	DE99.01.024.021	出院西医诊断_其他诊断编码_21	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.633514	2026-03-25 18:53:22.633514
1010	DE99.01.024.022	出院西医诊断_其他诊断编码_22	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.633968	2026-03-25 18:53:22.633968
1011	DE99.01.024.023	出院西医诊断_其他诊断编码_23	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.634303	2026-03-25 18:53:22.634303
1012	DE99.01.024.024	出院西医诊断_其他诊断编码_24	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.634666	2026-03-25 18:53:22.634666
1013	DE99.01.024.025	出院西医诊断_其他诊断编码_25	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.635053	2026-03-25 18:53:22.635053
1014	DE99.01.024.026	出院西医诊断_其他诊断编码_26	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.635545	2026-03-25 18:53:22.635545
1015	DE99.01.024.027	出院西医诊断_其他诊断编码_27	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.635922	2026-03-25 18:53:22.635922
1016	DE99.01.024.028	出院西医诊断_其他诊断编码_28	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.636287	2026-03-25 18:53:22.636287
1017	DE99.01.024.029	出院西医诊断_其他诊断编码_29	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.63657	2026-03-25 18:53:22.63657
1018	DE99.01.024.030	出院西医诊断_其他诊断编码_30	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.636919	2026-03-25 18:53:22.636919
1019	DE99.01.024.031	出院西医诊断_其他诊断编码_31	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.637232	2026-03-25 18:53:22.637232
1020	DE99.01.024.032	出院西医诊断_其他诊断编码_32	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.637593	2026-03-25 18:53:22.637593
1021	DE99.01.024.033	出院西医诊断_其他诊断编码_33	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.637982	2026-03-25 18:53:22.637982
1022	DE99.01.024.034	出院西医诊断_其他诊断编码_34	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.638328	2026-03-25 18:53:22.638328
1023	DE99.01.024.035	出院西医诊断_其他诊断编码_35	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.638718	2026-03-25 18:53:22.638718
1024	DE99.01.024.036	出院西医诊断_其他诊断编码_36	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.63903	2026-03-25 18:53:22.63903
1025	DE99.01.024.037	出院西医诊断_其他诊断编码_37	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.639352	2026-03-25 18:53:22.639352
1026	DE99.01.024.038	出院西医诊断_其他诊断编码_38	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.639666	2026-03-25 18:53:22.639666
1027	DE99.01.024.039	出院西医诊断_其他诊断编码_39	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.639991	2026-03-25 18:53:22.639991
1028	DE99.01.024.040	出院西医诊断_其他诊断编码_40	出院西医诊断_其他诊断疾病编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.640271	2026-03-25 18:53:22.640271
1029	DE99.01.025.00.055	入院中医诊断_编码	入院中医主诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.640553	2026-03-25 18:53:22.640553
1030	DE99.01.025.00.056	入院中医诊断_名称	入院中医主诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.64087	2026-03-25 18:53:22.64087
1031	DE99.01.025.000	出院西医诊断_其他诊断名称	出院西医诊断_其他诊断名称（同步配置选此数据元，程序自动拼接下标）	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.64117	2026-03-25 18:53:22.64117
1032	DE99.01.025.001	出院西医诊断_其他诊断名称_1	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.64147	2026-03-25 18:53:22.64147
1033	DE99.01.025.002	出院西医诊断_其他诊断名称_2	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.641778	2026-03-25 18:53:22.641778
1034	DE99.01.025.003	出院西医诊断_其他诊断名称_3	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.642145	2026-03-25 18:53:22.642145
1035	DE99.01.025.004	出院西医诊断_其他诊断名称_4	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.642683	2026-03-25 18:53:22.642683
1036	DE99.01.025.005	出院西医诊断_其他诊断名称_5	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.643281	2026-03-25 18:53:22.643281
1037	DE99.01.025.006	出院西医诊断_其他诊断名称_6	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.643764	2026-03-25 18:53:22.643764
1038	DE99.01.025.007	出院西医诊断_其他诊断名称_7	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.644267	2026-03-25 18:53:22.644267
1039	DE99.01.025.008	出院西医诊断_其他诊断名称_8	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.644636	2026-03-25 18:53:22.644636
1040	DE99.01.025.009	出院西医诊断_其他诊断名称_9	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.645001	2026-03-25 18:53:22.645001
1041	DE99.01.025.010	出院西医诊断_其他诊断名称_10	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.645415	2026-03-25 18:53:22.645415
1042	DE99.01.025.011	出院西医诊断_其他诊断名称_11	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.645688	2026-03-25 18:53:22.645688
1043	DE99.01.025.012	出院西医诊断_其他诊断名称_12	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.646019	2026-03-25 18:53:22.646019
1044	DE99.01.025.013	出院西医诊断_其他诊断名称_13	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.646325	2026-03-25 18:53:22.646325
1045	DE99.01.025.014	出院西医诊断_其他诊断名称_14	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.646598	2026-03-25 18:53:22.646598
1046	DE99.01.025.015	出院西医诊断_其他诊断名称_15	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.646902	2026-03-25 18:53:22.646902
1047	DE99.01.025.016	出院西医诊断_其他诊断名称_16	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.647282	2026-03-25 18:53:22.647282
1048	DE99.01.025.017	出院西医诊断_其他诊断名称_17	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.647634	2026-03-25 18:53:22.647634
1049	DE99.01.025.018	出院西医诊断_其他诊断名称_18	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.648113	2026-03-25 18:53:22.648113
1050	DE99.01.025.019	出院西医诊断_其他诊断名称_19	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.648689	2026-03-25 18:53:22.648689
1051	DE99.01.025.020	出院西医诊断_其他诊断名称_20	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.649146	2026-03-25 18:53:22.649146
1052	DE99.01.025.021	出院西医诊断_其他诊断名称_21	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.649483	2026-03-25 18:53:22.649483
1053	DE99.01.025.022	出院西医诊断_其他诊断名称_22	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.650008	2026-03-25 18:53:22.650008
1054	DE99.01.025.023	出院西医诊断_其他诊断名称_23	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.650432	2026-03-25 18:53:22.650432
1055	DE99.01.025.024	出院西医诊断_其他诊断名称_24	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.650809	2026-03-25 18:53:22.650809
1056	DE99.01.025.025	出院西医诊断_其他诊断名称_25	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.651235	2026-03-25 18:53:22.651235
1057	DE99.01.025.026	出院西医诊断_其他诊断名称_26	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.651526	2026-03-25 18:53:22.651526
1058	DE99.01.025.027	出院西医诊断_其他诊断名称_27	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.651832	2026-03-25 18:53:22.651832
1059	DE99.01.025.028	出院西医诊断_其他诊断名称_28	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.652162	2026-03-25 18:53:22.652162
1060	DE99.01.025.029	出院西医诊断_其他诊断名称_29	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.652425	2026-03-25 18:53:22.652425
1061	DE99.01.025.030	出院西医诊断_其他诊断名称_30	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.652735	2026-03-25 18:53:22.652735
1062	DE99.01.025.031	出院西医诊断_其他诊断名称_31	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.653017	2026-03-25 18:53:22.653017
1063	DE99.01.025.032	出院西医诊断_其他诊断名称_32	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.653377	2026-03-25 18:53:22.653377
1064	DE99.01.025.033	出院西医诊断_其他诊断名称_33	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.653677	2026-03-25 18:53:22.653677
1065	DE99.01.025.034	出院西医诊断_其他诊断名称_34	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.65393	2026-03-25 18:53:22.65393
1066	DE99.01.025.035	出院西医诊断_其他诊断名称_35	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.654313	2026-03-25 18:53:22.654313
1067	DE99.01.025.036	出院西医诊断_其他诊断名称_36	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.654608	2026-03-25 18:53:22.654608
1068	DE99.01.025.037	出院西医诊断_其他诊断名称_37	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.654922	2026-03-25 18:53:22.654922
1069	DE99.01.025.038	出院西医诊断_其他诊断名称_38	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.655248	2026-03-25 18:53:22.655248
1070	DE99.01.025.039	出院西医诊断_其他诊断名称_39	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.65552	2026-03-25 18:53:22.65552
1071	DE99.01.025.040	出院西医诊断_其他诊断名称_40	出院西医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.65587	2026-03-25 18:53:22.65587
1072	DE99.01.026.00.055	入院中医诊断_证候编码	入院中医主诊断证候编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.656183	2026-03-25 18:53:22.656183
1073	DE99.01.026.00.056	入院中医诊断_证候名称	入院中医主诊断证候名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.656486	2026-03-25 18:53:22.656486
1074	DE99.01.026.001	出院西医诊断_其他诊断_入院病情代码_1	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.65713	2026-03-25 18:53:22.65713
1075	DE99.01.026.002	出院西医诊断_其他诊断_入院病情代码_2	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.657504	2026-03-25 18:53:22.657504
1076	DE99.01.026.003	出院西医诊断_其他诊断_入院病情代码_3	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.657793	2026-03-25 18:53:22.657793
1077	DE99.01.026.004	出院西医诊断_其他诊断_入院病情代码_4	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.658191	2026-03-25 18:53:22.658191
1078	DE99.01.026.005	出院西医诊断_其他诊断_入院病情代码_5	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.658544	2026-03-25 18:53:22.658544
1079	DE99.01.026.006	出院西医诊断_其他诊断_入院病情代码_6	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.658824	2026-03-25 18:53:22.658824
1080	DE99.01.026.007	出院西医诊断_其他诊断_入院病情代码_7	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.659185	2026-03-25 18:53:22.659185
1081	DE99.01.026.008	出院西医诊断_其他诊断_入院病情代码_8	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.659543	2026-03-25 18:53:22.659543
1082	DE99.01.026.009	出院西医诊断_其他诊断_入院病情代码_9	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.659843	2026-03-25 18:53:22.659843
1083	DE99.01.026.010	出院西医诊断_其他诊断_入院病情代码_10	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.660189	2026-03-25 18:53:22.660189
1084	DE99.01.026.011	出院西医诊断_其他诊断_入院病情代码_11	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.660452	2026-03-25 18:53:22.660452
1085	DE99.01.026.012	出院西医诊断_其他诊断_入院病情代码_12	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.660728	2026-03-25 18:53:22.660728
1086	DE99.01.026.013	出院西医诊断_其他诊断_入院病情代码_13	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.661084	2026-03-25 18:53:22.661084
1087	DE99.01.026.014	出院西医诊断_其他诊断_入院病情代码_14	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.661371	2026-03-25 18:53:22.661371
1088	DE99.01.026.015	出院西医诊断_其他诊断_入院病情代码_15	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.661823	2026-03-25 18:53:22.661823
1089	DE99.01.026.016	出院西医诊断_其他诊断_入院病情代码_16	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.662547	2026-03-25 18:53:22.662547
1090	DE99.01.026.017	出院西医诊断_其他诊断_入院病情代码_17	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.663504	2026-03-25 18:53:22.663504
1091	DE99.01.026.018	出院西医诊断_其他诊断_入院病情代码_18	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.664151	2026-03-25 18:53:22.664151
1092	DE99.01.026.019	出院西医诊断_其他诊断_入院病情代码_19	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.66458	2026-03-25 18:53:22.66458
1093	DE99.01.026.020	出院西医诊断_其他诊断_入院病情代码_20	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.664964	2026-03-25 18:53:22.664964
1094	DE99.01.026.021	出院西医诊断_其他诊断_入院病情代码_21	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.665298	2026-03-25 18:53:22.665298
1095	DE99.01.026.022	出院西医诊断_其他诊断_入院病情代码_22	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.665921	2026-03-25 18:53:22.665921
1096	DE99.01.026.023	出院西医诊断_其他诊断_入院病情代码_23	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.667145	2026-03-25 18:53:22.667145
1097	DE99.01.026.024	出院西医诊断_其他诊断_入院病情代码_24	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.667559	2026-03-25 18:53:22.667559
1098	DE99.01.026.025	出院西医诊断_其他诊断_入院病情代码_25	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.668199	2026-03-25 18:53:22.668199
1099	DE99.01.026.026	出院西医诊断_其他诊断_入院病情代码_26	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.66894	2026-03-25 18:53:22.66894
1100	DE99.01.026.027	出院西医诊断_其他诊断_入院病情代码_27	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.670263	2026-03-25 18:53:22.670263
1101	DE99.01.026.028	出院西医诊断_其他诊断_入院病情代码_28	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.670925	2026-03-25 18:53:22.670925
1102	DE99.01.026.029	出院西医诊断_其他诊断_入院病情代码_29	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.671367	2026-03-25 18:53:22.671367
1103	DE99.01.026.030	出院西医诊断_其他诊断_入院病情代码_30	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.67174	2026-03-25 18:53:22.67174
1104	DE99.01.026.031	出院西医诊断_其他诊断_入院病情代码_31	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.672323	2026-03-25 18:53:22.672323
1105	DE99.01.026.032	出院西医诊断_其他诊断_入院病情代码_32	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.672938	2026-03-25 18:53:22.672938
1106	DE99.01.026.033	出院西医诊断_其他诊断_入院病情代码_33	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.673398	2026-03-25 18:53:22.673398
1107	DE99.01.026.034	出院西医诊断_其他诊断_入院病情代码_34	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.673727	2026-03-25 18:53:22.673727
1108	DE99.01.026.035	出院西医诊断_其他诊断_入院病情代码_35	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.674047	2026-03-25 18:53:22.674047
1109	DE99.01.026.036	出院西医诊断_其他诊断_入院病情代码_36	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.674597	2026-03-25 18:53:22.674597
1110	DE99.01.026.037	出院西医诊断_其他诊断_入院病情代码_37	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.675131	2026-03-25 18:53:22.675131
1111	DE99.01.026.038	出院西医诊断_其他诊断_入院病情代码_38	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.675632	2026-03-25 18:53:22.675632
1112	DE99.01.026.039	出院西医诊断_其他诊断_入院病情代码_39	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.676205	2026-03-25 18:53:22.676205
1113	DE99.01.026.040	出院西医诊断_其他诊断_入院病情代码_40	出院西医诊断_其他诊断_入院病情代码	S3	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.676912	2026-03-25 18:53:22.676912
1114	DE99.01.027.00.001	入院主诊断_中医证型	入院主诊断_中医证型	S1	A	20	\N	f	\N	t	2026-03-25 18:53:22.677285	2026-03-25 18:53:22.677285
1115	DE99.01.027.00.002	出院主诊断_中医证型	出院主诊断_中医证型	S1	A	20	\N	f	\N	t	2026-03-25 18:53:22.677783	2026-03-25 18:53:22.677783
1116	DE99.01.027.00.003	门诊主诊断_中医证型	门诊主诊断_中医证型	S1	A	20	\N	f	\N	t	2026-03-25 18:53:22.678176	2026-03-25 18:53:22.678176
1117	DE99.01.027.001	出院西医诊断_其他诊断_出院情况代码_1	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.678508	2026-03-25 18:53:22.678508
1118	DE99.01.027.002	出院西医诊断_其他诊断_出院情况代码_2	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.678853	2026-03-25 18:53:22.678853
1119	DE99.01.027.003	出院西医诊断_其他诊断_出院情况代码_3	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.67919	2026-03-25 18:53:22.67919
1120	DE99.01.027.004	出院西医诊断_其他诊断_出院情况代码_4	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.67954	2026-03-25 18:53:22.67954
1121	DE99.01.027.005	出院西医诊断_其他诊断_出院情况代码_5	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.679887	2026-03-25 18:53:22.679887
1122	DE99.01.027.006	出院西医诊断_其他诊断_出院情况代码_6	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.680257	2026-03-25 18:53:22.680257
1123	DE99.01.027.007	出院西医诊断_其他诊断_出院情况代码_7	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.680605	2026-03-25 18:53:22.680605
1124	DE99.01.027.008	出院西医诊断_其他诊断_出院情况代码_8	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.680956	2026-03-25 18:53:22.680956
1125	DE99.01.027.009	出院西医诊断_其他诊断_出院情况代码_9	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.681414	2026-03-25 18:53:22.681414
1126	DE99.01.027.010	出院西医诊断_其他诊断_出院情况代码_10	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.681759	2026-03-25 18:53:22.681759
1127	DE99.01.027.011	出院西医诊断_其他诊断_出院情况代码_11	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.682263	2026-03-25 18:53:22.682263
1128	DE99.01.027.012	出院西医诊断_其他诊断_出院情况代码_12	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.682751	2026-03-25 18:53:22.682751
1129	DE99.01.027.013	出院西医诊断_其他诊断_出院情况代码_13	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.683198	2026-03-25 18:53:22.683198
1130	DE99.01.027.014	出院西医诊断_其他诊断_出院情况代码_14	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.683643	2026-03-25 18:53:22.683643
1131	DE99.01.027.015	出院西医诊断_其他诊断_出院情况代码_15	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.684086	2026-03-25 18:53:22.684086
1132	DE99.01.027.016	出院西医诊断_其他诊断_出院情况代码_16	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.684424	2026-03-25 18:53:22.684424
1133	DE99.01.027.017	出院西医诊断_其他诊断_出院情况代码_17	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.684797	2026-03-25 18:53:22.684797
1134	DE99.01.027.018	出院西医诊断_其他诊断_出院情况代码_18	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.685139	2026-03-25 18:53:22.685139
1135	DE99.01.027.019	出院西医诊断_其他诊断_出院情况代码_19	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.685448	2026-03-25 18:53:22.685448
1136	DE99.01.027.020	出院西医诊断_其他诊断_出院情况代码_20	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.685835	2026-03-25 18:53:22.685835
1137	DE99.01.027.021	出院西医诊断_其他诊断_出院情况代码_21	出院西医诊断_其他诊断_出院情况代码	N	N	1	EMR01.01.001	f	\N	t	2026-03-25 18:53:22.686218	2026-03-25 18:53:22.686218
1138	DE99.01.027.022	出院西医诊断_其他诊断_出院情况代码_22	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.686522	2026-03-25 18:53:22.686522
1139	DE99.01.027.023	出院西医诊断_其他诊断_出院情况代码_23	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.686795	2026-03-25 18:53:22.686795
1140	DE99.01.027.024	出院西医诊断_其他诊断_出院情况代码_24	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.687234	2026-03-25 18:53:22.687234
1141	DE99.01.027.025	出院西医诊断_其他诊断_出院情况代码_25	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.687536	2026-03-25 18:53:22.687536
1142	DE99.01.027.026	出院西医诊断_其他诊断_出院情况代码_26	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.687857	2026-03-25 18:53:22.687857
1143	DE99.01.027.027	出院西医诊断_其他诊断_出院情况代码_27	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.688265	2026-03-25 18:53:22.688265
1144	DE99.01.027.028	出院西医诊断_其他诊断_出院情况代码_28	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.689189	2026-03-25 18:53:22.689189
1145	DE99.01.027.029	出院西医诊断_其他诊断_出院情况代码_29	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.689988	2026-03-25 18:53:22.689988
1146	DE99.01.027.030	出院西医诊断_其他诊断_出院情况代码_30	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.690344	2026-03-25 18:53:22.690344
1147	DE99.01.027.031	出院西医诊断_其他诊断_出院情况代码_31	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.690653	2026-03-25 18:53:22.690653
1148	DE99.01.027.032	出院西医诊断_其他诊断_出院情况代码_32	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.691064	2026-03-25 18:53:22.691064
1149	DE99.01.027.033	出院西医诊断_其他诊断_出院情况代码_33	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.691418	2026-03-25 18:53:22.691418
1150	DE99.01.027.034	出院西医诊断_其他诊断_出院情况代码_34	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.691999	2026-03-25 18:53:22.691999
1151	DE99.01.027.035	出院西医诊断_其他诊断_出院情况代码_35	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.692479	2026-03-25 18:53:22.692479
1152	DE99.01.027.036	出院西医诊断_其他诊断_出院情况代码_36	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.692857	2026-03-25 18:53:22.692857
1153	DE99.01.027.037	出院西医诊断_其他诊断_出院情况代码_37	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.693218	2026-03-25 18:53:22.693218
1154	DE99.01.027.038	出院西医诊断_其他诊断_出院情况代码_38	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.693539	2026-03-25 18:53:22.693539
1155	DE99.01.027.039	出院西医诊断_其他诊断_出院情况代码_39	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.693777	2026-03-25 18:53:22.693777
1156	DE99.01.027.040	出院西医诊断_其他诊断_出院情况代码_40	出院西医诊断_其他诊断_出院情况代码	S3	N	1	\N	f	\N	t	2026-03-25 18:53:22.694089	2026-03-25 18:53:22.694089
1157	DE99.01.028.001	出院中医诊断_主证名称_1	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.694393	2026-03-25 18:53:22.694393
1158	DE99.01.028.002	出院中医诊断_主证名称_2	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.694678	2026-03-25 18:53:22.694678
1159	DE99.01.028.003	出院中医诊断_主证名称_3	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.694966	2026-03-25 18:53:22.694966
1160	DE99.01.028.004	出院中医诊断_主证名称_4	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.695255	2026-03-25 18:53:22.695255
1161	DE99.01.028.005	出院中医诊断_主证名称_5	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.695624	2026-03-25 18:53:22.695624
1162	DE99.01.028.006	出院中医诊断_主证名称_6	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.695985	2026-03-25 18:53:22.695985
1163	DE99.01.028.007	出院中医诊断_主证名称_7	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.69632	2026-03-25 18:53:22.69632
1164	DE99.01.028.008	出院中医诊断_主证名称_8	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.696676	2026-03-25 18:53:22.696676
1165	DE99.01.028.009	出院中医诊断_主证名称_9	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.696962	2026-03-25 18:53:22.696962
1166	DE99.01.028.010	出院中医诊断_主证名称_10	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.697315	2026-03-25 18:53:22.697315
1167	DE99.01.028.011	出院中医诊断_主证名称_11	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.6976	2026-03-25 18:53:22.6976
1168	DE99.01.028.012	出院中医诊断_主证名称_12	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.69784	2026-03-25 18:53:22.69784
1169	DE99.01.028.013	出院中医诊断_主证名称_13	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.69821	2026-03-25 18:53:22.69821
1170	DE99.01.028.014	出院中医诊断_主证名称_14	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.698668	2026-03-25 18:53:22.698668
1171	DE99.01.028.015	出院中医诊断_主证名称_15	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.699109	2026-03-25 18:53:22.699109
1172	DE99.01.028.016	出院中医诊断_主证名称_16	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.699454	2026-03-25 18:53:22.699454
1173	DE99.01.028.017	出院中医诊断_主证名称_17	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.699825	2026-03-25 18:53:22.699825
1174	DE99.01.028.018	出院中医诊断_主证名称_18	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.70022	2026-03-25 18:53:22.70022
1175	DE99.01.028.019	出院中医诊断_主证名称_19	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.700708	2026-03-25 18:53:22.700708
1176	DE99.01.028.020	出院中医诊断_主证名称_20	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.701272	2026-03-25 18:53:22.701272
1177	DE99.01.028.021	出院中医诊断_主证名称_21	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.701658	2026-03-25 18:53:22.701658
1178	DE99.01.028.022	出院中医诊断_主证名称_22	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.702236	2026-03-25 18:53:22.702236
1179	DE99.01.028.023	出院中医诊断_主证名称_23	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.702716	2026-03-25 18:53:22.702716
1180	DE99.01.028.024	出院中医诊断_主证名称_24	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.703144	2026-03-25 18:53:22.703144
1181	DE99.01.028.025	出院中医诊断_主证名称_25	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.703435	2026-03-25 18:53:22.703435
1182	DE99.01.028.026	出院中医诊断_主证名称_26	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.7037	2026-03-25 18:53:22.7037
1183	DE99.01.028.027	出院中医诊断_主证名称_27	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.704169	2026-03-25 18:53:22.704169
1184	DE99.01.028.028	出院中医诊断_主证名称_28	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.704693	2026-03-25 18:53:22.704693
1185	DE99.01.028.029	出院中医诊断_主证名称_29	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.705292	2026-03-25 18:53:22.705292
1186	DE99.01.028.030	出院中医诊断_主证名称_30	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.705615	2026-03-25 18:53:22.705615
1187	DE99.01.028.031	出院中医诊断_主证名称_31	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.705973	2026-03-25 18:53:22.705973
1188	DE99.01.028.032	出院中医诊断_主证名称_32	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.706288	2026-03-25 18:53:22.706288
1189	DE99.01.028.033	出院中医诊断_主证名称_33	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.706606	2026-03-25 18:53:22.706606
1190	DE99.01.028.034	出院中医诊断_主证名称_34	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.706949	2026-03-25 18:53:22.706949
1191	DE99.01.028.035	出院中医诊断_主证名称_35	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.707267	2026-03-25 18:53:22.707267
1192	DE99.01.028.036	出院中医诊断_主证名称_36	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.707588	2026-03-25 18:53:22.707588
1193	DE99.01.028.037	出院中医诊断_主证名称_37	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.70801	2026-03-25 18:53:22.70801
1194	DE99.01.028.038	出院中医诊断_主证名称_38	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.708354	2026-03-25 18:53:22.708354
1195	DE99.01.028.039	出院中医诊断_主证名称_39	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.708795	2026-03-25 18:53:22.708795
1196	DE99.01.028.040	出院中医诊断_主证名称_40	出院中医诊断_主证名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.709127	2026-03-25 18:53:22.709127
1197	DE99.01.029.000	出院中医诊断_主证编码	出院中医诊断_主证编码（同步配置选此数据元，程序自动拼接下标）	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.709384	2026-03-25 18:53:22.709384
1198	DE99.01.029.001	出院中医诊断_主证编码_1	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.709701	2026-03-25 18:53:22.709701
1199	DE99.01.029.002	出院中医诊断_主证编码_2	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.710047	2026-03-25 18:53:22.710047
1200	DE99.01.029.003	出院中医诊断_主证编码_3	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.710363	2026-03-25 18:53:22.710363
1201	DE99.01.029.004	出院中医诊断_主证编码_4	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.710723	2026-03-25 18:53:22.710723
1202	DE99.01.029.005	出院中医诊断_主证编码_5	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.711187	2026-03-25 18:53:22.711187
1203	DE99.01.029.006	出院中医诊断_主证编码_6	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.711565	2026-03-25 18:53:22.711565
1204	DE99.01.029.007	出院中医诊断_主证编码_7	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.711864	2026-03-25 18:53:22.711864
1205	DE99.01.029.008	出院中医诊断_主证编码_8	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.712183	2026-03-25 18:53:22.712183
1206	DE99.01.029.009	出院中医诊断_主证编码_9	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.712501	2026-03-25 18:53:22.712501
1207	DE99.01.029.010	出院中医诊断_主证编码_10	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.712799	2026-03-25 18:53:22.712799
1208	DE99.01.029.011	出院中医诊断_主证编码_11	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.713174	2026-03-25 18:53:22.713174
1209	DE99.01.029.012	出院中医诊断_主证编码_12	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.713451	2026-03-25 18:53:22.713451
1210	DE99.01.029.013	出院中医诊断_主证编码_13	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.71372	2026-03-25 18:53:22.71372
1211	DE99.01.029.014	出院中医诊断_主证编码_14	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.714003	2026-03-25 18:53:22.714003
1212	DE99.01.029.015	出院中医诊断_主证编码_15	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.714379	2026-03-25 18:53:22.714379
1213	DE99.01.029.016	出院中医诊断_主证编码_16	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.714726	2026-03-25 18:53:22.714726
1214	DE99.01.029.017	出院中医诊断_主证编码_17	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.715196	2026-03-25 18:53:22.715196
1215	DE99.01.029.018	出院中医诊断_主证编码_18	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.715572	2026-03-25 18:53:22.715572
1216	DE99.01.029.019	出院中医诊断_主证编码_19	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.716081	2026-03-25 18:53:22.716081
1217	DE99.01.029.020	出院中医诊断_主证编码_20	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.716451	2026-03-25 18:53:22.716451
1218	DE99.01.029.021	出院中医诊断_主证编码_21	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.717111	2026-03-25 18:53:22.717111
1219	DE99.01.029.022	出院中医诊断_主证编码_22	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.717502	2026-03-25 18:53:22.717502
1220	DE99.01.029.023	出院中医诊断_主证编码_23	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.71801	2026-03-25 18:53:22.71801
1221	DE99.01.029.024	出院中医诊断_主证编码_24	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.718317	2026-03-25 18:53:22.718317
1222	DE99.01.029.025	出院中医诊断_主证编码_25	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.718674	2026-03-25 18:53:22.718674
1223	DE99.01.029.026	出院中医诊断_主证编码_26	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.718957	2026-03-25 18:53:22.718957
1224	DE99.01.029.027	出院中医诊断_主证编码_27	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.719275	2026-03-25 18:53:22.719275
1225	DE99.01.029.028	出院中医诊断_主证编码_28	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.719649	2026-03-25 18:53:22.719649
1226	DE99.01.029.029	出院中医诊断_主证编码_29	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.720199	2026-03-25 18:53:22.720199
1227	DE99.01.029.030	出院中医诊断_主证编码_30	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.720504	2026-03-25 18:53:22.720504
1228	DE99.01.029.031	出院中医诊断_主证编码_31	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.720826	2026-03-25 18:53:22.720826
1229	DE99.01.029.032	出院中医诊断_主证编码_32	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.721176	2026-03-25 18:53:22.721176
1230	DE99.01.029.033	出院中医诊断_主证编码_33	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.721507	2026-03-25 18:53:22.721507
1231	DE99.01.029.034	出院中医诊断_主证编码_34	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.721824	2026-03-25 18:53:22.721824
1232	DE99.01.029.035	出院中医诊断_主证编码_35	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.722211	2026-03-25 18:53:22.722211
1233	DE99.01.029.036	出院中医诊断_主证编码_36	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.722584	2026-03-25 18:53:22.722584
1234	DE99.01.029.037	出院中医诊断_主证编码_37	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.722867	2026-03-25 18:53:22.722867
1235	DE99.01.029.038	出院中医诊断_主证编码_38	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.723248	2026-03-25 18:53:22.723248
1236	DE99.01.029.039	出院中医诊断_主证编码_39	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.723569	2026-03-25 18:53:22.723569
1237	DE99.01.029.040	出院中医诊断_主证编码_40	出院中医诊断_主证编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.724425	2026-03-25 18:53:22.724425
1238	DE99.01.030.001	出院中医诊断_主证_入院病情代码_1	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.724772	2026-03-25 18:53:22.724772
1239	DE99.01.030.002	出院中医诊断_主证_入院病情代码_2	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.725777	2026-03-25 18:53:22.725777
1240	DE99.01.030.003	出院中医诊断_主证_入院病情代码_3	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.726474	2026-03-25 18:53:22.726474
1241	DE99.01.030.004	出院中医诊断_主证_入院病情代码_4	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.726862	2026-03-25 18:53:22.726862
1242	DE99.01.030.005	出院中医诊断_主证_入院病情代码_5	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.727258	2026-03-25 18:53:22.727258
1243	DE99.01.030.006	出院中医诊断_主证_入院病情代码_6	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.727611	2026-03-25 18:53:22.727611
1244	DE99.01.030.007	出院中医诊断_主证_入院病情代码_7	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.727948	2026-03-25 18:53:22.727948
1245	DE99.01.030.008	出院中医诊断_主证_入院病情代码_8	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.728274	2026-03-25 18:53:22.728274
1246	DE99.01.030.009	出院中医诊断_主证_入院病情代码_9	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.728625	2026-03-25 18:53:22.728625
1247	DE99.01.030.010	出院中医诊断_主证_入院病情代码_10	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.72901	2026-03-25 18:53:22.72901
1248	DE99.01.030.011	出院中医诊断_主证_入院病情代码_11	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.729469	2026-03-25 18:53:22.729469
1249	DE99.01.030.012	出院中医诊断_主证_入院病情代码_12	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.729879	2026-03-25 18:53:22.729879
1250	DE99.01.030.013	出院中医诊断_主证_入院病情代码_13	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.730251	2026-03-25 18:53:22.730251
1251	DE99.01.030.014	出院中医诊断_主证_入院病情代码_14	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.730617	2026-03-25 18:53:22.730617
1252	DE99.01.030.015	出院中医诊断_主证_入院病情代码_15	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.730933	2026-03-25 18:53:22.730933
1253	DE99.01.030.016	出院中医诊断_主证_入院病情代码_16	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.731249	2026-03-25 18:53:22.731249
1254	DE99.01.030.017	出院中医诊断_主证_入院病情代码_17	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.731552	2026-03-25 18:53:22.731552
1255	DE99.01.030.018	出院中医诊断_主证_入院病情代码_18	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.731935	2026-03-25 18:53:22.731935
1256	DE99.01.030.019	出院中医诊断_主证_入院病情代码_19	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.732212	2026-03-25 18:53:22.732212
1257	DE99.01.030.020	出院中医诊断_主证_入院病情代码_20	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.732815	2026-03-25 18:53:22.732815
1258	DE99.01.030.021	出院中医诊断_主证_入院病情代码_21	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.733171	2026-03-25 18:53:22.733171
1259	DE99.01.030.022	出院中医诊断_主证_入院病情代码_22	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.73358	2026-03-25 18:53:22.73358
1260	DE99.01.030.023	出院中医诊断_主证_入院病情代码_23	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.734035	2026-03-25 18:53:22.734035
1261	DE99.01.030.024	出院中医诊断_主证_入院病情代码_24	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.734358	2026-03-25 18:53:22.734358
1262	DE99.01.030.025	出院中医诊断_主证_入院病情代码_25	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.734682	2026-03-25 18:53:22.734682
1263	DE99.01.030.026	出院中医诊断_主证_入院病情代码_26	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.734976	2026-03-25 18:53:22.734976
1264	DE99.01.030.027	出院中医诊断_主证_入院病情代码_27	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.735317	2026-03-25 18:53:22.735317
1265	DE99.01.030.028	出院中医诊断_主证_入院病情代码_28	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.735648	2026-03-25 18:53:22.735648
1266	DE99.01.030.029	出院中医诊断_主证_入院病情代码_29	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.735958	2026-03-25 18:53:22.735958
1267	DE99.01.030.030	出院中医诊断_主证_入院病情代码_30	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.736295	2026-03-25 18:53:22.736295
1268	DE99.01.030.031	出院中医诊断_主证_入院病情代码_31	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.736611	2026-03-25 18:53:22.736611
1269	DE99.01.030.032	出院中医诊断_主证_入院病情代码_32	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.737003	2026-03-25 18:53:22.737003
1270	DE99.01.030.033	出院中医诊断_主证_入院病情代码_33	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.737288	2026-03-25 18:53:22.737288
1271	DE99.01.030.034	出院中医诊断_主证_入院病情代码_34	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.737615	2026-03-25 18:53:22.737615
1272	DE99.01.030.035	出院中医诊断_主证_入院病情代码_35	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.737992	2026-03-25 18:53:22.737992
1273	DE99.01.030.036	出院中医诊断_主证_入院病情代码_36	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.738313	2026-03-25 18:53:22.738313
1274	DE99.01.030.037	出院中医诊断_主证_入院病情代码_37	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.73862	2026-03-25 18:53:22.73862
1275	DE99.01.030.038	出院中医诊断_主证_入院病情代码_38	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.73892	2026-03-25 18:53:22.73892
1276	DE99.01.030.039	出院中医诊断_主证_入院病情代码_39	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.73929	2026-03-25 18:53:22.73929
1277	DE99.01.030.040	出院中医诊断_主证_入院病情代码_40	出院中医诊断_主证_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.739597	2026-03-25 18:53:22.739597
1278	DE99.01.031.001	出院中医诊断_主证_出院情况_1	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.739894	2026-03-25 18:53:22.739894
1279	DE99.01.031.002	出院中医诊断_主证_出院情况_2	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.740343	2026-03-25 18:53:22.740343
1280	DE99.01.031.003	出院中医诊断_主证_出院情况_3	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.740681	2026-03-25 18:53:22.740681
1281	DE99.01.031.004	出院中医诊断_主证_出院情况_4	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.741011	2026-03-25 18:53:22.741011
1282	DE99.01.031.005	出院中医诊断_主证_出院情况_5	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.741298	2026-03-25 18:53:22.741298
1283	DE99.01.031.006	出院中医诊断_主证_出院情况_6	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.741693	2026-03-25 18:53:22.741693
1284	DE99.01.031.007	出院中医诊断_主证_出院情况_7	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.74216	2026-03-25 18:53:22.74216
1285	DE99.01.031.008	出院中医诊断_主证_出院情况_8	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.742521	2026-03-25 18:53:22.742521
1286	DE99.01.031.009	出院中医诊断_主证_出院情况_9	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.742875	2026-03-25 18:53:22.742875
1287	DE99.01.031.010	出院中医诊断_主证_出院情况_10	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.743243	2026-03-25 18:53:22.743243
1288	DE99.01.031.011	出院中医诊断_主证_出院情况_11	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.74354	2026-03-25 18:53:22.74354
1289	DE99.01.031.012	出院中医诊断_主证_出院情况_12	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.743903	2026-03-25 18:53:22.743903
1290	DE99.01.031.013	出院中医诊断_主证_出院情况_13	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.744216	2026-03-25 18:53:22.744216
1291	DE99.01.031.014	出院中医诊断_主证_出院情况_14	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.744532	2026-03-25 18:53:22.744532
1292	DE99.01.031.015	出院中医诊断_主证_出院情况_15	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.744834	2026-03-25 18:53:22.744834
1293	DE99.01.031.016	出院中医诊断_主证_出院情况_16	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.745309	2026-03-25 18:53:22.745309
1294	DE99.01.031.017	出院中医诊断_主证_出院情况_17	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.745614	2026-03-25 18:53:22.745614
1295	DE99.01.031.018	出院中医诊断_主证_出院情况_18	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.745952	2026-03-25 18:53:22.745952
1296	DE99.01.031.019	出院中医诊断_主证_出院情况_19	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.746332	2026-03-25 18:53:22.746332
1297	DE99.01.031.020	出院中医诊断_主证_出院情况_20	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.746733	2026-03-25 18:53:22.746733
1298	DE99.01.031.021	出院中医诊断_主证_出院情况_21	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.747128	2026-03-25 18:53:22.747128
1299	DE99.01.031.022	出院中医诊断_主证_出院情况_22	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.747437	2026-03-25 18:53:22.747437
1300	DE99.01.031.023	出院中医诊断_主证_出院情况_23	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.747754	2026-03-25 18:53:22.747754
1301	DE99.01.031.024	出院中医诊断_主证_出院情况_24	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.748238	2026-03-25 18:53:22.748238
1302	DE99.01.031.025	出院中医诊断_主证_出院情况_25	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.748663	2026-03-25 18:53:22.748663
1303	DE99.01.031.026	出院中医诊断_主证_出院情况_26	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.749054	2026-03-25 18:53:22.749054
1304	DE99.01.031.027	出院中医诊断_主证_出院情况_27	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.749389	2026-03-25 18:53:22.749389
1305	DE99.01.031.028	出院中医诊断_主证_出院情况_28	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.749834	2026-03-25 18:53:22.749834
1306	DE99.01.031.029	出院中医诊断_主证_出院情况_29	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.750381	2026-03-25 18:53:22.750381
1307	DE99.01.031.030	出院中医诊断_主证_出院情况_30	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.750855	2026-03-25 18:53:22.750855
1308	DE99.01.031.031	出院中医诊断_主证_出院情况_31	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.751274	2026-03-25 18:53:22.751274
1309	DE99.01.031.032	出院中医诊断_主证_出院情况_32	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.75166	2026-03-25 18:53:22.75166
1310	DE99.01.031.033	出院中医诊断_主证_出院情况_33	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.75201	2026-03-25 18:53:22.75201
1311	DE99.01.031.034	出院中医诊断_主证_出院情况_34	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.752333	2026-03-25 18:53:22.752333
1312	DE99.01.031.035	出院中医诊断_主证_出院情况_35	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.752716	2026-03-25 18:53:22.752716
1313	DE99.01.031.036	出院中医诊断_主证_出院情况_36	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.753045	2026-03-25 18:53:22.753045
1314	DE99.01.031.037	出院中医诊断_主证_出院情况_37	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.753326	2026-03-25 18:53:22.753326
1315	DE99.01.031.038	出院中医诊断_主证_出院情况_38	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.753642	2026-03-25 18:53:22.753642
1316	DE99.01.031.039	出院中医诊断_主证_出院情况_39	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.753997	2026-03-25 18:53:22.753997
1317	DE99.01.031.040	出院中医诊断_主证_出院情况_40	出院中医诊断_主证_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.754429	2026-03-25 18:53:22.754429
1318	DE99.01.032.000	出院中医诊断_其他诊断编码	出院中医诊断_其他诊断名称（同步配置选此数据元，程序自动拼接下标）	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.75489	2026-03-25 18:53:22.75489
1319	DE99.01.032.001	出院中医诊断_其他诊断名称_1	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.75523	2026-03-25 18:53:22.75523
1320	DE99.01.032.002	出院中医诊断_其他诊断名称_2	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.755592	2026-03-25 18:53:22.755592
1321	DE99.01.032.003	出院中医诊断_其他诊断名称_3	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.755972	2026-03-25 18:53:22.755972
1322	DE99.01.032.004	出院中医诊断_其他诊断名称_4	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.756411	2026-03-25 18:53:22.756411
1323	DE99.01.032.005	出院中医诊断_其他诊断名称_5	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.757459	2026-03-25 18:53:22.757459
1324	DE99.01.032.006	出院中医诊断_其他诊断名称_6	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.759115	2026-03-25 18:53:22.759115
1325	DE99.01.032.007	出院中医诊断_其他诊断名称_7	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.760458	2026-03-25 18:53:22.760458
1326	DE99.01.032.008	出院中医诊断_其他诊断名称_8	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.761048	2026-03-25 18:53:22.761048
1327	DE99.01.032.009	出院中医诊断_其他诊断名称_9	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.761493	2026-03-25 18:53:22.761493
1328	DE99.01.032.010	出院中医诊断_其他诊断名称_10	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.762018	2026-03-25 18:53:22.762018
1329	DE99.01.032.011	出院中医诊断_其他诊断名称_11	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.762566	2026-03-25 18:53:22.762566
1330	DE99.01.032.012	出院中医诊断_其他诊断名称_12	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.763009	2026-03-25 18:53:22.763009
1331	DE99.01.032.013	出院中医诊断_其他诊断名称_13	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.76367	2026-03-25 18:53:22.76367
1332	DE99.01.032.014	出院中医诊断_其他诊断名称_14	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.764205	2026-03-25 18:53:22.764205
1333	DE99.01.032.015	出院中医诊断_其他诊断名称_15	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.764717	2026-03-25 18:53:22.764717
1334	DE99.01.032.016	出院中医诊断_其他诊断名称_16	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.765161	2026-03-25 18:53:22.765161
1335	DE99.01.032.017	出院中医诊断_其他诊断名称_17	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.765534	2026-03-25 18:53:22.765534
1336	DE99.01.032.018	出院中医诊断_其他诊断名称_18	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.765845	2026-03-25 18:53:22.765845
1337	DE99.01.032.019	出院中医诊断_其他诊断名称_19	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.766206	2026-03-25 18:53:22.766206
1338	DE99.01.032.020	出院中医诊断_其他诊断名称_20	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.766581	2026-03-25 18:53:22.766581
1339	DE99.01.032.021	出院中医诊断_其他诊断名称_21	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.76696	2026-03-25 18:53:22.76696
1340	DE99.01.032.022	出院中医诊断_其他诊断名称_22	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.767324	2026-03-25 18:53:22.767324
1341	DE99.01.032.023	出院中医诊断_其他诊断名称_23	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.767665	2026-03-25 18:53:22.767665
1342	DE99.01.032.024	出院中医诊断_其他诊断名称_24	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.768007	2026-03-25 18:53:22.768007
1343	DE99.01.032.025	出院中医诊断_其他诊断名称_25	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.768335	2026-03-25 18:53:22.768335
1344	DE99.01.032.026	出院中医诊断_其他诊断名称_26	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.768656	2026-03-25 18:53:22.768656
1345	DE99.01.032.027	出院中医诊断_其他诊断名称_27	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.768991	2026-03-25 18:53:22.768991
1346	DE99.01.032.028	出院中医诊断_其他诊断名称_28	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.769299	2026-03-25 18:53:22.769299
1347	DE99.01.032.029	出院中医诊断_其他诊断名称_29	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.769554	2026-03-25 18:53:22.769554
1348	DE99.01.032.030	出院中医诊断_其他诊断名称_30	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.769886	2026-03-25 18:53:22.769886
1349	DE99.01.032.031	出院中医诊断_其他诊断名称_31	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.770208	2026-03-25 18:53:22.770208
1350	DE99.01.032.032	出院中医诊断_其他诊断名称_32	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.770528	2026-03-25 18:53:22.770528
1351	DE99.01.032.033	出院中医诊断_其他诊断名称_33	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.770847	2026-03-25 18:53:22.770847
1352	DE99.01.032.034	出院中医诊断_其他诊断名称_34	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.771197	2026-03-25 18:53:22.771197
1353	DE99.01.032.035	出院中医诊断_其他诊断名称_35	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.771531	2026-03-25 18:53:22.771531
1354	DE99.01.032.036	出院中医诊断_其他诊断名称_36	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.77295	2026-03-25 18:53:22.77295
1355	DE99.01.032.037	出院中医诊断_其他诊断名称_37	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.773588	2026-03-25 18:53:22.773588
1356	DE99.01.032.038	出院中医诊断_其他诊断名称_38	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.77429	2026-03-25 18:53:22.77429
1357	DE99.01.032.039	出院中医诊断_其他诊断名称_39	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.775493	2026-03-25 18:53:22.775493
1358	DE99.01.032.040	出院中医诊断_其他诊断名称_40	出院中医诊断_其他诊断名称	S1	AN	50	\N	f	\N	t	2026-03-25 18:53:22.776481	2026-03-25 18:53:22.776481
1359	DE99.01.033.000	出院中医诊断_其他诊断名称	出院中医诊断_其他诊断编码（同步配置选此数据元，程序自动拼接下标）	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.777066	2026-03-25 18:53:22.777066
1360	DE99.01.033.001	出院中医诊断_其他诊断编码_1	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.777491	2026-03-25 18:53:22.777491
1361	DE99.01.033.002	出院中医诊断_其他诊断编码_2	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.777875	2026-03-25 18:53:22.777875
1362	DE99.01.033.003	出院中医诊断_其他诊断编码_3	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.778416	2026-03-25 18:53:22.778416
1363	DE99.01.033.004	出院中医诊断_其他诊断编码_4	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.778828	2026-03-25 18:53:22.778828
1364	DE99.01.033.005	出院中医诊断_其他诊断编码_5	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.779262	2026-03-25 18:53:22.779262
1365	DE99.01.033.006	出院中医诊断_其他诊断编码_6	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.779573	2026-03-25 18:53:22.779573
1366	DE99.01.033.007	出院中医诊断_其他诊断编码_7	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.780036	2026-03-25 18:53:22.780036
1367	DE99.01.033.008	出院中医诊断_其他诊断编码_8	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.780398	2026-03-25 18:53:22.780398
1368	DE99.01.033.009	出院中医诊断_其他诊断编码_9	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.783559	2026-03-25 18:53:22.783559
1369	DE99.01.033.010	出院中医诊断_其他诊断编码_10	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.785129	2026-03-25 18:53:22.785129
1370	DE99.01.033.011	出院中医诊断_其他诊断编码_11	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.786122	2026-03-25 18:53:22.786122
1371	DE99.01.033.012	出院中医诊断_其他诊断编码_12	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.78708	2026-03-25 18:53:22.78708
1372	DE99.01.033.013	出院中医诊断_其他诊断编码_13	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.787731	2026-03-25 18:53:22.787731
1373	DE99.01.033.014	出院中医诊断_其他诊断编码_14	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.788085	2026-03-25 18:53:22.788085
1374	DE99.01.033.015	出院中医诊断_其他诊断编码_15	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.788528	2026-03-25 18:53:22.788528
1375	DE99.01.033.016	出院中医诊断_其他诊断编码_16	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.788849	2026-03-25 18:53:22.788849
1376	DE99.01.033.017	出院中医诊断_其他诊断编码_17	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.789202	2026-03-25 18:53:22.789202
1377	DE99.01.033.018	出院中医诊断_其他诊断编码_18	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.789661	2026-03-25 18:53:22.789661
1378	DE99.01.033.019	出院中医诊断_其他诊断编码_19	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.790546	2026-03-25 18:53:22.790546
1379	DE99.01.033.020	出院中医诊断_其他诊断编码_20	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.791149	2026-03-25 18:53:22.791149
1380	DE99.01.033.021	出院中医诊断_其他诊断编码_21	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.791595	2026-03-25 18:53:22.791595
1381	DE99.01.033.022	出院中医诊断_其他诊断编码_22	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.792018	2026-03-25 18:53:22.792018
1382	DE99.01.033.023	出院中医诊断_其他诊断编码_23	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.792495	2026-03-25 18:53:22.792495
1383	DE99.01.033.024	出院中医诊断_其他诊断编码_24	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.792975	2026-03-25 18:53:22.792975
1384	DE99.01.033.025	出院中医诊断_其他诊断编码_25	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.793564	2026-03-25 18:53:22.793564
1385	DE99.01.033.026	出院中医诊断_其他诊断编码_26	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.794088	2026-03-25 18:53:22.794088
1386	DE99.01.033.027	出院中医诊断_其他诊断编码_27	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.794469	2026-03-25 18:53:22.794469
1387	DE99.01.033.028	出院中医诊断_其他诊断编码_28	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.794837	2026-03-25 18:53:22.794837
1388	DE99.01.033.029	出院中医诊断_其他诊断编码_29	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.795347	2026-03-25 18:53:22.795347
1389	DE99.01.033.030	出院中医诊断_其他诊断编码_30	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.795905	2026-03-25 18:53:22.795905
1390	DE99.01.033.031	出院中医诊断_其他诊断编码_31	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.796774	2026-03-25 18:53:22.796774
1391	DE99.01.033.032	出院中医诊断_其他诊断编码_32	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.797409	2026-03-25 18:53:22.797409
1392	DE99.01.033.033	出院中医诊断_其他诊断编码_33	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.797839	2026-03-25 18:53:22.797839
1393	DE99.01.033.034	出院中医诊断_其他诊断编码_34	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.79845	2026-03-25 18:53:22.79845
1394	DE99.01.033.035	出院中医诊断_其他诊断编码_35	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.799617	2026-03-25 18:53:22.799617
1395	DE99.01.033.036	出院中医诊断_其他诊断编码_36	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.800702	2026-03-25 18:53:22.800702
1396	DE99.01.033.037	出院中医诊断_其他诊断编码_37	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.801307	2026-03-25 18:53:22.801307
1397	DE99.01.033.038	出院中医诊断_其他诊断编码_38	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.802584	2026-03-25 18:53:22.802584
1398	DE99.01.033.039	出院中医诊断_其他诊断编码_39	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.803807	2026-03-25 18:53:22.803807
1399	DE99.01.033.040	出院中医诊断_其他诊断编码_40	出院中医诊断_其他诊断编码	S3	AN	11	\N	f	\N	t	2026-03-25 18:53:22.804741	2026-03-25 18:53:22.804741
1400	DE99.01.034.001	出院中医诊断_其他诊断_入院病情代码_1	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.805414	2026-03-25 18:53:22.805414
1401	DE99.01.034.002	出院中医诊断_其他诊断_入院病情代码_2	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.805893	2026-03-25 18:53:22.805893
1402	DE99.01.034.003	出院中医诊断_其他诊断_入院病情代码_3	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.806332	2026-03-25 18:53:22.806332
1403	DE99.01.034.004	出院中医诊断_其他诊断_入院病情代码_4	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.80674	2026-03-25 18:53:22.80674
1404	DE99.01.034.005	出院中医诊断_其他诊断_入院病情代码_5	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.80723	2026-03-25 18:53:22.80723
1405	DE99.01.034.006	出院中医诊断_其他诊断_入院病情代码_6	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.807719	2026-03-25 18:53:22.807719
1406	DE99.01.034.007	出院中医诊断_其他诊断_入院病情代码_7	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.808055	2026-03-25 18:53:22.808055
1407	DE99.01.034.008	出院中医诊断_其他诊断_入院病情代码_8	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.808543	2026-03-25 18:53:22.808543
1408	DE99.01.034.009	出院中医诊断_其他诊断_入院病情代码_9	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.8088	2026-03-25 18:53:22.8088
1409	DE99.01.034.010	出院中医诊断_其他诊断_入院病情代码_10	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.809251	2026-03-25 18:53:22.809251
1410	DE99.01.034.011	出院中医诊断_其他诊断_入院病情代码_11	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.80956	2026-03-25 18:53:22.80956
1411	DE99.01.034.012	出院中医诊断_其他诊断_入院病情代码_12	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.809956	2026-03-25 18:53:22.809956
1412	DE99.01.034.013	出院中医诊断_其他诊断_入院病情代码_13	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.810396	2026-03-25 18:53:22.810396
1413	DE99.01.034.014	出院中医诊断_其他诊断_入院病情代码_14	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.810899	2026-03-25 18:53:22.810899
1414	DE99.01.034.015	出院中医诊断_其他诊断_入院病情代码_15	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.8113	2026-03-25 18:53:22.8113
1415	DE99.01.034.016	出院中医诊断_其他诊断_入院病情代码_16	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.811584	2026-03-25 18:53:22.811584
1416	DE99.01.034.017	出院中医诊断_其他诊断_入院病情代码_17	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.811904	2026-03-25 18:53:22.811904
1417	DE99.01.034.018	出院中医诊断_其他诊断_入院病情代码_18	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.812296	2026-03-25 18:53:22.812296
1418	DE99.01.034.019	出院中医诊断_其他诊断_入院病情代码_19	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.812621	2026-03-25 18:53:22.812621
1419	DE99.01.034.020	出院中医诊断_其他诊断_入院病情代码_20	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.812889	2026-03-25 18:53:22.812889
1420	DE99.01.034.021	出院中医诊断_其他诊断_入院病情代码_21	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.813335	2026-03-25 18:53:22.813335
1421	DE99.01.034.022	出院中医诊断_其他诊断_入院病情代码_22	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.813641	2026-03-25 18:53:22.813641
1422	DE99.01.034.023	出院中医诊断_其他诊断_入院病情代码_23	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.813923	2026-03-25 18:53:22.813923
1423	DE99.01.034.024	出院中医诊断_其他诊断_入院病情代码_24	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.814191	2026-03-25 18:53:22.814191
1424	DE99.01.034.025	出院中医诊断_其他诊断_入院病情代码_25	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.814579	2026-03-25 18:53:22.814579
1425	DE99.01.034.026	出院中医诊断_其他诊断_入院病情代码_26	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.81496	2026-03-25 18:53:22.81496
1426	DE99.01.034.027	出院中医诊断_其他诊断_入院病情代码_27	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.815279	2026-03-25 18:53:22.815279
1427	DE99.01.034.028	出院中医诊断_其他诊断_入院病情代码_28	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.815545	2026-03-25 18:53:22.815545
1428	DE99.01.034.029	出院中医诊断_其他诊断_入院病情代码_29	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.815832	2026-03-25 18:53:22.815832
1429	DE99.01.034.030	出院中医诊断_其他诊断_入院病情代码_30	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.816184	2026-03-25 18:53:22.816184
1430	DE99.01.034.031	出院中医诊断_其他诊断_入院病情代码_31	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.816478	2026-03-25 18:53:22.816478
1431	DE99.01.034.032	出院中医诊断_其他诊断_入院病情代码_32	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.81691	2026-03-25 18:53:22.81691
1432	DE99.01.034.033	出院中医诊断_其他诊断_入院病情代码_33	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.817428	2026-03-25 18:53:22.817428
1433	DE99.01.034.034	出院中医诊断_其他诊断_入院病情代码_34	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.818069	2026-03-25 18:53:22.818069
1434	DE99.01.034.035	出院中医诊断_其他诊断_入院病情代码_35	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.818561	2026-03-25 18:53:22.818561
1435	DE99.01.034.036	出院中医诊断_其他诊断_入院病情代码_36	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.818949	2026-03-25 18:53:22.818949
1436	DE99.01.034.037	出院中医诊断_其他诊断_入院病情代码_37	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.819353	2026-03-25 18:53:22.819353
1437	DE99.01.034.038	出院中医诊断_其他诊断_入院病情代码_38	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.819712	2026-03-25 18:53:22.819712
1438	DE99.01.034.039	出院中医诊断_其他诊断_入院病情代码_39	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.820064	2026-03-25 18:53:22.820064
1439	DE99.01.034.040	出院中医诊断_其他诊断_入院病情代码_40	出院中医诊断_其他诊断_入院病情代码	N	N	1	WT01.01.010	f	\N	t	2026-03-25 18:53:22.820565	2026-03-25 18:53:22.820565
1440	DE99.01.035.001	出院中医诊断_其他诊断_出院情况_1	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.820962	2026-03-25 18:53:22.820962
1441	DE99.01.035.002	出院中医诊断_其他诊断_出院情况_2	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.821295	2026-03-25 18:53:22.821295
1442	DE99.01.035.003	出院中医诊断_其他诊断_出院情况_3	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.821788	2026-03-25 18:53:22.821788
1443	DE99.01.035.004	出院中医诊断_其他诊断_出院情况_4	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.82213	2026-03-25 18:53:22.82213
1444	DE99.01.035.005	出院中医诊断_其他诊断_出院情况_5	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.822574	2026-03-25 18:53:22.822574
1445	DE99.01.035.006	出院中医诊断_其他诊断_出院情况_6	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.822864	2026-03-25 18:53:22.822864
1446	DE99.01.035.007	出院中医诊断_其他诊断_出院情况_7	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.823256	2026-03-25 18:53:22.823256
1447	DE99.01.035.008	出院中医诊断_其他诊断_出院情况_8	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.823527	2026-03-25 18:53:22.823527
1448	DE99.01.035.009	出院中医诊断_其他诊断_出院情况_9	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.823808	2026-03-25 18:53:22.823808
1449	DE99.01.035.010	出院中医诊断_其他诊断_出院情况_10	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.824127	2026-03-25 18:53:22.824127
1450	DE99.01.035.011	出院中医诊断_其他诊断_出院情况_11	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.824457	2026-03-25 18:53:22.824457
1451	DE99.01.035.012	出院中医诊断_其他诊断_出院情况_12	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.824786	2026-03-25 18:53:22.824786
1452	DE99.01.035.013	出院中医诊断_其他诊断_出院情况_13	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.825197	2026-03-25 18:53:22.825197
1453	DE99.01.035.014	出院中医诊断_其他诊断_出院情况_14	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.8255	2026-03-25 18:53:22.8255
1454	DE99.01.035.015	出院中医诊断_其他诊断_出院情况_15	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.82582	2026-03-25 18:53:22.82582
1455	DE99.01.035.016	出院中医诊断_其他诊断_出院情况_16	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.826199	2026-03-25 18:53:22.826199
1456	DE99.01.035.017	出院中医诊断_其他诊断_出院情况_17	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.826523	2026-03-25 18:53:22.826523
1457	DE99.01.035.018	出院中医诊断_其他诊断_出院情况_18	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.826822	2026-03-25 18:53:22.826822
1458	DE99.01.035.019	出院中医诊断_其他诊断_出院情况_19	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.8272	2026-03-25 18:53:22.8272
1459	DE99.01.035.020	出院中医诊断_其他诊断_出院情况_20	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.827492	2026-03-25 18:53:22.827492
1460	DE99.01.035.021	出院中医诊断_其他诊断_出院情况_21	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.827808	2026-03-25 18:53:22.827808
1461	DE99.01.035.022	出院中医诊断_其他诊断_出院情况_22	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.828108	2026-03-25 18:53:22.828108
1462	DE99.01.035.023	出院中医诊断_其他诊断_出院情况_23	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.828444	2026-03-25 18:53:22.828444
1463	DE99.01.035.024	出院中医诊断_其他诊断_出院情况_24	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.828693	2026-03-25 18:53:22.828693
1464	DE99.01.035.025	出院中医诊断_其他诊断_出院情况_25	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.828969	2026-03-25 18:53:22.828969
1465	DE99.01.035.026	出院中医诊断_其他诊断_出院情况_26	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.829289	2026-03-25 18:53:22.829289
1466	DE99.01.035.027	出院中医诊断_其他诊断_出院情况_27	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.829714	2026-03-25 18:53:22.829714
1467	DE99.01.035.028	出院中医诊断_其他诊断_出院情况_28	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.830309	2026-03-25 18:53:22.830309
1468	DE99.01.035.029	出院中医诊断_其他诊断_出院情况_29	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.83085	2026-03-25 18:53:22.83085
1469	DE99.01.035.030	出院中医诊断_其他诊断_出院情况_30	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.831183	2026-03-25 18:53:22.831183
1470	DE99.01.035.031	出院中医诊断_其他诊断_出院情况_31	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.831535	2026-03-25 18:53:22.831535
1471	DE99.01.035.032	出院中医诊断_其他诊断_出院情况_32	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.831863	2026-03-25 18:53:22.831863
1472	DE99.01.035.033	出院中医诊断_其他诊断_出院情况_33	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.832255	2026-03-25 18:53:22.832255
1473	DE99.01.035.034	出院中医诊断_其他诊断_出院情况_34	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.832535	2026-03-25 18:53:22.832535
1474	DE99.01.035.035	出院中医诊断_其他诊断_出院情况_35	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.832851	2026-03-25 18:53:22.832851
1475	DE99.01.035.036	出院中医诊断_其他诊断_出院情况_36	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.833164	2026-03-25 18:53:22.833164
1476	DE99.01.035.037	出院中医诊断_其他诊断_出院情况_37	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.833446	2026-03-25 18:53:22.833446
1477	DE99.01.035.038	出院中医诊断_其他诊断_出院情况_38	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.833797	2026-03-25 18:53:22.833797
1478	DE99.01.035.039	出院中医诊断_其他诊断_出院情况_39	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.834232	2026-03-25 18:53:22.834232
1479	DE99.01.035.040	出院中医诊断_其他诊断_出院情况_40	出院中医诊断_其他诊断_出院情况	N	N	1	\N	f	\N	t	2026-03-25 18:53:22.834705	2026-03-25 18:53:22.834705
1480	DE99.01.040.00	性别代码	患者生理件别在特定编码体系中的代码	S3	N1	\N	WT01.01.001	f	\N	t	2026-03-25 18:53:22.835175	2026-03-25 18:53:22.835175
1481	DE99.01.052.00	职业类别	患者当前从事的职业类别在特定编码体系中的名称	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:22.83548	2026-03-25 18:53:22.83548
1482	DE99.02.001.000	手术及操作编码	手术及操作编码（同步配置选此数据元，程序自动拼接下标）	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.835845	2026-03-25 18:53:22.835845
1483	DE99.02.001.001	手术及操作编码_1	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.83616	2026-03-25 18:53:22.83616
1484	DE99.02.001.002	手术及操作编码_2	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.836466	2026-03-25 18:53:22.836466
1485	DE99.02.001.003	手术及操作编码_3	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.836864	2026-03-25 18:53:22.836864
1486	DE99.02.001.004	手术及操作编码_4	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.837218	2026-03-25 18:53:22.837218
1487	DE99.02.001.005	手术及操作编码_5	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.837477	2026-03-25 18:53:22.837477
1488	DE99.02.001.006	手术及操作编码_6	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.837837	2026-03-25 18:53:22.837837
1489	DE99.02.001.007	手术及操作编码_7	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.838167	2026-03-25 18:53:22.838167
1490	DE99.02.001.008	手术及操作编码_8	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.838483	2026-03-25 18:53:22.838483
1491	DE99.02.001.009	手术及操作编码_9	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.838816	2026-03-25 18:53:22.838816
1492	DE99.02.001.010	手术及操作编码_10	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.839109	2026-03-25 18:53:22.839109
1493	DE99.02.001.011	手术及操作编码_11	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.839388	2026-03-25 18:53:22.839388
1494	DE99.02.001.012	手术及操作编码_12	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.839719	2026-03-25 18:53:22.839719
1495	DE99.02.001.013	手术及操作编码_13	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.840003	2026-03-25 18:53:22.840003
1496	DE99.02.001.014	手术及操作编码_14	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.840301	2026-03-25 18:53:22.840301
1497	DE99.02.001.015	手术及操作编码_15	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.840608	2026-03-25 18:53:22.840608
1498	DE99.02.001.016	手术及操作编码_16	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.840868	2026-03-25 18:53:22.840868
1499	DE99.02.001.017	手术及操作编码_17	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.841217	2026-03-25 18:53:22.841217
1500	DE99.02.001.018	手术及操作编码_18	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.841563	2026-03-25 18:53:22.841563
1501	DE99.02.001.019	手术及操作编码_19	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.842009	2026-03-25 18:53:22.842009
1502	DE99.02.001.020	手术及操作编码_20	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.842395	2026-03-25 18:53:22.842395
1503	DE99.02.001.021	手术及操作编码_21	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.842843	2026-03-25 18:53:22.842843
1504	DE99.02.001.022	手术及操作编码_22	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.843277	2026-03-25 18:53:22.843277
1505	DE99.02.001.023	手术及操作编码_23	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.843626	2026-03-25 18:53:22.843626
1506	DE99.02.001.024	手术及操作编码_24	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.843952	2026-03-25 18:53:22.843952
1507	DE99.02.001.025	手术及操作编码_25	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.844323	2026-03-25 18:53:22.844323
1508	DE99.02.001.026	手术及操作编码_26	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.844705	2026-03-25 18:53:22.844705
1509	DE99.02.001.027	手术及操作编码_27	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.845115	2026-03-25 18:53:22.845115
1510	DE99.02.001.028	手术及操作编码_28	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.845426	2026-03-25 18:53:22.845426
1511	DE99.02.001.029	手术及操作编码_29	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.845782	2026-03-25 18:53:22.845782
1512	DE99.02.001.030	手术及操作编码_30	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.846121	2026-03-25 18:53:22.846121
1513	DE99.02.001.031	手术及操作编码_31	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.846421	2026-03-25 18:53:22.846421
1514	DE99.02.001.032	手术及操作编码_32	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.846758	2026-03-25 18:53:22.846758
1515	DE99.02.001.033	手术及操作编码_33	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.84708	2026-03-25 18:53:22.84708
1516	DE99.02.001.034	手术及操作编码_34	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.847389	2026-03-25 18:53:22.847389
1517	DE99.02.001.035	手术及操作编码_35	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.847803	2026-03-25 18:53:22.847803
1518	DE99.02.001.036	手术及操作编码_36	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.848118	2026-03-25 18:53:22.848118
1519	DE99.02.001.037	手术及操作编码_37	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.848542	2026-03-25 18:53:22.848542
1520	DE99.02.001.038	手术及操作编码_38	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.848936	2026-03-25 18:53:22.848936
1521	DE99.02.001.039	手术及操作编码_39	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.849296	2026-03-25 18:53:22.849296
1522	DE99.02.001.040	手术及操作编码_40	手术及操作编码	S3	AN	5	\N	f	\N	t	2026-03-25 18:53:22.849585	2026-03-25 18:53:22.849585
1523	DE99.02.002.000	手术及操作名称	手术及操作名称（同步配置选此数据元，程序自动拼接下标）	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.849942	2026-03-25 18:53:22.849942
1524	DE99.02.002.001	手术及操作名称_1	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.850346	2026-03-25 18:53:22.850346
1525	DE99.02.002.002	手术及操作名称_2	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.850709	2026-03-25 18:53:22.850709
1526	DE99.02.002.003	手术及操作名称_3	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.851045	2026-03-25 18:53:22.851045
1527	DE99.02.002.004	手术及操作名称_4	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.851345	2026-03-25 18:53:22.851345
1528	DE99.02.002.005	手术及操作名称_5	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.851676	2026-03-25 18:53:22.851676
1529	DE99.02.002.006	手术及操作名称_6	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.851969	2026-03-25 18:53:22.851969
1530	DE99.02.002.007	手术及操作名称_7	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.85232	2026-03-25 18:53:22.85232
1531	DE99.02.002.008	手术及操作名称_8	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.852599	2026-03-25 18:53:22.852599
1532	DE99.02.002.009	手术及操作名称_9	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.852902	2026-03-25 18:53:22.852902
1533	DE99.02.002.010	手术及操作名称_10	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.853213	2026-03-25 18:53:22.853213
1534	DE99.02.002.011	手术及操作名称_11	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.853649	2026-03-25 18:53:22.853649
1535	DE99.02.002.012	手术及操作名称_12	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.854014	2026-03-25 18:53:22.854014
1536	DE99.02.002.013	手术及操作名称_13	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.854317	2026-03-25 18:53:22.854317
1537	DE99.02.002.014	手术及操作名称_14	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.854657	2026-03-25 18:53:22.854657
1538	DE99.02.002.015	手术及操作名称_15	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.855007	2026-03-25 18:53:22.855007
1539	DE99.02.002.016	手术及操作名称_16	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.855333	2026-03-25 18:53:22.855333
1540	DE99.02.002.017	手术及操作名称_17	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.855723	2026-03-25 18:53:22.855723
1541	DE99.02.002.018	手术及操作名称_18	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.856019	2026-03-25 18:53:22.856019
1542	DE99.02.002.019	手术及操作名称_19	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.856375	2026-03-25 18:53:22.856375
1543	DE99.02.002.020	手术及操作名称_20	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.85669	2026-03-25 18:53:22.85669
1544	DE99.02.002.021	手术及操作名称_21	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.857036	2026-03-25 18:53:22.857036
1545	DE99.02.002.022	手术及操作名称_22	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.857359	2026-03-25 18:53:22.857359
1546	DE99.02.002.023	手术及操作名称_23	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.857633	2026-03-25 18:53:22.857633
1547	DE99.02.002.024	手术及操作名称_24	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.858015	2026-03-25 18:53:22.858015
1548	DE99.02.002.025	手术及操作名称_25	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.858394	2026-03-25 18:53:22.858394
1549	DE99.02.002.026	手术及操作名称_26	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.858735	2026-03-25 18:53:22.858735
1550	DE99.02.002.027	手术及操作名称_27	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.859044	2026-03-25 18:53:22.859044
1551	DE99.02.002.028	手术及操作名称_28	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.859329	2026-03-25 18:53:22.859329
1552	DE99.02.002.029	手术及操作名称_29	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.859639	2026-03-25 18:53:22.859639
1553	DE99.02.002.030	手术及操作名称_30	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.860047	2026-03-25 18:53:22.860047
1554	DE99.02.002.031	手术及操作名称_31	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.860422	2026-03-25 18:53:22.860422
1555	DE99.02.002.032	手术及操作名称_32	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.860843	2026-03-25 18:53:22.860843
1556	DE99.02.002.033	手术及操作名称_33	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.861276	2026-03-25 18:53:22.861276
1557	DE99.02.002.034	手术及操作名称_34	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.861598	2026-03-25 18:53:22.861598
1558	DE99.02.002.035	手术及操作名称_35	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.861956	2026-03-25 18:53:22.861956
1559	DE99.02.002.036	手术及操作名称_36	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.862546	2026-03-25 18:53:22.862546
1560	DE99.02.002.037	手术及操作名称_37	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.862844	2026-03-25 18:53:22.862844
1561	DE99.02.002.038	手术及操作名称_38	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.863256	2026-03-25 18:53:22.863256
1562	DE99.02.002.039	手术及操作名称_39	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.86358	2026-03-25 18:53:22.86358
1563	DE99.02.002.040	手术及操作名称_40	手术及操作名称	S1	AN	80	\N	f	\N	t	2026-03-25 18:53:22.863839	2026-03-25 18:53:22.863839
1564	DE99.02.003.000	手术及操作日期	手术及操作日期（同步配置选此数据元，程序自动拼接下标）	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.864181	2026-03-25 18:53:22.864181
1565	DE99.02.003.001	手术及操作日期_1	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.865772	2026-03-25 18:53:22.865772
1566	DE99.02.003.002	手术及操作日期_2	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.866239	2026-03-25 18:53:22.866239
1567	DE99.02.003.003	手术及操作日期_3	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.866598	2026-03-25 18:53:22.866598
1568	DE99.02.003.004	手术及操作日期_4	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.867068	2026-03-25 18:53:22.867068
1569	DE99.02.003.005	手术及操作日期_5	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.867493	2026-03-25 18:53:22.867493
1570	DE99.02.003.006	手术及操作日期_6	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.867828	2026-03-25 18:53:22.867828
1571	DE99.02.003.007	手术及操作日期_7	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.86816	2026-03-25 18:53:22.86816
1572	DE99.02.003.008	手术及操作日期_8	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.868517	2026-03-25 18:53:22.868517
1573	DE99.02.003.009	手术及操作日期_9	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.868877	2026-03-25 18:53:22.868877
1574	DE99.02.003.010	手术及操作日期_10	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.869179	2026-03-25 18:53:22.869179
1575	DE99.02.003.011	手术及操作日期_11	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.869451	2026-03-25 18:53:22.869451
1576	DE99.02.003.012	手术及操作日期_12	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.869758	2026-03-25 18:53:22.869758
1577	DE99.02.003.013	手术及操作日期_13	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.87007	2026-03-25 18:53:22.87007
1578	DE99.02.003.014	手术及操作日期_14	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.870376	2026-03-25 18:53:22.870376
1579	DE99.02.003.015	手术及操作日期_15	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.87067	2026-03-25 18:53:22.87067
1580	DE99.02.003.016	手术及操作日期_16	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.871033	2026-03-25 18:53:22.871033
1581	DE99.02.003.017	手术及操作日期_17	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.871361	2026-03-25 18:53:22.871361
1582	DE99.02.003.018	手术及操作日期_18	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.871677	2026-03-25 18:53:22.871677
1583	DE99.02.003.019	手术及操作日期_19	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.871956	2026-03-25 18:53:22.871956
1584	DE99.02.003.020	手术及操作日期_20	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.87224	2026-03-25 18:53:22.87224
1585	DE99.02.003.021	手术及操作日期_21	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.872563	2026-03-25 18:53:22.872563
1586	DE99.02.003.022	手术及操作日期_22	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.872873	2026-03-25 18:53:22.872873
1587	DE99.02.003.023	手术及操作日期_23	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.873289	2026-03-25 18:53:22.873289
1588	DE99.02.003.024	手术及操作日期_24	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.873549	2026-03-25 18:53:22.873549
1589	DE99.02.003.025	手术及操作日期_25	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.873812	2026-03-25 18:53:22.873812
1590	DE99.02.003.026	手术及操作日期_26	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.874207	2026-03-25 18:53:22.874207
1591	DE99.02.003.027	手术及操作日期_27	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.874514	2026-03-25 18:53:22.874514
1592	DE99.02.003.028	手术及操作日期_28	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.874895	2026-03-25 18:53:22.874895
1593	DE99.02.003.029	手术及操作日期_29	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.875371	2026-03-25 18:53:22.875371
1594	DE99.02.003.030	手术及操作日期_30	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.875754	2026-03-25 18:53:22.875754
1595	DE99.02.003.031	手术及操作日期_31	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.876095	2026-03-25 18:53:22.876095
1596	DE99.02.003.032	手术及操作日期_32	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.876391	2026-03-25 18:53:22.876391
1597	DE99.02.003.033	手术及操作日期_33	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.876785	2026-03-25 18:53:22.876785
1598	DE99.02.003.034	手术及操作日期_34	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.877206	2026-03-25 18:53:22.877206
1599	DE99.02.003.035	手术及操作日期_35	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.877468	2026-03-25 18:53:22.877468
1600	DE99.02.003.036	手术及操作日期_36	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.877778	2026-03-25 18:53:22.877778
1601	DE99.02.003.037	手术及操作日期_37	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.878102	2026-03-25 18:53:22.878102
1602	DE99.02.003.038	手术及操作日期_38	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.878406	2026-03-25 18:53:22.878406
1603	DE99.02.003.039	手术及操作日期_39	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.87881	2026-03-25 18:53:22.87881
1604	DE99.02.003.040	手术及操作日期_40	手术及操作日期	DT	DT15	\N	\N	f	\N	t	2026-03-25 18:53:22.879271	2026-03-25 18:53:22.879271
1605	DE99.02.004.001	手术级别代码_1	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.880008	2026-03-25 18:53:22.880008
1606	DE99.02.004.002	手术级别代码_2	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.880565	2026-03-25 18:53:22.880565
1607	DE99.02.004.003	手术级别代码_3	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.881207	2026-03-25 18:53:22.881207
1608	DE99.02.004.004	手术级别代码_4	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.881715	2026-03-25 18:53:22.881715
1609	DE99.02.004.005	手术级别代码_5	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.882192	2026-03-25 18:53:22.882192
1610	DE99.02.004.006	手术级别代码_6	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.882552	2026-03-25 18:53:22.882552
1611	DE99.02.004.007	手术级别代码_7	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.882877	2026-03-25 18:53:22.882877
1612	DE99.02.004.008	手术级别代码_8	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.88333	2026-03-25 18:53:22.88333
1613	DE99.02.004.009	手术级别代码_9	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.883669	2026-03-25 18:53:22.883669
1614	DE99.02.004.010	手术级别代码_10	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.884048	2026-03-25 18:53:22.884048
1615	DE99.02.004.011	手术级别代码_11	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.884369	2026-03-25 18:53:22.884369
1616	DE99.02.004.012	手术级别代码_12	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.884648	2026-03-25 18:53:22.884648
1617	DE99.02.004.013	手术级别代码_13	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.884995	2026-03-25 18:53:22.884995
1618	DE99.02.004.014	手术级别代码_14	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.885436	2026-03-25 18:53:22.885436
1619	DE99.02.004.015	手术级别代码_15	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.885757	2026-03-25 18:53:22.885757
1620	DE99.02.004.016	手术级别代码_16	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.886116	2026-03-25 18:53:22.886116
1621	DE99.02.004.017	手术级别代码_17	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.886417	2026-03-25 18:53:22.886417
1622	DE99.02.004.018	手术级别代码_18	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.887104	2026-03-25 18:53:22.887104
1623	DE99.02.004.019	手术级别代码_19	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.887599	2026-03-25 18:53:22.887599
1624	DE99.02.004.020	手术级别代码_20	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.887964	2026-03-25 18:53:22.887964
1625	DE99.02.004.021	手术级别代码_21	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.88857	2026-03-25 18:53:22.88857
1626	DE99.02.004.022	手术级别代码_22	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.889029	2026-03-25 18:53:22.889029
1627	DE99.02.004.023	手术级别代码_23	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.889309	2026-03-25 18:53:22.889309
1628	DE99.02.004.024	手术级别代码_24	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.889673	2026-03-25 18:53:22.889673
1629	DE99.02.004.025	手术级别代码_25	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.890018	2026-03-25 18:53:22.890018
1630	DE99.02.004.026	手术级别代码_26	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.890324	2026-03-25 18:53:22.890324
1631	DE99.02.004.027	手术级别代码_27	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.890709	2026-03-25 18:53:22.890709
1632	DE99.02.004.028	手术级别代码_28	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.891044	2026-03-25 18:53:22.891044
1633	DE99.02.004.029	手术级别代码_29	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.891347	2026-03-25 18:53:22.891347
1634	DE99.02.004.030	手术级别代码_30	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.891602	2026-03-25 18:53:22.891602
1635	DE99.02.004.031	手术级别代码_31	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.891938	2026-03-25 18:53:22.891938
1636	DE99.02.004.032	手术级别代码_32	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.892314	2026-03-25 18:53:22.892314
1637	DE99.02.004.033	手术级别代码_33	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.892648	2026-03-25 18:53:22.892648
1638	DE99.02.004.034	手术级别代码_34	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.893003	2026-03-25 18:53:22.893003
1639	DE99.02.004.035	手术级别代码_35	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.893463	2026-03-25 18:53:22.893463
1640	DE99.02.004.036	手术级别代码_36	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.893766	2026-03-25 18:53:22.893766
1641	DE99.02.004.037	手术级别代码_37	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.894151	2026-03-25 18:53:22.894151
1642	DE99.02.004.038	手术级别代码_38	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.894481	2026-03-25 18:53:22.894481
1643	DE99.02.004.039	手术级别代码_39	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.894782	2026-03-25 18:53:22.894782
1644	DE99.02.004.040	手术级别代码_40	手术级别代码	S3	N	1	CV05.10.024	f	\N	t	2026-03-25 18:53:22.895107	2026-03-25 18:53:22.895107
1645	DE99.02.005.000	手术者姓名	手术者姓名（同步配置选此数据元，程序自动拼接下标）	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.895518	2026-03-25 18:53:22.895518
1649	DE99.02.005.004	手术者姓名_4	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.896887	2026-03-25 18:53:22.896887
1650	DE99.02.005.005	手术者姓名_5	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.897233	2026-03-25 18:53:22.897233
1651	DE99.02.005.006	手术者姓名_6	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.897547	2026-03-25 18:53:22.897547
1652	DE99.02.005.007	手术者姓名_7	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.897862	2026-03-25 18:53:22.897862
1653	DE99.02.005.008	手术者姓名_8	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.89816	2026-03-25 18:53:22.89816
1654	DE99.02.005.009	手术者姓名_9	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.898443	2026-03-25 18:53:22.898443
1655	DE99.02.005.010	手术者姓名_10	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.898827	2026-03-25 18:53:22.898827
1656	DE99.02.005.011	手术者姓名_11	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.899271	2026-03-25 18:53:22.899271
1657	DE99.02.005.012	手术者姓名_12	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.8996	2026-03-25 18:53:22.8996
1658	DE99.02.005.013	手术者姓名_13	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.900764	2026-03-25 18:53:22.900764
1659	DE99.02.005.014	手术者姓名_14	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.901359	2026-03-25 18:53:22.901359
1660	DE99.02.005.015	手术者姓名_15	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.902064	2026-03-25 18:53:22.902064
1661	DE99.02.005.016	手术者姓名_16	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.902632	2026-03-25 18:53:22.902632
1662	DE99.02.005.017	手术者姓名_17	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.903333	2026-03-25 18:53:22.903333
1663	DE99.02.005.018	手术者姓名_18	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.904021	2026-03-25 18:53:22.904021
1664	DE99.02.005.019	手术者姓名_19	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.904442	2026-03-25 18:53:22.904442
1665	DE99.02.005.020	手术者姓名_20	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.904981	2026-03-25 18:53:22.904981
1666	DE99.02.005.021	手术者姓名_21	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.905521	2026-03-25 18:53:22.905521
1667	DE99.02.005.022	手术者姓名_22	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.906759	2026-03-25 18:53:22.906759
1668	DE99.02.005.023	手术者姓名_23	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.907598	2026-03-25 18:53:22.907598
1669	DE99.02.005.024	手术者姓名_24	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.908719	2026-03-25 18:53:22.908719
1670	DE99.02.005.025	手术者姓名_25	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.910026	2026-03-25 18:53:22.910026
1671	DE99.02.005.026	手术者姓名_26	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.910594	2026-03-25 18:53:22.910594
1672	DE99.02.005.027	手术者姓名_27	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.911237	2026-03-25 18:53:22.911237
1673	DE99.02.005.028	手术者姓名_28	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.91179	2026-03-25 18:53:22.91179
1674	DE99.02.005.029	手术者姓名_29	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.9123	2026-03-25 18:53:22.9123
1675	DE99.02.005.030	手术者姓名_30	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.912943	2026-03-25 18:53:22.912943
1676	DE99.02.005.031	手术者姓名_31	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.913512	2026-03-25 18:53:22.913512
1677	DE99.02.005.032	手术者姓名_32	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.914896	2026-03-25 18:53:22.914896
1678	DE99.02.005.033	手术者姓名_33	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.916247	2026-03-25 18:53:22.916247
1679	DE99.02.005.034	手术者姓名_34	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.917362	2026-03-25 18:53:22.917362
1680	DE99.02.005.035	手术者姓名_35	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.918151	2026-03-25 18:53:22.918151
1681	DE99.02.005.036	手术者姓名_36	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.919064	2026-03-25 18:53:22.919064
1682	DE99.02.005.037	手术者姓名_37	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.919557	2026-03-25 18:53:22.919557
1683	DE99.02.005.038	手术者姓名_38	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.920146	2026-03-25 18:53:22.920146
1684	DE99.02.005.039	手术者姓名_39	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.920621	2026-03-25 18:53:22.920621
1685	DE99.02.005.040	手术者姓名_40	手术者姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.921114	2026-03-25 18:53:22.921114
1686	DE99.02.006.000	I助姓名	I助姓名（同步配置选此数据元，程序自动拼接下标）	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.92173	2026-03-25 18:53:22.92173
1687	DE99.02.006.001	I助姓名_1	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.92233	2026-03-25 18:53:22.92233
1688	DE99.02.006.002	I助姓名_2	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.922836	2026-03-25 18:53:22.922836
1689	DE99.02.006.003	I助姓名_3	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.923346	2026-03-25 18:53:22.923346
1690	DE99.02.006.004	I助姓名_4	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.924873	2026-03-25 18:53:22.924873
1691	DE99.02.006.005	I助姓名_5	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.92549	2026-03-25 18:53:22.92549
1692	DE99.02.006.006	I助姓名_6	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.925884	2026-03-25 18:53:22.925884
1693	DE99.02.006.007	I助姓名_7	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.926225	2026-03-25 18:53:22.926225
1694	DE99.02.006.008	I助姓名_8	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.926553	2026-03-25 18:53:22.926553
1695	DE99.02.006.009	I助姓名_9	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.927021	2026-03-25 18:53:22.927021
1696	DE99.02.006.010	I助姓名_10	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.927356	2026-03-25 18:53:22.927356
1697	DE99.02.006.011	I助姓名_11	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.92781	2026-03-25 18:53:22.92781
1698	DE99.02.006.012	I助姓名_12	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.928293	2026-03-25 18:53:22.928293
1699	DE99.02.006.013	I助姓名_13	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.928947	2026-03-25 18:53:22.928947
1700	DE99.02.006.014	I助姓名_14	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.929994	2026-03-25 18:53:22.929994
1701	DE99.02.006.015	I助姓名_15	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.930431	2026-03-25 18:53:22.930431
1702	DE99.02.006.016	I助姓名_16	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.930724	2026-03-25 18:53:22.930724
1703	DE99.02.006.017	I助姓名_17	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.931093	2026-03-25 18:53:22.931093
1704	DE99.02.006.018	I助姓名_18	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.945021	2026-03-25 18:53:22.945021
1705	DE99.02.006.019	I助姓名_19	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.946111	2026-03-25 18:53:22.946111
1706	DE99.02.006.020	I助姓名_20	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.956391	2026-03-25 18:53:22.956391
1707	DE99.02.006.021	I助姓名_21	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.964737	2026-03-25 18:53:22.964737
1708	DE99.02.006.022	I助姓名_22	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.971061	2026-03-25 18:53:22.971061
1709	DE99.02.006.023	I助姓名_23	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.975193	2026-03-25 18:53:22.975193
1710	DE99.02.006.024	I助姓名_24	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.977746	2026-03-25 18:53:22.977746
1711	DE99.02.006.025	I助姓名_25	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.978865	2026-03-25 18:53:22.978865
1712	DE99.02.006.026	I助姓名_26	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.985346	2026-03-25 18:53:22.985346
1713	DE99.02.006.027	I助姓名_27	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.986335	2026-03-25 18:53:22.986335
1714	DE99.02.006.028	I助姓名_28	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.986998	2026-03-25 18:53:22.986998
1715	DE99.02.006.029	I助姓名_29	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.987469	2026-03-25 18:53:22.987469
1716	DE99.02.006.030	I助姓名_30	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.987805	2026-03-25 18:53:22.987805
1717	DE99.02.006.031	I助姓名_31	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.988315	2026-03-25 18:53:22.988315
1718	DE99.02.006.032	I助姓名_32	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.988791	2026-03-25 18:53:22.988791
1719	DE99.02.006.033	I助姓名_33	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.989337	2026-03-25 18:53:22.989337
1720	DE99.02.006.034	I助姓名_34	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.989941	2026-03-25 18:53:22.989941
1721	DE99.02.006.035	I助姓名_35	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.990386	2026-03-25 18:53:22.990386
1722	DE99.02.006.036	I助姓名_36	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.991055	2026-03-25 18:53:22.991055
1723	DE99.02.006.037	I助姓名_37	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.9915	2026-03-25 18:53:22.9915
1724	DE99.02.006.038	I助姓名_38	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.991917	2026-03-25 18:53:22.991917
1725	DE99.02.006.039	I助姓名_39	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.992444	2026-03-25 18:53:22.992444
1726	DE99.02.006.040	I助姓名_40	I助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.992853	2026-03-25 18:53:22.992853
1727	DE99.02.007.000	II助姓名	II助姓名（同步配置选此数据元，程序自动拼接下标）	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.993157	2026-03-25 18:53:22.993157
1728	DE99.02.007.001	II助姓名_1	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.993433	2026-03-25 18:53:22.993433
1729	DE99.02.007.002	II助姓名_2	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.993717	2026-03-25 18:53:22.993717
1730	DE99.02.007.003	II助姓名_3	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.994015	2026-03-25 18:53:22.994015
1731	DE99.02.007.004	II助姓名_4	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.994375	2026-03-25 18:53:22.994375
1732	DE99.02.007.005	II助姓名_5	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.994695	2026-03-25 18:53:22.994695
1733	DE99.02.007.006	II助姓名_6	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.995043	2026-03-25 18:53:22.995043
1734	DE99.02.007.007	II助姓名_7	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.995475	2026-03-25 18:53:22.995475
1735	DE99.02.007.008	II助姓名_8	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.996183	2026-03-25 18:53:22.996183
1736	DE99.02.007.009	II助姓名_9	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.996596	2026-03-25 18:53:22.996596
1737	DE99.02.007.010	II助姓名_10	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.997022	2026-03-25 18:53:22.997022
1738	DE99.02.007.011	II助姓名_11	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.997392	2026-03-25 18:53:22.997392
1739	DE99.02.007.012	II助姓名_12	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.997782	2026-03-25 18:53:22.997782
1740	DE99.02.007.013	II助姓名_13	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.99809	2026-03-25 18:53:22.99809
1741	DE99.02.007.014	II助姓名_14	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.99849	2026-03-25 18:53:22.99849
1742	DE99.02.007.015	II助姓名_15	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.998914	2026-03-25 18:53:22.998914
1743	DE99.02.007.016	II助姓名_16	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.999313	2026-03-25 18:53:22.999313
1744	DE99.02.007.017	II助姓名_17	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:22.999666	2026-03-25 18:53:22.999666
1745	DE99.02.007.018	II助姓名_18	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.000135	2026-03-25 18:53:23.000135
1746	DE99.02.007.019	II助姓名_19	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.000576	2026-03-25 18:53:23.000576
1747	DE99.02.007.020	II助姓名_20	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.001238	2026-03-25 18:53:23.001238
1748	DE99.02.007.021	II助姓名_21	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.001643	2026-03-25 18:53:23.001643
1749	DE99.02.007.022	II助姓名_22	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.002059	2026-03-25 18:53:23.002059
1750	DE99.02.007.023	II助姓名_23	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.002562	2026-03-25 18:53:23.002562
1751	DE99.02.007.024	II助姓名_24	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.002874	2026-03-25 18:53:23.002874
1752	DE99.02.007.025	II助姓名_25	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.00327	2026-03-25 18:53:23.00327
1753	DE99.02.007.026	II助姓名_26	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.003578	2026-03-25 18:53:23.003578
1754	DE99.02.007.027	II助姓名_27	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.004577	2026-03-25 18:53:23.004577
1755	DE99.02.007.028	II助姓名_28	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.005024	2026-03-25 18:53:23.005024
1756	DE99.02.007.029	II助姓名_29	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.005456	2026-03-25 18:53:23.005456
1757	DE99.02.007.030	II助姓名_30	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.005749	2026-03-25 18:53:23.005749
1758	DE99.02.007.031	II助姓名_31	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.006199	2026-03-25 18:53:23.006199
1759	DE99.02.007.032	II助姓名_32	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.00656	2026-03-25 18:53:23.00656
1760	DE99.02.007.033	II助姓名_33	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.006874	2026-03-25 18:53:23.006874
1761	DE99.02.007.034	II助姓名_34	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.007264	2026-03-25 18:53:23.007264
1762	DE99.02.007.035	II助姓名_35	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.007558	2026-03-25 18:53:23.007558
1763	DE99.02.007.036	II助姓名_36	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.008066	2026-03-25 18:53:23.008066
1764	DE99.02.007.037	II助姓名_37	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.008402	2026-03-25 18:53:23.008402
1765	DE99.02.007.038	II助姓名_38	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.008873	2026-03-25 18:53:23.008873
1766	DE99.02.007.039	II助姓名_39	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.009321	2026-03-25 18:53:23.009321
1767	DE99.02.007.040	II助姓名_40	II助姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.00975	2026-03-25 18:53:23.00975
1768	DE99.02.008.000	手术切口类别代码	手术切口类别代码（同步配置选此数据元，程序自动拼接下标）	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.023734	2026-03-25 18:53:23.023734
1769	DE99.02.008.001	手术切口类别代码_1	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.024512	2026-03-25 18:53:23.024512
1770	DE99.02.008.002	手术切口类别代码_2	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.024969	2026-03-25 18:53:23.024969
1771	DE99.02.008.003	手术切口类别代码_3	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.025443	2026-03-25 18:53:23.025443
1772	DE99.02.008.004	手术切口类别代码_4	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.025889	2026-03-25 18:53:23.025889
1773	DE99.02.008.005	手术切口类别代码_5	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.026279	2026-03-25 18:53:23.026279
1774	DE99.02.008.006	手术切口类别代码_6	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.02681	2026-03-25 18:53:23.02681
1775	DE99.02.008.007	手术切口类别代码_7	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.027188	2026-03-25 18:53:23.027188
1776	DE99.02.008.008	手术切口类别代码_8	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.027494	2026-03-25 18:53:23.027494
1777	DE99.02.008.009	手术切口类别代码_9	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.027878	2026-03-25 18:53:23.027878
1778	DE99.02.008.010	手术切口类别代码_10	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.028184	2026-03-25 18:53:23.028184
1779	DE99.02.008.011	手术切口类别代码_11	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.028577	2026-03-25 18:53:23.028577
1997	DE99.02.013.026	手术者ID_26	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.11965	2026-03-25 18:53:23.11965
1780	DE99.02.008.012	手术切口类别代码_12	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.028954	2026-03-25 18:53:23.028954
1781	DE99.02.008.013	手术切口类别代码_13	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.029283	2026-03-25 18:53:23.029283
1782	DE99.02.008.014	手术切口类别代码_14	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.029607	2026-03-25 18:53:23.029607
1783	DE99.02.008.015	手术切口类别代码_15	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.029891	2026-03-25 18:53:23.029891
1784	DE99.02.008.016	手术切口类别代码_16	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.030212	2026-03-25 18:53:23.030212
1785	DE99.02.008.017	手术切口类别代码_17	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.030574	2026-03-25 18:53:23.030574
1786	DE99.02.008.018	手术切口类别代码_18	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.030959	2026-03-25 18:53:23.030959
1787	DE99.02.008.019	手术切口类别代码_19	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.031239	2026-03-25 18:53:23.031239
1788	DE99.02.008.020	手术切口类别代码_20	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.0316	2026-03-25 18:53:23.0316
1789	DE99.02.008.021	手术切口类别代码_21	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.031934	2026-03-25 18:53:23.031934
1790	DE99.02.008.022	手术切口类别代码_22	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.032325	2026-03-25 18:53:23.032325
1791	DE99.02.008.023	手术切口类别代码_23	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.03265	2026-03-25 18:53:23.03265
1792	DE99.02.008.024	手术切口类别代码_24	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.032986	2026-03-25 18:53:23.032986
1793	DE99.02.008.025	手术切口类别代码_25	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.033301	2026-03-25 18:53:23.033301
1794	DE99.02.008.026	手术切口类别代码_26	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.033573	2026-03-25 18:53:23.033573
1795	DE99.02.008.027	手术切口类别代码_27	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.033854	2026-03-25 18:53:23.033854
1796	DE99.02.008.028	手术切口类别代码_28	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.034184	2026-03-25 18:53:23.034184
1797	DE99.02.008.029	手术切口类别代码_29	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.034468	2026-03-25 18:53:23.034468
1798	DE99.02.008.030	手术切口类别代码_30	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.034806	2026-03-25 18:53:23.034806
1799	DE99.02.008.031	手术切口类别代码_31	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.035146	2026-03-25 18:53:23.035146
1800	DE99.02.008.032	手术切口类别代码_32	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.035459	2026-03-25 18:53:23.035459
1801	DE99.02.008.033	手术切口类别代码_33	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.035813	2026-03-25 18:53:23.035813
1802	DE99.02.008.034	手术切口类别代码_34	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.036129	2026-03-25 18:53:23.036129
1803	DE99.02.008.035	手术切口类别代码_35	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.036414	2026-03-25 18:53:23.036414
1804	DE99.02.008.036	手术切口类别代码_36	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.036713	2026-03-25 18:53:23.036713
1805	DE99.02.008.037	手术切口类别代码_37	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.037003	2026-03-25 18:53:23.037003
1806	DE99.02.008.038	手术切口类别代码_38	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.037469	2026-03-25 18:53:23.037469
1807	DE99.02.008.039	手术切口类别代码_39	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.037754	2026-03-25 18:53:23.037754
1808	DE99.02.008.040	手术切口类别代码_40	手术切口类别代码	S3	N	1	WT01.01.014	f	\N	t	2026-03-25 18:53:23.038153	2026-03-25 18:53:23.038153
1809	DE99.02.009.000	手术切口愈合等级代码	手术切口愈合等级代码（同步配置选此数据元，程序自动拼接下标）	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.038452	2026-03-25 18:53:23.038452
1810	DE99.02.009.001	手术切口愈合等级代码_1	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.038815	2026-03-25 18:53:23.038815
1811	DE99.02.009.002	手术切口愈合等级代码_2	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.039203	2026-03-25 18:53:23.039203
1812	DE99.02.009.003	手术切口愈合等级代码_3	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.039595	2026-03-25 18:53:23.039595
1813	DE99.02.009.004	手术切口愈合等级代码_4	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.03999	2026-03-25 18:53:23.03999
1814	DE99.02.009.005	手术切口愈合等级代码_5	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.040316	2026-03-25 18:53:23.040316
1815	DE99.02.009.006	手术切口愈合等级代码_6	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.040646	2026-03-25 18:53:23.040646
1816	DE99.02.009.007	手术切口愈合等级代码_7	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.041031	2026-03-25 18:53:23.041031
1817	DE99.02.009.008	手术切口愈合等级代码_8	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.041399	2026-03-25 18:53:23.041399
1818	DE99.02.009.009	手术切口愈合等级代码_9	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.041809	2026-03-25 18:53:23.041809
1819	DE99.02.009.010	手术切口愈合等级代码_10	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.042215	2026-03-25 18:53:23.042215
1820	DE99.02.009.011	手术切口愈合等级代码_11	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.042646	2026-03-25 18:53:23.042646
1821	DE99.02.009.012	手术切口愈合等级代码_12	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.04305	2026-03-25 18:53:23.04305
1822	DE99.02.009.013	手术切口愈合等级代码_13	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.0434	2026-03-25 18:53:23.0434
1823	DE99.02.009.014	手术切口愈合等级代码_14	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.043762	2026-03-25 18:53:23.043762
1824	DE99.02.009.015	手术切口愈合等级代码_15	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.044049	2026-03-25 18:53:23.044049
1825	DE99.02.009.016	手术切口愈合等级代码_16	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.044397	2026-03-25 18:53:23.044397
1826	DE99.02.009.017	手术切口愈合等级代码_17	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.044742	2026-03-25 18:53:23.044742
1827	DE99.02.009.018	手术切口愈合等级代码_18	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.045041	2026-03-25 18:53:23.045041
1828	DE99.02.009.019	手术切口愈合等级代码_19	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.045443	2026-03-25 18:53:23.045443
1998	DE99.02.013.027	手术者ID_27	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.120127	2026-03-25 18:53:23.120127
1829	DE99.02.009.020	手术切口愈合等级代码_20	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.045724	2026-03-25 18:53:23.045724
1830	DE99.02.009.021	手术切口愈合等级代码_21	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.046069	2026-03-25 18:53:23.046069
1831	DE99.02.009.022	手术切口愈合等级代码_22	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.046368	2026-03-25 18:53:23.046368
1832	DE99.02.009.023	手术切口愈合等级代码_23	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.04665	2026-03-25 18:53:23.04665
1833	DE99.02.009.024	手术切口愈合等级代码_24	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.046997	2026-03-25 18:53:23.046997
1834	DE99.02.009.025	手术切口愈合等级代码_25	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.047337	2026-03-25 18:53:23.047337
1835	DE99.02.009.026	手术切口愈合等级代码_26	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.047706	2026-03-25 18:53:23.047706
1836	DE99.02.009.027	手术切口愈合等级代码_27	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.048033	2026-03-25 18:53:23.048033
1837	DE99.02.009.028	手术切口愈合等级代码_28	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.048317	2026-03-25 18:53:23.048317
1838	DE99.02.009.029	手术切口愈合等级代码_29	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.048637	2026-03-25 18:53:23.048637
1839	DE99.02.009.030	手术切口愈合等级代码_30	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.049011	2026-03-25 18:53:23.049011
1840	DE99.02.009.031	手术切口愈合等级代码_31	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.049386	2026-03-25 18:53:23.049386
1841	DE99.02.009.032	手术切口愈合等级代码_32	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.04967	2026-03-25 18:53:23.04967
1842	DE99.02.009.033	手术切口愈合等级代码_33	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.050033	2026-03-25 18:53:23.050033
1843	DE99.02.009.034	手术切口愈合等级代码_34	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.050402	2026-03-25 18:53:23.050402
1844	DE99.02.009.035	手术切口愈合等级代码_35	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.05076	2026-03-25 18:53:23.05076
1845	DE99.02.009.036	手术切口愈合等级代码_36	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.051221	2026-03-25 18:53:23.051221
1846	DE99.02.009.037	手术切口愈合等级代码_37	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.051528	2026-03-25 18:53:23.051528
1847	DE99.02.009.038	手术切口愈合等级代码_38	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.05181	2026-03-25 18:53:23.05181
1848	DE99.02.009.039	手术切口愈合等级代码_39	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.052108	2026-03-25 18:53:23.052108
1849	DE99.02.009.040	手术切口愈合等级代码_40	手术切口愈合等级代码	S3	N	1	WT01.01.015	f	\N	t	2026-03-25 18:53:23.052427	2026-03-25 18:53:23.052427
1850	DE99.02.010.001	麻醉方式代码_1	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.052712	2026-03-25 18:53:23.052712
1851	DE99.02.010.002	麻醉方式代码_2	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.053067	2026-03-25 18:53:23.053067
1852	DE99.02.010.003	麻醉方式代码_3	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.053369	2026-03-25 18:53:23.053369
1853	DE99.02.010.004	麻醉方式代码_4	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.053793	2026-03-25 18:53:23.053793
1854	DE99.02.010.005	麻醉方式代码_5	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.054127	2026-03-25 18:53:23.054127
1855	DE99.02.010.006	麻醉方式代码_6	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.054414	2026-03-25 18:53:23.054414
1856	DE99.02.010.007	麻醉方式代码_7	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.054816	2026-03-25 18:53:23.054816
1857	DE99.02.010.008	麻醉方式代码_8	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.055189	2026-03-25 18:53:23.055189
1858	DE99.02.010.009	麻醉方式代码_9	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.055469	2026-03-25 18:53:23.055469
1859	DE99.02.010.010	麻醉方式代码_10	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.055776	2026-03-25 18:53:23.055776
1860	DE99.02.010.011	麻醉方式代码_11	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.056197	2026-03-25 18:53:23.056197
1861	DE99.02.010.012	麻醉方式代码_12	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.056521	2026-03-25 18:53:23.056521
1862	DE99.02.010.013	麻醉方式代码_13	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.056927	2026-03-25 18:53:23.056927
1863	DE99.02.010.014	麻醉方式代码_14	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.057226	2026-03-25 18:53:23.057226
1864	DE99.02.010.015	麻醉方式代码_15	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.057617	2026-03-25 18:53:23.057617
1865	DE99.02.010.016	麻醉方式代码_16	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.057938	2026-03-25 18:53:23.057938
1866	DE99.02.010.017	麻醉方式代码_17	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.058213	2026-03-25 18:53:23.058213
1867	DE99.02.010.018	麻醉方式代码_18	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.058526	2026-03-25 18:53:23.058526
1868	DE99.02.010.019	麻醉方式代码_19	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.058892	2026-03-25 18:53:23.058892
1869	DE99.02.010.020	麻醉方式代码_20	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.059233	2026-03-25 18:53:23.059233
1870	DE99.02.010.021	麻醉方式代码_21	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.059531	2026-03-25 18:53:23.059531
1871	DE99.02.010.022	麻醉方式代码_22	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.059864	2026-03-25 18:53:23.059864
1872	DE99.02.010.023	麻醉方式代码_23	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.060208	2026-03-25 18:53:23.060208
1873	DE99.02.010.024	麻醉方式代码_24	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.060574	2026-03-25 18:53:23.060574
1874	DE99.02.010.025	麻醉方式代码_25	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.060947	2026-03-25 18:53:23.060947
1875	DE99.02.010.026	麻醉方式代码_26	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.061312	2026-03-25 18:53:23.061312
1876	DE99.02.010.027	麻醉方式代码_27	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.061606	2026-03-25 18:53:23.061606
1877	DE99.02.010.028	麻醉方式代码_28	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.061957	2026-03-25 18:53:23.061957
1878	DE99.02.010.029	麻醉方式代码_29	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.062381	2026-03-25 18:53:23.062381
1879	DE99.02.010.030	麻醉方式代码_30	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.062663	2026-03-25 18:53:23.062663
1880	DE99.02.010.031	麻醉方式代码_31	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.06312	2026-03-25 18:53:23.06312
1881	DE99.02.010.032	麻醉方式代码_32	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.06349	2026-03-25 18:53:23.06349
1882	DE99.02.010.033	麻醉方式代码_33	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.063872	2026-03-25 18:53:23.063872
1883	DE99.02.010.034	麻醉方式代码_34	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.064235	2026-03-25 18:53:23.064235
1884	DE99.02.010.035	麻醉方式代码_35	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.064549	2026-03-25 18:53:23.064549
1885	DE99.02.010.036	麻醉方式代码_36	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.065126	2026-03-25 18:53:23.065126
1886	DE99.02.010.037	麻醉方式代码_37	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.065447	2026-03-25 18:53:23.065447
1887	DE99.02.010.038	麻醉方式代码_38	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.065809	2026-03-25 18:53:23.065809
1888	DE99.02.010.039	麻醉方式代码_39	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.066145	2026-03-25 18:53:23.066145
1889	DE99.02.010.040	麻醉方式代码_40	麻醉方式代码	S3	N	2	CV06.00.103	f	\N	t	2026-03-25 18:53:23.066516	2026-03-25 18:53:23.066516
1890	DE99.02.011.000	麻醉医师姓名	麻醉医师姓名（同步配置选此数据元，程序自动拼接下标）	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.066971	2026-03-25 18:53:23.066971
1891	DE99.02.011.001	麻醉医师姓名_1	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.067311	2026-03-25 18:53:23.067311
1892	DE99.02.011.002	麻醉医师姓名_2	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.067641	2026-03-25 18:53:23.067641
1893	DE99.02.011.003	麻醉医师姓名_3	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.068014	2026-03-25 18:53:23.068014
1894	DE99.02.011.004	麻醉医师姓名_4	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.068337	2026-03-25 18:53:23.068337
1895	DE99.02.011.005	麻醉医师姓名_5	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.068699	2026-03-25 18:53:23.068699
1896	DE99.02.011.006	麻醉医师姓名_6	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.069066	2026-03-25 18:53:23.069066
1897	DE99.02.011.007	麻醉医师姓名_7	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.069365	2026-03-25 18:53:23.069365
1898	DE99.02.011.008	麻醉医师姓名_8	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.06965	2026-03-25 18:53:23.06965
1899	DE99.02.011.009	麻醉医师姓名_9	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.070038	2026-03-25 18:53:23.070038
1900	DE99.02.011.010	麻醉医师姓名_10	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.070322	2026-03-25 18:53:23.070322
1901	DE99.02.011.011	麻醉医师姓名_11	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.070616	2026-03-25 18:53:23.070616
1902	DE99.02.011.012	麻醉医师姓名_12	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.070877	2026-03-25 18:53:23.070877
1903	DE99.02.011.013	麻醉医师姓名_13	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.071246	2026-03-25 18:53:23.071246
1904	DE99.02.011.014	麻醉医师姓名_14	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.071598	2026-03-25 18:53:23.071598
1905	DE99.02.011.015	麻醉医师姓名_15	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.071975	2026-03-25 18:53:23.071975
1906	DE99.02.011.016	麻醉医师姓名_16	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.072321	2026-03-25 18:53:23.072321
1907	DE99.02.011.017	麻醉医师姓名_17	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.072795	2026-03-25 18:53:23.072795
1908	DE99.02.011.018	麻醉医师姓名_18	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.073125	2026-03-25 18:53:23.073125
1909	DE99.02.011.019	麻醉医师姓名_19	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.073456	2026-03-25 18:53:23.073456
1910	DE99.02.011.020	麻醉医师姓名_20	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.073764	2026-03-25 18:53:23.073764
1911	DE99.02.011.021	麻醉医师姓名_21	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.0741	2026-03-25 18:53:23.0741
1912	DE99.02.011.022	麻醉医师姓名_22	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.074419	2026-03-25 18:53:23.074419
1913	DE99.02.011.023	麻醉医师姓名_23	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.074761	2026-03-25 18:53:23.074761
1914	DE99.02.011.024	麻醉医师姓名_24	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.075193	2026-03-25 18:53:23.075193
1915	DE99.02.011.025	麻醉医师姓名_25	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.075571	2026-03-25 18:53:23.075571
1916	DE99.02.011.026	麻醉医师姓名_26	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.075958	2026-03-25 18:53:23.075958
1917	DE99.02.011.027	麻醉医师姓名_27	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.076288	2026-03-25 18:53:23.076288
1918	DE99.02.011.028	麻醉医师姓名_28	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.076581	2026-03-25 18:53:23.076581
1919	DE99.02.011.029	麻醉医师姓名_29	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.076953	2026-03-25 18:53:23.076953
1920	DE99.02.011.030	麻醉医师姓名_30	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.077244	2026-03-25 18:53:23.077244
1921	DE99.02.011.031	麻醉医师姓名_31	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.077554	2026-03-25 18:53:23.077554
1922	DE99.02.011.032	麻醉医师姓名_32	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.07783	2026-03-25 18:53:23.07783
1923	DE99.02.011.033	麻醉医师姓名_33	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.078204	2026-03-25 18:53:23.078204
1924	DE99.02.011.034	麻醉医师姓名_34	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.078505	2026-03-25 18:53:23.078505
1925	DE99.02.011.035	麻醉医师姓名_35	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.078864	2026-03-25 18:53:23.078864
1926	DE99.02.011.036	麻醉医师姓名_36	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.080549	2026-03-25 18:53:23.080549
1927	DE99.02.011.037	麻醉医师姓名_37	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.081781	2026-03-25 18:53:23.081781
1928	DE99.02.011.038	麻醉医师姓名_38	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.082843	2026-03-25 18:53:23.082843
1929	DE99.02.011.039	麻醉医师姓名_39	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.083423	2026-03-25 18:53:23.083423
1930	DE99.02.011.040	麻醉医师姓名_40	麻醉医师姓名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.083985	2026-03-25 18:53:23.083985
1931	DE99.02.012.000	是否急诊手术	是否急诊手术（同步配置选此数据元，程序自动拼接下标）	S3	N	1	\N	f	\N	t	2026-03-25 18:53:23.084422	2026-03-25 18:53:23.084422
1932	DE99.02.012.001	是否急诊手术_1	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.084753	2026-03-25 18:53:23.084753
1933	DE99.02.012.002	是否急诊手术_2	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.08507	2026-03-25 18:53:23.08507
1934	DE99.02.012.003	是否急诊手术_3	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.085517	2026-03-25 18:53:23.085517
1935	DE99.02.012.004	是否急诊手术_4	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.085804	2026-03-25 18:53:23.085804
1936	DE99.02.012.005	是否急诊手术_5	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.086158	2026-03-25 18:53:23.086158
1937	DE99.02.012.006	是否急诊手术_6	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.086524	2026-03-25 18:53:23.086524
1999	DE99.02.013.028	手术者ID_28	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.12058	2026-03-25 18:53:23.12058
1938	DE99.02.012.007	是否急诊手术_7	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.086845	2026-03-25 18:53:23.086845
1939	DE99.02.012.008	是否急诊手术_8	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.087325	2026-03-25 18:53:23.087325
1940	DE99.02.012.009	是否急诊手术_9	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.087712	2026-03-25 18:53:23.087712
1941	DE99.02.012.010	是否急诊手术_10	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.08811	2026-03-25 18:53:23.08811
1942	DE99.02.012.011	是否急诊手术_11	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.088456	2026-03-25 18:53:23.088456
1943	DE99.02.012.012	是否急诊手术_12	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.088782	2026-03-25 18:53:23.088782
1944	DE99.02.012.013	是否急诊手术_13	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.090012	2026-03-25 18:53:23.090012
1945	DE99.02.012.014	是否急诊手术_14	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.090995	2026-03-25 18:53:23.090995
1946	DE99.02.012.015	是否急诊手术_15	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.092384	2026-03-25 18:53:23.092384
1947	DE99.02.012.016	是否急诊手术_16	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.093296	2026-03-25 18:53:23.093296
1948	DE99.02.012.017	是否急诊手术_17	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.094015	2026-03-25 18:53:23.094015
1949	DE99.02.012.018	是否急诊手术_18	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.094562	2026-03-25 18:53:23.094562
1950	DE99.02.012.019	是否急诊手术_19	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.095221	2026-03-25 18:53:23.095221
1951	DE99.02.012.020	是否急诊手术_20	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.096684	2026-03-25 18:53:23.096684
1952	DE99.02.012.021	是否急诊手术_21	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.097412	2026-03-25 18:53:23.097412
1953	DE99.02.012.022	是否急诊手术_22	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.098257	2026-03-25 18:53:23.098257
1954	DE99.02.012.023	是否急诊手术_23	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.098835	2026-03-25 18:53:23.098835
1955	DE99.02.012.024	是否急诊手术_24	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.099675	2026-03-25 18:53:23.099675
1956	DE99.02.012.025	是否急诊手术_25	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.100144	2026-03-25 18:53:23.100144
1957	DE99.02.012.026	是否急诊手术_26	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.10049	2026-03-25 18:53:23.10049
1958	DE99.02.012.027	是否急诊手术_27	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.100917	2026-03-25 18:53:23.100917
1959	DE99.02.012.028	是否急诊手术_28	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.101339	2026-03-25 18:53:23.101339
1960	DE99.02.012.029	是否急诊手术_29	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.101752	2026-03-25 18:53:23.101752
1961	DE99.02.012.030	是否急诊手术_30	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.102156	2026-03-25 18:53:23.102156
1962	DE99.02.012.031	是否急诊手术_31	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.102579	2026-03-25 18:53:23.102579
1963	DE99.02.012.032	是否急诊手术_32	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.10309	2026-03-25 18:53:23.10309
1964	DE99.02.012.033	是否急诊手术_33	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.103429	2026-03-25 18:53:23.103429
1965	DE99.02.012.034	是否急诊手术_34	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.10392	2026-03-25 18:53:23.10392
1966	DE99.02.012.035	是否急诊手术_35	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.104219	2026-03-25 18:53:23.104219
1967	DE99.02.012.036	是否急诊手术_36	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.105293	2026-03-25 18:53:23.105293
1968	DE99.02.012.037	是否急诊手术_37	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.106338	2026-03-25 18:53:23.106338
1969	DE99.02.012.038	是否急诊手术_38	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.107106	2026-03-25 18:53:23.107106
1970	DE99.02.012.039	是否急诊手术_39	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.107542	2026-03-25 18:53:23.107542
1971	DE99.02.012.040	是否急诊手术_40	是否急诊手术	S3	N	1	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.107859	2026-03-25 18:53:23.107859
1972	DE99.02.013.001	手术者ID_1	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.108239	2026-03-25 18:53:23.108239
1973	DE99.02.013.002	手术者ID_2	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.108721	2026-03-25 18:53:23.108721
1974	DE99.02.013.003	手术者ID_3	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.109121	2026-03-25 18:53:23.109121
1975	DE99.02.013.004	手术者ID_4	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.109802	2026-03-25 18:53:23.109802
1976	DE99.02.013.005	手术者ID_5	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.110402	2026-03-25 18:53:23.110402
1977	DE99.02.013.006	手术者ID_6	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.110976	2026-03-25 18:53:23.110976
1978	DE99.02.013.007	手术者ID_7	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.111404	2026-03-25 18:53:23.111404
1979	DE99.02.013.008	手术者ID_8	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.111824	2026-03-25 18:53:23.111824
1980	DE99.02.013.009	手术者ID_9	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.112203	2026-03-25 18:53:23.112203
1981	DE99.02.013.010	手术者ID_10	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.112757	2026-03-25 18:53:23.112757
1982	DE99.02.013.011	手术者ID_11	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.113407	2026-03-25 18:53:23.113407
1983	DE99.02.013.012	手术者ID_12	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.113908	2026-03-25 18:53:23.113908
1984	DE99.02.013.013	手术者ID_13	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.114293	2026-03-25 18:53:23.114293
1985	DE99.02.013.014	手术者ID_14	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.114694	2026-03-25 18:53:23.114694
1986	DE99.02.013.015	手术者ID_15	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.11505	2026-03-25 18:53:23.11505
1987	DE99.02.013.016	手术者ID_16	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.115441	2026-03-25 18:53:23.115441
1988	DE99.02.013.017	手术者ID_17	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.115984	2026-03-25 18:53:23.115984
1989	DE99.02.013.018	手术者ID_18	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.116356	2026-03-25 18:53:23.116356
1990	DE99.02.013.019	手术者ID_19	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.116806	2026-03-25 18:53:23.116806
1991	DE99.02.013.020	手术者ID_20	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.117302	2026-03-25 18:53:23.117302
1992	DE99.02.013.021	手术者ID_21	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.117588	2026-03-25 18:53:23.117588
1993	DE99.02.013.022	手术者ID_22	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.117914	2026-03-25 18:53:23.117914
1994	DE99.02.013.023	手术者ID_23	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.118228	2026-03-25 18:53:23.118228
1995	DE99.02.013.024	手术者ID_24	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.118626	2026-03-25 18:53:23.118626
1996	DE99.02.013.025	手术者ID_25	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.119195	2026-03-25 18:53:23.119195
2000	DE99.02.013.029	手术者ID_29	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.121399	2026-03-25 18:53:23.121399
2001	DE99.02.013.030	手术者ID_30	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.122333	2026-03-25 18:53:23.122333
2002	DE99.02.013.031	手术者ID_31	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.122753	2026-03-25 18:53:23.122753
2003	DE99.02.013.032	手术者ID_32	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.123184	2026-03-25 18:53:23.123184
2004	DE99.02.013.033	手术者ID_33	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.123591	2026-03-25 18:53:23.123591
2005	DE99.02.013.034	手术者ID_34	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.124024	2026-03-25 18:53:23.124024
2006	DE99.02.013.035	手术者ID_35	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.124404	2026-03-25 18:53:23.124404
2007	DE99.02.013.036	手术者ID_36	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.1248	2026-03-25 18:53:23.1248
2008	DE99.02.013.037	手术者ID_37	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.125358	2026-03-25 18:53:23.125358
2009	DE99.02.013.038	手术者ID_38	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.125779	2026-03-25 18:53:23.125779
2010	DE99.02.013.039	手术者ID_39	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.126148	2026-03-25 18:53:23.126148
2011	DE99.02.013.040	手术者ID_40	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.126471	2026-03-25 18:53:23.126471
2012	DE99.02.014.001	I助ID_1	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.126865	2026-03-25 18:53:23.126865
2013	DE99.02.014.002	I助ID_2	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.127251	2026-03-25 18:53:23.127251
2014	DE99.02.014.003	I助ID_3	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.127538	2026-03-25 18:53:23.127538
2015	DE99.02.014.004	I助ID_4	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.127869	2026-03-25 18:53:23.127869
2016	DE99.02.014.005	I助ID_5	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.128235	2026-03-25 18:53:23.128235
2017	DE99.02.014.006	I助ID_6	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.128656	2026-03-25 18:53:23.128656
2018	DE99.02.014.007	I助ID_7	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.129448	2026-03-25 18:53:23.129448
2019	DE99.02.014.008	I助ID_8	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.129999	2026-03-25 18:53:23.129999
2020	DE99.02.014.009	I助ID_9	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.130385	2026-03-25 18:53:23.130385
2021	DE99.02.014.010	I助ID_10	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.130725	2026-03-25 18:53:23.130725
2022	DE99.02.014.011	I助ID_11	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.131028	2026-03-25 18:53:23.131028
2023	DE99.02.014.012	I助ID_12	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.131324	2026-03-25 18:53:23.131324
2024	DE99.02.014.013	I助ID_13	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.131602	2026-03-25 18:53:23.131602
2025	DE99.02.014.014	I助ID_14	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.131933	2026-03-25 18:53:23.131933
2026	DE99.02.014.015	I助ID_15	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.132373	2026-03-25 18:53:23.132373
2027	DE99.02.014.016	I助ID_16	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.133009	2026-03-25 18:53:23.133009
2028	DE99.02.014.017	I助ID_17	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.133379	2026-03-25 18:53:23.133379
2029	DE99.02.014.018	I助ID_18	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.133749	2026-03-25 18:53:23.133749
2030	DE99.02.014.019	I助ID_19	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.134144	2026-03-25 18:53:23.134144
2031	DE99.02.014.020	I助ID_20	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.134476	2026-03-25 18:53:23.134476
2032	DE99.02.014.021	I助ID_21	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.134834	2026-03-25 18:53:23.134834
2033	DE99.02.014.022	I助ID_22	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.135261	2026-03-25 18:53:23.135261
2034	DE99.02.014.023	I助ID_23	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.135631	2026-03-25 18:53:23.135631
2035	DE99.02.014.024	I助ID_24	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.136099	2026-03-25 18:53:23.136099
2036	DE99.02.014.025	I助ID_25	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.136451	2026-03-25 18:53:23.136451
2037	DE99.02.014.026	I助ID_26	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.136762	2026-03-25 18:53:23.136762
2038	DE99.02.014.027	I助ID_27	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.137136	2026-03-25 18:53:23.137136
2039	DE99.02.014.028	I助ID_28	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.137612	2026-03-25 18:53:23.137612
2040	DE99.02.014.029	I助ID_29	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.138069	2026-03-25 18:53:23.138069
2041	DE99.02.014.030	I助ID_30	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.138557	2026-03-25 18:53:23.138557
2042	DE99.02.014.031	I助ID_31	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.138921	2026-03-25 18:53:23.138921
2043	DE99.02.014.032	I助ID_32	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.139298	2026-03-25 18:53:23.139298
2044	DE99.02.014.033	I助ID_33	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.139648	2026-03-25 18:53:23.139648
2045	DE99.02.014.034	I助ID_34	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.140045	2026-03-25 18:53:23.140045
2046	DE99.02.014.035	I助ID_35	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.140473	2026-03-25 18:53:23.140473
2047	DE99.02.014.036	I助ID_36	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.140892	2026-03-25 18:53:23.140892
2048	DE99.02.014.037	I助ID_37	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.14127	2026-03-25 18:53:23.14127
2049	DE99.02.014.038	I助ID_38	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.141939	2026-03-25 18:53:23.141939
2050	DE99.02.014.039	I助ID_39	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.142751	2026-03-25 18:53:23.142751
2051	DE99.02.014.040	I助ID_40	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.143638	2026-03-25 18:53:23.143638
2052	DE99.02.015.001	II助ID_1	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.144417	2026-03-25 18:53:23.144417
2053	DE99.02.015.002	II助ID_2	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.14522	2026-03-25 18:53:23.14522
2054	DE99.02.015.003	II助ID_3	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.145787	2026-03-25 18:53:23.145787
2055	DE99.02.015.004	II助ID_4	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.146572	2026-03-25 18:53:23.146572
2056	DE99.02.015.005	II助ID_5	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.147419	2026-03-25 18:53:23.147419
2057	DE99.02.015.006	II助ID_6	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.14801	2026-03-25 18:53:23.14801
2058	DE99.02.015.007	II助ID_7	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.148778	2026-03-25 18:53:23.148778
2059	DE99.02.015.008	II助ID_8	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.149464	2026-03-25 18:53:23.149464
2060	DE99.02.015.009	II助ID_9	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.150328	2026-03-25 18:53:23.150328
2061	DE99.02.015.010	II助ID_10	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.150802	2026-03-25 18:53:23.150802
2062	DE99.02.015.011	II助ID_11	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.151274	2026-03-25 18:53:23.151274
2063	DE99.02.015.012	II助ID_12	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.151692	2026-03-25 18:53:23.151692
2064	DE99.02.015.013	II助ID_13	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.152042	2026-03-25 18:53:23.152042
2065	DE99.02.015.014	II助ID_14	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.152394	2026-03-25 18:53:23.152394
2066	DE99.02.015.015	II助ID_15	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.15302	2026-03-25 18:53:23.15302
2067	DE99.02.015.016	II助ID_16	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.153371	2026-03-25 18:53:23.153371
2068	DE99.02.015.017	II助ID_17	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.153641	2026-03-25 18:53:23.153641
2069	DE99.02.015.018	II助ID_18	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.15396	2026-03-25 18:53:23.15396
2070	DE99.02.015.019	II助ID_19	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.154341	2026-03-25 18:53:23.154341
2071	DE99.02.015.020	II助ID_20	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.154682	2026-03-25 18:53:23.154682
2072	DE99.02.015.021	II助ID_21	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.155039	2026-03-25 18:53:23.155039
2073	DE99.02.015.022	II助ID_22	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.155575	2026-03-25 18:53:23.155575
2074	DE99.02.015.023	II助ID_23	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.155975	2026-03-25 18:53:23.155975
2075	DE99.02.015.024	II助ID_24	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.156356	2026-03-25 18:53:23.156356
2076	DE99.02.015.025	II助ID_25	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.156719	2026-03-25 18:53:23.156719
2077	DE99.02.015.026	II助ID_26	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.157055	2026-03-25 18:53:23.157055
2078	DE99.02.015.027	II助ID_27	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.157423	2026-03-25 18:53:23.157423
2079	DE99.02.015.028	II助ID_28	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.15778	2026-03-25 18:53:23.15778
2080	DE99.02.015.029	II助ID_29	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.158145	2026-03-25 18:53:23.158145
2081	DE99.02.015.030	II助ID_30	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.158512	2026-03-25 18:53:23.158512
2082	DE99.02.015.031	II助ID_31	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.158933	2026-03-25 18:53:23.158933
2083	DE99.02.015.032	II助ID_32	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.15925	2026-03-25 18:53:23.15925
2084	DE99.02.015.033	II助ID_33	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.159567	2026-03-25 18:53:23.159567
2085	DE99.02.015.034	II助ID_34	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.159933	2026-03-25 18:53:23.159933
2086	DE99.02.015.035	II助ID_35	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.160291	2026-03-25 18:53:23.160291
2087	DE99.02.015.036	II助ID_36	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.160571	2026-03-25 18:53:23.160571
2088	DE99.02.015.037	II助ID_37	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.16089	2026-03-25 18:53:23.16089
2089	DE99.02.015.038	II助ID_38	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.161303	2026-03-25 18:53:23.161303
2090	DE99.02.015.039	II助ID_39	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.161629	2026-03-25 18:53:23.161629
2091	DE99.02.015.040	II助ID_40	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.161959	2026-03-25 18:53:23.161959
2092	DE99.02.016.001	麻醉医师ID_1	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.162285	2026-03-25 18:53:23.162285
2093	DE99.02.016.002	麻醉医师ID_2	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.162609	2026-03-25 18:53:23.162609
2094	DE99.02.016.003	麻醉医师ID_3	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.162969	2026-03-25 18:53:23.162969
2095	DE99.02.016.004	麻醉医师ID_4	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.163476	2026-03-25 18:53:23.163476
2096	DE99.02.016.005	麻醉医师ID_5	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.163752	2026-03-25 18:53:23.163752
2097	DE99.02.016.006	麻醉医师ID_6	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.16412	2026-03-25 18:53:23.16412
2098	DE99.02.016.007	麻醉医师ID_7	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.164448	2026-03-25 18:53:23.164448
2099	DE99.02.016.008	麻醉医师ID_8	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.164778	2026-03-25 18:53:23.164778
2100	DE99.02.016.009	麻醉医师ID_9	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.165196	2026-03-25 18:53:23.165196
2101	DE99.02.016.010	麻醉医师ID_10	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.165469	2026-03-25 18:53:23.165469
2102	DE99.02.016.011	麻醉医师ID_11	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.165734	2026-03-25 18:53:23.165734
2103	DE99.02.016.012	麻醉医师ID_12	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.166018	2026-03-25 18:53:23.166018
2104	DE99.02.016.013	麻醉医师ID_13	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.16633	2026-03-25 18:53:23.16633
2105	DE99.02.016.014	麻醉医师ID_14	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.166682	2026-03-25 18:53:23.166682
2106	DE99.02.016.015	麻醉医师ID_15	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.167055	2026-03-25 18:53:23.167055
2107	DE99.02.016.016	麻醉医师ID_16	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.167333	2026-03-25 18:53:23.167333
2108	DE99.02.016.017	麻醉医师ID_17	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.167703	2026-03-25 18:53:23.167703
2109	DE99.02.016.018	麻醉医师ID_18	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.168023	2026-03-25 18:53:23.168023
2110	DE99.02.016.019	麻醉医师ID_19	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.168337	2026-03-25 18:53:23.168337
2111	DE99.02.016.020	麻醉医师ID_20	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.168615	2026-03-25 18:53:23.168615
2112	DE99.02.016.021	麻醉医师ID_21	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.168916	2026-03-25 18:53:23.168916
2113	DE99.02.016.022	麻醉医师ID_22	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.169265	2026-03-25 18:53:23.169265
2114	DE99.02.016.023	麻醉医师ID_23	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.169592	2026-03-25 18:53:23.169592
2115	DE99.02.016.024	麻醉医师ID_24	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.16997	2026-03-25 18:53:23.16997
2116	DE99.02.016.025	麻醉医师ID_25	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.170302	2026-03-25 18:53:23.170302
2117	DE99.02.016.026	麻醉医师ID_26	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.170579	2026-03-25 18:53:23.170579
2118	DE99.02.016.027	麻醉医师ID_27	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.170926	2026-03-25 18:53:23.170926
2119	DE99.02.016.028	麻醉医师ID_28	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.171295	2026-03-25 18:53:23.171295
2120	DE99.02.016.029	麻醉医师ID_29	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.171614	2026-03-25 18:53:23.171614
2121	DE99.02.016.030	麻醉医师ID_30	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.17195	2026-03-25 18:53:23.17195
2122	DE99.02.016.031	麻醉医师ID_31	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.17226	2026-03-25 18:53:23.17226
2123	DE99.02.016.032	麻醉医师ID_32	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.172539	2026-03-25 18:53:23.172539
2124	DE99.02.016.033	麻醉医师ID_33	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.172825	2026-03-25 18:53:23.172825
2125	DE99.02.016.034	麻醉医师ID_34	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.17311	2026-03-25 18:53:23.17311
2126	DE99.02.016.035	麻醉医师ID_35	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.173443	2026-03-25 18:53:23.173443
2127	DE99.02.016.036	麻醉医师ID_36	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.173727	2026-03-25 18:53:23.173727
2128	DE99.02.016.037	麻醉医师ID_37	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.174041	2026-03-25 18:53:23.174041
2129	DE99.02.016.038	麻醉医师ID_38	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.174334	2026-03-25 18:53:23.174334
2130	DE99.02.016.039	麻醉医师ID_39	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.174594	2026-03-25 18:53:23.174594
2131	DE99.02.016.040	麻醉医师ID_40	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.174933	2026-03-25 18:53:23.174933
2132	DE99.02.016.041	门诊医师签名	门诊医师签名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.175246	2026-03-25 18:53:23.175246
2133	DE99.02.016.042	门诊医师ID	门诊医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.175573	2026-03-25 18:53:23.175573
2134	DE99.02.016.043	病例分型	病例分型	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:23.17589	2026-03-25 18:53:23.17589
2135	DE99.02.016.044	实施重症监护	实施重症监护	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:23.176302	2026-03-25 18:53:23.176302
2136	DE99.02.016.045	监护总时间_d	监护总时间天	N	N	5	\N	f	\N	t	2026-03-25 18:53:23.176596	2026-03-25 18:53:23.176596
2137	DE99.02.016.046	监护总时间_h	监护总时间小时	N	N	5	\N	f	\N	t	2026-03-25 18:53:23.176936	2026-03-25 18:53:23.176936
2138	DE99.02.016.047	单病种管理	单病种管理	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:23.177355	2026-03-25 18:53:23.177355
2139	DE99.02.016.048	实施DRGs管理	实施DRGs管理	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:23.177657	2026-03-25 18:53:23.177657
2140	DE99.02.016.049	抗生素使用	抗生素使用	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:23.177985	2026-03-25 18:53:23.177985
2141	DE99.02.016.050	细菌培养标本送检	细菌培养标本送检	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:23.178349	2026-03-25 18:53:23.178349
2142	DE99.02.016.051	法定传染病	法定传染病	S3	N1	\N	\N	f	\N	t	2026-03-25 18:53:23.178661	2026-03-25 18:53:23.178661
2143	DE99.02.016.052	TNM分期_T	TNM分期-T表示肿瘤原发灶的情况	S1	A	20	\N	f	\N	t	2026-03-25 18:53:23.178962	2026-03-25 18:53:23.178962
2144	DE99.02.016.053	TNM分期_N	TNM分期-N表示区域淋巴结受累情况	S1	A	20	\N	f	\N	t	2026-03-25 18:53:23.179332	2026-03-25 18:53:23.179332
2145	DE99.02.016.054	TNM分期_M	TNM分期-M表示远处转移	S1	A	20	\N	f	\N	t	2026-03-25 18:53:23.179657	2026-03-25 18:53:23.179657
2146	DE99.03.001.01	入出院诊断符合情况	入出院诊断符合情况	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:23.179992	2026-03-25 18:53:23.179992
2147	DE99.03.001.02	手术前后诊断符合情况	手术前后诊断符合情况	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:23.18026	2026-03-25 18:53:23.18026
2148	DE99.03.001.03	主要诊断与病理诊断符合情况	主要诊断与病理诊断符合情况	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:23.180579	2026-03-25 18:53:23.180579
2149	DE99.03.001.04	主要诊断疗效	主要诊断疗效	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:23.180878	2026-03-25 18:53:23.180878
2150	DE99.03.001.05	国籍	国籍名称	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:23.181188	2026-03-25 18:53:23.181188
2151	DE99.03.001.06	医师签名	医师签名，可自动带出	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:23.181504	2026-03-25 18:53:23.181504
2152	DE99.03.001.07	护士签名	护士签名，病历书写手动签名	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:23.18183	2026-03-25 18:53:23.18183
2153	DE99.03.001.08	签名位	签名位	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:23.18213	2026-03-25 18:53:23.18213
2154	DE99.03.001.09	审签签名位	审签签名位	S1	AN	10	\N	f	\N	t	2026-03-25 18:53:23.182434	2026-03-25 18:53:23.182434
2155	DE99.09.000.06	输入文本	输入文本	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.182743	2026-03-25 18:53:23.182743
2156	DE99.09.000.07	主要表现	主要表现	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.18302	2026-03-25 18:53:23.18302
2157	DE99.09.000.08	精神检查	精神检查	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.183356	2026-03-25 18:53:23.183356
2158	DE99.09.000.09	辅助检查	辅助检查	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.183696	2026-03-25 18:53:23.183696
2159	DE99.09.000.10	鉴别诊断2	鉴别诊断2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.184028	2026-03-25 18:53:23.184028
2160	DE99.09.000.11	诊疗计划2	诊疗计划2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.184319	2026-03-25 18:53:23.184319
2161	DE99.09.000.12	详细地址	详细地址	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.184638	2026-03-25 18:53:23.184638
2162	DE99.09.000.35	患者授权亲属签名	患者授权亲属签名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.184947	2026-03-25 18:53:23.184947
2163	DE99.09.000.36	与患者关系	与患者关系	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.185272	2026-03-25 18:53:23.185272
2164	DE99.09.000.37	麻醉方式	麻醉方式	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.185556	2026-03-25 18:53:23.185556
2165	DE99.09.000.44	评估方法	评估方法	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.185827	2026-03-25 18:53:23.185827
2166	DE99.09.000.45	疼痛程度	疼痛程度	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.186177	2026-03-25 18:53:23.186177
2167	DE99.09.003.54	意识形态1	意识形态1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.186475	2026-03-25 18:53:23.186475
2168	DE99.09.003.55	意识形态2	意识形态2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.186794	2026-03-25 18:53:23.186794
2169	DE99.09.003.56	意识形态3	意识形态3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.187091	2026-03-25 18:53:23.187091
2170	DE99.09.003.57	意识形态4	意识形态4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.187399	2026-03-25 18:53:23.187399
2171	DE99.09.003.58	意识形态5	意识形态5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.187663	2026-03-25 18:53:23.187663
2172	DE99.09.003.59	意识形态6	意识形态6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.187971	2026-03-25 18:53:23.187971
2173	DE99.09.003.60	意识形态7	意识形态7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.188239	2026-03-25 18:53:23.188239
2174	DE99.09.003.61	意识形态8	意识形态8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.188555	2026-03-25 18:53:23.188555
2175	DE99.09.003.62	意识形态9	意识形态9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.188822	2026-03-25 18:53:23.188822
2176	DE99.09.003.63	意识形态10	意识形态10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.189122	2026-03-25 18:53:23.189122
2177	DE99.09.003.64	意识形态11	意识形态11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.189395	2026-03-25 18:53:23.189395
2178	DE99.09.003.65	理解程度1	理解程度1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.189675	2026-03-25 18:53:23.189675
2179	DE99.09.003.66	理解程度2	理解程度	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.189968	2026-03-25 18:53:23.189968
2180	DE99.09.003.68	理解程度3	理解程度3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.190267	2026-03-25 18:53:23.190267
2181	DE99.09.003.70	理解程度4	理解程度4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.190861	2026-03-25 18:53:23.190861
2182	DE99.09.003.72	理解程度五	理解程度五	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.191225	2026-03-25 18:53:23.191225
2183	DE99.09.003.73	理解程度6	理解程度6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.191547	2026-03-25 18:53:23.191547
2184	DE99.09.003.74	理解程度7	理解程度7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.191945	2026-03-25 18:53:23.191945
2185	DE99.09.003.75	理解程度8	理解程度8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.192288	2026-03-25 18:53:23.192288
2186	DE99.09.003.76	理解程度9	理解程度9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.192637	2026-03-25 18:53:23.192637
2187	DE99.09.003.77	理解程度10	理解程度10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.193014	2026-03-25 18:53:23.193014
2188	DE99.09.003.78	理解程度11	理解程度11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.193393	2026-03-25 18:53:23.193393
2189	DE99.09.003.82	情绪状态1	情绪状态1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.193726	2026-03-25 18:53:23.193726
2190	DE99.09.003.83	情绪状态2	情绪状态2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.194023	2026-03-25 18:53:23.194023
2191	DE99.09.003.87	情绪状态3	情绪状态3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.194327	2026-03-25 18:53:23.194327
2192	DE99.09.003.88	情绪状态4	情绪状态4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.19464	2026-03-25 18:53:23.19464
2193	DE99.09.003.90	情绪状态5	情绪状态5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.195033	2026-03-25 18:53:23.195033
2194	DE99.09.003.92	情绪状态6	情绪状态6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.195381	2026-03-25 18:53:23.195381
2195	DE99.09.003.94	情绪状态7	情绪状态7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.195971	2026-03-25 18:53:23.195971
2196	DE99.09.003.95	情绪状态8	情绪状态8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.196377	2026-03-25 18:53:23.196377
2197	DE99.09.003.96	情绪状态9	情绪状态9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.196724	2026-03-25 18:53:23.196724
2198	DE99.09.003.97	情绪状态10	情绪状态10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.197108	2026-03-25 18:53:23.197108
2199	DE99.09.003.98	情绪状态11	情绪状态11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.197407	2026-03-25 18:53:23.197407
2200	DE99.09.004.00	合作程度1	合作程度1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.197711	2026-03-25 18:53:23.197711
2201	DE99.09.004.01	合作程度2	合作程度2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.198009	2026-03-25 18:53:23.198009
2202	DE99.09.004.02	合作程度3	合作程度3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.198301	2026-03-25 18:53:23.198301
2203	DE99.09.004.03	合作程度4	合作程度4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.198683	2026-03-25 18:53:23.198683
2204	DE99.09.004.04	合作程度5	合作程度5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.198957	2026-03-25 18:53:23.198957
2205	DE99.09.004.05	合作程度6	合作程度6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.19933	2026-03-25 18:53:23.19933
2206	DE99.09.004.06	合作程度7	合作程度7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.199642	2026-03-25 18:53:23.199642
2207	DE99.09.004.07	合作程度8	合作程度8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.20001	2026-03-25 18:53:23.20001
2208	DE99.09.004.08	合作程度9	合作程度8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.200293	2026-03-25 18:53:23.200293
2209	DE99.09.004.09	合作程度10	合作程度10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.200629	2026-03-25 18:53:23.200629
2210	DE99.09.004.10	合作程度11	合作程度11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.20092	2026-03-25 18:53:23.20092
2211	DE99.09.004.11	耐受程度1	耐受程度1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.201228	2026-03-25 18:53:23.201228
2212	DE99.09.004.12	耐受程度2	耐受程度2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.20153	2026-03-25 18:53:23.20153
2213	DE99.09.004.13	耐受程度3	耐受程度3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.201823	2026-03-25 18:53:23.201823
2214	DE99.09.004.14	耐受程度4	耐受程度4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.202172	2026-03-25 18:53:23.202172
2215	DE99.09.004.15	耐受程度5	耐受程度5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.202466	2026-03-25 18:53:23.202466
2216	DE99.09.004.16	耐受程度6	耐受程度6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.202783	2026-03-25 18:53:23.202783
2217	DE99.09.004.17	耐受程度7	耐受程度7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.203107	2026-03-25 18:53:23.203107
2218	DE99.09.004.18	耐受程度8	耐受程度8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.203447	2026-03-25 18:53:23.203447
2219	DE99.09.004.19	耐受程度9	耐受程度9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.20373	2026-03-25 18:53:23.20373
2220	DE99.09.004.20	耐受程度10	耐受程度10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.204058	2026-03-25 18:53:23.204058
2221	DE99.09.004.21	耐受程度11	耐受程度11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.204368	2026-03-25 18:53:23.204368
2222	DE99.09.004.22	管道数量1	管道数量1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.204646	2026-03-25 18:53:23.204646
2223	DE99.09.004.23	管道数量2	管道数量2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.204929	2026-03-25 18:53:23.204929
2224	DE99.09.004.24	管道数量3	管道数量3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.205221	2026-03-25 18:53:23.205221
2225	DE99.09.004.25	管道数量4	管道数量4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.205681	2026-03-25 18:53:23.205681
2226	DE99.09.004.26	管道数量5	管道数量5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.205966	2026-03-25 18:53:23.205966
2227	DE99.09.004.27	管道数量6	管道数量6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.206332	2026-03-25 18:53:23.206332
2228	DE99.09.004.28	管道数量7	管道数量7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.206596	2026-03-25 18:53:23.206596
2229	DE99.09.004.29	管道数量8	管道数量8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.206888	2026-03-25 18:53:23.206888
2230	DE99.09.004.30	管道数量9	管道数量9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.2072	2026-03-25 18:53:23.2072
2231	DE99.09.004.31	管道数量10	管道数量10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.207499	2026-03-25 18:53:23.207499
2232	DE99.09.004.32	管道数量11	管道数量11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.207801	2026-03-25 18:53:23.207801
2233	DE99.09.004.33	管道类型1分	管道类型1分	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.208189	2026-03-25 18:53:23.208189
2234	DE99.09.004.34	管道类型1分_2	管道类型1分_2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.208483	2026-03-25 18:53:23.208483
2235	DE99.09.004.35	管道类型1分_3	管道类型1分_3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.20883	2026-03-25 18:53:23.20883
2236	DE99.09.004.36	管道类型1分_4	管道类型1分_4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.209157	2026-03-25 18:53:23.209157
2237	DE99.09.004.37	管道类型1分_5	管道类型1分_5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.209428	2026-03-25 18:53:23.209428
2238	DE99.09.004.38	管道类型1分_6	管道类型1分_6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.209766	2026-03-25 18:53:23.209766
2239	DE99.09.004.39	管道类型1分_7	管道类型1分_7	S	A	50	\N	f	\N	t	2026-03-25 18:53:23.210151	2026-03-25 18:53:23.210151
2240	DE99.09.004.40	管道类型1分_8	管道类型1分_8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.210679	2026-03-25 18:53:23.210679
2241	DE99.09.004.41	管道类型1分_9	管道类型1分_9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.211031	2026-03-25 18:53:23.211031
2242	DE99.09.004.42	管道类型1分_10	管道类型1分_10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.211349	2026-03-25 18:53:23.211349
2243	DE99.09.004.43	管道类型1分_11	管道类型1分_11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.211655	2026-03-25 18:53:23.211655
2244	DE99.09.004.44	管道类型2分	管道类型2分	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.211951	2026-03-25 18:53:23.211951
2245	DE99.09.004.45	管道类型2分_2	管道类型2分_2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.212254	2026-03-25 18:53:23.212254
2246	DE99.09.004.46	管道类型2分_3	管道类型2分_3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.21266	2026-03-25 18:53:23.21266
2247	DE99.09.004.47	管道类型2分_4	管道类型2分_4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.212975	2026-03-25 18:53:23.212975
2248	DE99.09.004.48	管道类型2分_5	管道类型2分_4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.213264	2026-03-25 18:53:23.213264
2249	DE99.09.004.49	管道类型2分_6	管道类型2分_6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.213591	2026-03-25 18:53:23.213591
2250	DE99.09.004.50	管道类型2分_7	管道类型2分_7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.213886	2026-03-25 18:53:23.213886
2251	DE99.09.004.51	管道类型2分_8	管道类型2分_8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.214189	2026-03-25 18:53:23.214189
2252	DE99.09.004.52	管道类型2分_9	管道类型2分_9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.214463	2026-03-25 18:53:23.214463
2253	DE99.09.004.53	管道类型2分_10	管道类型2分_10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.214763	2026-03-25 18:53:23.214763
2254	DE99.09.004.54	管道类型2分_11	管道类型2分_11	S	A	50	\N	f	\N	t	2026-03-25 18:53:23.215069	2026-03-25 18:53:23.215069
2255	DE99.09.004.55	管道类型3分	管道类型3分	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.215416	2026-03-25 18:53:23.215416
2256	DE99.09.004.56	管道类型3分_2	管道类型3分_2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.215708	2026-03-25 18:53:23.215708
2257	DE99.09.004.57	管道类型3分_3	管道类型3分_3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.216005	2026-03-25 18:53:23.216005
2258	DE99.09.004.58	管道类型3分_4	管道类型3分_4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.216364	2026-03-25 18:53:23.216364
2259	DE99.09.004.59	管道类型3分_5	管道类型3分_5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.216663	2026-03-25 18:53:23.216663
2260	DE99.09.004.60	管道类型3分_6	管道类型3分_6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.216999	2026-03-25 18:53:23.216999
2261	DE99.09.004.61	管道类型3分_7	管道类型3分_7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.217332	2026-03-25 18:53:23.217332
2262	DE99.09.004.62	管道类型3分_8	管道类型3分_8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.217592	2026-03-25 18:53:23.217592
2263	DE99.09.004.63	管道类型3分_9	管道类型3分_9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.217866	2026-03-25 18:53:23.217866
2264	DE99.09.004.64	管道类型3分_10	管道类型3分_10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.218172	2026-03-25 18:53:23.218172
2265	DE99.09.004.65	管道类型3分_11	管道类型3分_11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.218495	2026-03-25 18:53:23.218495
2266	DE99.09.004.66	管道类型4分	管道类型4分	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.218794	2026-03-25 18:53:23.218794
2267	DE99.09.004.67	管道类型4分_2	管道类型4分_2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.2192	2026-03-25 18:53:23.2192
2268	DE99.09.004.68	管道类型4分_3	管道类型4分_3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.219472	2026-03-25 18:53:23.219472
2269	DE99.09.004.69	管道类型4分_4	管道类型4分_4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.219739	2026-03-25 18:53:23.219739
2270	DE99.09.004.70	管道类型4分_5	管道类型4分_5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.220012	2026-03-25 18:53:23.220012
2271	DE99.09.004.71	管道类型4分_6	管道类型4分_6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.220347	2026-03-25 18:53:23.220347
2272	DE99.09.004.72	管道类型4分_7	管道类型4分_7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.220633	2026-03-25 18:53:23.220633
2273	DE99.09.004.73	管道类型4分_8	管道类型4分_8	S	A	50	\N	f	\N	t	2026-03-25 18:53:23.220897	2026-03-25 18:53:23.220897
2274	DE99.09.004.74	管道类型4分_9	管道类型4分_9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.2212	2026-03-25 18:53:23.2212
2275	DE99.09.004.75	管道类型4分_10	管道类型4分_10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.221499	2026-03-25 18:53:23.221499
2276	DE99.09.004.76	管道类型4分_11	管道类型4分_11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.221768	2026-03-25 18:53:23.221768
2277	DE99.09.004.85	管道固定方式1	管道固定方式1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.222135	2026-03-25 18:53:23.222135
2278	DE99.09.004.87	管道固定方式2	管道固定方式2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.222465	2026-03-25 18:53:23.222465
2279	DE99.09.004.88	管道固定方式3	管道固定方式3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.222776	2026-03-25 18:53:23.222776
2280	DE99.09.004.89	管道固定方式4	管道固定方式4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.223087	2026-03-25 18:53:23.223087
2281	DE99.09.004.90	管道固定方式5	管道固定方式5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.223358	2026-03-25 18:53:23.223358
2282	DE99.09.004.91	管道固定方式6	管道固定方式6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.223701	2026-03-25 18:53:23.223701
2283	DE99.09.004.92	管道固定方式7	管道固定方式7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.223991	2026-03-25 18:53:23.223991
2284	DE99.09.004.93	管道固定方式8	管道固定方式8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.22431	2026-03-25 18:53:23.22431
2285	DE99.09.004.94	管道固定方式9	管道固定方式9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.224672	2026-03-25 18:53:23.224672
2286	DE99.09.004.95	管道固定方式10	管道固定方式10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.224975	2026-03-25 18:53:23.224975
2287	DE99.09.004.96	管道固定方式11	管道固定方式11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.225312	2026-03-25 18:53:23.225312
2288	DE99.09.004.97	活动1	活动1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.225633	2026-03-25 18:53:23.225633
2289	DE99.09.004.98	活动2	活动2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.225912	2026-03-25 18:53:23.225912
2290	DE99.09.004.99	活动3	活动2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.226229	2026-03-25 18:53:23.226229
2291	DE99.09.005.00	活动4	活动4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.226501	2026-03-25 18:53:23.226501
2292	DE99.09.005.01	活动5	活动5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.226829	2026-03-25 18:53:23.226829
2293	DE99.09.005.02	活动6	活动6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.227146	2026-03-25 18:53:23.227146
2294	DE99.09.005.03	活动7	活动7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.22743	2026-03-25 18:53:23.22743
2295	DE99.09.005.04	活动8	活动8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.227731	2026-03-25 18:53:23.227731
2296	DE99.09.005.05	活动9	活动9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.228078	2026-03-25 18:53:23.228078
2297	DE99.09.005.06	活动10	活动10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.228378	2026-03-25 18:53:23.228378
2298	DE99.09.005.07	活动11	活动11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.228738	2026-03-25 18:53:23.228738
2299	DE99.09.005.08	总分_9	总分_9	N	N2	\N	\N	f	\N	t	2026-03-25 18:53:23.229072	2026-03-25 18:53:23.229072
2300	DE99.09.005.09	总分_10	总分_10	N	N2	\N	\N	f	\N	t	2026-03-25 18:53:23.229507	2026-03-25 18:53:23.229507
2301	DE99.09.005.10	总分_11	总分_11	N	N2	\N	\N	f	\N	t	2026-03-25 18:53:23.230195	2026-03-25 18:53:23.230195
2302	DE99.09.005.11	风险等级1	风险等级1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.230977	2026-03-25 18:53:23.230977
2303	DE99.09.005.12	风险等级2	风险等级2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.23143	2026-03-25 18:53:23.23143
2304	DE99.09.005.13	风险等级3	风险等级3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.231871	2026-03-25 18:53:23.231871
2305	DE99.09.005.14	风险等级4	风险等级4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.23226	2026-03-25 18:53:23.23226
2306	DE99.09.005.16	风险等级5	风险等级5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.232565	2026-03-25 18:53:23.232565
2307	DE99.09.005.17	风险等级6	风险等级6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.23287	2026-03-25 18:53:23.23287
2308	DE99.09.005.18	风险等级7	风险等级7	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.233183	2026-03-25 18:53:23.233183
2309	DE99.09.005.19	风险等级8	风险等级8	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.233695	2026-03-25 18:53:23.233695
2310	DE99.09.005.20	风险等级9	风险等级9	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.234041	2026-03-25 18:53:23.234041
2311	DE99.09.005.21	风险等级10	风险等级10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.234352	2026-03-25 18:53:23.234352
2312	DE99.09.005.22	风险等级11	风险等级11	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.234719	2026-03-25 18:53:23.234719
2313	DE99.09.006.95	输入1	输入1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.235398	2026-03-25 18:53:23.235398
2314	DE99.09.007.00	输入2	输入2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.236264	2026-03-25 18:53:23.236264
2315	DE99.09.007.01	输入3	输入3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.236745	2026-03-25 18:53:23.236745
2316	DE99.09.007.04	输入4	输入4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.237216	2026-03-25 18:53:23.237216
2317	DE99.09.007.21	输入12	输入12	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.237741	2026-03-25 18:53:23.237741
2318	DE99.09.007.26	输入15	输入15	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.238349	2026-03-25 18:53:23.238349
2319	DE99.09.007.28	输入16	输入16	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.238846	2026-03-25 18:53:23.238846
2320	DE99.09.007.95	输入日期1	输入日期1	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.23944	2026-03-25 18:53:23.23944
2321	DE99.09.007.97	输入日期3	输入日期3	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.240134	2026-03-25 18:53:23.240134
2322	DE99.09.007.98	输入日期4	输入日期4	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.240604	2026-03-25 18:53:23.240604
2323	DE99.09.007.99	输入日期5	输入日期5	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.241173	2026-03-25 18:53:23.241173
2324	DE99.09.008.00	输入日期6	输入日期6	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.241955	2026-03-25 18:53:23.241955
2325	DE99.09.008.02	关系2	关系2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.243201	2026-03-25 18:53:23.243201
2326	DE99.09.008.03	关系3	关系3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.243847	2026-03-25 18:53:23.243847
2327	DE99.09.008.04	告知者签名	告知者签名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.244499	2026-03-25 18:53:23.244499
2328	DE99.09.008.05	患者手印1	患者手印1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.244956	2026-03-25 18:53:23.244956
2329	DE99.09.008.06	患者手印2	患者手印2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.245334	2026-03-25 18:53:23.245334
2330	DE99.09.008.07	患者手印3	患者手印3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.245625	2026-03-25 18:53:23.245625
2331	DE99.09.008.08	其他	其他	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.245969	2026-03-25 18:53:23.245969
2332	DE99.09.008.09	告知者签名1	告知者签名1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.246918	2026-03-25 18:53:23.246918
2333	DE99.09.008.10	告知者签名2	告知者签名2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.248015	2026-03-25 18:53:23.248015
2334	DE99.09.008.11	告知者签名3	告知者签名3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.248584	2026-03-25 18:53:23.248584
2335	DE99.09.008.12	压力性损伤部位1	压力性损伤部位1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.249257	2026-03-25 18:53:23.249257
2336	DE99.09.008.13	范围1	范围1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.249776	2026-03-25 18:53:23.249776
2337	DE99.09.008.14	范围2	范围2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.25029	2026-03-25 18:53:23.25029
2338	DE99.09.008.15	范围3	范围3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.250868	2026-03-25 18:53:23.250868
2339	DE99.09.008.17	数字1	数字1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.25145	2026-03-25 18:53:23.25145
2340	DE99.09.009.11	损伤部位	损伤部位	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.252045	2026-03-25 18:53:23.252045
2341	DE99.09.009.12	其他2	其他2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.252577	2026-03-25 18:53:23.252577
2342	DE99.09.009.13	输入日期7	输入日期7	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.253023	2026-03-25 18:53:23.253023
2343	DE99.09.009.14	输入日期8	输入日期8	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.25351	2026-03-25 18:53:23.25351
2344	DE99.09.009.15	告知者签名4	告知者签名4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.254092	2026-03-25 18:53:23.254092
2345	DE99.09.009.16	关系4	关系4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.254481	2026-03-25 18:53:23.254481
2346	DE99.09.009.17	患者手印4	患者手印4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.254963	2026-03-25 18:53:23.254963
2347	DE99.09.009.18	输入文本2	输入文本2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.255353	2026-03-25 18:53:23.255353
2348	DE99.09.009.19	输入文本3	输入文本3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.255846	2026-03-25 18:53:23.255846
2349	DE99.09.009.20	输入文本4	输入文本4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.256583	2026-03-25 18:53:23.256583
2350	DE99.09.009.21	意识1	意识1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.257256	2026-03-25 18:53:23.257256
2351	DE99.09.009.22	意识2	意识2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.258509	2026-03-25 18:53:23.258509
2352	DE99.09.009.23	意识3	意识3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.259247	2026-03-25 18:53:23.259247
2353	DE99.09.009.24	科室护士签名	科室护士签名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.259666	2026-03-25 18:53:23.259666
2354	DE99.09.009.25	介入室护士签名	介入室护士签名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.260076	2026-03-25 18:53:23.260076
2355	DE99.09.009.26	体温1	体温1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.26058	2026-03-25 18:53:23.26058
2356	DE99.09.009.27	心率1	心率1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.261065	2026-03-25 18:53:23.261065
2357	DE99.09.009.28	心率2	心率2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.261437	2026-03-25 18:53:23.261437
2358	DE99.09.009.29	呼吸1	呼吸1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.261981	2026-03-25 18:53:23.261981
2359	DE99.09.009.30	呼吸2	呼吸2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.262302	2026-03-25 18:53:23.262302
2360	DE99.09.009.31	呼吸3	呼吸3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.263314	2026-03-25 18:53:23.263314
2361	DE99.09.009.32	血压上1	血压上1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.263766	2026-03-25 18:53:23.263766
2362	DE99.09.009.33	血压上2	血压上2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.264279	2026-03-25 18:53:23.264279
2363	DE99.09.009.34	血压上3	血压上3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.264742	2026-03-25 18:53:23.264742
2364	DE99.09.009.35	血压下1	血压下1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.265302	2026-03-25 18:53:23.265302
2365	DE99.09.009.36	血压下2	血压下2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.265837	2026-03-25 18:53:23.265837
2366	DE99.09.009.41	到达介入室时间	到达介入室时间	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.266259	2026-03-25 18:53:23.266259
2367	DE99.09.009.66	术中输液量	术中输液量	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.26664	2026-03-25 18:53:23.26664
2368	DE99.09.009.73	术中尿量	术中尿量	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.266955	2026-03-25 18:53:23.266955
2369	DE99.09.009.75	术中输血量	术中输血量	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.267373	2026-03-25 18:53:23.267373
2370	DE99.09.009.77	介入室护士签名2	介入室护士签名2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.267707	2026-03-25 18:53:23.267707
2371	DE99.09.009.78	接受护士签名	接受护士签名	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.268057	2026-03-25 18:53:23.268057
2372	DE99.09.010.80	体重指数	体重指数	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.268396	2026-03-25 18:53:23.268396
2373	DE99.09.010.81	蛋白质	蛋白质	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.268835	2026-03-25 18:53:23.268835
2374	DE99.09.010.85	处1	处1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.269184	2026-03-25 18:53:23.269184
2375	DE99.09.010.86	处2	处2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.269543	2026-03-25 18:53:23.269543
2376	DE99.09.010.87	处3	处3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.26991	2026-03-25 18:53:23.26991
2377	DE99.09.010.88	处4	处4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.270246	2026-03-25 18:53:23.270246
2378	DE99.09.010.89	处5	处5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.270576	2026-03-25 18:53:23.270576
2379	DE99.09.010.90	处6	处6	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.270877	2026-03-25 18:53:23.270877
2380	DE99.09.010.91	页数1	页数1	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.271284	2026-03-25 18:53:23.271284
2381	DE99.09.011.01	页数10	页数10	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.271705	2026-03-25 18:53:23.271705
2382	DE99.09.011.03	页数12	页数12	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.271982	2026-03-25 18:53:23.271982
2383	DE99.09.011.46	病人或监护人身份证	病人或监护人身份证​	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.272333	2026-03-25 18:53:23.272333
2384	DE99.09.011.91	签名2	签名2	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.272742	2026-03-25 18:53:23.272742
2385	DE99.09.011.92	签名3	签名3	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.273135	2026-03-25 18:53:23.273135
2386	DE99.09.011.93	签名4	签名4	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.273456	2026-03-25 18:53:23.273456
2387	DE99.09.012.53	空白选项52	空白选项5	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.273893	2026-03-25 18:53:23.273893
2388	DE99.09.013.83	石膏夹板外固定方式	石膏夹板外固定方式	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.274263	2026-03-25 18:53:23.274263
2389	DE99.09.013.84	骨牵引方法	骨牵引方法	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.274608	2026-03-25 18:53:23.274608
2390	DE99.09.013.85	可能存在的风险	可能存在的风险	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.275026	2026-03-25 18:53:23.275026
2391	DE99.09.013.86	家属想要了解的其他问题	家属想要了解的其他问题	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.275393	2026-03-25 18:53:23.275393
2392	DE99.09.013.87	有无	有无	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.275772	2026-03-25 18:53:23.275772
2393	DE99.09.013.88	有无1	有无1	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.276155	2026-03-25 18:53:23.276155
2394	DE99.09.013.89	门诊腰椎片	门诊腰椎片	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.276578	2026-03-25 18:53:23.276578
2395	DE99.09.013.93	是否	是否	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.277432	2026-03-25 18:53:23.277432
2396	DE99.09.013.94	是否1	是否1	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.27782	2026-03-25 18:53:23.27782
2397	DE99.09.013.95	是否2	是否2	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.278221	2026-03-25 18:53:23.278221
2398	DE99.09.013.96	是否3	是否3	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.278652	2026-03-25 18:53:23.278652
2399	DE99.09.013.97	是否4	是否4	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.278983	2026-03-25 18:53:23.278983
2400	DE99.09.013.98	是否5	是否5	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.279362	2026-03-25 18:53:23.279362
2401	DE99.09.013.99	是否_6	是否_6	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.279717	2026-03-25 18:53:23.279717
2402	DE99.09.014.00	是否_7	是否_7	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.280035	2026-03-25 18:53:23.280035
2403	DE99.09.014.01	是否_8	是否_8	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.280401	2026-03-25 18:53:23.280401
2404	DE99.09.014.02	是否_9	是否_9	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.280788	2026-03-25 18:53:23.280788
2405	DE99.09.014.03	是否_10	是否_10	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.281171	2026-03-25 18:53:23.281171
2406	DE99.09.014.04	是否_11	是否_11	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.281487	2026-03-25 18:53:23.281487
2407	DE99.09.014.05	是否_12	是否_12	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.281802	2026-03-25 18:53:23.281802
2408	DE99.09.014.06	是否_13	是否_13	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.282143	2026-03-25 18:53:23.282143
2409	DE99.09.014.07	是否_14	是否_14	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.282499	2026-03-25 18:53:23.282499
2410	DE99.09.014.08	是否_15	是否_15	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.282867	2026-03-25 18:53:23.282867
2411	DE99.09.014.09	是否_16	是否_16	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.283271	2026-03-25 18:53:23.283271
2412	DE99.09.014.10	是否_17	是否_17	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.283768	2026-03-25 18:53:23.283768
2413	DE99.09.014.11	是否_18	是否_18	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.284151	2026-03-25 18:53:23.284151
2414	DE99.09.014.67	是否_19	是否_19	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.28452	2026-03-25 18:53:23.28452
2415	DE99.09.014.68	是否_20	是否_20	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.284838	2026-03-25 18:53:23.284838
2416	DE99.09.014.69	是否_21	是否_21	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.285214	2026-03-25 18:53:23.285214
2417	DE99.09.014.70	是否_22	是否_22	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.285554	2026-03-25 18:53:23.285554
2418	DE99.09.014.71	有无_2	有无_2	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.285866	2026-03-25 18:53:23.285866
2419	DE99.09.014.72	有无_3	有无_3	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.286233	2026-03-25 18:53:23.286233
2420	DE99.09.014.75	手术医生陈述	手术医生陈述	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.286536	2026-03-25 18:53:23.286536
2421	DE99.09.014.76	麻醉医生陈述	麻醉医生陈述	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.287014	2026-03-25 18:53:23.287014
2422	DE99.09.014.77	手术护士陈述	手术护士陈述	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.287361	2026-03-25 18:53:23.287361
2423	DE99.09.014.78	各种管路	各种管路	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.287743	2026-03-25 18:53:23.287743
2424	DE99.09.014.79	患者去向	患者去向	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.28814	2026-03-25 18:53:23.28814
2425	DE99.09.014.82	假体	假体	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.288513	2026-03-25 18:53:23.288513
2426	DE99.09.014.83	预计失血量	预计失血量	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.288815	2026-03-25 18:53:23.288815
2427	DE99.09.014.84	手术关注点	手术关注点	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.289384	2026-03-25 18:53:23.289384
2428	DE99.09.014.85	动脉通路	动脉通路	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.289856	2026-03-25 18:53:23.289856
2429	DE99.09.014.86	气管插管	气管插管	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.290699	2026-03-25 18:53:23.290699
2430	DE99.09.014.88	伤口引流	伤口引流	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.291352	2026-03-25 18:53:23.291352
2431	DE99.09.014.89	胃管	胃管	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.291745	2026-03-25 18:53:23.291745
2432	DE99.09.014.90	尿管	尿管	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.292157	2026-03-25 18:53:23.292157
2433	DE99.09.014.91	病房	病房	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.2925	2026-03-25 18:53:23.2925
2434	DE99.09.014.93	ICU病房	ICU病房	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.29286	2026-03-25 18:53:23.29286
2435	DE99.09.014.94	急诊	急诊	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.293288	2026-03-25 18:53:23.293288
2436	DE99.09.014.95	离院	离院	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.293595	2026-03-25 18:53:23.293595
2437	DE99.09.014.96	仪器设备	仪器设备	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.294093	2026-03-25 18:53:23.294093
2438	DE99.09.014.97	术前术中特殊用药情况	术前术中特殊用药情况	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.29447	2026-03-25 18:53:23.29447
2439	DE99.09.015.03	影像学资料	影像学资料	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.294879	2026-03-25 18:53:23.294879
2440	DE99.09.015.45	术后医嘱	术后医嘱	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.295599	2026-03-25 18:53:23.295599
2441	DE99.09.017.00	肾功	肾功	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.296189	2026-03-25 18:53:23.296189
2442	DE99.09.017.01	配血	配血	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.29691	2026-03-25 18:53:23.29691
2443	DE99.09.017.02	流凝血时间	流凝血时间	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.297311	2026-03-25 18:53:23.297311
2444	DE99.09.017.03	拟订计划日期	拟订计划日期	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.297715	2026-03-25 18:53:23.297715
2445	DE99.09.017.04	手术人员	手术人员	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.298458	2026-03-25 18:53:23.298458
2446	DE99.09.017.05	参加人员	参加人员	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.298747	2026-03-25 18:53:23.298747
2447	DE99.09.017.06	科主任意见	科主任意见	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.299108	2026-03-25 18:53:23.299108
2448	DE99.09.017.07	院长意见	院长意见	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.299708	2026-03-25 18:53:23.299708
2449	DE99.09.018.31	既往输血史	既往输血史	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.300119	2026-03-25 18:53:23.300119
2450	DE99.09.018.36	受血者属地	受血者属地	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.300667	2026-03-25 18:53:23.300667
2451	DE99.09.018.55	受血者姓名	受血者姓名	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:23.301038	2026-03-25 18:53:23.301038
2452	DE99.09.018.57	ALT	ALT	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.301457	2026-03-25 18:53:23.301457
2453	DE99.09.018.58	HBsAG	HBsAG	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.302148	2026-03-25 18:53:23.302148
2454	DE99.09.018.60	Anti_HCV	Anti-HCV	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.302928	2026-03-25 18:53:23.302928
2455	DE99.09.018.61	Anti_HIV1_2	Anti-HIV1/2	S1	AN	1000	\N	f	\N	t	2026-03-25 18:53:23.303531	2026-03-25 18:53:23.303531
2456	DE99.09.018.62	血红蛋白	血红蛋白	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.3043	2026-03-25 18:53:23.3043
2457	DE99.09.018.63	HCT	HCT	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.304735	2026-03-25 18:53:23.304735
2458	DE99.09.018.64	RPR	RPR	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.305289	2026-03-25 18:53:23.305289
2459	DE99.09.018.65	申请时间	申请时间	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.305751	2026-03-25 18:53:23.305751
2460	DE99.09.018.66	血库意见	血库意见	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.30615	2026-03-25 18:53:23.30615
2461	DE99.09.018.67	医务科批示	医务科批示	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.306562	2026-03-25 18:53:23.306562
2462	DE99.09.018.68	空白选项59	空白选项59	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.307022	2026-03-25 18:53:23.307022
2463	DE99.09.018.70	空白选项62	空白选项61	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.307391	2026-03-25 18:53:23.307391
2464	DE99.09.018.79	临床诊断	临床诊断	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.307908	2026-03-25 18:53:23.307908
2465	DE99.09.018.80	交叉配血试验结果	交叉配血试验结果	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.308324	2026-03-25 18:53:23.308324
2466	DE99.09.018.81	不规则抗体筛选结果	不规则抗体筛选结果	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.308757	2026-03-25 18:53:23.308757
2467	DE99.09.018.82	复检者	复检者	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.309085	2026-03-25 18:53:23.309085
2468	DE99.09.018.84	发血者	发血者	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.309388	2026-03-25 18:53:23.309388
2469	DE99.09.018.89	发血时间	发血时间	DT	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.309793	2026-03-25 18:53:23.309793
2470	DE99.09.018.95	其他检查结果	其他检查结果	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.31047	2026-03-25 18:53:23.31047
2471	DE99.09.019.01	配血者	配血者	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.310918	2026-03-25 18:53:23.310918
2472	DE99.09.019.17	Anti_HBs	Anti-HBs	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.311367	2026-03-25 18:53:23.311367
2473	DE99.09.019.18	HBeAg	HBeAg	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.311736	2026-03-25 18:53:23.311736
2474	DE99.09.019.19	Anti_Hbe	Anti-Hbe	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.312142	2026-03-25 18:53:23.312142
2475	DE99.09.019.20	Anti_HBc	Anti-HBc	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.312464	2026-03-25 18:53:23.312464
2476	DE99.09.020.05	其他观察[$日期_时间$]	其他观察[$日期_时间$]	S1	A	50	\N	f	\N	t	2026-03-25 18:53:23.312726	2026-03-25 18:53:23.312726
2477	DE99.09.024.54	是否择期手术	是否择期手术	N	N1	\N	EMR01.01.002	f	\N	t	2026-03-25 18:53:23.313116	2026-03-25 18:53:23.313116
2478	DE99.09.027.62	静注异丙酚	静注异丙酚	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.313531	2026-03-25 18:53:23.313531
2479	DE99.09.027.64	咪唑安定	咪唑安定	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.313931	2026-03-25 18:53:23.313931
2480	DE99.09.027.65	氯胺酮	氯胺酮	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.314282	2026-03-25 18:53:23.314282
2481	DE99.09.027.67	分次静注	分次静注	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.314599	2026-03-25 18:53:23.314599
2482	DE99.09.027.68	术程麻醉	术程麻醉	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.314958	2026-03-25 18:53:23.314958
2483	DE99.09.027.76	血氧饱和度_1	血氧饱和度_1	S1	A	\N	\N	f	\N	t	2026-03-25 18:53:23.315401	2026-03-25 18:53:23.315401
2484	DE99.09.035.68	接收患者日期	接收患者日期	D	D15	\N	\N	f	\N	t	2026-03-25 18:53:23.316018	2026-03-25 18:53:23.316018
2485	DE99.09.036.16	11	111	S1	AN	20	WT01.01.012	f	\N	t	2026-03-25 18:53:23.316352	2026-03-25 18:53:23.316352
2486	DE99.09.036.18	qqqq	wqwqw	D	NONE	\N	\N	f	\N	t	2026-03-25 18:53:23.316813	2026-03-25 18:53:23.316813
2487	DE99.10.118.01	疼痛	疼痛	S1	A	6	\N	f	\N	t	2026-03-25 18:53:23.317384	2026-03-25 18:53:23.317384
2488	DE99.10.118.02	血压_上午	上午血压	S1	A	6	\N	f	\N	t	2026-03-25 18:53:23.317724	2026-03-25 18:53:23.317724
2489	DE99.10.118.03	血压_下午	下午血压	S1	A	6	\N	f	\N	t	2026-03-25 18:53:23.318044	2026-03-25 18:53:23.318044
2490	DE99.11.001.001	出生地_省ID	出生地_省ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.318381	2026-03-25 18:53:23.318381
2491	DE99.11.001.002	出生地_市ID	出生地_市ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.318693	2026-03-25 18:53:23.318693
2492	DE99.11.001.003	出生地_县ID	出生地_县ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.319114	2026-03-25 18:53:23.319114
2493	DE99.11.001.004	籍贯_省ID	籍贯_省ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.319448	2026-03-25 18:53:23.319448
2494	DE99.11.001.005	籍贯_市ID	籍贯_市ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.319801	2026-03-25 18:53:23.319801
2495	DE99.11.001.006	籍贯_县ID	籍贯_县ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.320148	2026-03-25 18:53:23.320148
2496	DE99.11.001.007	住址_省ID	住址_省ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.320486	2026-03-25 18:53:23.320486
2497	DE99.11.001.008	住址_市ID	住址_市ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.320822	2026-03-25 18:53:23.320822
2498	DE99.11.001.009	住址_县ID	住址_县ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.32119	2026-03-25 18:53:23.32119
2499	DE99.11.001.010	户籍_省ID	户籍_省ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.321542	2026-03-25 18:53:23.321542
2500	DE99.11.001.011	户籍_市ID	户籍_市ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.322013	2026-03-25 18:53:23.322013
2501	DE99.11.001.012	户籍_县ID	户籍_县ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.32235	2026-03-25 18:53:23.32235
2502	DE99.11.001.013	单位_省ID	单位_省ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.322665	2026-03-25 18:53:23.322665
2503	DE99.11.001.014	单位_市ID	单位_市ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.323127	2026-03-25 18:53:23.323127
2504	DE99.11.001.015	单位_县ID	单位_县ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.32346	2026-03-25 18:53:23.32346
2505	DE99.11.001.016	联系人_省ID	联系人_省ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.323827	2026-03-25 18:53:23.323827
2506	DE99.11.001.017	联系人_市ID	联系人_市ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.324283	2026-03-25 18:53:23.324283
2507	DE99.11.001.018	联系人_县ID	联系人_县ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.324623	2026-03-25 18:53:23.324623
2508	DE99.11.002.019	主治医师ID	主治医生ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.325112	2026-03-25 18:53:23.325112
2509	DE99.11.002.020	责任医师ID	责任医生ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.325506	2026-03-25 18:53:23.325506
2510	DE99.11.002.021	主管护士ID	主管护士ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.325908	2026-03-25 18:53:23.325908
2511	DE99.11.002.022	责任护士ID	责任护士ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.326367	2026-03-25 18:53:23.326367
2512	DE99.11.002.023	主任医师ID	主任医生ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.326739	2026-03-25 18:53:23.326739
2513	DE99.11.002.024	经治医师ID	经治医生ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.327147	2026-03-25 18:53:23.327147
2514	DE99.11.002.025	科主任ID	科主任ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.327461	2026-03-25 18:53:23.327461
2515	DE99.11.002.026	主诊医师	主诊医师	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.32779	2026-03-25 18:53:23.32779
2516	DE99.11.002.027	主诊医师ID	主诊医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.328316	2026-03-25 18:53:23.328316
2517	DE99.11.003.028	手术者ID	手术者ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.328702	2026-03-25 18:53:23.328702
2518	DE99.11.003.029	I助ID	I助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.329189	2026-03-25 18:53:23.329189
2519	DE99.11.003.030	II助ID	II助ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.329933	2026-03-25 18:53:23.329933
2520	DE99.11.003.031	麻醉医师ID	麻醉医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.33047	2026-03-25 18:53:23.33047
2521	DE99.11.003.032	主任_副主任_医师ID	主任_副主任_医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.330988	2026-03-25 18:53:23.330988
2522	DE99.11.003.033	住院医师ID	住院医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.331438	2026-03-25 18:53:23.331438
2523	DE99.11.003.034	进修医师ID	进修医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.331776	2026-03-25 18:53:23.331776
2524	DE99.11.003.035	实习医师ID	实习医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.332143	2026-03-25 18:53:23.332143
2525	DE99.11.003.036	编码员ID	编码员ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.33259	2026-03-25 18:53:23.33259
2526	DE99.11.003.037	质控医师ID	质控医师ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.332928	2026-03-25 18:53:23.332928
2527	DE99.11.003.038	质控护士ID	质控护士ID	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.333323	2026-03-25 18:53:23.333323
2528	DE99.11.004.032	年龄_日	年龄_日	N	N	3	\N	f	\N	t	2026-03-25 18:53:23.333944	2026-03-25 18:53:23.333944
2529	DE99.11.004.033	籍贯_县	籍贯_县	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.334261	2026-03-25 18:53:23.334261
2530	DE99.11.004.034	其他医疗机构转入	其他医疗机构转入	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.334617	2026-03-25 18:53:23.334617
2531	DE99.11.004.035	主要诊断确诊日期	主要诊断确诊日期	DT	DT8	\N	\N	f	\N	t	2026-03-25 18:53:23.335107	2026-03-25 18:53:23.335107
2532	DE99.11.004.036	随诊	随诊	N	N	3	\N	f	\N	t	2026-03-25 18:53:23.3355	2026-03-25 18:53:23.3355
2533	DE99.11.004.037	随诊期限_周	随诊期限_周	N	N	3	\N	f	\N	t	2026-03-25 18:53:23.335998	2026-03-25 18:53:23.335998
2534	DE99.11.004.038	随诊期限_月	随诊期限_月	N	N	3	\N	f	\N	t	2026-03-25 18:53:23.336432	2026-03-25 18:53:23.336432
2535	DE99.11.004.039	随诊期限_年	随诊期限_年	N	N	3	\N	f	\N	t	2026-03-25 18:53:23.336987	2026-03-25 18:53:23.336987
2536	DE99.11.004.040	Ⅰ类手术切口预防性应用抗菌药物	Ⅰ类手术切口预防性应用抗菌药物	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.337337	2026-03-25 18:53:23.337337
2537	DE99.11.004.041	使用持续时间	使用持续时间	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.337747	2026-03-25 18:53:23.337747
2538	DE99.11.004.042	联合用药	联合用药	S1	AN	20	\N	f	\N	t	2026-03-25 18:53:23.338411	2026-03-25 18:53:23.338411
2539	DE99.11.004.044	其他支付费用	其他支付费用	N	N	\N	\N	f	\N	t	2026-03-25 18:53:23.338781	2026-03-25 18:53:23.338781
2540	DE99.11.004.045	手术操作补充填写表	手术操作补充填写表	N	N	1	EMR01.01.003	f	\N	t	2026-03-25 18:53:23.339199	2026-03-25 18:53:23.339199
2541	DE99.11.005.001	发病节气	发病节气	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.339649	2026-03-25 18:53:23.339649
2542	DE99.11.005.002	心检查结果	心检查结果	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.340091	2026-03-25 18:53:23.340091
2543	DE99.11.005.003	肺部检查结果	肺部检查结果	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.340481	2026-03-25 18:53:23.340481
2544	DE99.11.005.004	血糖	血糖	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.34079	2026-03-25 18:53:23.34079
2545	DE99.11.005.005	心电图	心电图	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.341138	2026-03-25 18:53:23.341138
2546	DE99.11.005.006	婚姻史	婚姻史	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.341482	2026-03-25 18:53:23.341482
2547	DE99.11.005.007	辨病辩证依据	辨病辩证依据	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.342046	2026-03-25 18:53:23.342046
2548	DE99.21.001.001	日期时间[$日期_时间$]	日期时间[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.342385	2026-03-25 18:53:23.342385
2549	DE99.21.001.006	SPO2[$日期_时间$]	SPO2%[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.342835	2026-03-25 18:53:23.342835
2550	DE99.21.001.007	意识[$日期_时间$]	意识[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.343684	2026-03-25 18:53:23.343684
2551	DE99.21.001.008	空白1[$日期_时间$]	空白1[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.344411	2026-03-25 18:53:23.344411
2552	DE99.21.001.009	空白2[$日期_时间$]	空白2[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.344858	2026-03-25 18:53:23.344858
2553	DE99.21.001.010	空白3[$日期_时间$]	空白3[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.345295	2026-03-25 18:53:23.345295
2554	DE99.21.001.011	空白4[$日期_时间$]	空白4[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.345685	2026-03-25 18:53:23.345685
2555	DE99.21.001.012	空白5[$日期_时间$]	空白5[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.34619	2026-03-25 18:53:23.34619
2556	DE99.21.001.013	空白6[$日期_时间$]	空白6[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.346654	2026-03-25 18:53:23.346654
2557	DE99.21.001.014	空白7[$日期_时间$]	空白7[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.347117	2026-03-25 18:53:23.347117
2558	DE99.21.001.015	空白8[$日期_时间$]	空白8[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.347537	2026-03-25 18:53:23.347537
2559	DE99.21.001.016	基础护理措施[$日期_时间$]	基础护理措施[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.347941	2026-03-25 18:53:23.347941
2560	DE99.21.001.017	护士签名[$日期_时间$]	护士签名[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.348316	2026-03-25 18:53:23.348316
2561	DE99.21.001.018	护士签名ID[$日期_时间$]	护士签名ID[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.348826	2026-03-25 18:53:23.348826
2562	DE99.21.002.019	心率[$日期_时间$]	心率[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.349406	2026-03-25 18:53:23.349406
2563	DE99.21.002.020	瞳孔反应左[$日期_时间$]	瞳孔反应左[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.349717	2026-03-25 18:53:23.349717
2564	DE99.21.002.021	瞳孔反应右[$日期_时间$]	瞳孔反应右[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.350135	2026-03-25 18:53:23.350135
2565	DE99.21.002.022	对光反射[$日期_时间$]	对光反射[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.350489	2026-03-25 18:53:23.350489
2566	DE99.21.002.023	呼吸模式[$日期_时间$]	呼吸模式[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.350773	2026-03-25 18:53:23.350773
2567	DE99.21.002.024	FIO2[$日期_时间$]	FIO2%[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.351176	2026-03-25 18:53:23.351176
2568	DE99.21.002.025	呼吸支持及氧疗f次_分[$日期_时间$]	呼吸支持及氧疗f次/分[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.351536	2026-03-25 18:53:23.351536
2569	DE99.21.002.026	插管深度[$日期_时间$]	插管深度[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.352027	2026-03-25 18:53:23.352027
2570	DE99.21.002.027	入量项目1[$日期_时间$]	入量项目1[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.352327	2026-03-25 18:53:23.352327
2571	DE99.21.002.028	量1[$日期_时间$]	量1[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.352618	2026-03-25 18:53:23.352618
2572	DE99.21.002.029	入量项目2[$日期_时间$]	入量项目2[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.353106	2026-03-25 18:53:23.353106
2573	DE99.21.002.030	量2[$日期_时间$]	量2[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.353426	2026-03-25 18:53:23.353426
2574	DE99.21.002.031	总量_入量[$日期_时间$]	总量_入量[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.353713	2026-03-25 18:53:23.353713
2575	DE99.21.002.032	出量项目3[$日期_时间$]	出量项目3[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.354039	2026-03-25 18:53:23.354039
2576	DE99.21.002.033	通畅[$日期_时间$]	通畅[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.354354	2026-03-25 18:53:23.354354
2577	DE99.21.002.034	出量颜色[$日期_时间$]	出量颜色[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.354624	2026-03-25 18:53:23.354624
2578	DE99.21.002.035	出量性状[$日期_时间$]	出量性状[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.354955	2026-03-25 18:53:23.354955
2579	DE99.21.002.036	量3[$日期_时间$]	量3[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.355342	2026-03-25 18:53:23.355342
2580	DE99.21.002.037	出量尿量ml[$日期_时间$]	出量尿量ml[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.355634	2026-03-25 18:53:23.355634
2581	DE99.21.002.038	出量项目4[$日期_时间$]	出量项目4[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.35591	2026-03-25 18:53:23.35591
2582	DE99.21.002.039	量4[$日期_时间$]	量4[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.356182	2026-03-25 18:53:23.356182
2583	DE99.21.002.040	总量_出量[$日期_时间$]	总量_出量[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.356468	2026-03-25 18:53:23.356468
2584	DE99.21.002.041	卧位[$日期_时间$]	卧位[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.356819	2026-03-25 18:53:23.356819
2585	DE99.21.002.042	受压皮肤[$日期_时间$]	受压皮肤[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.357151	2026-03-25 18:53:23.357151
2586	DE99.21.002.043	其他[$日期_时间$]	其他[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.35748	2026-03-25 18:53:23.35748
2587	DE99.21.002.044	翻身叩背[$日期_时间$]	翻身叩背[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.357797	2026-03-25 18:53:23.357797
2588	DE99.21.002.045	吸氧[$日期_时间$]	吸氧[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.358145	2026-03-25 18:53:23.358145
2589	DE99.21.002.046	子宫复旧[$日期_时间$]	子宫复旧[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.358445	2026-03-25 18:53:23.358445
2590	DE99.21.002.047	切口敷数[$日期_时间$]	切口敷数[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.358763	2026-03-25 18:53:23.358763
2591	DE99.21.002.048	皮肤情况[$日期_时间$]	皮肤情况[$日期_时间$]	S1	AN	100	\N	f	\N	t	2026-03-25 18:53:23.359067	2026-03-25 18:53:23.359067
\.


--
-- Data for Name: emr_data_set; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.emr_data_set (id, dataset_code, dataset_name, dataset_desc, enabled, created_at, updated_at) FROM stdin;
1	S001.001	患者基本信息子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
2	S001.002	患者健康信息子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
3	S001.003	卫生事件摘要子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
4	S001.004	医疗费用记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
5	S002.001	门诊病历子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
6	S002.002	急诊留观病历子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
7	S003.001	西药处方子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
8	S003.002	中药处方子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
9	S004.001	检查记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
10	S004.002	检验记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
11	S005.001	治疗记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
12	S005.002	一般手术记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
13	S005.003	麻醉术前访视记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
14	S005.004	麻醉记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
15	S005.005	麻醉术后访视记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
16	S005.006	输血记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
17	S006.001	待产记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
18	S006.002	阴道分娩记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
19	S006.003	剖宫产手术记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
20	S007.001	一般护理记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
21	S007.002	病危（重）护理记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
22	S007.003	手术护理记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
23	S007.004	生命体征测量记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
24	S007.005	出入量记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
25	S007.006	高值耗材使用记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
26	S008.001	入院评估记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
27	S008.002	护理计划记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
28	S008.003	出院评估与指导记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
29	S009.001	手术同意书子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
30	S009.002	麻醉知情同意书子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
31	S009.003	输血治疗同意书子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
32	S009.004	特殊检查及特殊治疗同意书子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
33	S009.005	病危（重）通知书子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
34	S009.006	其他知情同意书子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
35	S010.001	住院病案首页子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
36	S011.001	中医住院病案首页子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
37	S012.001	入院记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
38	S012.002	24 h内入出院记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
39	S012.003	24 h内入院死亡记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
40	S013.000	住院病程记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
41	S013.002	日常病程记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
42	S013.003	上级医师查房记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
43	S013.004	疑难病例讨论子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
44	S013.005	交接班记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
45	S013.006	转科记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
46	S013.007	阶段小结子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
47	S013.008	抢救记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
48	S013.009	会诊记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
49	S013.010	术前小结子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
50	S013.011	术前讨论子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
51	S013.012	术后首次病程记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
52	S013.013	出院记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
53	S013.014	死亡记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
54	S013.015	死亡病例讨论记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
55	S014.001	住院医嘱子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
56	S015.001	出院小结子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
57	S016.001	转诊（院）记录子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
58	S017.001	医疗机构信息子集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
59	Z999.001	其他数据集	\N	t	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777
\.


--
-- Data for Name: emr_data_set_element; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.emr_data_set_element (id, dataset_code, element_code, display_order, is_required, is_readonly, default_value, created_at, updated_at, element_name) FROM stdin;
1	S001.001	DE02.01.031.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	身份证件类别代码
2	S001.001	DE01.00.021.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	健康卡号
3	S001.001	DE02.01.044.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗保险类别代码
4	S001.001	DE02.01.039.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
5	S001.001	DE02.01.005.01	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生日期
6	S001.001	DE02.01.040.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
7	S001.001	DE02.01.018.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	婚姻状况代码
8	S001.001	DE02.01.025.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	民族
9	S001.001	DE02.01.052.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	职业类别代码
10	S001.001	DE02.01.004.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	工作单位名称
11	S001.001	DE02.01.010.00.016	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位电话
12	S001.001	DE02.01.024.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址类别代码
13	S001.001	DE02.01.009.01	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_省
14	S001.001	DE02.01.009.02	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_市
15	S001.001	DE02.01.009.03	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_县
16	S001.001	DE02.01.009.04	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_乡
17	S001.001	DE02.01.009.05	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_村
18	S001.001	DE02.01.009.06	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_门牌号码
19	S001.001	DE02.01.047.00.006	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	邮政编码
20	S001.001	DE02.01.010.00.015	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者电话号码
21	S001.001	DE02.01.039.00.144	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人姓名
22	S001.001	DE02.01.010.00.017	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人电话
23	S001.001	DE06.00.218.00.015	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	建档日期时间
24	S001.001	DE08.10.052.00.002	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	建档医疗机构组织机构
25	S001.001	DE02.01.039.00.143	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	建档者姓名
26	S001.002	DE01.00.021.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	健康卡号
27	S001.002	DE04.50.001.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	ABO血型代码
28	S001.002	DE04.50.010.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Rh血型代码
29	S001.002	DE02.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病史_含外伤
30	S001.002	DE02.10.008.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	传染病史
31	S001.002	DE02.10.101.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预防接种史
32	S001.002	DE02.10.061.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术史
33	S001.002	DE02.10.100.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血史
34	S001.002	DE02.10.022.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
35	S001.002	DE02.10.098.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	婚育史
36	S001.002	DE02.10.102.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	月经史
37	S001.002	DE02.10.103.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	家族史
38	S001.003	DE01.00.021.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	健康卡号
39	S001.003	DE08.10.052.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	组织机构代码
40	S001.003	DE08.10.026.00.003	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构科室名称
41	S001.003	DE02.01.060.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者类型代码
42	S001.003	DE01.00.010.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
43	S001.003	DE01.00.014.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
44	S001.003	DE06.00.062.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	就诊日期时间
45	S001.003	DE06.00.092.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
46	S001.003	DE06.00.017.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预出院时间
47	S001.003	DE04.01.018.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	发病日期时间
48	S001.003	DE05.10.053.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	就诊原因
49	S001.003	DE05.01.024.00.033	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	西医诊断编码
50	S001.003	DE05.10.130.00.026	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医病名代码
51	S001.003	DE05.10.130.00.027	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医证候代码
52	S001.003	DE06.00.093.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
53	S001.003	DE08.50.022.00.003	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	关键药物名称
54	S001.003	DE06.00.136.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	关键药物用法
55	S001.003	DE06.00.129.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物不良反应情况
56	S001.003	DE06.00.164.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药使用类别代码
57	S001.003	DE06.00.251.00.001	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	其他医学处置
58	S001.003	DE05.01.021.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	根本死因代码
59	S001.003	DE05.10.113.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病情转归代码
60	S001.003	DE02.01.039.00.020	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	责任医师姓名
61	S001.004	DE01.00.021.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	健康卡号
62	S001.004	DE01.00.010.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
63	S001.004	DE01.00.014.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
64	S001.004	DE07.00.007.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗付费方式代码
65	S001.004	DE07.00.004.00.001	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	门诊总费用
66	S001.004	DE07.00.010.00.069	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院费用金额
67	S001.004	DE07.00.001.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院自付金额
68	S002.001	DE08.10.052.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	组织机构代码
69	S002.001	DE99.00.010.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	门诊号
70	S002.001	DE08.10.026.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
71	S002.001	DE02.01.039.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
72	S002.001	DE02.01.040.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
73	S002.001	DE02.01.005.01	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生日期
74	S002.001	DE02.01.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
75	S002.001	DE02.01.032.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
76	S002.001	DE02.10.023.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物过敏标志
77	S002.001	DE02.10.022.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
78	S002.001	DE06.00.062.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	就诊日期时间
79	S002.001	DE06.00.196.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初诊标志代码
80	S002.001	DE04.01.119.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主诉
81	S002.001	DE02.10.071.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	现病史
82	S002.001	DE02.10.099.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	既往史
83	S002.001	DE04.10.258.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体格检查
84	S002.001	DE02.10.028.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
85	S002.001	DE04.30.010.00.001	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辅助检查项目
86	S002.001	DE04.30.009.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辅助检查结果
87	S002.001	DE05.01.024.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_西医诊断编码
88	S002.001	DE05.01.025.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_西医诊断名称
89	S002.001	DE05.10.130.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医病名代码
90	S002.001	DE05.10.172.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医病名名称
91	S002.001	DE05.10.130.00.040	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医证候代码
92	S002.001	DE05.10.172.00.007	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医证候名称
93	S002.001	DE05.10.132.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辨证依据
94	S002.001	DE06.00.300.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
95	S002.001	DE06.00.289.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱项目类型代码
96	S002.001	DE06.00.288.00	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱项目内容
97	S002.001	DE06.00.179.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱备注信息
98	S002.001	DE08.10.026.00.018	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱开立科室
99	S002.001	DE02.01.039.00.095	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱开立者签名
100	S002.001	DE06.00.220.00	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱开立日期时间
101	S002.001	DE02.01.039.00.025	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱审核者签名
102	S002.001	DE09.00.088.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱审核日期时间
103	S002.001	DE08.10.026.00.019	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行科室
104	S002.001	DE02.01.039.00.147	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行者签名
105	S002.001	DE06.00.222.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行日期时间
106	S002.001	DE06.00.290.00	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行状态
107	S002.001	DE02.01.039.00.100	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	取消医嘱者签名
108	S002.001	DE06.00.234.00	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱取消日期时间
109	S002.001	DE01.00.008.00	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
110	S002.001	DE02.01.039.00.178	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
111	S002.001	DE04.10.219.00	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	一般状况检查结果
112	S002.001	DE05.10.031.00	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	一般健康状况标志
113	S002.002	DE08.10.052.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	组织机构代码
114	S002.002	DE01.00.010.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
115	S002.002	DE08.10.026.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
116	S002.002	DE02.01.039.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
117	S002.002	DE02.01.040.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
118	S002.002	DE02.01.005.01	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生日期
119	S002.002	DE02.01.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
120	S002.002	DE02.01.032.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
121	S002.002	DE02.10.023.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物过敏标志
122	S002.002	DE02.10.022.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
123	S002.002	DE06.00.062.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	就诊日期时间
124	S002.002	DE06.00.196.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初诊标志代码
125	S002.002	DE06.00.235.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	收人观察室日期时间
126	S002.002	DE04.01.119.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主诉
127	S002.002	DE02.10.071.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	现病史
128	S002.002	DE02.10.099.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	既往史
129	S002.002	DE04.10.258.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体格检查
130	S002.002	DE02.10.028.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
131	S002.002	DE04.30.010.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辅助检杳项目
132	S002.002	DE04.30.009.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辅助检查结果
133	S002.002	DE05.01.024.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_西医诊断编码
134	S002.002	DE05.01.025.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_西医诊断名称
135	S002.002	DE05.10.130.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医病名代码
136	S002.002	DE05.10.172.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医病名名称
137	S002.002	DE05.10.130.00.040	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医证候代码
138	S002.002	DE05.10.172.00.007	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医证候名称
139	S002.002	DE05.10.132.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辨证依据
140	S002.002	DE06.00.300.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
141	S002.002	DE06.00.289.00	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱项目类型代码
142	S002.002	DE06.00.288.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱项目内容
143	S002.002	DE06.00.179.00	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱备注信息
144	S002.002	DE08.10.026.00.018	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱开立科室
145	S002.002	DE02.01.039.00.095	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱开立者签名
146	S002.002	DE06.00.220.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱开立日期时间
147	S002.002	DE02.01.039.00.025	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱审核者签名
148	S002.002	DE09.00.088.00	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱审核日期时间
149	S002.002	DE08.10.026.00.019	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行科室
150	S002.002	DE02.01.039.00.147	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行者签名
151	S002.002	DE06.00.222.00	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行日期时间
152	S002.002	DE06.00.290.00	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行状态
153	S002.002	DE02.01.039.00.100	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	取消医嘱者签名
154	S002.002	DE06.00.234.00	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱取消日期时间
155	S002.002	DE01.00.008.00	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
156	S002.002	DE06.00.181.00	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊留观病程记录
157	S002.002	DE06.00.221.00	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	抢救开始日期时间
158	S002.002	DE06.00.218.00	46	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	抢救结束日期时间
159	S002.002	DE06.00.181.00.002	47	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊抢救记录
160	S002.002	DE06.00.093.00	48	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
161	S002.002	DE06.00.187.00	49	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作目标部位名称
162	S002.002	DE08.50.037.00	50	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	介入物名称
163	S002.002	DE06.00.251.00	51	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作方法
164	S002.002	DE06.00.250.00	52	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作次数
165	S002.002	DE09.00.053.00	53	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录日期时间
166	S002.002	DE09.00.119.00	54	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	注意事项
167	S002.002	DE08.30.032.00	55	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	参加抢救人员名单
168	S002.002	DE08.30.031.00	56	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	专业技术职务类别代码
182	S003.001	DE08.10.052.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	组织机构代码
183	S003.001	DE01.00.010.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
184	S003.001	DE01.00.020.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方编号
185	S003.001	DE08.50.033.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方开立日期
186	S003.001	DE06.00.294.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方有效天数
187	S003.001	DE08.10.026.00.025	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方开立科室名称
188	S003.001	DE02.01.039.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
189	S003.001	DE02.01.040.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
190	S003.001	DE02.01.026.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
191	S003.001	DE02.01.032.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
192	S003.001	DE05.01.024.00.065	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
193	S003.001	DE08.50.022.00.012	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物名称
194	S003.001	DE08.50.043.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物规格
195	S003.001	DE08.50.011.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物剂型代码
196	S003.001	DE08.50.023.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用次剂量
197	S003.001	DE08.50.024.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用剂量单位
198	S003.001	DE06.00.133.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用频率
199	S003.001	DE06.00.134.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	用药途径代码
200	S003.001	DE06.00.135.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用总剂量
201	S003.001	DE08.50.056.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方药品组号
202	S003.001	DE02.01.039.00.156	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方开立医师签名
203	S003.001	DE02.01.039.00.157	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方审核药剂师签名
204	S003.001	DE02.01.039.00.158	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方调配药剂师签名
205	S003.001	DE02.01.039.00.159	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方核对药剂师签名
206	S003.001	DE02.01.039.00.160	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方发药药剂师签名
207	S003.001	DE06.00.179.00.006	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方备注信息
208	S003.001	DE07.00.004.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方药品金额
209	S003.002	DE08.10.052.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	组织机构代码
210	S003.002	DE01.00.010.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
211	S003.002	DE01.00.020.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方编号
212	S003.002	DE08.50.032.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方类别代码
213	S003.002	DE08.50.033.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方开立日期
214	S003.002	DE06.00.294.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方有效天数
215	S003.002	DE08.10.026.00.025	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方开立科室名称
216	S003.002	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
217	S003.002	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
218	S003.002	DE02.01.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
219	S003.002	DE02.01.032.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
220	S003.002	DE05.01.024.00.033	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	西医诊断编码
221	S003.002	DE05.10.130.00.026	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医病名代码
222	S003.002	DE05.10.130.00.027	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医证候代码
223	S003.002	DE08.50.022.00.012	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物名称
224	S003.002	DE08.50.043.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物规格
225	S003.002	DE08.50.011.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物剂型代码
226	S003.002	DE08.50.023.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用次剂量
227	S003.002	DE08.50.024.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用剂量单位
228	S003.002	DE06.00.133.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用频率
229	S003.002	DE06.00.134.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	用药途径代码
230	S003.002	DE06.00.135.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用总剂量
231	S003.002	DE08.50.056.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方药品组号
232	S003.002	DE08.50.049.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药饮片处方
233	S003.002	DE08.50.050.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药饮片剂数_剂
234	S003.002	DE08.50.047.00.001	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药饮片煎煮法
235	S003.002	DE06.00.136.00.013	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药用药方法
236	S003.002	DE06.00.300.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
237	S003.002	DE02.01.039.00.156	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方开立医师签名
238	S003.002	DE02.01.039.00.157	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方审核药剂师签名
239	S003.002	DE02.01.039.00.158	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方调配药剂师签名
240	S003.002	DE02.01.039.00.159	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方核对药剂师签名
241	S003.002	DE02.01.039.00.160	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方发药药剂师签名
242	S003.002	DE06.00.179.00.006	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方备注信息
243	S003.002	DE07.00.004.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方药品金额
244	S004.001	DE08.10.052.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	组织机构代码
245	S004.001	DE01.00.010.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
246	S004.001	DE01.00.014.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
247	S004.001	DE02.01.060.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者类型代码
248	S004.001	DE02.01.039.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
249	S004.001	DE02.01.040.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
250	S004.001	DE02.01.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
251	S004.001	DE02.01.032.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
252	S004.001	DE02.01.010.00.009	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电话号码
253	S004.001	DE08.10.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
254	S004.001	DE08.10.054.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
255	S004.001	DE01.00.019.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
256	S004.001	DE01.00.026.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
257	S004.001	DE01.00.008.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
258	S004.001	DE08.10.013.00.003	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查申请机构名称
259	S004.001	DE08.10.026.00.011	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查申请科室
260	S004.001	DE05.01.024.00.065	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
261	S004.001	DE08.10.013.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断机构名称
262	S004.001	DE05.01.058.00.005	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断日期
263	S004.001	DE04.01.119.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主诉
264	S004.001	DE06.00.221.00.004	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	症状开始日期时间
265	S004.001	DE06.00.218.00.006	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	症状停止日期时间
266	S004.001	DE04.01.117.00.002	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	症状描述
267	S004.001	DE02.01.079.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	特殊检查标志
268	S004.001	DE06.00.093.00.005	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作编码
269	S004.001	DE06.00.094.00.004	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作名称
270	S004.001	DE06.00.186.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作部位代码
271	S004.001	DE08.50.037.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	介入物名称
272	S004.001	DE06.00.251.00.004	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作方法描述
273	S004.001	DE06.00.250.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作次数
274	S004.001	DE06.00.095.00.002	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作日期时间
275	S004.001	DE06.00.073.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉方式代码
276	S004.001	DE02.10.028.00.001	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉观察结果
277	S004.001	DE06.00.307.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉中西医标识代码
278	S004.001	DE02.01.039.00.168	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉医师签名
279	S004.001	DE06.00.296.00	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程描述
280	S004.001	DE04.50.134.00	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	标本类别
281	S004.001	DE04.50.135.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	标本状态
282	S004.001	DE08.50.027.00	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	标本固定液名称
283	S004.001	DE04.50.137.00	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	标本采样日期时间
284	S004.001	DE04.50.141.00	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	接收标本日期时间
285	S004.001	DE02.10.027.00	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查方法名称
286	S004.001	DE04.30.018.00	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查类别
287	S004.001	DE04.30.019.00	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查项目代码
288	S004.001	DE04.30.017.00	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查结果代码
289	S004.001	DE04.30.015.00	46	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查定量结果
290	S004.001	DE04.30.016.00	47	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查定量结果计量单位
291	S004.001	DE02.01.039.00.044	48	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查技师签名
292	S004.001	DE02.01.039.00.045	49	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查医师签名
293	S004.001	DE04.50.140.00	50	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查日期
294	S004.001	DE01.00.018.00	51	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查报告单编号
295	S004.001	DE08.10.013.00.004	52	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查报告机构名称
296	S004.001	DE08.10.026.00.012	53	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查报告科室
297	S004.001	DE04.50_131.00	54	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查报告结果_客观所见
298	S004.001	DE04.50.132.00	55	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查报告结果_主观提示
299	S004.001	DE06.00.179.00.002	56	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查报告备注
300	S004.001	DE04.50.133.00	57	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查报告日期
301	S004.001	DE02.01.039.00.103	58	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	报告医师签名
302	S004.001	DE02.01.039.00.104	59	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	审核医师签名
303	S004.002	DE08.10.052.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	组织机构代码
304	S004.002	DE01.00.010.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
305	S004.002	DE01.00.014.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
306	S004.002	DE02.01.060.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者类型代码
307	S004.002	DE02.01.039.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
308	S004.002	DE02.01.040.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
309	S004.002	DE02.01.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
310	S004.002	DE02.01.032.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
311	S004.002	DE02.01.010.00.009	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电话号码
312	S004.002	DE08.10.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
313	S004.002	DE08.10.054.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
314	S004.002	DE01.00.019.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
315	S004.002	DE01.00.026.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
316	S004.002	DE01.00.008.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
317	S004.002	DE08.10.013.00.010	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验申请机构名称
318	S004.002	DE08.10.026.00.020	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验申请科室
319	S004.002	DE05.01.024.00.065	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
320	S004.002	DE08.10.013.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断机构名称
321	S004.002	DE05.01.058.00.005	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断日期
322	S004.002	DE04.50.134.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	标本类别
323	S004.002	DE04.50.135.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	标本状态
324	S004.002	DE04.50.137.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	标本采样日期时间
325	S004.002	DE04.50.141.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	接收标本日期时间
326	S004.002	DE02.10.027.00.001	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验方法名称
327	S004.002	DE04.30.018.00.001	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验类别
328	S004.002	DE04.30.019.00.001	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验项目代码
329	S004.002	DE04.30.017.00.002	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验结果代码
330	S004.002	DE04.30.015.00.002	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验定量结果
331	S004.002	DE04.30.016.00.001	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验定量结果计M单位
332	S004.002	DE02.01.039.00.101	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验技师签名
333	S004.002	DE02.01.039.00.102	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验医师签名
334	S004.002	DE04.50.140.00.001	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验日期
335	S004.002	DE01.00.018.00.001	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验报告单编号
336	S004.002	DE08.10.013.00.011	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验报告机构名称
337	S004.002	DE08.10.026.00.021	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验报告科室
338	S004.002	DE04.50.130.00	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验报告结果
339	S004.002	DE06.00.179.00.003	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验报告备注
340	S004.002	DE04.50.133.00.001	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检验报告日期
341	S004.002	DE02.01.039.00.103	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	报告医师签名
342	S004.002	DE02.01.039.00.104	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	审核医师签名
343	S005.001	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
344	S005.001	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
345	S005.001	DE01.00.008.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
346	S005.001	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
347	S005.001	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
348	S005.001	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
349	S005.001	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
350	S005.001	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
351	S005.001	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
352	S005.001	DE02.01.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
353	S005.001	DE02.01.032.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
354	S005.001	DE04.10.188.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
355	S005.001	DE05.01.024.00.065	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
356	S005.001	DE06.00.018.00.009	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处理及指导意见
357	S005.001	DE05.10.165.00.002	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	有创诊疗操作标志
358	S005.001	DE06.00.093.00.005	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作编码
359	S005.001	DE06.00.094.00.004	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作名称
360	S005.001	DE06.00.187.00.003	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作目标部位名称
361	S005.001	DE08.50.037.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	介入物名称
362	S005.001	DE06.00.251.00.004	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作方法描述
363	S005.001	DE06.00.250.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作次数
364	S005.001	DE06.00.095.00.002	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作日期时间
365	S005.001	DE08.50.022.00.012	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物名称
366	S005.001	DE06.00.136.00.014	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物用法
367	S005.001	DE06.00.164.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药使用类别代码
368	S005.001	DE06.00.133.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用频率
369	S005.001	DE08.50.011.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物剂型代码
370	S005.001	DE08.50.024.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用剂量单位
371	S005.001	DE08.50.023.00	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用次剂量
372	S005.001	DE06.00.135.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用总剂量
373	S005.001	DE06.00.134.00	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	用药途径代码
374	S005.001	DE02.10.023.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物过敏标志
375	S005.001	DE02.10.022.00	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
376	S005.001	DE06.00.179.00.005	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱使用备注
377	S005.001	DE06.00.159.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治疗方案
378	S005.001	DE06.00.108.00	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	随访方式代码
379	S005.001	DE06.00.109.00	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	随访日期
380	S005.001	DE06.00.112.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	随访周期建议代码
381	S005.001	DE02.01.039.00.147	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行者签名
382	S005.001	DE09.00.053.00.038	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
383	S005.002	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
384	S005.002	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
385	S005.002	DE01.00.008.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
386	S005.002	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
387	S005.002	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
388	S005.002	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
389	S005.002	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
390	S005.002	DE06.00.256.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术间编号
391	S005.002	DE02.01.039.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
392	S005.002	DE02.01.040.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
393	S005.002	DE02.01.026.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
394	S005.002	DE02.01.032.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
395	S005.002	DE05.01.024.00.064	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前诊断编码
396	S005.002	DE05.01.024.00.058	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后诊断编码
397	S005.002	DE06.00.221.00.013	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术开始日期时间
398	S005.002	DE06.00.218.00.017	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术结束日期时间
399	S005.002	DE06.00.093.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
400	S005.002	DE06.00.094.00.005	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术名称
401	S005.002	DE06.00.255.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术级别代码
402	S005.002	DE06.00.187.00.005	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术目标部位名称
403	S005.002	DE08.50.037.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	介入物名称
404	S005.002	DE06.00.260.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术体位代码
405	S005.002	DE05.10.063.00.004	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术过程描述
406	S005.002	DE02.10.062.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术史标志
407	S005.002	DE08.50.057.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	皮肤消毒描述
408	S005.002	DE06.00.321.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术切口描述
409	S005.002	DE05.10.165.00.003	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	引流标志
410	S005.002	DE06.00.097.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出血量_mL
411	S005.002	DE06.00.268.00.001	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输液量_mL
412	S005.002	DE06.00.267.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血量_mL
413	S005.002	DE06.00.136.00.015	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前用药
414	S005.002	DE06.00.136.00.016	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术中用药
415	S005.002	DE08.50.044.00.001	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	引流材料名称
416	S005.002	DE06.00.341.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	放置部位
417	S005.002	DE06.00.264.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血反应标志
418	S005.002	DE02.01.039.00.153	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	器械护士姓名
419	S005.002	DE02.01.039.00.154	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	巡台护士姓名
420	S005.002	DE06.00.073.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉方式代码
421	S005.002	DE02.01.039.00.174	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术者签名
422	S005.002	DE09.00.053.00.038	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
423	S005.003	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
424	S005.003	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
425	S005.003	DE01.00.008.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
426	S005.003	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
427	S005.003	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
428	S005.003	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
429	S005.003	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
430	S005.003	DE06.00.256.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术间编号
431	S005.003	DE02.01.039.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
432	S005.003	DE02.01.040.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
433	S005.003	DE02.01.026.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
434	S005.003	DE02.01.032.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
435	S005.003	DE04.10.188.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
436	S005.003	DE04.50.001.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	ABO血型代码
437	S005.003	DE04.50.010.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Rh血型代码
438	S005.003	DE05.01.024.00.064	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前诊断编码
439	S005.003	DE06.00.093.00.007	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术及操作编码
440	S005.003	DE06.00.073.00.005	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施麻醉方法代码
441	S005.003	DE05.01.07f3.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前合并疾病
442	S005.003	DE09.00.119.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	注意事项
443	S005.003	DE05.10.140.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	简要病史
444	S005.003	DE02.10.022.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
445	S005.003	DE04.30.043.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	心电图检查结果
446	S005.003	DE04.30.045.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胸部X线检查结果
447	S005.003	DE04.30.005.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	CT检查结采
448	S005.003	DE04.30.002.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	B起检查结果
449	S005.003	DE04.30.009.00.002	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	MRI超检查结果
450	S005.003	DE04.30.009.00.003	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	肺功能检查结果
451	S005.003	DE04.50.128.00.001	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	血常规检查结果
452	S005.003	DE04.50.048.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	尿常规检查结果
453	S005.003	DE04.50.142.00	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	凝血功能检查结果
454	S005.003	DE04.50.026.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	肝功能检查结果
455	S005.003	DE04.50.128.00.002	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	血气分析检查结果
456	S005.003	DE04.10.219.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	一般状况检查结果
457	S005.003	DE05.10.142.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	精神状态正常标志
458	S005.003	DE04.10.207.00	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	心脏听诊结果
459	S005.003	DE04.10.031.00	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	肺部听诊结果
460	S005.003	DE04.10.093.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	脊柱检查结果
461	S005.003	DE04.10.046.00	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	腹部检查结果
462	S005.003	DE06.00.230.00	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	气管检查结果
463	S005.003	DE04.10.264.00	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	牙齿检查结果
464	S005.003	DE06.00.287.00.007	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前麻醉医嘱
465	S005.003	DE06.00.227.00	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉适应证
466	S005.003	DE02.01.039.00.168	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉医师签名
467	S005.003	DE09.00.053.00.038	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
468	S005.004	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
469	S005.004	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
470	S005.004	DE01.00.008.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
471	S005.004	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
472	S005.004	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
473	S005.004	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
474	S005.004	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
475	S005.004	DE06.00.256.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术间编号
476	S005.004	DE02.01.039.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
477	S005.004	DE02.01.040.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
478	S005.004	DE02.01.026.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
479	S005.004	DE02.01.032.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
480	S005.004	DE04.10.188.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
481	S005.004	DE04.50.001.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	ABO血型代码
482	S005.004	DE04.50.010.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Rh血型代码
483	S005.004	DE05.01.024.00.064	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前诊断编码
484	S005.004	DE05.01.024.00.058	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后诊断编码
485	S005.004	DE06.00.093.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
486	S005.004	DE06.00.260.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术体位代码
487	S005.004	DE06.00.073.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉方式代码
488	S005.004	DE06.00.228.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	气管插管分类
489	S005.004	DE08.50.022.00.004	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉药物名称
490	S005.004	DE04.10.260.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉体位
491	S005.004	DE06.00.208.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	呼吸类型代码
492	S005.004	DE06.00.226.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉描述
493	S005.004	DE06.00.216.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	常规监测项目名称
494	S005.004	DE06.00.281.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	常规监测项目结果
495	S005.004	DE06.00.216.00.001	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	特殊监测项目名称
496	S005.004	DE06.00.281.00.001	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	特殊监测项目结果
497	S005.004	DE05.01.077.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉合并症标志代码
498	S005.004	DE06.00.296.00	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程描述
499	S005.004	DE05.10.063.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	穿刺过程
500	S005.004	DE04.10.174.00	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	收缩压_mmHg
501	S005.004	DE04.10.176.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	舒张压_mmHg
502	S005.004	DE04.10.186.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体温
503	S005.004	DE04.10.206.00.004	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	心率
504	S005.004	DE04.10.118.00	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	脉搏
505	S005.004	DE04.10.081.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	呼吸频率_次_min
506	S005.004	DE05.10.129.00	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	美国麻醉医师协会_ASA_分级标准代码
507	S005.004	DE06.00.253.00	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉效果
508	S005.004	DE06.00.136.00.001	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉前用药
509	S005.004	DE06.00.221.00.013	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术开始日期时间
510	S005.004	DE06.00.095.00	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉开始日期时间
511	S005.004	DE06.00.218.00.017	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术结束日期时间
512	S005.004	DE06.00.191.00	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出手术室日期时间
513	S005.004	DE08.50.022.00.012	46	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物名称
514	S005.004	DE06.00.136.00.014	47	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物用法
515	S005.004	DE06.00.133.00	48	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用频率
516	S005.004	DE08.50.024.00	49	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用剂量单位
517	S005.004	DE08.50.023.00	50	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用次剂量
518	S005.004	DE06.00.135.00	51	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用总剂量
519	S005.004	DE06.00.134.00	52	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	用药途径代码
520	S005.004	DE06.00.218.00.007	53	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血日期时间
521	S005.004	DE08.50.040.00	54	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血品种代码
522	S005.004	DE06.00.267.00	55	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血量_mL
523	S005.004	DE08.50.036.00	56	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血量计量单位
524	S005.004	DE06.00.264.00	57	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血反应标志
525	S005.004	DE06.00.269.00	58	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术中输液项目
526	S005.004	DE06.00.097.00	59	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出血量_mL
527	S005.004	DE06.00.185.00	60	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者去向代码
528	S005.004	DE02.01.039.00.168	61	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉医师签名
529	S005.004	DE09.00.053.00.038	62	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
530	S005.005	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
531	S005.005	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
532	S005.005	DE01.00.008.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
533	S005.005	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
534	S005.005	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
535	S005.005	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
536	S005.005	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
537	S005.005	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
538	S005.005	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
539	S005.005	DE02.01.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
540	S005.005	DE02.01.032.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
541	S005.005	DE04.10.188.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
542	S005.005	DE04.50.001.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	ABO血型代码
543	S005.005	DE04.50.010.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Rh血型代码
544	S005.005	DE05.01.024.00.064	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前诊断编码
545	S005.005	DE05.01.024.00.058	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后诊断编码
546	S005.005	DE04.10.219.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	一般状况检查结果
547	S005.005	DE06.00.093.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
548	S005.005	DE06.00.073.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉方式代码
549	S005.005	DE06.00.225.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉恢复情况
550	S005.005	DE06.00.233.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	淸醒日期时间
551	S005.005	DE05.10.165.00.001	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拔除气管插管标志
552	S005.005	DE05.10.158.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	特殊情况
553	S005.005	DE06.00.227.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉适应证
554	S005.005	DE02.01.039.00.168	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉医师签名
555	S005.005	DE09.00.053.00.038	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
556	S005.006	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
557	S005.006	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
558	S005.006	DE01.00.008.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
559	S005.006	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
560	S005.006	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
561	S005.006	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
562	S005.006	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
563	S005.006	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
564	S005.006	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
565	S005.006	DE02.01.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
566	S005.006	DE02.01.032.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
567	S005.006	DE04.50.001.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	ABO血型代码
568	S005.006	DE04.50.010.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Rh血型代码
569	S005.006	DE06.00.106.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血史标识代码
570	S005.006	DE05.01.024.00.065	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
571	S005.006	DE04.50.147.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血性质代码
572	S005.006	DE04_50.001.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	申请ABO血型代码
573	S005.006	DE04.50.010.00.001	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	申请Rh血型代码
574	S005.006	DE06.00.340.00.002	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血指征
575	S005.006	DE06.00.181.00.004	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血过程记录
576	S005.006	DE08.50.040.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血品种代码
577	S005.006	DE01.00.023.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	血袋编码
578	S005.006	DE06.00.267.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血量_mL
579	S005.006	DE08.50.036.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血量计量单位
580	S005.006	DE06.00.264.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血反应标志
581	S005.006	DE06.00.265.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血反应类型代码
582	S005.006	DE06.00.263.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血次数
583	S005.006	DE06.00.218.00.007	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血日期时间
584	S005.006	DE06.00.107.00	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血原因
585	S005.006	DE02.01.039.00.178	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
586	S005.006	DE09.00.053.00.038	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
587	S006.001	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
588	S006.001	DE02.01.039.00.111	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产妇姓名
589	S006.001	DE02.01.026.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
590	S006.001	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
591	S006.001	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
592	S006.001	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
593	S006.001	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
594	S006.001	DE06.00.197.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	待产日期时间
595	S006.001	DE04.01.108.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	孕次
596	S006.001	DE02.10.002.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产次
597	S006.001	DE02.10.051.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	末次月经日期
598	S006.001	DE06.00.261.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	受孕形式代码
599	S006.001	DE05.10.098.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预产期
600	S006.001	DE04.10.013.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产前检查标志
601	S006.001	DE05.10.161.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产前检查异常情况
602	S006.001	DE04.10.188.00.001	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	孕前体重_kg
603	S006.001	DE04.10.167.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	身高_cm
604	S006.001	DE04.10.188.00.002	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	分娩前体重_kg
605	S006.001	DE05.10.070.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	此次妊娠特殊情况
606	S006.001	DE02.10.099.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	既往史
607	S006.001	DE02.10.061.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术史
608	S006.001	DE02.10.098.00.001	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	既往孕产史
609	S006.001	DE04.10.174.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	收缩压_mmHg
610	S006.001	DE04.10.176.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	舒张压_mmHg
611	S006.001	DE04.10.186.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体温
612	S006.001	DE04.10.118.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	脉搏
613	S006.001	DE04.10.081.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	呼吸频率_次_min
614	S006.001	DE04.10.067.00.001	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫底高度_cm
615	S006.001	DE04.10.052.00	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	腹围_cm
616	S006.001	DE04.10.183.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎心率_次_min
617	S006.001	DE05.01.044.00	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎方位代码
618	S006.001	DE04.10.019.00.001	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	估计胎儿体重
619	S006.001	DE05.10.135.00	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	头位难产情况的评估
620	S006.001	DE04.10.175.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	骶耻外径_cm
621	S006.001	DE04.10.239.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	坐骨结节间径_cm
622	S006.001	DE04.10.245.00	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫缩情况
623	S006.001	DE04.10.248.00	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫颈情况
624	S006.001	DE04.10.265.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫口情况
625	S006.001	DE05.10.155.00	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎膜情况代码
626	S006.001	DE04.10.256.00	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	破膜方式代码
627	S006.001	DE04.10.262.00	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	先露位置
628	S006.001	DE04.30.062.00	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	羊水情况
629	S006.001	DE04.10.257.00.001	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	膀胱充盈标志
630	S006.001	DE04.01.123.00	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	肠胀气标志
631	S006.001	DE04.50.139.00	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查方式代码
632	S006.001	DE05.10.014.00	46	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处置计划
633	S006.001	DE02.10.011.00	47	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	计划选取的分娩方式代码
634	S006.001	DE09.00.053.00.014	48	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产程记录日期时间
635	S006.001	DE06.00.190.00	49	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产程经过
636	S006.001	DE02.0l.039.00	50	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产程检查者签名
637	S006.001	DE02.01.039.00.117	51	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录人员签名
638	S006.002	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
639	S006.002	DE02.01.039.00.111	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产妇姓名
640	S006.002	DE02.01.026.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
641	S006.002	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
642	S006.002	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
643	S006.002	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
644	S006.002	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
645	S006.002	DE04.01.108.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	孕次
646	S006.002	DE02.10.002.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产次
647	S006.002	DE02.10.051.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	末次月经日期
648	S006.002	DE05.10.098.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预产期
649	S006.002	DE06.00.224.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	临产日期时间
650	S006.002	DE05.10.154.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎膜破裂Fi期时间
651	S006.002	DE04.30.058.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	前羊水性状
652	S006.002	DE04.30.057.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	前羊水ft_mL
653	S006.002	DE06.00.021.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	第1产程时长_min
654	S006.002	DE04.10.250.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫口开全日期时间
655	S006.002	DE06.00.019.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	第2产程时长_min
656	S006.002	DE02.01.014.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎儿娩出日期时间
657	S006.002	DE06.00.020.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	第3产程吋长_min
658	S006.002	DE04.10.236.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	总产程时长_min
659	S006.002	DE05.01.044.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎方位代码
660	S006.002	DE06.00.311.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	阴道助产标志
661	S006.002	DE06.00.312.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	阴道助产方式
662	S006.002	DE04.30.063.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	羊水性状
663	S006.002	DE04.30.061.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	羊水量_mL
664	S006.002	DE06.00.273.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎盘娩出日期时间
665	S006.002	DE05.10.157.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎盘娩出情况
666	S006.002	DE05.10.156.00	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎膜完整情况标志
667	S006.002	DE04.30.059.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	绕颈身_周
668	S006.002	DE04.30.055.00	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	脐带长度_cm
669	S006.002	DE05.10.145.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	脐带异常情况描述
670	S006.002	DE08.50.022.00	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产时用药
671	S006.002	DE06.00.295.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预防措施
672	S006.002	DE05.10.165.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产妇会阴切开标志
673	S006.002	DE04.10.252.00	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会阴切开位置
674	S006.002	DE06.00.011.00	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产妇会阴缝合针数
675	S006.002	DE05.01.003.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会阴裂伤情况代码
676	S006.002	DE04.10.253.00	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会阴血肿标志
677	S006.002	DE06.00.073.00	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉方式代码
678	S006.002	DE08.50.022.00.004	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉药物名称
679	S006.002	DE05.10.163.00	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	阴道裂伤标忐
680	S006.002	DE05.10.164.00	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	阴道血肿标志
681	S006.002	DE04.10.254.00	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	阴道血肿大小
682	S006.002	DE06.00.213.00	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	阴道血肿处理
683	S006.002	DE04.10.249.00	46	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫颈裂伤标志
684	S006.002	DE06.00.200.00	47	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫颈缝合情况
685	S006.002	DE04.10.240.00	48	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	肛査
686	S006.002	DE08.50.022.00.002	49	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后用药
687	S006.002	DE06.00.182.00	50	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	分娩过程特殊情况描述
688	S006.002	DE04.10.245.00	51	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫缩情况
689	S006.002	DE04.10.233.00	52	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	子宫情况
690	S006.002	DE04.10.025.00	53	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	恶露状况
691	S006.002	DE06.00.284.00	54	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	修补手术过程
692	S006.002	DE04.50.138.00	55	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	存脐带血情况标志
693	S006.002	DE05.10.007.00	56	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后诊断
694	S006.002	DE06.00.218.00.001	57	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后观察日期时间
695	S006.002	DE04.10.246.00	58	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后检查时间_min
696	S006.002	DE04.10.174.00.001	59	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后收缩压_mmHg
697	S006.002	DE04.10.176.00.001	60	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后舒张压_mmHg
698	S006.002	DE04.10.118.00.001	61	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后脉搏_次_min
699	S006.002	DE04.10.206.00	62	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后心率_次_min
700	S006.002	DE04.10.012.00	63	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后出血量_mL
701	S006.002	DE04.10.245.00.001	64	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后宫缩
702	S006.002	DE04.10.067.00	65	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后宫底高度_cm
703	S006.002	DE04.10.257.00	66	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产后膀胱充盈标志
704	S006.002	DE02.01.040.00.002	67	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿性别代码
705	S006.002	DE04.10.019.00	68	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿出生体重
706	S006.002	DE04.10.018.00	69	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿出生身长
707	S006.002	DE05.10.168.00	70	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产瘤大小
708	S006.002	DE05.10.167.00	71	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产瘤部位
709	S006.002	DE06.00.215.00	72	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Apgar评分间隔时间代码
710	S006.002	DE05.10.001.00	73	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Apgar评分值
711	S006.002	DE06.00.026.00	74	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	分娩结局代码
712	S006.002	DE05.10.160.00	75	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿异常情况代码
713	S006.002	DE02.01.039.00.015	76	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	接生人员签名
714	S006.002	DE02.01.039.00.112	77	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术医生签名
715	S006.002	DE02.01.039.00.116	78	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	儿科医生签名
716	S006.002	DE02.01.039.00.117	79	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录人员签名
717	S006.003	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
718	S006.003	DE02.01.039.00.111	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产妇姓名
719	S006.003	DE02.01.026.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
720	S006.003	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
721	S006.003	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
722	S006.003	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
723	S006.003	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
724	S006.003	DE06.00.197.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	待产日期时间
725	S006.003	DE05.10.109.00.001	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前诊断
726	S006.003	DE06.00.340.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术指征
727	S006.003	DE06.00.093.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
728	S006.003	DE06.00.221.00.013	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术开始日期时间
729	S006.003	DE06.00.073.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉方式代码
730	S006.003	DE04.10.260.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉体位
731	S006.003	DE06.00.253.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉效果
732	S006.003	DE05.10.063.00.003	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	剖宫产手术过程
733	S006.003	DE04.10.233.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	子宫情况
734	S006.003	DE05.10.173.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎儿娩出方式
735	S006.003	DE04.30.063.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	羊水性状
736	S006.003	DE04.30.061.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	羊水量_mL
737	S006.003	DE06.00.273.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎盘娩出日期时间
738	S006.003	DE05.10.157.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎盘娩出情况
739	S006.003	DE05.10.156.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胎膜完整情况标志
740	S006.003	DE04.30.055.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	脐带长度_cm
741	S006.003	DE04.30.059.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	绕颈身_周
742	S006.003	DE05.10.H5.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胳带异常情况描述
743	S006.003	DE04.50.138.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	存脐带血情况标志
744	S006.003	DE06.00.200.00.001	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	子宫壁缝合情况
745	S006.003	DE08.50.022.00.008	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫缩剂名称
746	S006.003	DE06.00.136.00.012	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫缩剂使用方法
747	S006.003	DE08.50.022.00.009	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术用药
748	S006.003	DE06.00.293.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术用药量
749	S006.003	DE04.10.233.00.001	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	腹腔探查子宫
750	S006.003	DE04.10.042.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	腹腔探查附件
751	S006.003	DE04.30.053.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫腔探査异常情况描述
752	S006.003	DE04.30.052.00	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宫腔探查处理情_况
753	S006.003	DE05.10.134.00.001	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术时产妇情况
754	S006.003	DE06.00.097.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出血量_mL
755	S006.003	DE06.00.262.00	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血成分
756	S006.003	DE06.00.267.00	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血量_mL
757	S006.003	DE06.00.268.00	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输液最_mL
758	S006.003	DE06.00.318.00	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	供氧时间_min
759	S006.003	DE08.50.022.00.010	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	其他用药
760	S006.003	DE06.00.179.00.004	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	其他用药情况
761	S006.003	DE06.00.218.00.017	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术结束日期时间
762	S006.003	DE06.00.259.00	46	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术全程时间_min
763	S006.003	DE05.10.007.00.001	47	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后诊断
764	S006.003	DE06.00.218.00.013	48	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后观察日期时间
765	S006.003	DE04.10.246.00.001	49	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后检查时间_min
766	S006.003	DE04.10.174.00.002	50	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后收缩压_mmHg
767	S006.003	DE04.10.176.00.002	51	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后舒张压_mmHg
768	S006.003	DE04.10.118.00.002	52	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后脉搏_次_min
769	S006.003	DE04.10.206.00.003	53	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后心率_次_min
770	S006.003	DE04.10.012.00.001	54	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后出血量_mL
771	S006.003	DE04.10.245.00.002	55	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后宫缩
772	S006.003	DE04.10.067.00.002	56	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后宫底高度_cm
773	S006.003	DE02.01.040.00.002	57	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿性别代码
774	S006.003	DE04.10.019.00	58	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿出生体重
775	S006.003	DE04.10.018.00	59	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿出生身长
776	S006.003	DE05.10.168.00	60	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产瘤大小
777	S006.003	DE05.10.167.00.001	61	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产痫部位
778	S006.003	DE06.00.215.00.001	62	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Apgai评分间隔时间代码
779	S006.003	DE05.10.001.00	63	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Apgar评分值
780	S006.003	DE06.00.026.00	64	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	分娩结局代码
781	S006.003	DE05.10.160.00	65	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿异常情况代码
782	S006.003	DE02.01.039.00.112	66	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术医生签名
783	S006.003	DE02.01.039.00.113	67	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉医生签名
784	S006.003	DE02.01.039.00.163	68	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	器械护士签名
785	S006.003	DE02.01.039.00.115	69	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术助手签名
786	S006.003	DE02.01.039.00.116	70	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	儿科医生签名
787	S006.003	DE02.01.039.00.117	71	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录人员签名
788	S007.001	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
789	S007.001	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
790	S007.001	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
791	S007.001	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
792	S007.001	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
793	S007.001	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
794	S007.001	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
795	S007.001	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
796	S007.001	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
797	S007.001	DE05.01.024.00.065	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
798	S007.001	DE06.00.211.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理等级代码
799	S007.001	DE06.00.212.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理类型代码
800	S007.001	DE02.10.022.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
801	S007.001	DE04.10.188.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
802	S007.001	DE04.10.186.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体温
803	S007.001	DE04.10.081.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	呼吸频率_次_min
804	S007.001	DE04.10.118.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	脉搏
805	S007.001	DE04.10.174.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	收缩压_mmHg
806	S007.001	DE04.10.176.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	舒张压_mmHg
807	S007.001	DE04.50.149.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	血氧饱和度
808	S007.001	DE04.10.237.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	足背动脉搏动标志
809	S007.001	DE03.00.080.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	饮食情况代码
810	S007.001	DE06.00.209.00.002	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	导管护理描述
811	S007.001	DE06.00.229.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	气管护理代码
812	S007.001	DE04.10.259.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体位护理
813	S007.001	DE04.50.068.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	皮肤护理
814	S007.001	DE06.00.292.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	营养护理
815	S007.001	DE06.00.291.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	饮食指导代码
816	S007.001	DE06.00.283.00	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	心理护理代码
817	S007.001	DE06.00.178.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	安全护理代码
818	S007.001	DE06.00.181.00.006	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	简要病情
819	S007.001	DE02.10.031.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理观察项目名称
820	S007.001	DE02.10.028.00.007	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理观察结果
821	S007.001	DE06.00.342.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作名称
822	S007.001	DE06.00.210.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作项目类目名称
823	S007.001	DE06.00.209.00	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作结果
824	S007.001	DE06.00.204.00	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	发出手术安全核对表标志
825	S007.001	DE06.00.338.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	收回手术安全核对表标志
826	S007.001	DE06.00.204.00.001	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	发出手术风险评估表标志
827	S007.001	DE06.00.338.00.001	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	收回手术风险评估表标志
828	S007.001	DE06.00.201.00	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	隔离标志
829	S007.001	DE06.00.202.00	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	隔离种类代码
830	S007.001	DE09.00.053.00.038	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
831	S007.002	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
832	S007.002	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
833	S007.002	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
834	S007.002	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
835	S007.002	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
836	S007.002	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
837	S007.002	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
838	S007.002	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
839	S007.002	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
840	S007.002	DE06.00.211.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理等级代码
841	S007.002	DE06.00.212.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理类型代码
842	S007.002	DE02.10.022.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
843	S007.002	DE05.01.024.00.065	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
844	S007.002	DE04.10.188.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
845	S007.002	DE04.10.186.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体温
846	S007.002	DE04.10.206.00.004	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	心率
847	S007.002	DE04.10.081.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	呼吸频率_次_min
848	S007.002	DE04.10.174.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	收缩压_mmHg
849	S007.002	DE04.10.176.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	舒张压_mmHg
850	S007.002	DE04.50.102.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	血糖检测值_mmol_L
851	S007.002	DE03.00.080.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	饮食情况代码
852	S007.002	DE02.10.031.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理观察项目名称
853	S007.002	DE02.10.028.00.007	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理观察结果
854	S007.002	DE06.00.342.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作名称
855	S007.002	DE06.00.210.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作项目类目名称
856	S007.002	DE06.00.209.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作结果
857	S007.002	DE06.00.207.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	呼吸机监护项目
1687	S012.003	DE02.01.025.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	民族
858	S007.002	DE09.00.053.00.038	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
859	S007.003	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
860	S007.003	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
861	S007.003	DE08.10.026.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
862	S007.003	DE08.10.054.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
863	S007.003	DE01.00.019.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
864	S007.003	DE01.00.026.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
865	S007.003	DE06.00.256.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术间编号
866	S007.003	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
867	S007.003	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
868	S007.003	DE02.01.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
869	S007.003	DE02.01.032.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
870	S007.003	DE04.10.188.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
871	S007.003	DE04.50.001.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	ABO血型代码
872	S007.003	DE04.50.010.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Rh血型代码
873	S007.003	DE05.01.024.00.064	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前诊断编码
874	S007.003	DE06.00.093.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
875	S007.003	DE06.00.187.00.005	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术目标部位名称
876	S007.003	DE06.00.218.00.017	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术结束日期时间
877	S007.003	DE06.00.221.00.013	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术开始日期时间
878	S007.003	DE02.10.023.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物过敏标志
879	S007.003	DE02.10.022.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
880	S007.003	DE04.10.126.00.001	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	皮肤检查描述
881	S007.003	DE06.00.211.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理等级代码
882	S007.003	DE06.00.212.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理类型代码
883	S007.003	DE02.10.031.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理观察项目名称
884	S007.003	DE02.10.028.00.007	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理观察结果
885	S007.003	DE06.00.210.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作项目类目名称
886	S007.003	DE06.00.342.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作名称
887	S007.003	DE06.00.209.00	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作结果
888	S007.003	DE06.00.236.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入手术室日期时间
889	S007.003	DE06.00.191.00	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出手术室日期时间
890	S007.003	DE06.00.317.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	准备事项
891	S007.003	DE04.30.060.00	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术中病理标志
892	S007.003	DE08.50.042.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术中所用物品名称
893	S007.003	DE09.00.111.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前清点标志
894	S007.003	DE06.00.204.00.002	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	关前核对标志
895	S007.003	DE06.00.204.00.003	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	关后核对标志
896	S007.003	DE06.00.206.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病人交接核对项目
897	S007.003	DE02.01.039.00.162	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	巡台护士签名
898	S007.003	DE02.01.039.00.163	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	器械护士签名
899	S007.003	DE02.01.039.00.164	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	交接护士签名
900	S007.003	DE02.01.039.00.165	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转运者签名
901	S007.003	DE09.00.107.00	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	交接日期时间
902	S007.003	DE09.00.053.00.038	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
903	S007.004	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
904	S007.004	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
905	S007.004	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
906	S007.004	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
907	S007.004	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
908	S007.004	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
909	S007.004	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
910	S007.004	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
911	S007.004	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
912	S007.004	DE05.01.024.00.065	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
913	S007.004	DE06.00.092.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
914	S007.004	DE06.00.310.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院天数
915	S007.004	DE06.00.270.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术或分娩后天数
916	S007.004	DE09.00.053.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录日期时间
917	S007.004	DE04.10.081.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	呼吸频率_次_min
918	S007.004	DE06.00.239.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	使用呼吸机标志
919	S007.004	DE04.10.118.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	脉搏
920	S007.004	DE04.10.206.00.002	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	起搏器心率_次_min
921	S007.004	DE04.10.186.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体温
922	S007.004	DE04.10.174.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	收缩压_mmHg
923	S007.004	DE04.10.176.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	舒张压_mmHg
924	S007.004	DE04.10.188.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
925	S007.004	DE04.10.052.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	腹围_cm
926	S007.004	DE02.10.031.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理观察项目名称
927	S007.004	DE02.10.028.00.007	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理观察结果
928	S007.004	DE09.00.053.00.038	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
929	S007.005	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
930	S007.005	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
931	S007.005	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
932	S007.005	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
933	S007.005	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
934	S007.005	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
935	S007.005	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
936	S007.005	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
937	S007.005	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
938	S007.005	DE04.10.188.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
939	S007.005	DE05.01.024.00.065	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
940	S007.005	DE06.00.211.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理等级代码
941	S007.005	DE06.00.212.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理类型代码
942	S007.005	DE02.10.028.00.007	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理观察结果
943	S007.005	DE06.00.210.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作项目类目名称
944	S007.005	DE06.00.342.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作名称
945	S007.005	DE06.00.209.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作结果
946	S007.005	DE09.00.053.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录日期时间
947	S007.005	DE06.00.136.00.014	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物用法
948	S007.005	DE06.00.164.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药使用类别代码
949	S007.005	DE06.00.133.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用频率
950	S007.005	DE08.50.024.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用剂量单位
951	S007.005	DE08.50.023.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用次剂量
952	S007.005	DE06.00.135.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物使用总剂量
953	S007.005	DE06.00.134.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	用药途径代码
954	S007.005	DE08.50.022.00.012	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物名称
955	S007.005	DE04.01.048.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	呕吐标志
956	S007.005	DE04.01.051.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	排尿困难标志
957	S007.005	DE09.00.053.00.038	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
958	S007.006	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
959	S007.006	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
960	S007.006	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
961	S007.006	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
962	S007.006	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
963	S007.006	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
964	S007.006	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
965	S007.006	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
966	S007.006	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
967	S007.006	DE05.01.024.00.065	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
968	S007.006	DE09.00.053.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录日期时间
969	S007.006	DE08.50.058.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	植入性耗材标志
970	S007.006	DE08.50.044.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	材料名称
971	S007.006	DE08.50.055.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产品编码
972	S007.006	DE08.10.042.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产品生产厂家
973	S007.006	DE08.50.035.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	产品供应商
974	S007.006	DE08.50.034.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	耗材单位
975	S007.006	DE06.00.241.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	数量
976	S007.006	DE06.00.242.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	使用途径
977	S007.006	DE09.00.053.00.038	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
978	S008.001	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
979	S008.001	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
980	S008.001	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
981	S008.001	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
982	S008.001	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
983	S008.001	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
984	S008.001	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
985	S008.001	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
986	S008.001	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
987	S008.001	DE02.01.015.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	国籍代码
988	S008.001	DE02.01.025.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	民族
989	S008.001	DE02.01.018.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	婚姻状况代码
990	S008.001	DE02.01.052.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	职业类别代码
991	S008.001	DE02.01.041.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	学历代码
992	S008.001	DE02.01.010.00.015	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者电话号码
993	S008.001	DE02.01.010.00.016	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位电话
994	S008.001	DE02.01.012.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者电子邮件地址
995	S008.001	DE02.01.039.00.144	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人姓名
996	S008.001	DE02.01.010.00.017	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人电话
997	S008.001	DE06.00.237.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入病房方式
998	S008.001	DE06.00.092.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
999	S008.001	DE04.01.117.00.005	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主要症状
1000	S008.001	DE04.10.188.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
1001	S008.001	DE04.10.186.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体温
1002	S008.001	DE04.10.081.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	呼吸频率_次_min
1003	S008.001	DE04.10.118.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	脉搏
1004	S008.001	DE04.10.174.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	收缩压_mmHg
1005	S008.001	DE04.10.176.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	舒张压_mmHg
1006	S008.001	DE05.10.053.00.001	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院原因
1007	S008.001	DE06.00.339.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院途径代码
1008	S008.001	DE05.10.001.00	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Apgar评分值
1009	S008.001	DE03.00.080.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	饮食情况代码
1010	S008.001	DE05.10.022.00	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	发育程度代码
1011	S008.001	DE05.10.142.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	精神状态正常标志
1012	S008.001	DE05.10.065.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麵眠状况
1013	S008.001	DE05.10.158.00	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	特殊情况
1014	S008.001	DE05.10.084.00	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	心理状态代码
1015	S008.001	DE05.10.097.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	营养状态代码
1016	S008.001	DE05.10.122.00	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	自理能力代码
1017	S008.001	DE02.10.022.00	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
1018	S008.001	DE05.10.031.00	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	一般健康状况标志
1019	S008.001	DE02.10.026.00	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病史_含外伤
1020	S008.001	DE05.10.119.00	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者传染性标志
1021	S008.001	DE02.10.008.00	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	传染病史
1022	S008.001	DE02.10.101.00	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预防接种史
1023	S008.001	DE02.10.061.00	46	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术史
1024	S008.001	DE02.10.100.00	47	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血史
1026	S008.001	DE02.10.103.00	49	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	家族史
1027	S008.001	DE02.10.031.00	50	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理观察项目名称
1028	S008.001	DE02.10.028.00.007	51	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理观察结果
1029	S008.001	DE03.00.070.00	52	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	吸烟标志
1030	S008.001	DE03.00.065.00	53	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	停止吸烟天数
1031	S008.001	DE03.00.073.00	54	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	吸烟状况代码
1032	S008.001	DE03.00.053.00	55	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	日吸烟量_支
1033	S008.001	DE03.00.030.00	56	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	饮酒标志
1034	S008.001	DE03.00.076.00	57	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	饮酒频率代码
1035	S008.001	DE03.00.054.00	58	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	日饮酒量_mL
1036	S008.001	DE06.00.280.00	59	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	通知医师标志
1037	S008.001	DE06.00.279.00	60	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	通知医师日期时间
1038	S008.001	DE05.10.144.00	61	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	评估日期时间
1039	S008.001	DE02.01.039.00.145	62	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	责任护士签名
1040	S008.001	DE02.01.039.00.146	63	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	接诊护士签名
1041	S008.001	DE09.00.053.00.038	64	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
1042	S008.002	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1043	S008.002	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1044	S008.002	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1045	S008.002	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1046	S008.002	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1047	S008.002	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1048	S008.002	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1049	S008.002	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1050	S008.002	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1051	S008.002	DE05.01.024.00.065	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
1052	S008.002	DE06.00.211.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理等级代码
1053	S008.002	DE06.00.212.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理类型代码
1054	S008.002	DE05.10.136.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理问题
1055	S008.002	DE06.00.210.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作项目类目名称
1056	S008.002	DE06.00.342.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作名称
1057	S008.002	DE06.00.209.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	护理操作结果
1058	S008.002	DE06.00.209.00.002	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	导管护理描述
1059	S008.002	DE04.10.259.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体位护理
1060	S008.002	DE04.50.068.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	皮肤护理
1061	S008.002	DE06.00.229.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	气管护理代码
1062	S008.002	DE06.00.178.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	安全护理代码
1063	S008.002	DE06.00.291.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	饮食指导代码
1064	S008.002	DE09.00.053.00.038	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
1065	S008.003	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1066	S008.003	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1067	S008.003	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1068	S008.003	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1069	S008.003	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1070	S008.003	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1071	S008.003	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1072	S008.003	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1073	S008.003	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1074	S008.003	DE06.00.017.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预出院时间
1075	S008.003	DE03.00.080.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	饮食情况代码
1076	S008.003	DE05.10.122.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	自理能力代码
1077	S008.003	DE06.00.193.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院情况
1078	S008.003	DE06.00.223.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	离院方式代码
1079	S008.003	DE06.00.136.00.005	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	用药指导
1080	S008.003	DE06.00.291.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	饮食指导代码
1081	S008.003	DE06.00.238.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	生活方式指导
1082	S008.003	DE06.00.124.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	宣教内容
1083	S008.003	DE06.00.299.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	复诊指导
1084	S008.003	DE09.00.053.00.038	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
1085	S009.001	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
1086	S009.001	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1087	S009.001	DE09.00.118.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	知情同意书编号
1088	S009.001	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1089	S009.001	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1090	S009.001	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1091	S009.001	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1092	S009.001	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1093	S009.001	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1094	S009.001	DE02.01.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1095	S009.001	DE02.01.032.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1096	S009.001	DE05.01.024.00.064	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前诊断编码
1097	S009.001	DE06.00.093.00.007	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术及操作编码
1098	S009.001	DE06.00.221.00.015	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术及操作日期时间
1099	S009.001	DE06.00.340.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术指征
1100	S009.001	DE05.10.141.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术禁忌症
1101	S009.001	DE06.00.302.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术方式
1102	S009.001	DE06.00.073.00.005	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施麻醉方法代码
1103	S009.001	DE06.00.271.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前准备
1104	S009.001	DE05.10.162.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术中可能出现的意外及风险
1105	S009.001	DE05.01.075.00.001	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术后可能出现的意外及并发症
1106	S009.001	DE06.00.301.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	替代方案
1107	S009.001	DE06.00.018.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构意见
1108	S009.001	DE06.00.018.00.012	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者_法定代理人意见
1109	S009.001	DE02.01.039.00.176	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者签名
1110	S009.001	DE02.01.039.00.177	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	法定代理人签名
1111	S009.001	DE02.10.024.00.008	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	法定代理人与患者的关系代码
1112	S009.001	DE09.00.053.00.039	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者_法定代理人签名日期时间
1113	S009.001	DE02.01.039.00.036	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	经治医师签名
1114	S009.001	DE02.01.039.00.174	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术者签名
1115	S009.001	DE09.00.053.00.040	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名日期时间
1116	S009.002	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
1117	S009.002	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1118	S009.002	DE09.00.118.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	知情同意书编号
1119	S009.002	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1120	S009.002	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1121	S009.002	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1122	S009.002	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1123	S009.002	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1124	S009.002	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1125	S009.002	DE02.01.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1126	S009.002	DE02.01.032.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1127	S009.002	DE05.01.024.00.064	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前诊断编码
1128	S009.002	DE06.00.093.00.007	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术及操作编码
1129	S009.002	DE06.00.221.00.015	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术及操作日期时间
1130	S009.002	DE06.00.073.00.005	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施麻醉方法代码
1131	S009.002	DE04.01.121.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者基础疾病
1132	S009.002	DE05.10.146.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	基础疾病对麻醉可能产生的影响
1133	S009.002	DE06.00.251.00.005	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟行有创操作和监测方法
1134	S009.002	DE05.01.075.00.002	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉中_麻醉后可能发生的意外及并发症
1135	S009.002	DE06.00.240.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	使用麻醉钺痛泵标志
1136	S009.002	DE01.00.016.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	参加麻醉安全保险标志
1137	S009.002	DE06.00.018.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构意见
1138	S009.002	DE06.00.018.00.012	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者_法定代理人意见
1139	S009.002	DE02.01.039.00.176	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者签名
1140	S009.002	DE02.01.039.00.177	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	法定代理人签名
1141	S009.002	DE02.10.024.00.008	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	法定代理人与患者的关系代码
1142	S009.002	DE09.00.053.00.039	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者_法定代理人签名日期时间
1143	S009.002	DE02.01.039.00.168	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉医师签名
1144	S009.002	DE09.00.053.00.037	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉医师签名日期时间
1145	S009.003	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
1146	S009.003	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1147	S009.003	DE09.00.118.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	知情同意书编号
1148	S009.003	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1149	S009.003	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1150	S009.003	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1151	S009.003	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1152	S009.003	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1153	S009.003	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1154	S009.003	DE02.01.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1155	S009.003	DE02.01.032.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1156	S009.003	DE05.01.024.00.065	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
1157	S009.003	DE06.00.106.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血史标识代码
1158	S009.003	DE06.00.340.00.002	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血指征
1159	S009.003	DE08.50.040.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血品种代码
1160	S009.003	DE05.10.109.00.002	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血前有关检查项目及结果
1161	S009.003	DE06.00.266.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血方式
1162	S009.003	DE06.00.221.00.011	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟定输血日期时间
1163	S009.003	DE06.00.018.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构意见
1164	S009.003	DE06.00.018.00.012	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者_法定代理人意见
1165	S009.003	DE02.01.039.00.140	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者_法定代理人签名
1166	S009.003	DE02.10.024.00.008	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	法定代理人与患者的关系代码
1167	S009.003	DE09.00.053.00.039	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者_法定代理人签名日期时间
1168	S009.003	DE02.01.039.00.178	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
1169	S009.003	DE09.00.053.00.040	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名日期时间
1170	S009.004	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
1171	S009.004	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1172	S009.004	DE09.00.118.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	知情同意书编号
1173	S009.004	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1174	S009.004	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1175	S009.004	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1176	S009.004	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1177	S009.004	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1178	S009.004	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1179	S009.004	DE02.01.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1180	S009.004	DE02.01.032.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1181	S009.004	DE05.01.024.00.065	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
1182	S009.004	DE06.00.306.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	特殊检查及特殊治疗项目名称
1183	S009.004	DE06.00.305.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	特殊检查及特殊治疗目的
1184	S009.004	DE05.01.075.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	特殊检查及特殊治疗可能引起的并发症及风险
1185	S009.004	DE06.00.301.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	替代方案
1186	S009.004	DE02.01.039.00.140	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者_法定代理人签名
1187	S009.004	DE02.10.024.00.008	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	法定代理人与患者的关系代码
1188	S009.004	DE09.00.053.00.039	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者_法定代理人签名日期时间
1189	S009.004	DE02.01.039.00.178	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
1190	S009.004	DE09.00.053.00.040	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名日期时间
1191	S009.005	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
1192	S009.005	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1193	S009.005	DE09.00.118.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	知情同意书编号
1194	S009.005	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1195	S009.005	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1196	S009.005	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1197	S009.005	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1198	S009.005	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1199	S009.005	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1200	S009.005	DE02.01.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1201	S009.005	DE02.01.032.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1202	S009.005	DE05.01.024.00.065	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
1203	S009.005	DE06.00.183.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病情概括及主要抢救措施
1204	S009.005	DE06.00.278.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病危_重_通知内容
1205	S009.005	DE09.00.053.00.022	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病危_重_通知日期时间
1206	S009.005	DE02.01.039.00.177	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	法定代理人签名
1207	S009.005	DE02.10.024.00.008	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	法定代理人与患者的关系代码
1208	S009.005	DE09.00.053.00.023	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	法定代理人签名日期时间
1209	S009.005	DE02.01.039.00.178	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
1210	S009.005	DE09.00.053.00.040	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名日期时间
1211	S009.006	DE01.00.010.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
1212	S009.006	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1213	S009.006	DE09.00.117.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	知情同意书名称
1214	S009.006	DE09.00.118.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	知情同意书编号
1215	S009.006	DE08.10.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1216	S009.006	DE08.10.054.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1217	S009.006	DE01.00.019.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1218	S009.006	DE01.00.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1219	S009.006	DE02.01.039.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1220	S009.006	DE02.01.040.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1221	S009.006	DE02.01.026.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1222	S009.006	DE02.01.032.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1223	S009.006	DE05.01.024.00.065	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
1224	S009.006	DE09.00.116.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	知情同意内容
1225	S009.006	DE06.00.018.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构意见
1226	S009.006	DE06.00.018.00.012	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者_法定代理人意见
1227	S009.006	DE02.01.039.00.176	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者签名
1228	S009.006	DE02.01.039.00.177	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	法定代理人签名
1229	S009.006	DE02.10.024.00.008	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	法定代理人与患者的关系代码
1230	S009.006	DE09.00.053.00.039	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者_法定代理人签名日期时间
1231	S009.006	DE02.01.039.00.178	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
1232	S009.006	DE09.00.053.00.040	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名日期时间
1233	S010.001	DE08.10.013.00.012	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构名称
1234	S010.001	DE08.10.052.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	组织机构代码
1235	S010.001	DE07.00.007.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗付费方式代码
1236	S010.001	DE01.00.021.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	健康卡号
1237	S010.001	DE02.10.090.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院次数
1238	S010.001	DE01.00.014.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1239	S010.001	DE01.00.004.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病案号
1240	S010.001	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1241	S010.001	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1242	S010.001	DE02.01.005.01	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生日期
1243	S010.001	DE02.01.026.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1244	S010.001	DE02.01.032.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1245	S010.001	DE02.01.015.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	国籍代码
1246	S010.001	DE04.10.019.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿出生体重
1247	S010.001	DE04.10.019.00.003	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿入院体重
1248	S010.001	DE02.01.009.01.007	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生地_省
1249	S010.001	DE02.01.009.02.006	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生地_市
1250	S010.001	DE02.01.009.03.006	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生地_县
1251	S010.001	DE02.01.009.01.008	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	籍贯_省
1252	S010.001	DE02.01.009.02.007	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	籍贯_市
1253	S010.001	DE02.01.025.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	民族
1254	S010.001	DE02.01.031.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	身份证件类别代码
1255	S010.001	DE02.01.030.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	身份证号码
1256	S010.001	DE02.01.052.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	职业类别代码
1257	S010.001	DE02.01.018.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	婚姻状况代码
1258	S010.001	DE02.01.009.01.009	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_省
1259	S010.001	DE02.01.009.02.008	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_市
1260	S010.001	DE02.01.009.03.007	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_县
1261	S010.001	DE02.01.009.04.005	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_乡
1262	S010.001	DE02.01.009.05.005	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_村
1263	S010.001	DE02.01.009.06.005	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_门牌号码
1264	S010.001	DE02.01.010.00.009	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电话号码
1265	S010.001	DE02.01.047.00	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址邮编
1266	S010.001	DE02.01.009.01.010	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍_省
1267	S010.001	DE02.01.009.02.009	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍_市
1268	S010.001	DE02.01.009.03.008	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍_县
1269	S010.001	DE02.01.009.04.006	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍_乡
1270	S010.001	DE02.01.009.05.006	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍_村
1271	S010.001	DE02.01.047.00.004	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍邮编
1272	S010.001	DE02.01.004.00	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	工作单位名称
1273	S010.001	DE02.01.009.01.011	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_省
1274	S010.001	DE02.01.009.02.010	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_市
1275	S010.001	DE02.01.009.03.009	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_县
1276	S010.001	DE02.01.009.04.007	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_乡
1277	S010.001	DE02.01.009.05.007	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_村
1278	S010.001	DE02.01.009.06.007	46	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_门牌号码
1279	S010.001	DE02.01.010.00.016	47	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位电话
1280	S010.001	DE02.01.047.00.005	48	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位邮编
1281	S010.001	DE02.01.039.00.144	49	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人姓名
1282	S010.001	DE02.10.024.00.005	50	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人与患者的关系代码
1283	S010.001	DE02.01.009.01.012	51	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人_省
1284	S010.001	DE02.01.009.02.011	52	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人_市
1285	S010.001	DE02.01.009.03.005	53	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人_县
1286	S010.001	DE02.01.009.04.008	54	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人地址_乡
1287	S010.001	DE02.01.009.05.008	55	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人地址_村
1288	S010.001	DE02.01.009.06.008	56	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人地址_门牌号码
1289	S010.001	DE02.01.010.00.017	57	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人电话
1290	S010.001	DE06.00.339.00	58	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院途径代码
1291	S010.001	DE06.00.092.00	59	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
1292	S010.001	DE08.10.026.00.022	60	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院科别
1293	S010.001	DE01.00.019.00.003	61	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院病房
1294	S010.001	DE08.10.026.00.023	62	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转科科别
1295	S010.001	DE06.00.017.00	63	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预出院时间
1296	S010.001	DE08.10.026.00.024	64	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院科别
1297	S010.001	DE01.00.019.00.004	65	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院病房
1298	S010.001	DE06.00.310.00	66	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院天数
1299	S010.001	DE05.01.025.00.016	67	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	门急诊诊断名称
1300	S010.001	DE05.01.024.00.046	68	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	门急诊诊断疾病编码
1301	S010.001	DE05.10.152.00	69	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	损伤中毒的外部原因
1302	S010.001	DE05.01.024.00.049	70	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	损伤中毒的外部原因疾病编码
1303	S010.001	DE05.01.025.00.019	71	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病理诊断名称
1304	S010.001	DE05.01.024.00.050	72	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病理诊断疾病编码
1305	S010.001	DE01.00.005.00	73	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病理号
1306	S010.001	DE02.10.023.00	74	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物过敏标志
1307	S010.001	DE02.10.022.00	75	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
1308	S010.001	DE09.00.108.00	76	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡患者尸检标志
1309	S010.001	DE04.50.001.00	77	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	ABO血型代码
1310	S010.001	DE04.50.010.00	78	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Rh血型代码
1311	S010.001	DE02.01.039.00.119	79	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科主任签名
1312	S010.001	DE02.01.039.00.120	80	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主任_副主任_医师签名
1313	S010.001	DE02.01.039.00.172	81	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主治医师签名
1314	S010.001	DE02.01.039.00.171	82	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院医师签名
1315	S010.001	DE02.01.039.00.145	83	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	责任护士签名
1316	S010.001	DE02.01.039.00.124	84	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	进修医师签名
1317	S010.001	DE02.01.039.00.125	85	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	实习医师签名
1318	S010.001	DE02.01.039.00.126	86	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	编码员签名
1319	S010.001	DE09.00.103.00	87	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病案质量代码
1320	S010.001	DE02.01.039.00.127	88	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	质控医师签名
1321	S010.001	DE02.01.039.00.128	89	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	质控护士签名
1322	S010.001	DE09.00.120.00	90	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	质控日期
1323	S010.001	DE99.02.001.012	91	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码_12
1324	S010.001	DE06.00.255.00	92	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术级别代码
1325	S010.001	DE06.00.073.00	93	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉方式代码
1326	S010.001	DE06.00.223.00	94	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	离院方式代码
1327	S010.001	DE08.10.013.00.009	95	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟接收医疗机构名称
1328	S010.001	DE06.00.194.00	96	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院31天内再住院标志
1329	S010.001	DE06.00.195.00	97	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院31天内再住院目的
1330	S010.001	DE05.10.138.01	98	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院前昏迷时间_d
1331	S010.001	DE05.10.138.02	99	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院前昏迷时间_h
1332	S010.001	DE05.10.138.03	100	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院前昏迷时间_min
1333	S010.001	DE05.10.138.01.002	101	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院后昏迷时间_d
1334	S010.001	DE05.10.138.02.002	102	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院后昏迷时间_h
1335	S010.001	DE05.10.138.03.002	103	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院后昏迷时间_min
1336	S010.001	DE07.00.010.00	104	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院总费用
1337	S010.001	DE07.00.001.00	105	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院自付金额
1338	S010.001	DE07.00.010.00.042	106	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	综合医疗服务类_一般医疗服务费
1339	S010.001	DE07.00.010.00.043	107	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	综合医疗服务类_一般治疗操作费
1340	S010.001	DE07.00.010.00.044	108	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	综合医疗服务类_护理费
1341	S010.001	DE07.00.010.00.045	109	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	综合医疗服务类_其他费用
1342	S010.001	DE07.00.010.00.046	110	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断类_病理诊断费
1343	S010.001	DE07.00.010.00.047	111	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断类_实验室诊断费
1344	S010.001	DE07.00.010.00.048	112	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断类_影像学诊断费
1345	S010.001	DE07.00.010.00.049	113	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断类_临床诊断项目费
1346	S010.001	DE07.00.010.00.050	114	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治疗类_非手术治疗项目费
1347	S010.001	DE07.00.010.00.051	115	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	临床物理治疗费
1348	S010.001	DE07.00.010.00.052	116	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治疗类_手术治疗费
1349	S010.001	DE07.00.010.00.053	117	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉费
1350	S010.001	DE07.00.010.00.054	118	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术费
1351	S010.001	DE07.00.010.00.055	119	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	康复类_康复费
1352	S010.001	DE07.00.010.00.056	120	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医类_中医治疗费
1353	S010.001	DE07.00.010.00.057	121	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	西药类_西药费
1354	S010.001	DE07.00.010.00.058	122	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	抗菌药物费用
1355	S010.001	DE07.00.010.00.059	123	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药类_中成药费
1356	S010.001	DE07.00.010.00.060	124	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中草药费
1357	S010.001	DE07.00.010.00.061	125	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	血液和血液制品类_血费
1358	S010.001	DE07.00.010.00.034	126	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	白蛋白类制品费
1359	S010.001	DE07.00.010.00.062	127	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	球蛋白类制品费
1360	S010.001	DE07.00.010.00.063	128	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	凝血因子类制品费
1361	S010.001	DE07.00.010.00.064	129	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	细胞因子类制品费
1362	S010.001	DE07.00.010.00.065	130	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	耗材类_检查用一次性医用材料费
1363	S010.001	DE07.00.010.00.066	131	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	耗材类_治疗用一次性医用材料费
1364	S010.001	DE07.00.010.00.067	132	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	耗材类_手术用一次性医用材料费
1365	S010.001	DE07.00.010.00.068	133	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	其他类_其他费用
1366	S010.001	DE99.11.004.033	134	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	籍贯_县
1367	S010.001	DE02.01.009.01	135	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_省
1368	S010.001	DE02.01.009.02	136	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_市
1369	S010.001	DE02.01.009.03	137	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_县
1370	S010.001	DE99.02.001.001	138	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码_1
1371	S010.001	DE99.02.002.001	139	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作名称_1
1372	S010.001	DE99.01.024.00.056	140	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院西医诊断_名称
1373	S010.001	DE99.01.024.00.055	141	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院西医诊断_编码
1374	S010.001	DE05.01.024.00.044	142	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院西医诊断_编码
1375	S010.001	DE05.01.025.00.009	143	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院西医诊断_名称
1376	S010.001	DE99.02.001.009	144	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码_9
1377	S010.001	DE99.02.002.009	145	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作名称_9
1378	S010.001	DE99.02.002.010	146	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作名称_10
1379	S010.001	DE99.02.001.010	147	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码_10
1380	S010.001	DE99.02.002.011	148	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作名称_11
1381	S010.001	DE99.02.001.011	149	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码_11
1382	S010.001	DE99.02.002.012	150	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作名称_12
1388	S010.001	DE99.01.025.011	156	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院西医诊断_其他诊断名称_11
1389	S010.001	DE99.01.024.011	157	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院西医诊断_其他诊断编码_11
1390	S011.001	DE08.10.013.00.012	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构名称
1391	S011.001	DE08.10.052.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	组织机构代码
1392	S011.001	DE07.00.007.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗付费方式代码
1393	S011.001	DE01.00.021.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	健康卡号
1394	S011.001	DE02.10.090.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院次数
1395	S011.001	DE01.00.014.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1396	S011.001	DE01.00.004.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病案号
1397	S011.001	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1398	S011.001	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1399	S011.001	DE02.01.005.01	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生日期
1400	S011.001	DE02.01.026.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1401	S011.001	DE02.01.032.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1402	S011.001	DE02.01.015.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	国籍代码
1403	S011.001	DE04.10.019.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿出生体重
1404	S011.001	DE04.10.019.00.003	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	新生儿入院体重
1405	S011.001	DE02.01.009.01.007	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生地_省
1406	S011.001	DE02.01.009.02.006	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生地_市
1407	S011.001	DE02.01.009.03.006	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生地_县
1408	S011.001	DE02.01.009.01.008	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	籍贯_省
1409	S011.001	DE02.01.009.02.007	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	籍贯_市
1410	S011.001	DE02.01.025.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	民族
1411	S011.001	DE02.01.031.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	身份证件类别代码
1412	S011.001	DE02.01.030.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	身份证号码
1413	S011.001	DE02.01.052.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	职业类别代码
1414	S011.001	DE02.01.018.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	婚姻状况代码
1415	S011.001	DE02.01.009.01.009	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_省
1416	S011.001	DE02.01.009.02.008	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_市
1417	S011.001	DE02.01.009.03.007	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_县
1418	S011.001	DE02.01.009.04.005	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_乡
1419	S011.001	DE02.01.009.05.005	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_村
1420	S011.001	DE02.01.009.06.005	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址_门牌号码
1421	S011.001	DE02.01.010.00.009	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电话号码
1422	S011.001	DE02.01.047.00	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住址邮编
1423	S011.001	DE02.01.009.01.010	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍_省
1424	S011.001	DE02.01.009.02.009	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍_市
1425	S011.001	DE02.01.009.03.008	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍_县
1426	S011.001	DE02.01.009.04.006	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍_乡
1427	S011.001	DE02.01.009.05.006	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍_村
1428	S011.001	DE02.01.009.06.002	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍地址街道
1429	S011.001	DE02.01.047.00.004	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	户籍邮编
1430	S011.001	DE02.01.004.00	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	工作单位名称
1431	S011.001	DE02.01.009.01.011	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_省
1432	S011.001	DE02.01.009.02.010	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_市
1433	S011.001	DE02.01.009.03.009	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_县
1434	S011.001	DE02.01.009.04.007	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_乡
1435	S011.001	DE02.01.009.05.007	46	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_村
1436	S011.001	DE02.01.009.06.007	47	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位_门牌号码
1437	S011.001	DE02.01.010.00.016	48	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位电话
1438	S011.001	DE02.01.047.00.005	49	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	单位邮编
1439	S011.001	DE02.01.039.00.144	50	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人姓名
1440	S011.001	DE02.10.024.00.005	51	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人与患者的关系代码
1441	S011.001	DE02.01.009.01.012	52	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人_省
1442	S011.001	DE02.01.009.02.011	53	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人_市
1443	S011.001	DE02.01.009.03.005	54	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人_县
1444	S011.001	DE02.01.009.04.008	55	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人地址_乡
1445	S011.001	DE02.01.009.05.008	56	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人地址_村
1446	S011.001	DE02.01.009.06.008	57	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人地址_门牌号码
1447	S011.001	DE02.01.010.00.017	58	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人电话
1448	S011.001	DE06.00.339.00	59	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院途径代码
1449	S011.001	DE06.00.304.00	60	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治疗类别代码
1450	S011.001	DE06.00.092.00	61	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
1451	S011.001	DE08.10.026.00.022	62	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院科别
1452	S011.001	DE01.00.019.00.003	63	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院病房
1453	S011.001	DE08.10.026.00.023	64	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转科科别
1454	S011.001	DE06.00.017.00	65	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预出院时间
1455	S011.001	DE08.10.026.00.024	66	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院科别
1456	S011.001	DE01.00.019.00.004	67	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院病房
1457	S011.001	DE06.00.310.00	68	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院天数
1458	S011.001	DE05.10.172.00.015	69	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	门急诊诊断_中医诊断名称
1459	S011.001	DE05.10.130.00.028	70	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	门急诊诊断_中医诊断病名编码
1460	S011.001	DE05.10.172.00.016	71	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	门急诊诊断_中医证候名称
1461	S011.001	DE05.10.130.00.029	72	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	门急诊诊断_中医证候证候编码
1462	S011.001	DE05.01.025.00.011	73	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	门急诊诊断_西医诊断名称
1463	S011.001	DE05.01.024.00.034	74	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	门急诊诊断_西医诊断疾病编码
1464	S011.001	DE06.00.247.00	75	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	实施临床路径标志代码
1465	S011.001	DE06.00.243.00	76	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	使用医疗机构中药制剂标志
1466	S011.001	DE06.00.244.00	77	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	使用中医诊疗设备标志
1467	S011.001	DE06.00.245.00	78	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	使用中医诊疗技术标志
1468	S011.001	DE06.00.180.00	79	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辨证施护标志
1469	S011.001	DE05.10.172.00.017	80	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_主病名称
1470	S011.001	DE05.10.130.00.030	81	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_主病编码
1471	S011.001	DE09.00.104.00	82	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_主病_入院病情代码
1472	S011.001	DE05.10.172.00.018	83	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_主证名称
1473	S011.001	DE09.00.104.00.001	84	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_主证_入院病情代码
1474	S011.001	DE09.00.104.00.002	85	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院西医诊断_主要诊断_入院病情代码
1475	S011.001	DE05.10.152.00	86	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	损伤中毒的外部原因
1476	S011.001	DE05.01.024.00.049	87	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	损伤中毒的外部原因疾病编码
1477	S011.001	DE05.01.025.00.019	88	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病理诊断名称
1478	S011.001	DE05.01.024.00.050	89	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病理诊断疾病编码
1479	S011.001	DE01.00.005.00	90	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病理号
1480	S011.001	DE02.10.023.00	91	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物过敏标志
1481	S011.001	DE02.10.022.00	92	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
1482	S011.001	DE09.00.108.00	93	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡患者尸检标志
1483	S011.001	DE04.50.001.00	94	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	ABO血型代码
1484	S011.001	DE04.50.010.00	95	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	Rh血型代码
1485	S011.001	DE02.01.039.00.119	96	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科主任签名
1486	S011.001	DE02.01.039.00.120	97	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主任_副主任_医师签名
1487	S011.001	DE02.01.039.00.172	98	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主治医师签名
1488	S011.001	DE02.01.039.00.171	99	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院医师签名
1489	S011.001	DE02.01.039.00.145	100	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	责任护士签名
1490	S011.001	DE02.01.039.00.124	101	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	进修医师签名
1491	S011.001	DE02.01.039.00.125	102	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	实习医师签名
1492	S011.001	DE02.01.039.00.126	103	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	编码员签名
1493	S011.001	DE09.00.103.00	104	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病案质量代码
1494	S011.001	DE02.01.039.00.127	105	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	质控医师签名
1495	S011.001	DE02.01.039.00.128	106	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	质控护士签名
1496	S011.001	DE09.00.120.00	107	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	质控日期
1497	S011.001	DE06.00.093.00	108	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
1498	S011.001	DE06.00.255.00	109	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术级别代码
1499	S011.001	DE06.00.073.00	110	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉方式代码
1500	S011.001	DE06.00.223.00	111	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	离院方式代码
1501	S011.001	DE08.10.013.00.009	112	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟接收医疗机构名称
1502	S011.001	DE06.00.194.00	113	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院31天内再住院标志
1503	S011.001	DE06.00.195.00	114	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院31天内再住院目的
1504	S011.001	DE05.10.138.01	115	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院前昏迷时间_d
1505	S011.001	DE05.10.138.02	116	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院前昏迷时间_h
1506	S011.001	DE05.10.138.03	117	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院前昏迷时间_min
1507	S011.001	DE05.10.138.01.002	118	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院后昏迷时间_d
1508	S011.001	DE05.10.138.02.002	119	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院后昏迷时间_h
1509	S011.001	DE05.10.138.03.002	120	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颅脑损伤患者入院后昏迷时间_min
1510	S011.001	DE07.00.010.00	121	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院总费用
1511	S011.001	DE07.00.001.00	122	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院自付金额
1512	S011.001	DE07.00.010.00.042	123	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	综合医疗服务类_一般医疗服务费
1513	S011.001	DE07.00.010.00.002	124	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医辨证论治费
1514	S011.001	DE07.00.010.00.003	125	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医辨证论治会诊费
1515	S011.001	DE07.00.010.00.043	126	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	综合医疗服务类_一般治疗操作费
1516	S011.001	DE07.00.010.00.044	127	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	综合医疗服务类_护理费
1517	S011.001	DE07.00.010.00.045	128	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	综合医疗服务类_其他费用
1518	S011.001	DE07.00.010.00.046	129	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断类_病理诊断费
1519	S011.001	DE07.00.010.00.047	130	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断类_实验室诊断费
1520	S011.001	DE07.00.010.00.048	131	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断类_影像学诊断费
1521	S011.001	DE07.00.010.00.049	132	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断类_临床诊断项目费
1522	S011.001	DE07.00.010.00.050	133	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治疗类_非手术治疗项目费
1523	S011.001	DE07.00.010.00.051	134	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	临床物理治疗费
1524	S011.001	DE07.00.010.00.052	135	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治疗类_手术治疗费
1525	S011.001	DE07.00.010.00.053	136	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉费
1526	S011.001	DE07.00.010.00.054	137	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术费
1527	S011.001	DE07.00.010.00.055	138	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	康复类_康复费
1528	S011.001	DE07.00.010.00.017	139	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医类_中医诊断费
1529	S011.001	DE07.00.010.00.056	140	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医类_中医治疗费
1530	S011.001	DE07.00.010.00.019	141	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医外治费
1531	S011.001	DE07.00.010.00.020	142	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医骨伤费
1532	S011.001	DE07.00.010.00.021	143	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	针刺与灸法费
1533	S011.001	DE07.00.010.00.022	144	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医推拿治疗费
1534	S011.001	DE07.00.010.00.023	145	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医肛肠治疗费
1535	S011.001	DE07.00.010.00.024	146	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医特殊治疗费
1536	S011.001	DE07.00.010.00.025	147	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医类_中医其他费用
1537	S011.001	DE07.00.010.00.026	148	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药特殊调配加工费
1538	S011.001	DE07.00.010.00.027	149	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辨证施膳费
1539	S011.001	DE07.00.010.00.057	150	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	西药类_西药费
1540	S011.001	DE07.00.010.00.058	151	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	抗菌药物费用
1541	S011.001	DE07.00.010.00.059	152	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药类_中成药费
1542	S011.001	DE07.00.010.00.031	153	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构中药制剂费
1543	S011.001	DE07.00.010.00.060	154	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中草药费
1544	S011.001	DE07.00.010.00.061	155	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	血液和血液制品类_血费
1545	S011.001	DE07.00.010.00.034	156	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	白蛋白类制品费
1546	S011.001	DE07.00.010.00.062	157	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	球蛋白类制品费
1547	S011.001	DE07.00.010.00.063	158	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	凝血因子类制品费
1548	S011.001	DE07.00.010.00.064	159	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	细胞因子类制品费
1549	S011.001	DE07.00.010.00.065	160	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	耗材类_检查用一次性医用材料费
1550	S011.001	DE07.00.010.00.066	161	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	耗材类_治疗用一次性医用材料费
1551	S011.001	DE07.00.010.00.067	162	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	耗材类_手术用一次性医用材料费
1552	S011.001	DE07.00.010.00.068	163	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	其他类_其他费用
1553	S012.001	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1554	S012.001	DE08.10.054.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1555	S012.001	DE08.10.026.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1556	S012.001	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1557	S012.001	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1558	S012.001	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1559	S012.001	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1560	S012.001	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1561	S012.001	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1562	S012.001	DE02.01.025.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	民族
1563	S012.001	DE02.01.018.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	婚姻状况代码
1564	S012.001	DE02.01.009.01	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_省
1565	S012.001	DE02.01.009.02	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_市
1566	S012.001	DE02.01.009.03	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_县
1567	S012.001	DE02.01.009.04	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_乡
1568	S012.001	DE02.01.009.05	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_村
1569	S012.001	DE02.01.009.06	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_门牌号码
1570	S012.001	DE02.01.052.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	职业类别代码
1571	S012.001	DE06.00.092.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
1572	S012.001	DE02.01.039.00.169	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病史陈述者姓名
1573	S012.001	DE02.10.024.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	陈述者与患者的关系代码
1574	S012.001	DE05.10.143.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	陈述内容可靠标志
1575	S012.001	DE04.01.119.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主诉
1576	S012.001	DE02.10.071.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	现病史
1577	S012.001	DE05.10.031.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	一般健康状况标志
1578	S012.001	DE02.10.026.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病史_含外伤
1579	S012.001	DE05.10.119.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者传染性标志
1580	S012.001	DE02.10.008.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	传染病史
1581	S012.001	DE02.10.101.00	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预防接种史
1582	S012.001	DE02.10.061.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术史
1583	S012.001	DE02.10.100.00	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	输血史
1584	S012.001	DE02.10.022.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
1585	S012.001	DE02.10.097.00	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	个人史
1586	S012.001	DE02.10.098.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	婚育史
1587	S012.001	DE02.10.102.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	月经史
1588	S012.001	DE02.10.103.00	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	家族史
1589	S012.001	DE04.10.186.00	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体温
1590	S012.001	DE04.10.118.00	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	脉搏
1591	S012.001	DE04.10.081.00	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	呼吸频率_次_min
1592	S012.001	DE04.10.174.00	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	收缩压_mmHg
1593	S012.001	DE04.10.176.00	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	舒张压_mmHg
1594	S012.001	DE04.10.167.00	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	身高_cm
1595	S012.001	DE04.10.188.00	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
1596	S012.001	DE04.10.219.00	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	一般状况检查结果
1597	S012.001	DE04.10.126.00	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	皮肤和黏膜检查结果
1598	S012.001	DE04.10.114.00	46	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	全身浅表淋巴结检查结果
1599	S012.001	DE04.10.261.00	47	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	头部及其器官检查结果
1600	S012.001	DE04.10.255.00	48	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	颈部检查结果
1601	S012.001	DE04.10.263.00	49	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	胸部检查结果
1602	S012.001	DE04.10.046.00	50	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	腹部检查结果
1603	S012.001	DE04.10.065.00	51	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	肛门指诊检查结果描述
1604	S012.001	DE04.10.195.00	52	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	外生殖器检查结果
1605	S012.001	DE04.10.093.00	53	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	脊柱检查结果
1606	S012.001	DE04.10.179.00	54	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	四肢检查结果
1607	S012.001	DE05.10.149.00	55	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	神经系统检查结果
1608	S012.001	DE08.10.061.00	56	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	专科情况
1609	S012.001	DE04.30.009.00	57	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辅助检查结果
1610	S012.001	DE02.10.028.00	58	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
1611	S012.001	DE06.00.300.00	59	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
1612	S012.001	DE05.01.025.00	60	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_西医诊断名称
1613	S012.001	DE05.01.024.00	61	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_西医诊断编码
1614	S012.001	DE05.10.172.00	62	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医病名名称
1615	S012.001	DE05.10.130.00	63	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医病名代码
1616	S012.001	DE05.10.172.00.007	64	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医证候名称
1617	S012.001	DE05.10.130.00.040	65	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医证候代码
1618	S012.001	DE05.01.058.00	66	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断日期
1619	S012.001	DE05.01.025.00.003	67	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	修正诊断_西医诊断名称
1620	S012.001	DE05.01.024.00.005	68	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	修正诊断_西医诊断编码
1621	S012.001	DE05.10.172.00.003	69	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	修正诊断_中医病名名称
1622	S012.001	DE05.10.130.00.003	70	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	修正诊断_中医病名代码
1623	S012.001	DE05.10.172.00.004	71	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	修正诊断_中医证候名称
1624	S012.001	DE05.10.130.00.004	72	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	修正诊断_中医证候代码
1625	S012.001	DE05.01.058.00.001	73	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	修正诊断日期
1626	S012.001	DE05.01.025.00.004	74	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	确定诊断_西医诊断名称
1627	S012.001	DE05.01.024.00.006	75	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	确定诊断_西医诊断编码
1628	S012.001	DE05.10.172.00.005	76	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	确定诊断_中医病名名称
1629	S012.001	DE05.10.130.00.005	77	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	确定诊断_中医病名代码
1630	S012.001	DE05.10.172.00.006	78	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	确定诊断_中医证候名称
1631	S012.001	DE05.10.130.00.006	79	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	确定诊断_中医证候代码
1632	S012.001	DE05.01.058.00.002	80	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	确定诊断日期
1633	S012.001	DE05.01.025.00.005	81	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	补充诊断名称
1634	S012.001	DE05.01.024.00.007	82	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	补充诊断编码
1635	S012.001	DE05.01.058.00.003	83	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	补充诊断日期
1636	S012.001	DE05.01.080.00	84	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院诊断顺位
1637	S012.001	DE02.01.039.00.170	85	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	接诊医师签名
1638	S012.001	DE02.01.039.00.171	86	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院医师签名
1639	S012.001	DE02.01.039.00.172	87	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主治医师签名
1640	S012.001	DE02.01.039.00.173	88	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主任医师签名
1641	S012.002	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1642	S012.002	DE02.01.039.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1643	S012.002	DE02.01.040.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1644	S012.002	DE02.01.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1645	S012.002	DE02.01.032.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1646	S012.002	DE02.01.025.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	民族
1647	S012.002	DE02.01.018.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	婚姻状况代码
1648	S012.002	DE02.01.009.01	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_省
1649	S012.002	DE02.01.009.02	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_市
1650	S012.002	DE02.01.009.03	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_县
1651	S012.002	DE02.01.009.04	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_乡
1652	S012.002	DE02.01.009.05	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_村
1653	S012.002	DE02.01.009.06	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_门牌号码
1654	S012.002	DE02.01.052.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	职业类别代码
1655	S012.002	DE02.01.039.00.169	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病史陈述者姓名
1656	S012.002	DE02.10.024.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	陈述者与患者的关系代码
1657	S012.002	DE05.10.143.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	陈述内容可靠标志
1658	S012.002	DE06.00.092.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
1659	S012.002	DE06.00.017.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预出院时间
1660	S012.002	DE04.01.119.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主诉
1661	S012.002	DE02.10.071.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	现病史
1662	S012.002	DE05.10.148.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院情况
1663	S012.002	DE04.01.118.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	症状名称
1664	S012.002	DE04.01.117.00.002	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	症状描述
1665	S012.002	DE02.10.028.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
1666	S012.002	DE06.00.300.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
1667	S012.002	DE06.00.296.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程描述
1668	S012.002	DE06.00.193.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院情况
1669	S012.002	DE05.01.025.00.009	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院西医诊断_名称
1670	S012.002	DE05.01.024.00.044	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院西医诊断_编码
1671	S012.002	DE05.10.172.00.012	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_病名名称
1672	S012.002	DE05.10.130.00.038	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_病名代码
1673	S012.002	DE05.10.172.00.011	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_证候名称
1674	S012.002	DE05.10.130.00.039	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_证候代码
1675	S012.002	DE06.00.287.00.005	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院医嘱
1676	S012.002	DE02.01.039.00.051	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院医嘱开立人签名
1677	S012.002	DE06.00.220.00.001	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院医嘱开立日期时间
1678	S012.002	DE02.01.039.00.170	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	接诊医师签名
1679	S012.002	DE02.01.039.00.171	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院医师签名
1680	S012.002	DE02.01.039.00.172	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主治医师签名
1681	S012.002	DE02.01.039.00.173	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主任医师签名
1682	S012.003	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1683	S012.003	DE02.01.039.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1684	S012.003	DE02.01.040.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1685	S012.003	DE02.01.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1686	S012.003	DE02.01.032.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1688	S012.003	DE02.01.018.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	婚姻状况代码
1689	S012.003	DE02.01.009.01	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_省
1690	S012.003	DE02.01.009.02	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_市
1691	S012.003	DE02.01.009.03	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_县
1692	S012.003	DE02.01.009.04	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_乡
1693	S012.003	DE02.01.009.05	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_村
1694	S012.003	DE02.01.009.06	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_门牌号码
1695	S012.003	DE02.01.052.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	职业类别代码
1696	S012.003	DE02.01.039.00.169	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病史陈述者姓名
1697	S012.003	DE02.10.024.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	陈述者与患者的关系代码
1698	S012.003	DE05.10.143.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	陈述内容可靠标志
1699	S012.003	DE06.00.092.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
1700	S012.003	DE02.01.036.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡日期时间
1701	S012.003	DE05.10.148.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院情况
1702	S012.003	DE02.10.028.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
1703	S012.003	DE06.00.300.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
1704	S012.003	DE06.00.296.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程描述
1705	S012.003	DE05.10.099.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡原因
1706	S012.003	DE05.01.025.00.024	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡诊断_西医诊断名称
1707	S012.003	DE05.01.024.00.063	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡诊断_西医诊断编码
1708	S012.003	DE05.10.172.00.023	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡诊断_中医病名名称
1709	S012.003	DE05.10.130.00.043	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡诊断_中医病名代码
1710	S012.003	DE05.10.172.00.024	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡诊断_中医证候名称
1711	S012.003	DE05.10.130.00.044	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡诊断_中医证候代码
1712	S012.003	DE02.01.039.00.170	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	接诊医师签名
1713	S012.003	DE02.01.039.00.171	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院医师签名
1714	S012.003	DE02.01.039.00.172	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主治医师签名
1715	S012.003	DE02.01.039.00.173	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主任医师签名
1716	S013.000	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1717	S013.000	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1718	S013.000	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1719	S013.000	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1720	S013.000	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1721	S013.000	DE09.00.053.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录日期时间
1722	S013.000	DE02.01.039.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1723	S013.000	DE02.01.040.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1724	S013.000	DE02.01.026.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1725	S013.000	DE02.01.032.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1726	S013.000	DE04.01.119.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主诉
1727	S013.000	DE05.10.133.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病例特点
1728	S013.000	DE02.10.028.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
1729	S013.000	DE05.01.070.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断依据
1730	S013.000	DE05.01.024.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_西医诊断编码
1731	S013.000	DE05.10.130.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医病名代码
1732	S013.000	DE05.10.130.00.040	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	初步诊断_中医证候代码
1733	S013.000	DE05.01.025.00.022	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	鉴别诊断_西医诊断名称
1734	S013.000	DE05.10.172.00.019	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	鉴别诊断_中医病名名称
1735	S013.000	DE05.10.172.00.020	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	鉴别诊断_中医证候名称
1736	S013.000	DE06.00.298.00.003	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗计划
1737	S013.000	DE06.00.300.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
1738	S013.000	DE02.01.039.00.171	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院医师签名
1739	S013.000	DE02.01.039.00.149	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	上级医师签名
1740	S013.002	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1741	S013.002	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1742	S013.002	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1743	S013.002	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1744	S013.002	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1745	S013.002	DE09.00.053.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录日期时间
1746	S013.002	DE02.01.039.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1747	S013.002	DE02.01.040.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1748	S013.002	DE02.01.026.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1749	S013.002	DE02.01.032.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1750	S013.002	DE06.00.309.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院病程
1751	S013.002	DE06.00.287.00.006	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱内容
1752	S013.002	DE02.10.028.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
1753	S013.002	DE05.10.131.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辨证论治详细描述
1754	S013.002	DE08.50.047.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药煎煮方法
1755	S013.002	DE06.00.136.00.013	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药用药方法
1756	S013.002	DE08.30.031.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	专业技术职务类别代码
1757	S013.002	DE02.01.039.00.178	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
1758	S013.002	DE09.00.053.00.038	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
1759	S013.003	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1760	S013.003	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1761	S013.003	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1762	S013.003	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1763	S013.003	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1764	S013.003	DE06.00.189.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	査房日期时间
1765	S013.003	DE02.01.039.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1766	S013.003	DE02.01.040.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1767	S013.003	DE02.01.026.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1768	S013.003	DE02.01.032.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1769	S013.003	DE06.00.181.00.005	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	查房记录
1770	S013.003	DE06.00.287.00.006	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱内容
1771	S013.003	DE02.10.028.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
1772	S013.003	DE05.10.131.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辨证论治详细描述
1773	S013.003	DE08.50.047.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药煎煮方法
1774	S013.003	DE06.00.136.00.013	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药用药方法
1775	S013.003	DE06.00.298.00.003	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗计划
1776	S013.003	DE02.01.039.00.092	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录人签名
1777	S013.003	DE02.01.039.00.172	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主治医师签名
1778	S013.003	DE02.01.039.00.173	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主任医师签名
1779	S013.003	DE09.00.053.00.038	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
1780	S013.004	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1781	S013.004	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1782	S013.004	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1783	S013.004	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1784	S013.004	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1785	S013.004	DE06.00.218.00.014	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	讨论日期时间
1786	S013.004	DE06.00.274.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	讨论地点
1787	S013.004	DE08.30.032.00.003	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	参加讨论人员名单
1788	S013.004	DE02.01.039.00.137	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主持人姓名
1789	S013.004	DE02.01.039.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1790	S013.004	DE02.01.040.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1791	S013.004	DE02.01.026.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1792	S013.004	DE02.01.032.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1793	S013.004	DE06.00.018.00.004	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	讨论意见
1794	S013.004	DE02.10.028.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
1795	S013.004	DE05.10.131.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辨证论治详细描述
1796	S013.004	DE06.00.287.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药处方医嘱内容
1797	S013.004	DE06.00.136.00.013	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药用药方法
1798	S013.004	DE06.00.018.00.007	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主持人总结意见
1799	S013.004	DE02.01.039.00.178	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
1800	S013.004	DE02.01.039.00.172	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主治医师签名
1801	S013.004	DE02.01.039.00.173	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主任医师签名
1802	S013.004	DE06.00.018.00.005	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	讨论结论
1803	S013.005	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1804	S013.005	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1805	S013.005	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1806	S013.005	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1807	S013.005	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1808	S013.005	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1809	S013.005	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1810	S013.005	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1811	S013.005	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1812	S013.005	DE06.00.092.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
1813	S013.005	DE04.01.119.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主诉
1814	S013.005	DE05.10.148.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院情况
1815	S013.005	DE02.10.028.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
1816	S013.005	DE06.00.300.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
1817	S013.005	DE06.00.296.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程描述
1818	S013.005	DE06.00.184.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前情况
1819	S013.005	DE05.01.024.00.040	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前诊断_西医诊断编码
1820	S013.005	DE05.10.130.00.034	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前诊断_中医病名代码
1821	S013.005	DE05.10.130.00.035	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前诊断_中医证候代码
1822	S013.005	DE09.00.119.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	注意事项
1823	S013.005	DE06.00.298.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	接班诊疗计划
1824	S013.005	DE06.00.218.00.002	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	交班日期时间
1825	S013.005	DE02.01.039.00.018	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	交班者签名
1826	S013.005	DE06.00.218.00.003	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	接班日期时间
1827	S013.005	DE02.01.039.00.019	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	接班者签名
1828	S013.006	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1829	S013.006	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1830	S013.006	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1831	S013.006	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1832	S013.006	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1833	S013.006	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1834	S013.006	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1835	S013.006	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1836	S013.006	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1837	S013.006	DE06.00.092.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
1838	S013.006	DE04.01.119.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主诉
1839	S013.006	DE05.10.148.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院情况
1840	S013.006	DE02.10.028.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
1841	S013.006	DE06.00.300.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
1842	S013.006	DE06.00.296.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程描述
1843	S013.006	DE06.00.184.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前情况
1844	S013.006	DE05.01.024.00.040	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前诊断_西医诊断编码
1845	S013.006	DE05.10.130.00.034	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前诊断_中医病名代码
1846	S013.006	DE05.10.130.00.035	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前诊断_中医证候代码
1847	S013.006	DE06.00.315.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转科目的
1848	S013.006	DE06.00.298.00.001	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转入诊疗计划
1849	S013.006	DE06.00.287.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药处方医嘱内容
1850	S013.006	DE08.50.047.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药煎煮方法
1851	S013.006	DE06.00.136.00.013	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药用药方法
1852	S013.006	DE09.00.119.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	注意事项
1853	S013.006	DE06.00.314.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转科记录类型
1854	S013.006	DE06.00.313.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转出日期时间
1855	S013.006	DE08.10.026.00.008	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转出科室
1856	S013.006	DE02.01.039.00.032	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转出医师签名
1857	S013.006	DE06.00.316.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转入日期时间
1858	S013.006	DE08.10.026.00.009	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转入科室
1859	S013.006	DE02.01.039.00.033	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转入医师签名
1860	S013.007	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1861	S013.007	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1862	S013.007	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1863	S013.007	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1864	S013.007	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1865	S013.007	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1866	S013.007	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1867	S013.007	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1868	S013.007	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1869	S013.007	DE06.00.092.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
1870	S013.007	DE06.00.218.00.018	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	小结日期时间
1871	S013.007	DE04.01.119.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主诉
1872	S013.007	DE05.10.148.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院情况
1873	S013.007	DE02.10.028.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
1874	S013.007	DE05.10.130.00.037	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	人皖诊断_中医证候代码
1875	S013.007	DE06.00.300.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
1876	S013.007	DE08.50.047.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药煎煮方法
1877	S013.007	DE06.00.136.00.013	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药用药方法
1878	S013.007	DE06.00.287.00.006	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱内容
1879	S013.007	DE06.00.296.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程描述
1880	S013.007	DE06.00.184.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前情况
1881	S013.007	DE05.01.024.00.040	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前诊断_西医诊断编码
1882	S013.007	DE05.10.130.00.034	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前诊断_中医病名代码
1883	S013.007	DE05.10.130.00.035	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	目前诊断_中医证候代码
1884	S013.007	DE06.00.159.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治疗方案
1885	S013.007	DE02.01.039.00.178	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
1886	S013.007	DE09.00.053.00.038	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
1887	S013.008	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1888	S013.008	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1889	S013.008	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1890	S013.008	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1891	S013.008	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1892	S013.008	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1893	S013.008	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1894	S013.008	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1895	S013.008	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1896	S013.008	DE05.01.025.00.008	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断名称
1897	S013.008	DE05.01.024.00.065	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
1898	S013.008	DE05.10.134.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病情变化情况
1899	S013.008	DE06.00.231.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	抢救措施
1900	S013.008	DE06.00.093.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
1901	S013.008	DE06.00.187.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作目标部位名称
1902	S013.008	DE08.50.037.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	介入物名称
1903	S013.008	DE06.00.251.00.003	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作方法
1904	S013.008	DE06.00.250.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	操作次数
1905	S013.008	DE06.00.221.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	抢救开始日期时间
1906	S013.008	DE06.00.218.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	抢救结束日期时间
1907	S013.008	DE04.30.020.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检丧_检验项目名称
1908	S013.008	DE04.30.009.00.001	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查_检验结果
1909	S013.008	DE04.30.015.00.001	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查_检验定量结果
1910	S013.008	DE04.30.017.00.001	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	检查_检验结果代码
1911	S013.008	DE09.00.119.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	注意事项
1912	S013.008	DE08.30.032.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	参加抢救人员名单
1913	S013.008	DE08.30.031.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	专业技术职务类别代码
1914	S013.008	DE02.01.039.00.178	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
1915	S013.008	DE09.00.053.00.038	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
1916	S013.009	DE01.00.008.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
1917	S013.009	DE01.00.014.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1918	S013.009	DE08.10.026.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1919	S013.009	DE08.10.054.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1920	S013.009	DE01.00.019.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1921	S013.009	DE01.00.026.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1922	S013.009	DE02.01.039.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1923	S013.009	DE02.01.040.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1924	S013.009	DE02.01.026.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1925	S013.009	DE02.01.032.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1926	S013.009	DE06.00.182.00.002	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病历摘要
1927	S013.009	DE04.30.009.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辅助检查结果
1928	S013.009	DE02.10.028.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
1929	S013.009	DE05.01.025.00.010	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	西医诊断名称
1930	S013.009	DE05.01.024.00.033	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	西医诊断编码
1931	S013.009	DE05.10.172.00.013	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医病名名称
1932	S013.009	DE05.10.130.00.026	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医病名代码
1933	S013.009	DE05.10.172.00.014	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医证候名称
1934	S013.009	DE05.10.130.00.027	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医证候代码
1935	S013.009	DE06.00.300.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
1936	S013.009	DE06.00.297.00	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程名称
1937	S013.009	DE06.00.296.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程描述
1938	S013.009	DE06.00.319.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊类型
1939	S013.009	DE06.00.039.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊原因
1940	S013.009	DE06.00.214.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊目的
1941	S013.009	DE02.01.039.00.074	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊申请医师签名
1942	S013.009	DE08.10.026.00.013	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊申请科室
1943	S013.009	DE08.10.013.00.005	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊申请医疗机构名称
1944	S013.009	DE06.00.018.00.006	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊怠见
1945	S013.009	DE02.01.039.00.075	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊医师签名
1946	S013.009	DE08.10.026.00.014	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊科室名称
1947	S013.009	DE08.10.013.00.006	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊医师所在医疗机构名称
1948	S013.009	DE08.10.013.00.007	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊所在医疗机构名称
1949	S013.009	DE06.00.343.00	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊日期时间
1950	S013.009	DE99.00.053.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录时间
1951	S013.010	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1952	S013.010	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1953	S013.010	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1954	S013.010	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1955	S013.010	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1956	S013.010	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1957	S013.010	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1958	S013.010	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1959	S013.010	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1960	S013.010	DE06.00.218.00.018	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	小结日期时间
1961	S013.010	DE06.00.182.00.002	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病历摘要
1962	S013.010	DE05.01.024.00.064	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前诊断编码
1963	S013.010	DE05.01.070.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断依据
1964	S013.010	DE02.10.023.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	药物过敏标志
1965	S013.010	DE02.10.022.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
1966	S013.010	DE04.30.009.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辅助检查结果
1967	S013.010	DE05.10.151.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术适应证
1968	S013.010	DE05.10.141.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术禁忌症
1969	S013.010	DE06.00.340.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术指征
1970	S013.010	DE06.00.018.00.011	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	会诊意见
1971	S013.010	DE06.00.093.00.007	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术及操作编码
1972	S013.010	DE06.00.094.00.006	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术及操作名称
1973	S013.010	DE06.00.187.00.006	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术目标部位名称
1974	S013.010	DE06.00.221.00.015	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术及操作日期时间
1975	S013.010	DE06.00.073.00.005	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施麻醉方法代码
1976	S013.010	DE09.00.119.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	注意事项
1977	S013.010	DE06.00.254.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术要点
1978	S013.010	DE06.00.271.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前准备
1979	S013.010	DE02.01.039.00.174	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术者签名
1980	S013.010	DE02.01.039.00.178	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
1981	S013.010	DE09.00.053.00.038	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
1982	S013.011	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
1983	S013.011	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
1984	S013.011	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
1985	S013.011	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
1986	S013.011	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
1987	S013.011	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
1988	S013.011	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
1989	S013.011	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
1990	S013.011	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
1991	S013.011	DE06.00.218.00.014	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	讨论日期时间
1992	S013.011	DE06.00.274.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	讨论地点
1993	S013.011	DE02.01.039.00.137	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主持人姓名
1994	S013.011	DE08.30.032.00.003	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	参加讨论人员名单
1995	S013.011	DE08.30.031.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	专业技术职务类别代码
1996	S013.011	DE06.00.092.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
1997	S013.011	DE05.01.024.00.064	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前诊断编码
1998	S013.011	DE06.00.094.00.006	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术及操作名称
1999	S013.011	DE06.00.093.00.007	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术及操作编码
2000	S013.011	DE06.00.187.00.006	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术目标部位名称
2001	S013.011	DE06.00.221.00.015	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施手术及操作日期时间
2002	S013.011	DE06.00.073.00.005	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	拟实施麻醉方法代码
2003	S013.011	DE06.00.254.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术要点
2004	S013.011	DE06.00.271.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术前准备
2005	S013.011	DE06.00.340.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术指征
2006	S013.011	DE06.00.301.00.001	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术方案
2007	S013.011	DE09.00.119.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	注意事项
2008	S013.011	DE06.00.018.00.004	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	讨论意见
2009	S013.011	DE06.00.018.00.005	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	讨论结论
2010	S013.011	DE02.01.039.00.174	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术者签名
2011	S013.011	DE02.01.039.00.168	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉医师签名
2012	S013.011	DE02.01.039.00.178	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
2013	S013.011	DE09.00.053.00.038	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
2014	S013.012	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
2015	S013.012	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
2016	S013.012	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
2017	S013.012	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
2018	S013.012	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
2019	S013.012	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
2020	S013.012	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
2021	S013.012	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
2022	S013.012	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
2023	S013.012	DE09.00.053.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	记录日期时间
2024	S013.012	DE06.00.093.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
2025	S013.012	DE06.00.094.00.005	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术名称
2026	S013.012	DE06.00.187.00.005	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术目标部位名称
2027	S013.012	DE06.00.221.00.007	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术日期时间
2028	S013.012	DE06.00.073.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉方式代码
2029	S013.012	DE05.10.063.00.002	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术过程
2030	S013.012	DE05.01.025.00.015	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后诊断名称
2031	S013.012	DE05.01.024.00.058	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后诊断编码
2032	S013.012	DE05.01.070.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断依据
2033	S013.012	DE09.00.119.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	注意事项
2034	S013.012	DE02.01.039.00.178	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医师签名
2035	S013.012	DE09.00.053.00.038	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
2036	S013.012	DE06.00.309.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院病程
2037	S013.012	DE99.09.022.71	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	术后处理
2038	S013.013	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
2039	S013.013	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
2040	S013.013	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
2041	S013.013	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
2042	S013.013	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
2043	S013.013	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
2044	S013.013	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
2045	S013.013	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
2046	S013.013	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
2047	S013.013	DE06.00.092.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
2048	S013.013	DE05.10.148.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院情况
2049	S013.013	DE04.50.128.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	阳性辅助检查结果
2050	S013.013	DE02.10.028.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
2051	S013.013	DE06.00.300.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
2052	S013.013	DE06.00.296.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程描述
2053	S013.013	DE08.50.047.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药煎煮方法
2054	S013.013	DE06.00.136.00.013	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药用药方法
2055	S013.013	DE06.00.193.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院情况
2056	S013.013	DE06.00.017.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预出院时间
2057	S013.013	DE05.01.025.00.009	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院西医诊断_名称
2058	S013.013	DE05.01.024.00.044	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院西医诊断_编码
2059	S013.013	DE05.10.172.00.012	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_病名名称
2060	S013.013	DE05.10.130.00.038	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_病名代码
2061	S013.013	DE05.10.172.00.011	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_证候名称
2062	S013.013	DE05.10.130.00.039	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_证候代码
2063	S013.013	DE04.01.117.00.004	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院时症状与体征
2064	S013.013	DE06.00.287.00.005	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院医嘱
2065	S013.013	DE02.01.039.00.171	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院医师签名
2066	S013.013	DE02.01.039.00.172	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主治医师签名
2067	S013.013	DE02.01.039.00.173	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主任医师签名
2068	S013.013	DE09.00.053.00.038	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
2069	S013.013	DE05.01.070.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断依据
2070	S013.014	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
2071	S013.014	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
2072	S013.014	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
2073	S013.014	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
2074	S013.014	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
2075	S013.014	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
2076	S013.014	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
2077	S013.014	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
2078	S013.014	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
2079	S013.014	DE06.00.092.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
2080	S013.014	DE05.10.148.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院情况
2081	S013.014	DE06.00.296.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程描述
2082	S013.014	DE02.01.036.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡日期时间
2083	S013.014	DE05.01.025.00.020	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	直接死亡原因名称
2084	S013.014	DE05.01.021.00.001	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	直接死亡原因编码
2085	S013.014	DE05.01.025.00.021	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡诊断名称
2086	S013.014	DE05.01.021.00.002	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡诊断编码
2087	S013.014	DE09.00.115.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	家属是否同意尸体解剖标志
2088	S013.014	DE02.01.039.00.171	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院医师签名
2089	S013.014	DE02.01.039.00.172	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主治医师签名
2090	S013.014	DE02.01.039.00.173	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主任医师签名
2091	S013.014	DE09.00.053.00.038	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
2092	S013.015	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
2093	S013.015	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
2094	S013.015	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
2095	S013.015	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
2096	S013.015	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
2097	S013.015	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
2098	S013.015	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
2099	S013.015	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
2100	S013.015	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
2101	S013.015	DE06.00.218.00.014	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	讨论日期时间
2102	S013.015	DE06.00.274.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	讨论地点
2103	S013.015	DE02.01.039.00.137	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主持人姓名
2104	S013.015	DE08.30.032.00.003	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	参加讨论人员名单
2105	S013.015	DE08.30.031.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	专业技术职务类别代码
2106	S013.015	DE05.01.025.00.020	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	直接死亡原因名称
2107	S013.015	DE05.01.021.00.001	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	直接死亡原因编码
2108	S013.015	DE05.01.025.00.021	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡诊断名称
2109	S013.015	DE05.01.021.00.002	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡诊断编码
2110	S013.015	DE06.00.181.00.007	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	死亡讨论记录
2111	S013.015	DE06.00.018.00.007	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主持人总结意见
2112	S013.015	DE02.01.039.00.172	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主治医师签名
2113	S013.015	DE02.01.039.00.173	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主任医师签名
2114	S013.015	DE09.00.053.00.038	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
2115	S014.001	DE01.00.014.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
2116	S014.001	DE08.10.026.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
2117	S014.001	DE08.10.054.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
2118	S014.001	DE01.00.019.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
2119	S014.001	DE01.00.026.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
2120	S014.001	DE02.01.039.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
2121	S014.001	DE02.01.040.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
2122	S014.001	DE02.01.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
2123	S014.001	DE02.01.032.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
2124	S014.001	DE04.10.188.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	体重_kg
2125	S014.001	DE08.50.056.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处方药品组号
2126	S014.001	DE01.00.008.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	电子申请单编号
2127	S014.001	DE06.00.286.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱类别代码
2128	S014.001	DE06.00.289.00	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱项目类型代码
2129	S014.001	DE06.00.288.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱项目内容
2130	S014.001	DE06.00.222.00.001	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱计划开始日期时间
2131	S014.001	DE06.00.219.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱计划结束日期时间
2132	S014.001	DE06.00.179.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱备注信息
2133	S014.001	DE02.01.039.00.095	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱开立者签名
2134	S014.001	DE06.00.220.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱开立日期时间
2135	S014.001	DE08.10.026.00.018	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱开立科室
2136	S014.001	DE02.01.039.00.096	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱审核人签名
2137	S014.001	DE09.00.088.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱审核日期时间
2138	S014.001	DE02.01.039.00.097	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	核对医嘱护士签名
2139	S014.001	DE06.00.205.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱核对日期时间
2140	S014.001	DE02.01.039.00.147	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行者签名
2141	S014.001	DE06.00.222.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行日期时间
2142	S014.001	DE08.10.026.00.019	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行科室
2143	S014.001	DE06.00.290.00	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱执行状态
2144	S014.001	DE06.00.218.00.011	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱停止日期时间
2145	S014.001	DE02.01.039.00.099	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	停止医嘱者签名
2146	S014.001	DE06.00.234.00	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医嘱取消日期时间
2147	S014.001	DE02.01.039.00.100	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	取消医嘱者签名
2148	S015.001	DE08.10.052.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	组织机构代码
2149	S015.001	DE01.00.021.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	健康卡号
2150	S015.001	DE01.00.014.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
2151	S015.001	DE08.10.026.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	科室名称
2152	S015.001	DE08.10.054.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病区名称
2153	S015.001	DE01.00.019.00	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病房号
2154	S015.001	DE01.00.026.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	床位号
2155	S015.001	DE02.01.039.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
2156	S015.001	DE02.01.040.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
2157	S015.001	DE02.01.026.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄
2158	S015.001	DE02.01.032.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	年龄_月
2159	S015.001	DE02.01.018.00	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	婚姻状况代码
2160	S015.001	DE02.01.052.00	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	职业类别代码
2161	S015.001	DE02.01.010.00.015	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	患者电话号码
2162	S015.001	DE02.01.024.00	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址类别代码
2163	S015.001	DE02.01.009.01	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_省
2164	S015.001	DE02.01.009.02	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_市
2165	S015.001	DE02.01.009.03	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_县
2166	S015.001	DE02.01.009.04	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_乡
2167	S015.001	DE02.01.009.05	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_村
2168	S015.001	DE02.01.009.06	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_门牌号码
2169	S015.001	DE02.01.047.00.006	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	邮政编码
2170	S015.001	DE02.01.039.00.144	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人姓名
2171	S015.001	DE02.01.010.00.017	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	联系人电话
2172	S015.001	DE06.00.092.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院时间
2173	S015.001	DE06.00.017.00	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	预出院时间
2174	S015.001	DE06.00.310.00	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院天数
2175	S015.001	DE05.10.148.00	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	入院情况
2176	S015.001	DE04.50.128.00	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	阳性辅助检查结果
2177	S015.001	DE02.10.028.00	30	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中医四诊观察结果
2178	S015.001	DE05.10.130.00.037	31	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	人皖诊断_中医证候代码
2179	S015.001	DE05.01.024.00.044	32	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院西医诊断_编码
2180	S015.001	DE05.10.130.00.038	33	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_病名代码
2181	S015.001	DE05.10.130.00.039	34	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院中医诊断_证候代码
2182	S015.001	DE06.00.093.00	35	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
2183	S015.001	DE06.00.221.00.008	36	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作开始日期时间
2184	S015.001	DE06.00.073.00	37	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	麻醉方式代码
2185	S015.001	DE05.10.063.00.002	38	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术过程
2186	S015.001	DE06.00.300.00	39	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治则治法
2187	S015.001	DE08.50.047.00	40	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药煎煮方法
2188	S015.001	DE06.00.136.00.013	41	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	中药用药方法
2189	S015.001	DE06.00.296.00	42	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊疗过程描述
2190	S015.001	DE06.00.193.00	43	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院情况
2191	S015.001	DE04.01.117.00.004	44	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院时症状与体征
2192	S015.001	DE06.00.287.00.005	45	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出院医嘱
2193	S015.001	DE05.10.113.00	46	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	病情转归代码
2194	S015.001	DE02.01.039.00.171	47	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院医师签名
2195	S015.001	DE02.01.039.00.149	48	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	上级医师签名
2196	S015.001	DE09.00.053.00.038	49	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	签名日期时间
2197	S016.001	DE01.00.021.00	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	健康卡号
2198	S016.001	DE01.00.010.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	急诊号
2199	S016.001	DE01.00.014.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	住院号
2200	S016.001	DE02.01.039.00	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	姓名
2201	S016.001	DE02.01.040.00	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	性别
2202	S016.001	DE02.01.005.01	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	出生日期
2203	S016.001	DE02.10.022.00	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	过敏药物
2204	S016.001	DE02.10.026.00	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病史_含外伤
2205	S016.001	DE02.10.061.00	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术史
2206	S016.001	DE06.00.176.00	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转诊_院_日期
2207	S016.001	DE06.00.177.00	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转诊原因
2208	S016.001	DE06.00.181.00.003	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转诊记录
2209	S016.001	DE02.01.039.00.023	13	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转诊医师姓名
2210	S016.001	DE05.01.024.00.065	14	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	疾病诊断编码
2211	S016.001	DE05.01.058.00.005	15	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断日期
2212	S016.001	DE08.10.013.00	16	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	诊断机构名称
2213	S016.001	DE04.01.117.00	17	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	相关症状
2214	S016.001	DE06.00.308.00	18	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	主要治疗措施
2215	S016.001	DE04.30.009.00	19	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	辅助检查结果
2216	S016.001	DE06.00.093.00	20	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作编码
2217	S016.001	DE06.00.221.00.008	21	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	手术及操作开始日期时间
2218	S016.001	DE06.00.159.00	22	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	治疗方案
2219	S016.001	DE05.10.014.00	23	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	处置计划
2220	S016.001	DE05.10.033.00	24	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	健康问题评估
2221	S016.001	DE06.00.066.00	25	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	康复措施指导
2222	S016.001	DE08.10.052.00.001	26	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转出医疗机构代码
2223	S016.001	DE08.10.026.00.004	27	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转出医疗机构科室名称
2224	S016.001	DE08.10.013.00.001	28	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转入医疗机构名称
2225	S016.001	DE08.10.026.00.005	29	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	转入医疗机构科室名称
2226	S017.001	DE08.10.013.00.012	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构名称
2227	S017.001	DE08.10.052.00	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	组织机构代码
2228	S017.001	DE02.01.010.00	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构联系电话
2229	S017.001	DE02.01.039.00.031	4	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构负责人_法人_姓名
2230	S017.001	DE02.01.010.00.001	5	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	医疗机构负责人联系电话
2231	S017.001	DE02.01.009.01	6	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_省
2232	S017.001	DE02.01.009.02	7	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_市
2233	S017.001	DE02.01.009.03	8	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_县
2234	S017.001	DE02.01.009.04	9	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_乡
2235	S017.001	DE02.01.009.05	10	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_村
2236	S017.001	DE02.01.009.06	11	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	地址_门牌号码
2237	S017.001	DE02.01.047.00.006	12	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	邮政编码
2238	Z999.001	DE99.09.010.91	1	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	页数1
2239	Z999.001	DE99.09.010.92	2	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	页数2
2240	Z999.001	DE99.09.036.19	3	f	f	\N	2026-03-25 18:49:31.59777	2026-03-25 18:49:31.59777	选中标志
\.


--
-- Data for Name: emr_icd10_diagnosis; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.emr_icd10_diagnosis (id, diag_code, diag_name, pinyin_initials, status, sort_no, create_time, update_time) FROM stdin;
1	A00	霍乱	HL	1	1	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
2	A01	伤寒和副伤寒	SHHFSH	1	2	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
3	A02	其他沙门菌感染	QTSMJGR	1	3	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
4	A03	细菌性痢疾	XJXLJ	1	4	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
5	A04	其他细菌性肠道感染	QTXJXCDGR	1	5	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
6	A05	其他细菌性食物中毒,不可归类在他处者	QTXJXSWZDBKGLZTCZ	1	6	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
7	A06	阿米巴病	AMBB	1	7	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
8	A07	其他原虫性肠道疾病	QTYCXCDJB	1	8	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
9	A08	病毒性和其他特指的肠道感染	BDXHQTTZDCDGR	1	9	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
10	A09	其他传染性和未特指病因的胃肠炎和结肠炎	QTCRXHWTZBYDWCYHJCY	1	10	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
11	A15	呼吸道结核,经细菌学和组织学证实	HXDJHJXJXHZZXZS	1	11	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
12	A16	呼吸道结核,未经细菌学或组织学所证实	HXDJHWJXJXHZZXSZS	1	12	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
13	A18	其他器官的结核	QTQGDJH	1	13	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
14	A19	粟粒性结核	SLXJH	1	14	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
15	A20	鼠疫	SY	1	15	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
16	A21	土拉菌病[兔热病]	TLJBTRB	1	16	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
17	A22	炭疽	TJ	1	17	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
18	A23	布氏菌病	BSJB	1	18	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
19	A24	鼻疽和类鼻疽	BJHLBJ	1	19	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
20	A25	鼠咬热	SYR	1	20	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
21	A26	类丹毒	LDD	1	21	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
22	A27	钩端螺旋体病	GDLXTB	1	22	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
23	A28	其他动物源性细菌性疾病,不可归类在他处者	QTDWYXXJXJBBKGLZTCZ	1	23	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
24	A30	麻风[汉森病]	MFHSB	1	24	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
25	A31	其他分枝杆菌感染	QTFZGJGR	1	25	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
26	A32	利斯特菌病	LSTJB	1	26	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
27	A33	新生儿破伤风	XSEPSF	1	27	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
28	A34	产科破伤风	CKPSF	1	28	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
29	A35	其他破伤风	QTPSF	1	29	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
30	A36	白喉	BH	1	30	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
31	A37	百日咳	BRK	1	31	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
32	A38	猩红热	XHR	1	32	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
33	A39	脑膜炎球菌感染	NMYQJGR	1	33	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
34	A40	链球菌性败血症	LQJXBXZ	1	34	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
35	A41	其他脓毒病	QTNDB	1	35	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
36	A42	放线菌病	FXJB	1	36	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
37	A43	诺卡菌病	NKJB	1	37	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
38	A44	巴尔通体病	BETTB	1	38	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
39	A46	丹毒	DD	1	39	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
40	A48	其他细菌性疾病,不可归类在他处者	QTXJXJBBKGLZTCZ	1	40	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
41	A49	未特指部位的细菌性感染	WTZBWDXJXGR	1	41	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
42	A50	先天性梅毒	XTXMD	1	42	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
43	A51	早期梅毒	ZQMD	1	43	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
44	A52	晚期梅毒	WQMD	1	44	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
45	A53	其他和未特指的梅毒	QTHWTZDMD	1	45	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
46	A54	淋球菌感染	LQJGR	1	46	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
47	A55	衣原体(性病性)淋巴肉芽肿	YYTXBXLBRYZ	1	47	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
48	A56	其他性传播的衣原体疾病	QTXCBDYYTJB	1	48	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
49	A57	软下疳	RXG	1	49	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
50	A58	腹股沟肉芽肿	FGGRYZ	1	50	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
51	A59	滴虫病[毛滴虫病]	DCBMDCB	1	51	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
52	A60	肛门生殖器的疱疹病毒[单纯疱疹]感染	GMSZQDPZBDDCPZGR	1	52	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
53	A63	其他主要为性传播的疾病,不可归类在他处者	QTZYWXCBDJBBKGLZTCZ	1	53	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
54	A64	未特指的性传播疾病	WTZDXCBJB	1	54	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
55	A65	非性病性梅毒	FXBXMD	1	55	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
56	A66	雅司病	YSB	1	56	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
57	A67	品他病	PTB	1	57	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
58	A68	回归热	HGR	1	58	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
59	A69	其他螺旋体感染	QTLXTGR	1	59	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
60	A70	鹦鹉热衣原体感染	YWRYYTGR	1	60	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
61	A71	沙眼	SY	1	61	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
62	A74	由衣原体引起的其他疾病	YYYTYQDQTJB	1	62	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
63	A75	斑疹伤寒	BZSH	1	63	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
64	A77	斑疹热[蜱媒介的立克次体病]	BZRPMJDLKCTB	1	64	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
65	A78	Q热	QR	1	65	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
66	A79	其他立克次体病	QTLKCTB	1	66	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
67	A80	急性脊髓灰质炎	JXJSHZY	1	67	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
68	A81	中枢神经系统的非典型病毒感染	ZSSJXTDFDXBDGR	1	68	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
69	A82	狂犬病	KQB	1	69	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
70	A83	蚊媒介的病毒性脑炎	WMJDBDXNY	1	70	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
71	A84	蜱媒介的病毒性脑炎	PMJDBDXNY	1	71	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
72	A85	其他病毒性脑炎,不可归类在他处者	QTBDXNYBKGLZTCZ	1	72	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
73	A86	未特指的病毒性脑炎	WTZDBDXNY	1	73	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
74	A87	病毒性脑膜炎	BDXNMY	1	74	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
75	A88	中枢神经系统的其他病毒性感染,不可归类在他处者	ZSSJXTDQTBDXGRBKGLZTCZ	1	75	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
76	A89	中枢神经系统未特指的病毒性感染	ZSSJXTWTZDBDXGR	1	76	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
77	A90	登革热[古典登革热]	DGRGDDGR	1	77	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
78	A91	登革出血热	DGCXR	1	78	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
79	A92	其他蚊媒介的病毒性发热	QTWMJDBDXFR	1	79	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
80	A93	其他节肢动物媒介的病毒性发热,不可归类在他处者	QTJZDWMJDBDXFRBKGLZTCZ	1	80	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
81	A94	未特指的节肢动物媒介的病毒性发热	WTZDJZDWMJDBDXFR	1	81	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
82	A95	黄热病	HRB	1	82	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
83	A96	沙粒病毒性出血热	SLBDXCXR	1	83	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
84	A98	其他病毒性出血热,不可归类在他处者	QTBDXCXRBKGLZTCZ	1	84	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
85	A99	未特指的病毒性出血热	WTZDBDXCXR	1	85	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
86	B00	疱疹病毒[单纯疱疹]感染	PZBDDCPZGR	1	86	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
87	B01	水痘	SD	1	87	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
88	B02	带状疱疹	DZPZ	1	88	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
89	B03	天花	TH	1	89	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
90	B04	猴痘	HD	1	90	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
91	B05	麻疹	MZ	1	91	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
92	B06	风疹	FZ	1	92	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
93	B07	病毒性疣	BDXY	1	93	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
94	B08	其他以皮肤和粘膜损害为特征的病毒性感染,不可归类在他处者	QTYPFHZMSHWTZDBDXGRBKGLZTCZ	1	94	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
95	B09	未特指的以皮肤和粘膜损害为特征的病毒性感染	WTZDYPFHZMSHWTZDBDXGR	1	95	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
96	B15	急性甲型肝炎	JXJXGY	1	96	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
97	B16	急性乙型肝炎	JXYXGY	1	97	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
98	B17	其他急性病毒性肝炎	QTJXBDXGY	1	98	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
99	B18	慢性病毒性肝炎	MXBDXGY	1	99	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
100	B19	未特指的病毒性肝炎	WTZDBDXGY	1	100	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
101	B20	人类免疫缺陷病毒[HIV]病造成的传染病和寄生虫病	RLMYQXBDHIVBZCDCRBHJSCB	1	101	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
102	B21	人类免疫缺陷病毒[HIV]病造成的恶性肿瘤	RLMYQXBDHIVBZCDEXZL	1	102	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
103	B22	人类免疫缺陷病毒[HIV]病造成的其他特指的疾病	RLMYQXBDHIVBZCDQTTZDJB	1	103	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
104	B23	人类免疫缺陷病毒[HIV]病造成的其他情况	RLMYQXBDHIVBZCDQTQK	1	104	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
105	B24	未特指的人类免疫缺陷病毒[HIV]病	WTZDRLMYQXBDHIVB	1	105	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
106	B25	巨细胞病毒病	JXBBDB	1	106	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
107	B26	流行牲腮腺炎	LXSSXY	1	107	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
108	B27	传染性单核细胞增多症	CRXDHXBZDZ	1	108	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
109	B30	病毒性结膜炎	BDXJMY	1	109	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
110	B33	其他病毒性疾病,不可归类在他处者	QTBDXJBBKGLZTCZ	1	110	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
111	B34	未特指部位的病毒性感染	WTZBWDBDXGR	1	111	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
112	B35	皮肤癣菌病	PFXJB	1	112	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
113	B36	其他浅部真菌病	QTQBZJB	1	113	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
114	B37	念珠菌病	NZJB	1	114	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
115	B38	肺球孢子菌病	FQBZJB	1	115	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
116	B39	组织胞浆菌病	ZZBJJB	1	116	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
117	B40	芽生菌病	YSJB	1	117	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
118	B41	副球孢子菌病	FQBZJB	1	118	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
119	B42	孢子丝菌病	BZSJB	1	119	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
120	B43	着色真菌病与棕色真菌病性脓肿	ZSZJBYZSZJBXNZ	1	120	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
121	B44	曲霉病	QMB	1	121	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
122	B45	隐球菌病	YQJB	1	122	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
123	B46	接合菌病	JHJB	1	123	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
124	B47	足菌肿[足分枝菌病]	ZJZZFZJB	1	124	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
125	B48	其他真菌病,不可归类在他处者	QTZJBBKGLZTCZ	1	125	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
126	B49	未特指的真菌病	WTZDZJB	1	126	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
127	B50	恶性疟原虫疟疾	EXNYCNJ	1	127	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
128	B51	间日疟原虫疟疾	JRNYCNJ	1	128	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
129	B52	三日疟原虫疟疾	SRNYCNJ	1	129	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
130	B53	其他经寄生虫学证实的疟疾	QTJJSCXZSDNJ	1	130	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
131	B54	未特指的疟疾	WTZDNJ	1	131	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
132	B55	利什曼病	LSMB	1	132	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
133	B56	非洲锥虫病	FZZCB	1	133	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
134	B57	查加斯病	CJSB	1	134	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
135	B58	弓形虫病[弓形体病]	GXCBGXTB	1	135	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
136	B59	肺孢子虫病	FBZCB	1	136	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
137	B60	其他原虫性疾病,不可归类在他处者	QTYCXJBBKGLZTCZ	1	137	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
138	B64	未特指的原虫性疾病	WTZDYCXJB	1	138	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
139	B65	血吸虫病[裂体吸虫病]	XXCBLTXCB	1	139	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
140	B66	其他吸虫感染	QTXCGR	1	140	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
141	B67	棘球蚴病	JQYB	1	141	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
142	B68	绦虫病	TCB	1	142	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
143	B69	囊虫病[囊尾蚴病]	NCBNWYB	1	143	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
144	B70	裂头绦虫病和裂头蚴病	LTTCBHLTYB	1	144	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
145	B71	其他绦虫感染	QTTCGR	1	145	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
146	B72	龙线虫病	LXCB	1	146	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
147	B73	盘尾丝虫病	PWSCB	1	147	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
148	B74	丝虫病	SCB	1	148	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
149	B75	旋毛虫病	XMCB	1	149	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
150	B76	钩虫病	GCB	1	150	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
151	B77	蛔虫病	HCB	1	151	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
152	B78	类圆线虫病	LYXCB	1	152	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
153	B79	鞭虫病	BCB	1	153	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
154	B80	蛲虫病	NCB	1	154	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
155	B81	其他肠道蠕虫病,不可归类在他处者	QTCDRCBBKGLZTCZ	1	155	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
156	B82	未特指的肠道寄生虫病	WTZDCDJSCB	1	156	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
157	B83	其他蠕虫病	QTRCB	1	157	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
158	B85	虱病和阴虱病	SBHYSB	1	158	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
159	B86	疥疮	JC	1	159	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
160	B87	蝇蛆病	YQB	1	160	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
161	B88	其他病虫侵染	QTBCQR	1	161	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
162	B89	未特指的寄生虫病	WTZDJSCB	1	162	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
163	B90	结核病后遗症	JHBHYZ	1	163	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
164	B91	脊髓灰质炎的后遗症	JSHZYDHYZ	1	164	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
165	B92	麻风的后遗症	MFDHYZ	1	165	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
166	B94	其他和未特指的传染病和寄生虫病的后遗症	QTHWTZDCRBHJSCBDHYZ	1	166	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
167	B95	链球菌和葡萄球菌作为分类于其他章疾病的原因	LQJHPTQJZWFLYQTZJBDYY	1	167	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
168	B96	其他特指细菌性病原体作为分类于其他章疾病的原因	QTTZXJXBYTZWFLYQTZJBDYY	1	168	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
169	B97	病毒性病原体作为分类于其他章疾病的原因	BDXBYTZWFLYQTZJBDYY	1	169	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
170	B98	分类地其他章的作为疾病原因的特指感染病原体	FLDQTZDZWJBYYDTZGRBYT	1	170	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
171	B99	其他和未特指的传染病	QTHWTZDCRB	1	171	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
172	C00	唇恶性肿瘤	CEXZL	1	172	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
173	C01	舌根恶性肿瘤	SGEXZL	1	173	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
174	C02	舌其他和未特指部位的恶性肿瘤	SQTHWTZBWDEXZL	1	174	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
175	C03	牙龈恶性肿瘤	YYEXZL	1	175	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
176	C04	口底恶性肿瘤	KDEXZL	1	176	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
177	C05	腭恶性肿瘤	EEXZL	1	177	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
178	C06	口其他和未特指部位的恶性肿瘤	KQTHWTZBWDEXZL	1	178	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
179	C07	腮腺恶性肿瘤	SXEXZL	1	179	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
180	C08	大涎腺其他和未特指的恶性肿瘤	DXXQTHWTZDEXZL	1	180	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
181	C09	扁桃体恶性肿瘤	BTTEXZL	1	181	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
182	C10	口咽恶性肿瘤	KYEXZL	1	182	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
183	C11	鼻咽恶性肿瘤	BYEXZL	1	183	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
184	C12	梨状窦恶性肿瘤	LZDEXZL	1	184	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
185	C13	咽下部恶性肿瘤	YXBEXZL	1	185	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
186	C14	唇、口腔和咽其他和部位不明的恶性肿瘤	CKQHYQTHBWBMDEXZL	1	186	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
187	C15	食管恶性肿瘤	SGEXZL	1	187	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
188	C16	胃恶性肿瘤	WEXZL	1	188	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
189	C17	小肠恶性肿瘤	XCEXZL	1	189	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
190	C18	结肠恶性肿瘤	JCEXZL	1	190	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
191	C19	直肠乙状结肠连接处恶性肿瘤	ZCYZJCLJCEXZL	1	191	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
192	C20	直肠恶性肿瘤	ZCEXZL	1	192	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
193	C21	肛门和肛管的恶性肿瘤	GMHGGDEXZL	1	193	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
194	C22	肝和肝内胆管恶性肿瘤	GHGNDGEXZL	1	194	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
195	C23	胆囊恶性肿瘤	DNEXZL	1	195	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
196	C24	胆道其他和未特指部位的恶性肿瘤	DDQTHWTZBWDEXZL	1	196	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
197	C25	胰恶性肿瘤	YEXZL	1	197	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
198	C26	消化器官其他和不明确的恶性肿瘤	XHQGQTHBMQDEXZL	1	198	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
199	C30	鼻腔和中耳恶性肿瘤	BQHZEEXZL	1	199	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
200	C31	鼻旁窦恶性肿瘤	BPDEXZL	1	200	2026-03-25 18:47:24.958421	2026-03-25 18:47:24.958421
\.


--
-- Data for Name: emr_record; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.emr_record (id, emr_code, visit_code, patient_code, doctor_code, template_code, emr_type, emr_status, current_version, create_time, update_time) FROM stdin;
2	EMR_V20260326214329601B77A99_20260327145801644	V20260326214329601B77A99	P1774437162241126	DOC002	OUTPATIENT_RUNTIME	OUTPATIENT	SIGNED	6	2026-03-27 14:58:01.610011	2026-03-27 15:20:59.971254
\.


--
-- Data for Name: emr_record_version; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.emr_record_version (id, emr_code, version_no, emr_content, signed_flag, create_time, update_time) FROM stdin;
9	EMR_V20260326214329601B77A99_20260327145801644	6	{"meta": {"source": "outpatient_doctor_station", "saved_at": "2026-03-27T07:20:58.896Z", "saved_by": "DOC002", "active_template_code": "OUTPATIENT_DEFAULT_XML_20260326"}, "version": "1.0", "diagnosis": {"items": [{"sort_no": 1, "diag_code": "A00", "diag_name": "霍乱", "pinyin_initials": "HL"}, {"sort_no": 2, "diag_code": "A01", "diag_name": "伤寒和副伤寒", "pinyin_initials": "SHHFSH"}], "primary": {"diag_code": "A00", "diag_name": "霍乱"}}, "visit_info": {"reg_code": "R20260326214329593320BB9", "dept_code": "DEPT003", "visit_code": "V20260326214329601B77A99", "visit_date": "", "visit_type": "FIRST", "doctor_code": "DOC002", "visit_status": "IN_CONSULTATION"}, "patient_info": {"id_card": "140102345601234567", "birthday": 20180301, "gender_code": "2", "patient_code": "P1774437162241126", "patient_name": "测试患者a"}, "template_xml": "\\n<XTextDocument xmlns:xsd=\\"http://www.w3.org/2001/XMLSchema\\" xmlns:xsi=\\"http://www.w3.org/2001/XMLSchema-instance\\" EditorVersionString=\\"1.0.0.0\\">\\n   <Attributes>\\n      <Attribute>\\n         <Name>DCLocalDataSource</Name>\\n         <Value>&lt;DataSourceDocument xmlns:xsi=\\"http://www.w3.org/2001/XMLSchema-instance\\" xmlns:xsd=\\"http://www.w3.org/2001/XMLSchema\\" ID=\\"DataSource\\" Name=\\"DataSource\\" Guid=\\"9c34a38d-a29b-4685-83f9-db43397b4d3a\\" Title=\\"\\"&gt;&lt;Parameters /&gt;&lt;Nodes /&gt;&lt;/DataSourceDocument&gt;</Value>\\n      </Attribute>\\n   </Attributes>\\n   <XElements>\\n      <Element xsi:type=\\"XTextHeader\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"9\\" />\\n            <Element xsi:type=\\"XInputField\\" StyleIndex=\\"1\\">\\n               <ID>机构名称</ID>\\n               <XElements>\\n                  <Element xsi:type=\\"XString\\" StyleIndex=\\"1\\">\\n                     <Text>AAAAA</Text>\\n                  </Element>\\n                  <Element xsi:type=\\"XString\\" StyleIndex=\\"2\\">\\n                     <Text>医院</Text>\\n                  </Element>\\n               </XElements>\\n               <Deleteable>false</Deleteable>\\n               <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n               <SpecifyWidth>1181.102</SpecifyWidth>\\n               <Alignment>Center</Alignment>\\n               <Name>机构名称</Name>\\n               <InnerValue>AAAAA医院</InnerValue>\\n               <BackgroundText>机构名称</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"12\\" />\\n            <Element xsi:type=\\"XString\\">\\n               <Text>科别：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>科别</ID>\\n               <Name>科别</Name>\\n               <BackgroundText>科别</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>     床号：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>床号</ID>\\n               <Name>床号</Name>\\n               <BackgroundText>床号</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>床    姓名：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>姓名YM</ID>\\n               <Name>姓名</Name>\\n               <BackgroundText>姓名</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"3\\">\\n               <Text>    住院号：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\" StyleIndex=\\"3\\">\\n               <ID>住院号</ID>\\n               <Name>住院号</Name>\\n               <BackgroundText>住院号</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"11\\" />\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextBody\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>入</Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"5\\">\\n               <Text> </Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>院</Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"5\\">\\n               <Text> </Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>记</Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"5\\">\\n               <Text> </Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>录</Text>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"10\\" />\\n            <Element xsi:type=\\"XTextTable\\" NumOfRows=\\"6\\" NumOfColumns=\\"2\\">\\n               <ID>table1</ID>\\n               <XElements>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 姓名：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>姓名</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>Name333</BindingPath>\\n                                 </ValueBinding>\\n                                 <XElements>\\n                                    <Element xsi:type=\\"XString\\">\\n                                       <Text>1111</Text>\\n                                    </Element>\\n                                 </XElements>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>姓名</Name>\\n                                 <InnerValue>1111</InnerValue>\\n                                 <BackgroundText>姓名</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>出生地：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>出生地</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>BirthPlace</BindingPath>\\n                                 </ValueBinding>\\n                                 <XElements>\\n                                    <Element xsi:type=\\"XString\\">\\n                                       <Text>22222</Text>\\n                                    </Element>\\n                                 </XElements>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>出生地</Name>\\n                                 <InnerValue>22222</InnerValue>\\n                                 <BackgroundText>出生地</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 性别：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>性别</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>sex</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>性别</Name>\\n                                 <BackgroundText>性别</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DropdownList</EditStyle>\\n                                    <ListSource>\\n                                       <Items>\\n                                          <Item>\\n                                             <Text>男</Text>\\n                                             <Value>1</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>女</Text>\\n                                             <Value>2</Value>\\n                                          </Item>\\n                                       </Items>\\n                                    </ListSource>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>  </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>职业：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>职业</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>Job</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>职业</Name>\\n                                 <BackgroundText>职业</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 年龄：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>年龄</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                    <ValueType>Integer</ValueType>\\n                                    <CheckMaxValue>true</CheckMaxValue>\\n                                    <CheckMinValue>true</CheckMinValue>\\n                                    <MaxValue>120</MaxValue>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>Age</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>年龄</Name>\\n                                 <BackgroundText>年龄</BackgroundText>\\n                                 <FieldSettings>\\n                                    <EditStyle>Numeric</EditStyle>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>岁</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>入院时间：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>入院时间</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>indate</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>入院时间</Name>\\n                                 <DisplayFormat>\\n                                    <Style>DateTime</Style>\\n                                    <Format>yyyy-MM-dd HH:mm:ss</Format>\\n                                 </DisplayFormat>\\n                                 <BackgroundText>入院时间</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DateTime</EditStyle>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 民族：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\" StyleIndex=\\"7\\">\\n                                 <ID>民族</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>mingzu</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>民族</Name>\\n                                 <BackgroundText>民族</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DropdownList</EditStyle>\\n                                    <ListSource>\\n                                       <Items>\\n                                          <Item>\\n                                             <Text>汉族</Text>\\n                                             <Value>01</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>蒙古族</Text>\\n                                             <Value>02</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>回族</Text>\\n                                             <Value>03</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>藏族</Text>\\n                                             <Value>04</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>维吾尔族</Text>\\n                                             <Value>05</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>苗族</Text>\\n                                             <Value>06</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>彝族</Text>\\n                                             <Value>07</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>壮族</Text>\\n                                             <Value>08</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>布依族</Text>\\n                                             <Value>09</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>朝鲜族</Text>\\n                                             <Value>10</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>满族</Text>\\n                                             <Value>11</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>侗族</Text>\\n                                             <Value>12</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>瑶族</Text>\\n                                             <Value>13</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>白族</Text>\\n                                             <Value>14</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>土家族</Text>\\n                                             <Value>15</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>哈尼族</Text>\\n                                             <Value>16</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>哈萨克族</Text>\\n                                             <Value>17</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>傣族</Text>\\n                                             <Value>18</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>黎族</Text>\\n                                             <Value>19</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>傈僳族</Text>\\n                                             <Value>20</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>佤族</Text>\\n                                             <Value>21</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>畲族</Text>\\n                                             <Value>22</Value>\\n                                          </Item>\\n                                       </Items>\\n                                    </ListSource>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\" StyleIndex=\\"7\\">\\n                                 <Text> </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>记录时间：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>记录时间</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>recorddate</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>记录时间</Name>\\n                                 <BackgroundText>记录时间</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DateTime</EditStyle>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 婚姻：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>婚姻</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>marriage</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>婚姻</Name>\\n                                 <BackgroundText>婚姻</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DropdownList</EditStyle>\\n                                    <ListSource>\\n                                       <Items>\\n                                          <Item>\\n                                             <Text>未婚</Text>\\n                                             <Value>0</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>已婚</Text>\\n                                             <Value>1</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>离异</Text>\\n                                             <Value>2</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>丧偶</Text>\\n                                             <Value>3</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>其他</Text>\\n                                             <Value>4</Value>\\n                                          </Item>\\n                                       </Items>\\n                                    </ListSource>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>  </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>病史陈述者：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>病史陈述者</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>patientname</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>病史陈述者</Name>\\n                                 <BackgroundText>病史陈述者</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 发病节气：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>发病季节</ID>\\n                                 <Name>发病节气</Name>\\n                                 <BackgroundText>发病节气</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n               </XElements>\\n               <Columns>\\n                  <Element xsi:type=\\"XTextTableColumn\\">\\n                     <Width>937.375</Width>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableColumn\\">\\n                     <Width>957.375</Width>\\n                  </Element>\\n               </Columns>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"9\\" />\\n            <Element xsi:type=\\"XString\\">\\n               <Text>                                                     医师签名：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>医师签名</ID>\\n               <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n               <SpecifyWidth>236.22</SpecifyWidth>\\n               <Name>医师签名</Name>\\n               <BackgroundText>医师签名</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"9\\" />\\n            <Element xsi:type=\\"XParagraphFlag\\" />\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooter\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>                                   第</Text>\\n            </Element>\\n            <Element xsi:type=\\"XPageInfo\\" StyleIndex=\\"8\\">\\n               <Width>85</Width>\\n               <AutoHeight>true</AutoHeight>\\n               <Height>62.734</Height>\\n               <FormatString>[%PageIndex%]</FormatString>\\n            </Element>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>页</Text>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" />\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextHeaderForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"0\\">\\n               <AutoCreate>true</AutoCreate>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooterForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements />\\n      </Element>\\n   </XElements>\\n   <FileName>Test\\\\演示文档\\\\常规文档\\\\入院记录通用测试.xml</FileName>\\n   <FileFormat>XML</FileFormat>\\n   <ContentStyles>\\n      <Default xsi:type=\\"DocumentContentStyle\\">\\n         <FontName>宋体</FontName>\\n         <FontSize>12</FontSize>\\n      </Default>\\n      <Styles>\\n         <Style Index=\\"0\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"1\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>15</FontSize>\\n            <Bold>true</Bold>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"2\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>15</FontSize>\\n            <Bold>true</Bold>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"3\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <BorderLeft>true</BorderLeft>\\n            <BorderBottom>true</BorderBottom>\\n            <BorderTop>true</BorderTop>\\n            <BorderRight>true</BorderRight>\\n         </Style>\\n         <Style Index=\\"4\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>18</FontSize>\\n            <Bold>true</Bold>\\n         </Style>\\n         <Style Index=\\"5\\">\\n            <FontName>Times New Roman</FontName>\\n            <FontSize>18</FontSize>\\n            <Bold>true</Bold>\\n         </Style>\\n         <Style Index=\\"6\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <BorderWidth>1</BorderWidth>\\n            <PaddingLeft>15</PaddingLeft>\\n            <PaddingTop>10</PaddingTop>\\n            <PaddingRight>12.5</PaddingRight>\\n            <PaddingBottom>10</PaddingBottom>\\n         </Style>\\n         <Style Index=\\"7\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>10.5</FontSize>\\n         </Style>\\n         <Style Index=\\"8\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n         </Style>\\n         <Style Index=\\"9\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>Space1pt5</LineSpacingStyle>\\n         </Style>\\n         <Style Index=\\"10\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>Space1pt5</LineSpacingStyle>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"11\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>SpaceMultiple</LineSpacingStyle>\\n            <LineSpacing>1.2</LineSpacing>\\n         </Style>\\n         <Style Index=\\"12\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>SpaceMultiple</LineSpacingStyle>\\n            <LineSpacing>1.2</LineSpacing>\\n            <Align>Center</Align>\\n         </Style>\\n      </Styles>\\n   </ContentStyles>\\n   <DocumentContentVersion>2</DocumentContentVersion>\\n   <Info>\\n      <LicenseText>都昌:都昌WEB旗舰版演示</LicenseText>\\n      <CreationTime>1980-01-01T00:00:00+08:00</CreationTime>\\n      <LastModifiedTime>2026-03-27T15:20:58+08:00</LastModifiedTime>\\n      <LastPrintTime>1980-01-01T00:00:00+08:00</LastPrintTime>\\n      <Operator>DCSoft.Writer Version:1.2019.1.4</Operator>\\n      <NumOfPage>1</NumOfPage>\\n   </Info>\\n   <BodyText>入 院 记 录\\n\\n 姓名：1111  出生地：22222 \\n 性别：性别   职业：职业 \\n 年龄：年龄岁 入院时间：入院时间 \\n 民族：民族  记录时间：记录时间 \\n 婚姻：婚姻   病史陈述者：病史陈述者 \\n 发病节气：发病节气   \\n                                                     医师签名：医师签名\\n</BodyText>\\n   <PageSettings>\\n      <LeftMargin>95</LeftMargin>\\n      <RightMargin>95</RightMargin>\\n   </PageSettings>\\n</XTextDocument>", "clinical_notes": {"chief_complaint": "1111", "history_of_present_illness": "2222"}, "encounter_data": {"labs": [], "allergies": "", "diagnosis": "A00 霍乱；A01 伤寒和副伤寒", "examinations": [], "prescriptions": [], "chiefComplaint": "1111", "criticalValues": "", "diagnosisItems": [{"diag_code": "A00", "diag_name": "霍乱", "pinyin_initials": "HL"}, {"diag_code": "A01", "diag_name": "伤寒和副伤寒", "pinyin_initials": "SHHFSH"}], "historyOfPresentIllness": "2222"}}	t	2026-03-27 15:20:59.971254	2026-03-27 15:20:59.971254
\.


--
-- Data for Name: emr_template_department; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.emr_template_department (id, template_id, dept_id, create_time, update_time) FROM stdin;
15	16	1	2026-03-26 21:40:30.075093	2026-03-26 21:40:30.075093
16	17	1774528726634	2026-03-26 21:41:13.646439	2026-03-26 21:41:13.646439
17	18	1774528726634	2026-03-26 21:41:44.308373	2026-03-26 21:41:44.308373
\.


--
-- Data for Name: emr_value_domain; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.emr_value_domain (id, domain_code, domain_name, domain_type, description, status, create_time, updated_at) FROM stdin;
1	CV02.01.204	医疗保险类别代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
2	CV02.01.205	地址类别代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
3	CV04.50.020	Rh(D)血型代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
4	CV04.50.021	输血品种代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
5	CV05.01.040	输血反应类型代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
6	CV05.10.021	美国麻醉医师协会（ASA)分级标准代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
7	CV05.10.024	手术级别代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
8	CV06.00.103	麻醉方法代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
9	CV06.00.223	手术体位代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
10	CV06.00.227	操作部位代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
11	CV06.00.228	药物使用频次代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
12	CV06.00.229	医嘱项目类型代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
13	CV07.10.005	医疗付费方式代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
14	CV09.00.404	患者类型代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
15	EMR01.01.001	出院情况	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
16	EMR01.01.002	是否	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
17	EMR01.01.003	有无	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
18	EMR01.01.004	检验结果（阴/阳）	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
19	EMR01.01.005	手术并发症名称代码表	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
20	EMR01.01.006	肿瘤（TNM）分期	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
21	WT01.01.000	身份证件类别	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
22	WT01.01.001	性别代码	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
23	WT01.01.002	民族代码	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
24	WT01.01.003	从事专业类别代码	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
25	WT01.01.004	医师执业类别代码	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
26	WT01.01.005	国籍代码	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
27	WT01.01.006	职业代码	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
28	WT01.01.007	婚姻状况代码	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
29	WT01.01.008	联系人关系代码	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
30	WT01.01.009	入院途径	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
31	WT01.01.010	入院病情代码	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
32	WT01.01.011	血型编码	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
33	WT01.01.012	病案质量	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
34	WT01.01.014	切口愈合等级	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
35	WT01.01.015	切口愈合类别	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
36	WT01.01.017	离院方式	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
37	WT01.01.018	有无	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
38	WT01.01.019	实施临床路径	ENUM	\N	1	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
\.


--
-- Data for Name: emr_value_domain_item; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.emr_value_domain_item (id, domain_code, item_code, item_name, item_order, is_default, status, remark, create_time, updated_at) FROM stdin;
1	CV02.01.204	1	城镇职工基本医疗保险	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
2	CV02.01.204	2	城镇居民基本医疗保险	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
3	CV02.01.204	3	新型农村合作医疗	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
4	CV02.01.204	4	公务员医疗补助	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
5	CV02.01.204	5	企业补充医疗保险	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
6	CV02.01.204	6	大额补充医疗保险	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
7	CV02.01.204	7	商业医疗保险	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
8	CV02.01.204	99	其他	99	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
9	CV02.01.205	1	户籍住址	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
10	CV02.01.205	2	工作场所地址	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
11	CV02.01.205	3	家庭常住住址	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
12	CV02.01.205	4	通讯地址	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
13	CV02.01.205	5	暂住地址	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
14	CV02.01.205	6	出生地址	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
15	CV02.01.205	7	产后修养地址	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
16	CV02.01.205	8	变迁地址	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
17	CV02.01.205	9	现住址	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
18	CV02.01.205	99	其他地址	99	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
19	CV04.50.020	1	阴性	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
20	CV04.50.020	2	阳性	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
21	CV04.50.020	3	不详	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
22	CV04.50.020	4	未查	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
23	CV04.50.021	1	红细胞	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
24	CV04.50.021	2	全血	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
25	CV04.50.021	3	血小板	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
26	CV04.50.021	4	血浆	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
27	CV04.50.021	5	冷沉淀	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
28	CV04.50.021	6	机采浓缩白细胞悬液	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
29	CV04.50.021	9	其他	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
30	CV04.50.021	11	浓缩红细胞	11	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
31	CV04.50.021	12	滤白红细胞	12	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
32	CV04.50.021	13	红细胞悬液	13	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
33	CV04.50.021	14	洗涤红细胞	14	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
34	CV04.50.021	15	冰冻红细胞	15	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
35	CV04.50.021	16	冰冻解冻去甘油红细胞	16	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
36	CV04.50.021	17	Rh阴性悬浮红细胞	17	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
37	CV04.50.021	21	滤白全血	21	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
38	CV04.50.021	22	重组全血	22	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
39	CV04.50.021	23	Rh阴性全血	23	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
40	CV04.50.021	31	手工分离浓缩血小板	31	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
41	CV04.50.021	32	机采血小板	32	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
42	CV04.50.021	33	滤白机采血小板	33	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
43	CV04.50.021	34	冷冻机采血小板	34	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
44	CV04.50.021	41	新鲜液体血浆	41	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
45	CV04.50.021	42	新鲜冰冻血浆	42	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
46	CV04.50.021	43	普通冰冻血浆	43	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
47	CV04.50.021	44	滤白病毒灭活冰冻血浆	44	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
48	CV04.50.021	45	滤白新鲜冰冻血浆	45	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
49	CV04.50.021	46	滤白普通冰冻血浆	46	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
50	CV04.50.021	51	滤白冷沉淀	51	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
51	CV05.01.040	1	发热	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
52	CV05.01.040	2	过敏	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
53	CV05.01.040	3	溶血	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
54	CV05.01.040	9	其他	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
55	CV05.10.021	1	I	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
56	CV05.10.021	2	n	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
57	CV05.10.021	3	m	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
58	CV05.10.021	4	w	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
59	CV05.10.021	5	V	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
60	CV05.10.024	1	一级手术	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
61	CV05.10.024	2	二级手术	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
62	CV05.10.024	3	三级手术	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
63	CV05.10.024	4	四级手术	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
64	CV06.00.103	1	全身麻醉	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
65	CV06.00.103	2	椎管内麻醉	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
66	CV06.00.103	3	局部麻醉	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
67	CV06.00.103	4	复合麻醉	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
68	CV06.00.103	9	其他麻醉方法	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
69	CV06.00.103	11	吸入麻醉	11	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
70	CV06.00.103	12	静脉麻醉	12	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
71	CV06.00.103	13	基础麻醉	13	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
72	CV06.00.103	21	蛛网膜下腔阻滞麻醉	21	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
73	CV06.00.103	22	硬脊膜外腔阻滞麻醉	22	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
74	CV06.00.103	31	神经丛阻滞麻醉	31	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
75	CV06.00.103	32	神经节阻滞麻醉	32	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
76	CV06.00.103	33	神经阻滞麻醉	33	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
77	CV06.00.103	34	区域阻滞麻醉	34	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
78	CV06.00.103	35	局部浸润麻醉	35	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
79	CV06.00.103	36	表面麻醉	36	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
80	CV06.00.103	41	静吸复合麻醉	41	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
81	CV06.00.103	42	针药复合麻醉	42	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
82	CV06.00.103	43	神经丛与硬膜外阻滞复合麻醉	43	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
83	CV06.00.103	44	全麻复合全身降温	44	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
84	CV06.00.103	45	全麻复合控制性降压	45	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
85	CV06.00.223	1	仰卧位	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
86	CV06.00.223	2	俯卧位	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
87	CV06.00.223	3	左侧卧位	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
88	CV06.00.223	4	右侧卧位	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
89	CV06.00.223	5	截石位	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
90	CV06.00.223	6	屈氏位	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
91	CV06.00.223	9	其他	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
92	CV06.00.227	1	双侧鼻孔	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
93	CV06.00.227	2	臀部	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
94	CV06.00.227	3	左臂	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
95	CV06.00.227	4	左前胸	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
96	CV06.00.227	5	左肘前窝	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
97	CV06.00.227	6	左三角肌	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
98	CV06.00.227	7	左耳	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
99	CV06.00.227	8	左外颈	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
100	CV06.00.227	9	左足	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
101	CV06.00.227	10	左臀中肌	10	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
102	CV06.00.227	11	左手	11	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
103	CV06.00.227	12	左内颈	12	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
104	CV06.00.227	13	左下腹	13	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
105	CV06.00.227	14	左下臂	14	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
106	CV06.00.227	15	左中臂	15	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
107	CV06.00.227	16	左侧鼻孔	16	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
108	CV06.00.227	17	左后胸	17	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
109	CV06.00.227	18	左锁骨下	18	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
110	CV06.00.227	19	左大腿	19	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
111	CV06.00.227	20	左上臂	20	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
112	CV06.00.227	21	左上腹	21	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
113	CV06.00.227	22	左腹侧臀肌	22	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
114	CV06.00.227	23	左股外肌	23	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
115	CV06.00.227	24	右眼	24	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
116	CV06.00.227	25	左眼	25	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
117	CV06.00.227	26	双眼	26	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
118	CV06.00.227	27	肛门	27	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
119	CV06.00.227	28	会阴	28	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
120	CV06.00.227	29	右臂	29	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
121	CV06.00.227	30	右前胸	30	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
122	CV06.00.227	31	右肘前窝	31	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
123	CV06.00.227	32	右侧三角肌	32	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
124	CV06.00.227	33	右耳	33	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
125	CV06.00.227	34	右外颈	34	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
126	CV06.00.227	35	右足	35	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
127	CV06.00.227	36	右臀中肌	36	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
128	CV06.00.227	37	右手	37	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
129	CV06.00.227	38	右内颈	38	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
130	CV06.00.227	39	右下腹	39	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
131	CV06.00.227	40	右下臂	40	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
132	CV06.00.227	41	右中臂	41	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
133	CV06.00.227	42	右后胸	42	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
134	CV06.00.227	43	右锁骨下	43	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
135	CV06.00.227	44	右大腿	44	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
136	CV06.00.227	45	右上臂	45	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
137	CV06.00.227	46	右上腹	46	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
138	CV06.00.227	47	右腹侧臀肌	47	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
139	CV06.00.227	48	右股外侧肌	48	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
140	CV06.00.227	99	其他	99	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
141	CV06.00.228	1	bid	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
142	CV06.00.228	2	biw	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
143	CV06.00.228	3	Hs	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
144	CV06.00.228	4	ql2h	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
145	CV06.00.228	5	qlh	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
146	CV06.00.228	6	q3h	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
147	CV06.00.228	7	q6h	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
148	CV06.00.228	8	q8h	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
149	CV06.00.228	9	qd	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
150	CV06.00.228	10	qid	10	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
151	CV06.00.228	11	qod	11	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
152	CV06.00.228	12	qw	12	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
153	CV06.00.228	13	St	13	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
154	CV06.00.228	99	其他	99	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
155	CV06.00.229	1	药品类医嘱	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
156	CV06.00.229	2	检查类医嘱	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
157	CV06.00.229	3	检验类医嘱	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
158	CV06.00.229	4	手术类医嘱	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
159	CV06.00.229	5	处置类医嘱	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
160	CV06.00.229	6	材料类医嘱	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
161	CV06.00.229	7	嘱托医嘱	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
162	CV06.00.229	8	输血类医嘱	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
163	CV06.00.229	99	其他医嘱	99	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
248	WT01.01.002	34	布朗族	34	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
164	CV07.10.005	1	城镇职工基本医疗保险	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
165	CV07.10.005	2	城镇居民基本医疗保险	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
166	CV07.10.005	3	新型农村合作医疗	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
167	CV07.10.005	4	贫困救助	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
168	CV07.10.005	5	商业医疗保险	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
169	CV07.10.005	6	全公费	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
170	CV07.10.005	7	全自费	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
171	CV07.10.005	8	其他社会保险	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
172	CV07.10.005	99	其他	99	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
173	CV09.00.404	1	门诊	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
174	CV09.00.404	2	急诊	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
175	CV09.00.404	3	住院	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
176	CV09.00.404	9	其他	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
177	EMR01.01.001	1	治愈	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
178	EMR01.01.001	2	好转	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
179	EMR01.01.001	3	未愈	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
180	EMR01.01.001	4	死亡	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
181	EMR01.01.001	5	其他	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
182	EMR01.01.002	1	是	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
183	EMR01.01.002	2	否	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
184	EMR01.01.003	1	无	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
185	EMR01.01.003	2	有	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
186	EMR01.01.004	1	阳性	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
187	EMR01.01.004	2	阴性	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
188	EMR01.01.004	3	未做	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
189	EMR01.01.005	1	伤口裂开、出血或者血肿	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
190	EMR01.01.005	2	手术过程中异物遗留	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
191	EMR01.01.005	3	医源性气胸	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
192	EMR01.01.005	4	医源性撕裂伤	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
193	EMR01.01.005	6	肺部感染	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
194	EMR01.01.005	7	肺栓塞	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
195	EMR01.01.005	8	深静脉血栓	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
196	EMR01.01.005	9	髋关节血栓	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
197	EMR01.01.005	10	生理与代谢絮乱	10	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
198	EMR01.01.005	11	呼吸衰竭	11	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
199	EMR01.01.005	12	败血症	12	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
200	EMR01.01.005	90	其他	90	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
201	EMR01.01.006	1	0期	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
202	EMR01.01.006	2	Ⅰ期	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
203	EMR01.01.006	3	Ⅱ期	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
204	EMR01.01.006	4	Ⅲ期	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
205	EMR01.01.006	5	Ⅳ期	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
206	EMR01.01.006	6	不详	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
207	WT01.01.000	1	身份证	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
208	WT01.01.000	2	军官证	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
209	WT01.01.000	3	港澳台居民通行证	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
210	WT01.01.000	4	护照	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
211	WT01.01.001	0	未知的性别	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
212	WT01.01.001	1	男	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
213	WT01.01.001	2	女	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
214	WT01.01.001	9	未说明的性别	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
215	WT01.01.002	01	汉族	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
216	WT01.01.002	02	蒙古族	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
217	WT01.01.002	03	回族	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
218	WT01.01.002	04	藏族	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
219	WT01.01.002	05	维吾尔族	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
220	WT01.01.002	06	苗族	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
221	WT01.01.002	07	彝族	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
222	WT01.01.002	08	壮族	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
223	WT01.01.002	09	布依族	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
224	WT01.01.002	10	朝鲜族	10	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
225	WT01.01.002	11	满族	11	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
226	WT01.01.002	12	侗族	12	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
227	WT01.01.002	13	瑶族	13	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
228	WT01.01.002	14	白族	14	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
229	WT01.01.002	15	土家族	15	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
230	WT01.01.002	16	哈尼族	16	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
231	WT01.01.002	17	哈萨克族	17	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
232	WT01.01.002	18	傣族	18	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
233	WT01.01.002	19	黎族	19	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
234	WT01.01.002	20	傈僳族	20	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
235	WT01.01.002	21	佤族	21	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
236	WT01.01.002	22	畲族	22	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
237	WT01.01.002	23	高山族	23	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
238	WT01.01.002	24	拉祜族	24	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
239	WT01.01.002	25	水族	25	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
240	WT01.01.002	26	东乡族	26	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
241	WT01.01.002	27	纳西族	27	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
242	WT01.01.002	28	景颇族	28	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
243	WT01.01.002	29	柯尔克孜	29	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
244	WT01.01.002	30	土族	30	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
245	WT01.01.002	31	达斡尔族	31	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
246	WT01.01.002	32	仫佬族	32	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
247	WT01.01.002	33	羌族	33	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
249	WT01.01.002	35	撒拉族	35	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
250	WT01.01.002	36	毛南族	36	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
251	WT01.01.002	37	仡佬族	37	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
252	WT01.01.002	38	锡伯族	38	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
253	WT01.01.002	39	阿昌族	39	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
254	WT01.01.002	40	普米族	40	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
255	WT01.01.002	41	塔吉克族	41	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
256	WT01.01.002	42	怒族	42	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
257	WT01.01.002	43	乌孜别克	43	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
258	WT01.01.002	44	俄罗斯族	44	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
259	WT01.01.002	45	鄂温克族	45	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
260	WT01.01.002	46	崩龙族	46	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
261	WT01.01.002	47	保安族	47	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
262	WT01.01.002	48	裕固族	48	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
263	WT01.01.002	49	京族	49	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
264	WT01.01.002	50	塔塔尔族	50	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
265	WT01.01.002	51	独龙族	51	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
266	WT01.01.002	52	鄂伦春族	52	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
267	WT01.01.002	53	赫哲族	53	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
268	WT01.01.002	54	门巴族	54	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
269	WT01.01.002	55	珞巴族	55	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
270	WT01.01.002	56	基诺族	56	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
271	WT01.01.002	88	其他民族	57	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
272	WT01.01.002	99	外国籍	58	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
273	WT01.01.003	11	执业医师	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
274	WT01.01.003	12	执业助理医师	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
275	WT01.01.003	13	见习医师	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
276	WT01.01.003	21	注册护士	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
277	WT01.01.003	22	助产士	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
278	WT01.01.003	31	西药师（士）	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
279	WT01.01.003	32	中药师（士）	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
280	WT01.01.003	41	检验技师（士）	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
281	WT01.01.003	42	影像技师（士）	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
282	WT01.01.003	43	康复技师	10	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
283	WT01.01.003	44	其他技师	11	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
284	WT01.01.003	50	卫生监督员	12	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
285	WT01.01.003	60	乡村医生	13	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
286	WT01.01.003	69	其他卫生技术人员	14	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
287	WT01.01.003	70	其他技术人员	15	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
288	WT01.01.003	80	管理人员	16	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
289	WT01.01.003	90	工勤技能人员	17	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
290	WT01.01.004	1	临床	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
291	WT01.01.004	2	口腔	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
292	WT01.01.004	3	公共卫生	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
293	WT01.01.004	4	中医	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
294	WT01.01.005	ABW	阿鲁巴	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
295	WT01.01.005	AFG	阿富汗	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
296	WT01.01.005	AGO	安哥拉	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
297	WT01.01.005	AIA	安圭拉	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
298	WT01.01.005	ALB	阿尔巴尼亚	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
299	WT01.01.005	AND	安道尔	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
300	WT01.01.005	ANT	荷属安的列斯	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
301	WT01.01.005	ARE	阿联酋	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
302	WT01.01.005	ARG	阿根廷	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
303	WT01.01.005	ARM	亚美尼亚	10	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
304	WT01.01.005	ASM	美属萨摩亚	11	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
305	WT01.01.005	ATA	南极洲	12	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
306	WT01.01.005	ATF	法属南部领土	13	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
307	WT01.01.005	ATG	安提瓜和巴布达	14	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
308	WT01.01.005	AUS	澳大利亚	15	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
309	WT01.01.005	AUT	奥地利	16	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
310	WT01.01.005	AZE	阿塞拜疆	17	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
311	WT01.01.005	BDI	布隆迪	18	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
312	WT01.01.005	BEL	比利时	19	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
313	WT01.01.005	BEN	贝宁	20	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
314	WT01.01.005	BFA	布基纳法索	21	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
315	WT01.01.005	BGD	孟加拉国	22	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
316	WT01.01.005	BGR	保加利亚	23	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
317	WT01.01.005	BHR	巴林	24	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
318	WT01.01.005	BHS	巴哈马	25	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
319	WT01.01.005	BIH	波斯尼亚和黑塞哥维那	26	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
320	WT01.01.005	BLR	白俄罗斯	27	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
321	WT01.01.005	BLZ	伯利兹	28	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
322	WT01.01.005	BMU	百幕大	29	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
323	WT01.01.005	BOL	玻利维亚	30	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
324	WT01.01.005	BRA	巴西	31	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
325	WT01.01.005	BRB	巴巴多斯	32	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
326	WT01.01.005	BRN	文莱	33	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
327	WT01.01.005	BTN	不丹	34	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
328	WT01.01.005	BVT	布维岛	35	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
329	WT01.01.005	BWA	博茨瓦纳	36	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
330	WT01.01.005	CAF	中非	37	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
331	WT01.01.005	CAN	加拿大	38	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
332	WT01.01.005	CCK	科科斯群岛	39	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
333	WT01.01.005	CHE	瑞士	40	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
334	WT01.01.005	CHL	智利	41	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
335	WT01.01.005	CHN	中国	42	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
336	WT01.01.005	CIV	科特迪瓦	43	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
337	WT01.01.005	CMR	喀麦隆	44	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
338	WT01.01.005	COD	刚果民主共和国	45	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
339	WT01.01.005	COG	刚果	46	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
340	WT01.01.005	COK	库克群岛	47	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
341	WT01.01.005	COL	哥伦比亚	48	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
342	WT01.01.005	COM	科摩罗	49	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
343	WT01.01.005	CPV	佛得角	50	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
344	WT01.01.005	CRI	哥斯达黎加	51	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
345	WT01.01.005	CUB	古巴	52	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
346	WT01.01.005	CXR	圣诞岛	53	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
347	WT01.01.005	CYM	开曼群岛	54	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
348	WT01.01.005	CYP	塞浦路斯	55	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
349	WT01.01.005	CZE	捷克	56	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
350	WT01.01.005	DEU	德国	57	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
351	WT01.01.005	DJI	吉布提	58	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
352	WT01.01.005	DMA	多米尼加	59	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
353	WT01.01.005	DNK	丹麦	60	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
354	WT01.01.005	DOM	多米尼家共和国	61	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
355	WT01.01.005	DZA	阿尔及利亚	62	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
356	WT01.01.005	ECU	厄瓜多尔	63	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
357	WT01.01.005	EGY	埃及	64	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
358	WT01.01.005	ERI	厄立特里亚	65	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
359	WT01.01.005	ESH	西撒哈拉	66	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
360	WT01.01.005	ESP	西班牙	67	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
361	WT01.01.005	EST	爱沙尼亚	68	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
362	WT01.01.005	ETH	埃塞俄比亚	69	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
363	WT01.01.005	FIN	芬兰	70	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
364	WT01.01.005	FJI	斐济	71	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
365	WT01.01.005	FLK	马尔维纳斯群岛	72	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
366	WT01.01.005	FRA	法国	73	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
367	WT01.01.005	FRO	法罗群岛	74	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
368	WT01.01.005	FSM	密克罗尼西亚	75	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
369	WT01.01.005	GAB	加蓬	76	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
370	WT01.01.005	GBD	英国（独立领土公民、出国不用）	77	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
371	WT01.01.005	GBN	英国（海外国民，出国不用）	78	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
372	WT01.01.005	GBO	英国（海外公民，出国不用）	79	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
373	WT01.01.005	GBP	英国（保护公民，出国不用）	80	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
374	WT01.01.005	GBR	英国	81	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
375	WT01.01.005	GBS	英国（隶属，出国不用）	82	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
376	WT01.01.005	GEO	格鲁吉亚	83	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
377	WT01.01.005	GHA	加纳	84	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
378	WT01.01.005	GIB	直布罗陀	85	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
379	WT01.01.005	GIN	几内亚	86	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
380	WT01.01.005	GLP	瓜德罗普	87	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
381	WT01.01.005	GMB	冈比亚	88	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
382	WT01.01.005	GNB	几内亚比绍	89	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
383	WT01.01.005	GNQ	赤道几内亚	90	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
384	WT01.01.005	GRC	希腊	91	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
385	WT01.01.005	GRD	格林纳达	92	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
386	WT01.01.005	GRL	格陵兰	93	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
387	WT01.01.005	GTM	危地马拉	94	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
388	WT01.01.005	GUF	法属圭亚那	95	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
389	WT01.01.005	GUM	关岛	96	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
390	WT01.01.005	GUY	圭亚那	97	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
391	WT01.01.005	HMD	赫德岛和麦克唐纳岛	98	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
392	WT01.01.005	HND	洪都拉斯	99	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
393	WT01.01.005	HRV	克罗地亚	100	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
394	WT01.01.005	HTI	海地	101	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
395	WT01.01.005	HUN	匈牙利	102	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
396	WT01.01.005	IDN	印度尼西亚	103	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
397	WT01.01.005	IND	印度	104	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
398	WT01.01.005	IOT	英属印度洋领土	105	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
399	WT01.01.005	IRL	爱尔兰	106	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
400	WT01.01.005	IRN	伊朗	107	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
401	WT01.01.005	IRQ	伊拉克	108	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
402	WT01.01.005	ISL	冰岛	109	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
403	WT01.01.005	ISR	以色列	110	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
404	WT01.01.005	ITA	意大利	111	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
405	WT01.01.005	JAM	牙买加	112	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
406	WT01.01.005	JOR	约旦	113	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
407	WT01.01.005	JPN	日本	114	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
408	WT01.01.005	JTN	约翰斯顿岛	115	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
409	WT01.01.005	KAZ	哈萨克斯坦	116	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
410	WT01.01.005	KEN	肯尼亚	117	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
411	WT01.01.005	KGZ	吉尔吉斯斯坦	118	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
412	WT01.01.005	KHM	柬埔寨	119	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
413	WT01.01.005	KIR	基里巴斯	120	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
414	WT01.01.005	KNA	圣基茨和尼维斯	121	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
415	WT01.01.005	KOR	韩国（南朝鲜）	122	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
416	WT01.01.005	KWT	科威特	123	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
417	WT01.01.005	LAO	老挝	124	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
418	WT01.01.005	LBN	黎巴嫩	125	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
419	WT01.01.005	LBR	利比里亚	126	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
420	WT01.01.005	LBY	利比亚	127	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
421	WT01.01.005	LCA	圣卢西亚	128	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
422	WT01.01.005	LIE	列支敦土登	129	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
423	WT01.01.005	LKA	斯里兰卡	130	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
424	WT01.01.005	LSO	莱索托	131	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
425	WT01.01.005	LTU	立陶宛	132	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
426	WT01.01.005	LUX	卢森堡	133	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
427	WT01.01.005	LVA	拉脱维亚	134	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
428	WT01.01.005	MAR	摩洛哥	135	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
429	WT01.01.005	MCO	摩纳哥	136	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
430	WT01.01.005	MDA	摩尔多瓦	137	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
431	WT01.01.005	MDG	马达加斯加	138	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
432	WT01.01.005	MDV	马尔代夫	139	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
433	WT01.01.005	MEX	墨西哥	140	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
434	WT01.01.005	MHL	马绍尔群岛	141	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
435	WT01.01.005	MID	中途岛	142	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
436	WT01.01.005	MKD	马其顿	143	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
437	WT01.01.005	MLI	马里	144	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
438	WT01.01.005	MLT	马耳他	145	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
439	WT01.01.005	MMR	缅甸	146	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
440	WT01.01.005	MNG	蒙古	147	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
441	WT01.01.005	MNP	北马里亚纳	148	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
442	WT01.01.005	MOZ	莫桑比克	149	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
443	WT01.01.005	MRT	毛里塔尼亚	150	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
444	WT01.01.005	MSR	蒙特塞拉特	151	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
445	WT01.01.005	MTQ	马提尼克	152	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
446	WT01.01.005	MUS	毛里求斯	153	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
447	WT01.01.005	MWI	马拉维	154	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
448	WT01.01.005	MYS	马来西亚	155	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
449	WT01.01.005	MYT	马约特	156	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
450	WT01.01.005	NAM	纳米比亚	157	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
451	WT01.01.005	NCL	新喀里多尼亚	158	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
452	WT01.01.005	NER	尼日尔	159	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
453	WT01.01.005	NFK	诺福克岛	160	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
454	WT01.01.005	NGA	尼日利亚	161	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
455	WT01.01.005	NIC	尼加拉瓜	162	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
456	WT01.01.005	NIU	纽埃	163	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
457	WT01.01.005	NLD	荷兰	164	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
458	WT01.01.005	NOR	挪威	165	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
459	WT01.01.005	NPL	尼波尔	166	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
460	WT01.01.005	NRU	瑙鲁	167	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
461	WT01.01.005	NTZ	中间地带	168	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
462	WT01.01.005	NZL	新西兰	169	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
463	WT01.01.005	OMN	阿曼	170	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
464	WT01.01.005	PAK	巴基斯坦	171	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
465	WT01.01.005	PAN	巴拿马	172	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
466	WT01.01.005	PCN	皮特凯恩群岛	173	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
467	WT01.01.005	PER	秘鲁	174	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
468	WT01.01.005	PHL	菲律宾	175	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
469	WT01.01.005	PLW	贝劳	176	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
470	WT01.01.005	PNG	巴布亚新几内亚	177	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
471	WT01.01.005	POL	波兰	178	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
472	WT01.01.005	PRI	波多黎各	179	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
473	WT01.01.005	PRK	朝鲜	180	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
474	WT01.01.005	PRT	葡萄牙	181	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
475	WT01.01.005	PRY	巴拉圭	182	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
476	WT01.01.005	PST	巴勒斯坦	183	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
477	WT01.01.005	PYF	法属菠利尼西亚	184	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
478	WT01.01.005	QAT	卡塔尔	185	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
479	WT01.01.005	REU	留尼汪	186	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
480	WT01.01.005	ROM	罗马尼亚	187	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
481	WT01.01.005	RUS	俄罗斯	188	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
482	WT01.01.005	RWA	卢旺达	189	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
483	WT01.01.005	SAU	沙特阿拉伯	190	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
484	WT01.01.005	SDN	苏丹	191	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
485	WT01.01.005	SEN	塞内加尔	192	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
486	WT01.01.005	SGP	新加坡	193	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
487	WT01.01.005	SGS	南乔治亚岛和南桑德韦奇岛	194	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
488	WT01.01.005	SHN	圣赫勒拿	195	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
489	WT01.01.005	SJM	斯瓦尔巴群岛	196	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
490	WT01.01.005	SLB	所罗门群岛	197	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
491	WT01.01.005	SLE	塞拉利昂	198	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
492	WT01.01.005	SLV	萨尔瓦多	199	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
493	WT01.01.005	SMR	圣马力诺	200	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
494	WT01.01.005	SOM	索马里	201	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
495	WT01.01.005	SPM	圣皮埃尔和密克隆	202	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
496	WT01.01.005	SS	塞班	203	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
497	WT01.01.005	STP	圣多美和普林西比	204	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
498	WT01.01.005	SUR	苏里南	205	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
499	WT01.01.005	SVK	斯洛伐克	206	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
500	WT01.01.005	SVN	斯洛文尼亚	207	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
501	WT01.01.005	SWE	瑞典	208	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
502	WT01.01.005	SWZ	斯威士兰	209	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
503	WT01.01.005	SX	锡金	210	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
504	WT01.01.005	SF	塞尔维亚	211	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
505	WT01.01.005	SYC	塞舌尔	212	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
506	WT01.01.005	SYR	叙利亚	213	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
507	WT01.01.005	TCA	特克斯和凯科斯群岛	214	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
508	WT01.01.005	TCD	乍得	215	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
509	WT01.01.005	TGO	多哥	216	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
510	WT01.01.005	THA	泰国	217	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
511	WT01.01.005	TJK	塔吉克斯坦	218	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
512	WT01.01.005	TKL	托克劳	219	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
513	WT01.01.005	TKM	土库曼斯坦	220	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
514	WT01.01.005	TMP	东帝汶	221	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
515	WT01.01.005	TON	汤加	222	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
516	WT01.01.005	TTO	特立尼达和多巴哥	223	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
517	WT01.01.005	TUN	突尼斯	224	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
518	WT01.01.005	TUR	土耳其	225	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
519	WT01.01.005	TUV	图瓦卢	226	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
520	WT01.01.005	TZA	坦桑尼亚	227	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
521	WT01.01.005	UGA	乌干达	228	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
522	WT01.01.005	UKR	乌克兰	229	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
523	WT01.01.005	UMI	美属太平洋各群岛	230	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
524	WT01.01.005	UN	联合国	231	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
525	WT01.01.005	UNA	联合国	232	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
526	WT01.01.005	UNO	联合国	233	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
527	WT01.01.005	URY	乌拉圭	234	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
528	WT01.01.005	USA	美国	235	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
529	WT01.01.005	UZB	乌兹别克斯坦	236	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
530	WT01.01.005	VAT	梵蒂冈	237	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
531	WT01.01.005	VCT	圣文森特和格林纳丁斯	238	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
532	WT01.01.005	VEN	委内瑞拉	239	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
533	WT01.01.005	VGB	英属维尔京群岛	240	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
534	WT01.01.005	VIR	美属维尔京群岛	241	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
535	WT01.01.005	VNM	越南	242	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
536	WT01.01.005	VUT	瓦努阿图	243	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
537	WT01.01.005	WAK	威克岛	244	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
538	WT01.01.005	WLF	瓦利斯和富图纳群岛	245	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
539	WT01.01.005	WSM	西萨摩亚	246	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
540	WT01.01.005	XXA	无国籍（无国籍人）	247	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
541	WT01.01.005	XXB	无国籍（难民）	248	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
542	WT01.01.005	XXX	无国籍（未声明国籍）	249	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
543	WT01.01.005	YEM	也门	250	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
544	WT01.01.005	YUG	南斯拉夫	251	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
545	WT01.01.005	ZAF	南非	252	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
546	WT01.01.005	ZAR	扎伊尔	253	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
547	WT01.01.005	ZMB	赞比亚	254	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
548	WT01.01.005	ZWE	津巴布韦	255	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
549	WT01.01.005	ZZZ	国籍不详	256	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
550	WT01.01.006	11	国家公务员	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
551	WT01.01.006	13	专业技术人员	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
552	WT01.01.006	17	职员	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
553	WT01.01.006	21	企业管理人员	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
554	WT01.01.006	24	工人	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
555	WT01.01.006	27	农民	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
556	WT01.01.006	31	学生	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
557	WT01.01.006	37	现役军人	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
558	WT01.01.006	51	自由职业者	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
559	WT01.01.006	54	个体经营者	10	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
560	WT01.01.006	70	无业人员	11	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
561	WT01.01.006	80	退(离)休人员	12	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
562	WT01.01.006	90	其他	13	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
563	WT01.01.007	10	未婚	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
564	WT01.01.007	20	已婚	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
565	WT01.01.007	21	初婚	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
566	WT01.01.007	22	再婚	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
567	WT01.01.007	23	复婚	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
568	WT01.01.007	30	丧偶	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
569	WT01.01.007	40	离婚	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
570	WT01.01.007	90	其他	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
571	WT01.01.008	0	本人或户主	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
572	WT01.01.008	1	配偶	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
573	WT01.01.008	2	子	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
574	WT01.01.008	3	女	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
575	WT01.01.008	4	孙子、孙女或外孙子、外孙女	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
576	WT01.01.008	5	父母	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
577	WT01.01.008	6	祖父母或外祖父母	7	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
578	WT01.01.008	7	兄、弟、姐、妹	8	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
579	WT01.01.008	8	其他	9	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
580	WT01.01.009	1	急诊	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
581	WT01.01.009	2	门诊	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
582	WT01.01.009	3	其他医疗机构转入	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
583	WT01.01.009	9	其他	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
584	WT01.01.010	1	有	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
585	WT01.01.010	2	临床未确定	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
586	WT01.01.010	3	情况不明	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
587	WT01.01.010	4	无	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
588	WT01.01.011	1	A型	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
589	WT01.01.011	2	B型	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
590	WT01.01.011	3	O型	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
591	WT01.01.011	4	AB型	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
592	WT01.01.011	5	不详	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
593	WT01.01.011	6	未查	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
594	WT01.01.012	1	甲	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
595	WT01.01.012	2	乙	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
596	WT01.01.012	3	丙	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
597	WT01.01.014	1	0	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
598	WT01.01.014	2	Ⅰ	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
599	WT01.01.014	3	Ⅱ	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
600	WT01.01.014	4	Ⅲ	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
601	WT01.01.015	1	甲	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
602	WT01.01.015	2	乙	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
603	WT01.01.015	3	丙	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
604	WT01.01.015	9	未知	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
605	WT01.01.017	1	医嘱离院	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
606	WT01.01.017	2	医嘱转院	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
607	WT01.01.017	3	医嘱转社区卫生服务机构/乡镇卫生院	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
608	WT01.01.017	4	非医嘱离院	4	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
609	WT01.01.017	5	死亡	5	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
610	WT01.01.017	9	其他	6	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
611	WT01.01.018	1	无	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
612	WT01.01.018	2	有	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
613	WT01.01.019	1	中医	1	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
614	WT01.01.019	2	西医	2	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
615	WT01.01.019	3	否	3	0	1	\N	2026-03-25 18:48:24.927548	2026-03-25 18:48:24.927548
\.


--
-- Data for Name: medical_order; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.medical_order (id, order_code, visit_code, patient_code, doctor_code, order_type, order_status, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: exam_result; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.exam_result (id, order_code, report_content, image_url, report_time, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: lab_result; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.lab_result (id, order_code, result_json, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: medical_order_drug; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.medical_order_drug (id, order_code, drug_code, drug_name, dosage, frequency, route, days, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: medical_order_exam; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.medical_order_exam (id, order_code, exam_item_code, exam_item_name, exam_part, is_enhanced, clinical_purpose, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: medical_order_lab; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.medical_order_lab (id, order_code, lab_item_code, lab_item_name, specimen_type, clinical_diagnosis, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.patient (id, patient_code, patient_name, gender_code, birthday, id_card, phone, create_time, update_time) FROM stdin;
1774437162437	P1774437162241126	测试患者a	2	20180301	140102345601234567	13314232209	2026-03-25 19:12:42.474825	2026-03-25 19:12:42.474825
\.


--
-- Data for Name: registration; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.registration (id, reg_code, patient_code, dept_code, doctor_code, reg_date, time_slot, seq_no, reg_status, create_time, update_time) FROM stdin;
1774437306967	R2026032519150699024F854	P1774437162241126	DEPT001	DOC001	20260325	AM	\N	REGISTERED	2026-03-25 19:15:06.98881	2026-03-25 19:15:06.98881
1774532609531	R20260326214329593320BB9	P1774437162241126	DEPT003	DOC002	20260318	AM	\N	REGISTERED	2026-03-26 21:43:29.582226	2026-03-26 21:43:29.582226
\.


--
-- Data for Name: outpatient_visit_active; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.outpatient_visit_active (id, visit_code, reg_code, patient_code, dept_code, doctor_code, visit_type, visit_status, start_time, end_time, create_time, update_time) FROM stdin;
1	V20260325191506995494480	R2026032519150699024F854	P1774437162241126	DEPT001	DOC001	FIRST	IN_CONSULTATION	2026-03-25 19:15:06.98881	\N	2026-03-25 19:15:06.98881	2026-03-25 19:15:06.98881
2	V20260326214329601B77A99	R20260326214329593320BB9	P1774437162241126	DEPT003	DOC002	FIRST	IN_CONSULTATION	2026-03-26 21:43:29.582226	\N	2026-03-26 21:43:29.582226	2026-03-26 21:43:29.582226
\.


--
-- Data for Name: outpatient_encounter_data; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.outpatient_encounter_data (id, visit_code, encounter_json, create_time, update_time) FROM stdin;
1	V20260325191506995494480	{}	2026-03-25 19:15:06.98881	2026-03-25 19:15:06.98881
2	V20260326214329601B77A99	{"meta": {"source": "outpatient_doctor_station", "saved_at": "2026-03-27T07:20:58.896Z", "saved_by": "DOC002", "active_template_code": "OUTPATIENT_DEFAULT_XML_20260326"}, "version": "1.0", "diagnosis": {"items": [{"sort_no": 1, "diag_code": "A00", "diag_name": "霍乱", "pinyin_initials": "HL"}, {"sort_no": 2, "diag_code": "A01", "diag_name": "伤寒和副伤寒", "pinyin_initials": "SHHFSH"}], "primary": {"diag_code": "A00", "diag_name": "霍乱"}}, "visit_info": {"reg_code": "R20260326214329593320BB9", "dept_code": "DEPT003", "visit_code": "V20260326214329601B77A99", "visit_date": "", "visit_type": "FIRST", "doctor_code": "DOC002", "visit_status": "IN_CONSULTATION"}, "patient_info": {"id_card": "140102345601234567", "birthday": 20180301, "gender_code": "2", "patient_code": "P1774437162241126", "patient_name": "测试患者a"}, "template_xml": "\\n<XTextDocument xmlns:xsd=\\"http://www.w3.org/2001/XMLSchema\\" xmlns:xsi=\\"http://www.w3.org/2001/XMLSchema-instance\\" EditorVersionString=\\"1.0.0.0\\">\\n   <Attributes>\\n      <Attribute>\\n         <Name>DCLocalDataSource</Name>\\n         <Value>&lt;DataSourceDocument xmlns:xsi=\\"http://www.w3.org/2001/XMLSchema-instance\\" xmlns:xsd=\\"http://www.w3.org/2001/XMLSchema\\" ID=\\"DataSource\\" Name=\\"DataSource\\" Guid=\\"9c34a38d-a29b-4685-83f9-db43397b4d3a\\" Title=\\"\\"&gt;&lt;Parameters /&gt;&lt;Nodes /&gt;&lt;/DataSourceDocument&gt;</Value>\\n      </Attribute>\\n   </Attributes>\\n   <XElements>\\n      <Element xsi:type=\\"XTextHeader\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"9\\" />\\n            <Element xsi:type=\\"XInputField\\" StyleIndex=\\"1\\">\\n               <ID>机构名称</ID>\\n               <XElements>\\n                  <Element xsi:type=\\"XString\\" StyleIndex=\\"1\\">\\n                     <Text>AAAAA</Text>\\n                  </Element>\\n                  <Element xsi:type=\\"XString\\" StyleIndex=\\"2\\">\\n                     <Text>医院</Text>\\n                  </Element>\\n               </XElements>\\n               <Deleteable>false</Deleteable>\\n               <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n               <SpecifyWidth>1181.102</SpecifyWidth>\\n               <Alignment>Center</Alignment>\\n               <Name>机构名称</Name>\\n               <InnerValue>AAAAA医院</InnerValue>\\n               <BackgroundText>机构名称</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"12\\" />\\n            <Element xsi:type=\\"XString\\">\\n               <Text>科别：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>科别</ID>\\n               <Name>科别</Name>\\n               <BackgroundText>科别</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>     床号：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>床号</ID>\\n               <Name>床号</Name>\\n               <BackgroundText>床号</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>床    姓名：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>姓名YM</ID>\\n               <Name>姓名</Name>\\n               <BackgroundText>姓名</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"3\\">\\n               <Text>    住院号：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\" StyleIndex=\\"3\\">\\n               <ID>住院号</ID>\\n               <Name>住院号</Name>\\n               <BackgroundText>住院号</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"11\\" />\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextBody\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>入</Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"5\\">\\n               <Text> </Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>院</Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"5\\">\\n               <Text> </Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>记</Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"5\\">\\n               <Text> </Text>\\n            </Element>\\n            <Element xsi:type=\\"XString\\" StyleIndex=\\"4\\">\\n               <Text>录</Text>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"10\\" />\\n            <Element xsi:type=\\"XTextTable\\" NumOfRows=\\"6\\" NumOfColumns=\\"2\\">\\n               <ID>table1</ID>\\n               <XElements>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 姓名：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>姓名</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>Name333</BindingPath>\\n                                 </ValueBinding>\\n                                 <XElements>\\n                                    <Element xsi:type=\\"XString\\">\\n                                       <Text>1111</Text>\\n                                    </Element>\\n                                 </XElements>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>姓名</Name>\\n                                 <InnerValue>1111</InnerValue>\\n                                 <BackgroundText>姓名</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>出生地：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>出生地</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>BirthPlace</BindingPath>\\n                                 </ValueBinding>\\n                                 <XElements>\\n                                    <Element xsi:type=\\"XString\\">\\n                                       <Text>22222</Text>\\n                                    </Element>\\n                                 </XElements>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>出生地</Name>\\n                                 <InnerValue>22222</InnerValue>\\n                                 <BackgroundText>出生地</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 性别：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>性别</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>sex</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>性别</Name>\\n                                 <BackgroundText>性别</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DropdownList</EditStyle>\\n                                    <ListSource>\\n                                       <Items>\\n                                          <Item>\\n                                             <Text>男</Text>\\n                                             <Value>1</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>女</Text>\\n                                             <Value>2</Value>\\n                                          </Item>\\n                                       </Items>\\n                                    </ListSource>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>  </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>职业：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>职业</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>Job</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>职业</Name>\\n                                 <BackgroundText>职业</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 年龄：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>年龄</ID>\\n                                 <ValidateStyle>\\n                                    <Required>true</Required>\\n                                    <ValueType>Integer</ValueType>\\n                                    <CheckMaxValue>true</CheckMaxValue>\\n                                    <CheckMinValue>true</CheckMinValue>\\n                                    <MaxValue>120</MaxValue>\\n                                 </ValidateStyle>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>Age</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>年龄</Name>\\n                                 <BackgroundText>年龄</BackgroundText>\\n                                 <FieldSettings>\\n                                    <EditStyle>Numeric</EditStyle>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>岁</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>入院时间：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>入院时间</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>indate</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>入院时间</Name>\\n                                 <DisplayFormat>\\n                                    <Style>DateTime</Style>\\n                                    <Format>yyyy-MM-dd HH:mm:ss</Format>\\n                                 </DisplayFormat>\\n                                 <BackgroundText>入院时间</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DateTime</EditStyle>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 民族：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\" StyleIndex=\\"7\\">\\n                                 <ID>民族</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>mingzu</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>民族</Name>\\n                                 <BackgroundText>民族</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DropdownList</EditStyle>\\n                                    <ListSource>\\n                                       <Items>\\n                                          <Item>\\n                                             <Text>汉族</Text>\\n                                             <Value>01</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>蒙古族</Text>\\n                                             <Value>02</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>回族</Text>\\n                                             <Value>03</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>藏族</Text>\\n                                             <Value>04</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>维吾尔族</Text>\\n                                             <Value>05</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>苗族</Text>\\n                                             <Value>06</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>彝族</Text>\\n                                             <Value>07</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>壮族</Text>\\n                                             <Value>08</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>布依族</Text>\\n                                             <Value>09</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>朝鲜族</Text>\\n                                             <Value>10</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>满族</Text>\\n                                             <Value>11</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>侗族</Text>\\n                                             <Value>12</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>瑶族</Text>\\n                                             <Value>13</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>白族</Text>\\n                                             <Value>14</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>土家族</Text>\\n                                             <Value>15</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>哈尼族</Text>\\n                                             <Value>16</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>哈萨克族</Text>\\n                                             <Value>17</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>傣族</Text>\\n                                             <Value>18</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>黎族</Text>\\n                                             <Value>19</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>傈僳族</Text>\\n                                             <Value>20</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>佤族</Text>\\n                                             <Value>21</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>畲族</Text>\\n                                             <Value>22</Value>\\n                                          </Item>\\n                                       </Items>\\n                                    </ListSource>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\" StyleIndex=\\"7\\">\\n                                 <Text> </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>记录时间：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>记录时间</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>recorddate</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>记录时间</Name>\\n                                 <BackgroundText>记录时间</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DateTime</EditStyle>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 婚姻：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>婚姻</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>marriage</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>婚姻</Name>\\n                                 <BackgroundText>婚姻</BackgroundText>\\n                                 <EditorActiveMode>Program F2 MouseClick</EditorActiveMode>\\n                                 <FieldSettings>\\n                                    <EditStyle>DropdownList</EditStyle>\\n                                    <ListSource>\\n                                       <Items>\\n                                          <Item>\\n                                             <Text>未婚</Text>\\n                                             <Value>0</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>已婚</Text>\\n                                             <Value>1</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>离异</Text>\\n                                             <Value>2</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>丧偶</Text>\\n                                             <Value>3</Value>\\n                                          </Item>\\n                                          <Item>\\n                                             <Text>其他</Text>\\n                                             <Value>4</Value>\\n                                          </Item>\\n                                       </Items>\\n                                    </ListSource>\\n                                 </FieldSettings>\\n                              </Element>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>  </Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text>病史陈述者：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>病史陈述者</ID>\\n                                 <ValueBinding>\\n                                    <DataSource>EMR_Patients</DataSource>\\n                                    <BindingPath>patientname</BindingPath>\\n                                 </ValueBinding>\\n                                 <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n                                 <Name>病史陈述者</Name>\\n                                 <BackgroundText>病史陈述者</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableRow\\">\\n                     <XElements>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XString\\">\\n                                 <Text> 发病节气：</Text>\\n                              </Element>\\n                              <Element xsi:type=\\"XInputField\\">\\n                                 <ID>发病季节</ID>\\n                                 <Name>发病节气</Name>\\n                                 <BackgroundText>发病节气</BackgroundText>\\n                              </Element>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                        <Element xsi:type=\\"XTextTableCell\\" StyleIndex=\\"6\\">\\n                           <XElements>\\n                              <Element xsi:type=\\"XParagraphFlag\\" />\\n                           </XElements>\\n                        </Element>\\n                     </XElements>\\n                  </Element>\\n               </XElements>\\n               <Columns>\\n                  <Element xsi:type=\\"XTextTableColumn\\">\\n                     <Width>937.375</Width>\\n                  </Element>\\n                  <Element xsi:type=\\"XTextTableColumn\\">\\n                     <Width>957.375</Width>\\n                  </Element>\\n               </Columns>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"9\\" />\\n            <Element xsi:type=\\"XString\\">\\n               <Text>                                                     医师签名：</Text>\\n            </Element>\\n            <Element xsi:type=\\"XInputField\\">\\n               <ID>医师签名</ID>\\n               <MoveFocusHotKey>Tab</MoveFocusHotKey>\\n               <SpecifyWidth>236.22</SpecifyWidth>\\n               <Name>医师签名</Name>\\n               <BackgroundText>医师签名</BackgroundText>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"9\\" />\\n            <Element xsi:type=\\"XParagraphFlag\\" />\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooter\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>                                   第</Text>\\n            </Element>\\n            <Element xsi:type=\\"XPageInfo\\" StyleIndex=\\"8\\">\\n               <Width>85</Width>\\n               <AutoHeight>true</AutoHeight>\\n               <Height>62.734</Height>\\n               <FormatString>[%PageIndex%]</FormatString>\\n            </Element>\\n            <Element xsi:type=\\"XString\\">\\n               <Text>页</Text>\\n            </Element>\\n            <Element xsi:type=\\"XParagraphFlag\\" />\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextHeaderForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements>\\n            <Element xsi:type=\\"XParagraphFlag\\" StyleIndex=\\"0\\">\\n               <AutoCreate>true</AutoCreate>\\n            </Element>\\n         </XElements>\\n      </Element>\\n      <Element xsi:type=\\"XTextFooterForFirstPage\\">\\n         <AcceptTab>true</AcceptTab>\\n         <XElements />\\n      </Element>\\n   </XElements>\\n   <FileName>Test\\\\演示文档\\\\常规文档\\\\入院记录通用测试.xml</FileName>\\n   <FileFormat>XML</FileFormat>\\n   <ContentStyles>\\n      <Default xsi:type=\\"DocumentContentStyle\\">\\n         <FontName>宋体</FontName>\\n         <FontSize>12</FontSize>\\n      </Default>\\n      <Styles>\\n         <Style Index=\\"0\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"1\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>15</FontSize>\\n            <Bold>true</Bold>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"2\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>15</FontSize>\\n            <Bold>true</Bold>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"3\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <BorderLeft>true</BorderLeft>\\n            <BorderBottom>true</BorderBottom>\\n            <BorderTop>true</BorderTop>\\n            <BorderRight>true</BorderRight>\\n         </Style>\\n         <Style Index=\\"4\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>18</FontSize>\\n            <Bold>true</Bold>\\n         </Style>\\n         <Style Index=\\"5\\">\\n            <FontName>Times New Roman</FontName>\\n            <FontSize>18</FontSize>\\n            <Bold>true</Bold>\\n         </Style>\\n         <Style Index=\\"6\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <BorderWidth>1</BorderWidth>\\n            <PaddingLeft>15</PaddingLeft>\\n            <PaddingTop>10</PaddingTop>\\n            <PaddingRight>12.5</PaddingRight>\\n            <PaddingBottom>10</PaddingBottom>\\n         </Style>\\n         <Style Index=\\"7\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>10.5</FontSize>\\n         </Style>\\n         <Style Index=\\"8\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n         </Style>\\n         <Style Index=\\"9\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>Space1pt5</LineSpacingStyle>\\n         </Style>\\n         <Style Index=\\"10\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>Space1pt5</LineSpacingStyle>\\n            <Align>Center</Align>\\n         </Style>\\n         <Style Index=\\"11\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>SpaceMultiple</LineSpacingStyle>\\n            <LineSpacing>1.2</LineSpacing>\\n         </Style>\\n         <Style Index=\\"12\\">\\n            <FontName>宋体</FontName>\\n            <FontSize>12</FontSize>\\n            <LineSpacingStyle>SpaceMultiple</LineSpacingStyle>\\n            <LineSpacing>1.2</LineSpacing>\\n            <Align>Center</Align>\\n         </Style>\\n      </Styles>\\n   </ContentStyles>\\n   <DocumentContentVersion>2</DocumentContentVersion>\\n   <Info>\\n      <LicenseText>都昌:都昌WEB旗舰版演示</LicenseText>\\n      <CreationTime>1980-01-01T00:00:00+08:00</CreationTime>\\n      <LastModifiedTime>2026-03-27T15:20:58+08:00</LastModifiedTime>\\n      <LastPrintTime>1980-01-01T00:00:00+08:00</LastPrintTime>\\n      <Operator>DCSoft.Writer Version:1.2019.1.4</Operator>\\n      <NumOfPage>1</NumOfPage>\\n   </Info>\\n   <BodyText>入 院 记 录\\n\\n 姓名：1111  出生地：22222 \\n 性别：性别   职业：职业 \\n 年龄：年龄岁 入院时间：入院时间 \\n 民族：民族  记录时间：记录时间 \\n 婚姻：婚姻   病史陈述者：病史陈述者 \\n 发病节气：发病节气   \\n                                                     医师签名：医师签名\\n</BodyText>\\n   <PageSettings>\\n      <LeftMargin>95</LeftMargin>\\n      <RightMargin>95</RightMargin>\\n   </PageSettings>\\n</XTextDocument>", "clinical_notes": {"chief_complaint": "1111", "history_of_present_illness": "2222"}, "encounter_data": {"labs": [], "allergies": "", "diagnosis": "A00 霍乱；A01 伤寒和副伤寒", "examinations": [], "prescriptions": [], "chiefComplaint": "1111", "criticalValues": "", "diagnosisItems": [{"diag_code": "A00", "diag_name": "霍乱", "pinyin_initials": "HL"}, {"diag_code": "A01", "diag_name": "伤寒和副伤寒", "pinyin_initials": "SHHFSH"}], "historyOfPresentIllness": "2222"}}	2026-03-26 21:43:29.582226	2026-03-27 15:20:59.971254
\.


--
-- Data for Name: outpatient_visit_history; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.outpatient_visit_history (id, visit_code, reg_code, patient_code, dept_code, doctor_code, visit_type, visit_status, start_time, end_time, create_time, update_time, encounter_json, archived_at, archive_reason) FROM stdin;
\.


--
-- Data for Name: sys_login_log; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.sys_login_log (id, username, ip_addr, status, msg, login_time) FROM stdin;
\.


--
-- Data for Name: sys_menu; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.sys_menu (id, parent_id, name, type, path, component, perms, icon, sort_value, status, create_time, update_time, is_deleted) FROM stdin;
1	0	系统管理	1	/system	\N	\N	setting	100	1	2026-03-25 18:45:45.017166	2026-03-25 18:45:45.017166	0
2	1	用户管理	2	/system/user	system/user/index	system:user:list	user	1	1	2026-03-25 18:45:45.017166	2026-03-25 18:45:45.017166	0
3	1	角色管理	2	/system/role	system/role/index	system:role:list	peoples	2	1	2026-03-25 18:45:45.017166	2026-03-25 18:45:45.017166	0
4	1	菜单管理	2	/system/menu	system/menu/index	system:menu:list	tree-table	3	1	2026-03-25 18:45:45.017166	2026-03-25 18:45:45.017166	0
5	2	添加用户	3	\N	\N	system:user:add	\N	1	1	2026-03-25 18:45:45.017166	2026-03-25 18:45:45.017166	0
6	2	编辑用户	3	\N	\N	system:user:edit	\N	2	1	2026-03-25 18:45:45.017166	2026-03-25 18:45:45.017166	0
7	2	删除用户	3	\N	\N	system:user:delete	\N	3	1	2026-03-25 18:45:45.017166	2026-03-25 18:45:45.017166	0
8	3	添加角色	3	\N	\N	system:role:add	\N	1	1	2026-03-25 18:45:45.017166	2026-03-25 18:45:45.017166	0
9	3	编辑角色	3	\N	\N	system:role:edit	\N	2	1	2026-03-25 18:45:45.017166	2026-03-25 18:45:45.017166	0
10	3	删除角色	3	\N	\N	system:role:delete	\N	3	1	2026-03-25 18:45:45.017166	2026-03-25 18:45:45.017166	0
11	3	分配权限	3	\N	\N	system:role:assign	\N	4	1	2026-03-25 18:45:45.017166	2026-03-25 18:45:45.017166	0
\.


--
-- Data for Name: sys_oper_log; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.sys_oper_log (id, title, method, request_method, operator_type, oper_name, oper_url, oper_ip, oper_param, json_result, status, error_msg, oper_time) FROM stdin;
\.


--
-- Data for Name: sys_role; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.sys_role (id, role_name, role_code, description, status, create_time, update_time, is_deleted) FROM stdin;
2	普通用户	USER	普通用户权限	1	2026-03-25 18:45:45.016666	2026-03-25 18:45:45.016666	0
4	护士	NURSE	护士角色	1	2026-03-25 18:45:45.016666	2026-03-25 18:45:45.016666	0
1	超级管理员	ADMIN	拥有系统所有权限	1	2026-03-25 18:45:45.016666	2026-03-25 18:47:24.804354	0
3	医生	DOCTOR	医生角色	1	2026-03-25 18:45:45.016666	2026-03-25 18:47:24.804354	0
\.


--
-- Data for Name: sys_role_menu; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.sys_role_menu (id, role_id, menu_id, create_time) FROM stdin;
1	1	1	2026-03-25 18:45:45.017895
2	1	2	2026-03-25 18:45:45.017895
3	1	3	2026-03-25 18:45:45.017895
4	1	4	2026-03-25 18:45:45.017895
5	1	5	2026-03-25 18:45:45.017895
6	1	6	2026-03-25 18:45:45.017895
7	1	7	2026-03-25 18:45:45.017895
8	1	8	2026-03-25 18:45:45.017895
9	1	9	2026-03-25 18:45:45.017895
10	1	10	2026-03-25 18:45:45.017895
11	1	11	2026-03-25 18:45:45.017895
\.


--
-- Data for Name: sys_user_role; Type: TABLE DATA; Schema: public; Owner: emr_user
--

COPY public.sys_user_role (id, user_id, role_id, create_time) FROM stdin;
2	1	1	2026-03-25 18:47:24.807774
3	3	3	2026-03-25 18:47:24.808517
\.


--
-- Name: Access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public."Access_id_seq"', 38, true);


--
-- Name: Document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public."Document_id_seq"', 1, false);


--
-- Name: Function_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public."Function_id_seq"', 3, true);


--
-- Name: Request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public."Request_id_seq"', 3, true);


--
-- Name: Script_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public."Script_id_seq"', 3, true);


--
-- Name: doctor_favorite_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.doctor_favorite_template_id_seq', 1, false);


--
-- Name: doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.doctor_id_seq', 2, true);


--
-- Name: emr_data_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.emr_data_element_id_seq', 2591, true);


--
-- Name: emr_data_set_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.emr_data_set_element_id_seq', 2240, true);


--
-- Name: emr_data_set_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.emr_data_set_id_seq', 59, true);


--
-- Name: emr_icd10_diagnosis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.emr_icd10_diagnosis_id_seq', 200, true);


--
-- Name: emr_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.emr_record_id_seq', 2, true);


--
-- Name: emr_record_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.emr_record_version_id_seq', 9, true);


--
-- Name: emr_template_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.emr_template_department_id_seq', 17, true);


--
-- Name: emr_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.emr_template_id_seq', 18, true);


--
-- Name: emr_value_domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.emr_value_domain_id_seq', 38, true);


--
-- Name: emr_value_domain_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.emr_value_domain_item_id_seq', 615, true);


--
-- Name: exam_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.exam_result_id_seq', 1, false);


--
-- Name: lab_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.lab_result_id_seq', 1, false);


--
-- Name: medical_order_drug_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.medical_order_drug_id_seq', 1, false);


--
-- Name: medical_order_exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.medical_order_exam_id_seq', 1, false);


--
-- Name: medical_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.medical_order_id_seq', 1, false);


--
-- Name: medical_order_lab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.medical_order_lab_id_seq', 1, false);


--
-- Name: outpatient_encounter_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.outpatient_encounter_data_id_seq', 2, true);


--
-- Name: outpatient_visit_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.outpatient_visit_history_id_seq', 1, false);


--
-- Name: outpatient_visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.outpatient_visit_id_seq', 2, true);


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.patient_id_seq', 1, false);


--
-- Name: registration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.registration_id_seq', 1, false);


--
-- Name: sys_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.sys_department_id_seq', 1, true);


--
-- Name: sys_login_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.sys_login_log_id_seq', 1, false);


--
-- Name: sys_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.sys_menu_id_seq', 11, true);


--
-- Name: sys_oper_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.sys_oper_log_id_seq', 1, false);


--
-- Name: sys_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.sys_role_id_seq', 6, true);


--
-- Name: sys_role_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.sys_role_menu_id_seq', 11, true);


--
-- Name: sys_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.sys_user_id_seq', 4, true);


--
-- Name: sys_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emr_user
--

SELECT pg_catalog.setval('public.sys_user_role_id_seq', 3, true);


--
-- PostgreSQL database dump complete
--

\unrestrict FqZ8rbXauDCMn85yC15iBdXvwzKkfdb40dtQT3fIWN08I9LSkRNiDkkeGfzwgu2

