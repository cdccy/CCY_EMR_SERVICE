import requests
import time

# ================= 配置区 =================
# 使用你提供的最新接口地址
REF_API_URL = "https://editor.huimei.com/hmEditor/admin-service/datasource/set/getSetVerData?dictVerId={}"
OUTPUT_FILE = "emr_data_set_complete.sql"

# 补全后的 60 个数据集列表
dataset_list = [
    {"code": "S001.001", "name": "患者基本信息子集"},
    {"code": "S001.002", "name": "患者健康信息子集"},
    {"code": "S001.003", "name": "卫生事件摘要子集"},
    {"code": "S001.004", "name": "医疗费用记录子集"},
    {"code": "S002.001", "name": "门诊病历子集"},
    {"code": "S002.002", "name": "急诊留观病历子集"},
    {"code": "S003.001", "name": "西药处方子集"},
    {"code": "S003.002", "name": "中药处方子集"},
    {"code": "S004.001", "name": "检查记录子集"},
    {"code": "S004.002", "name": "检验记录子集"},
    {"code": "S005.001", "name": "治疗记录子集"},
    {"code": "S005.002", "name": "一般手术记录子集"},
    {"code": "S005.003", "name": "麻醉术前访视记录子集"},
    {"code": "S005.004", "name": "麻醉记录子集"},
    {"code": "S005.005", "name": "麻醉术后访视记录子集"},
    {"code": "S005.006", "name": "输血记录子集"},
    {"code": "S006.001", "name": "待产记录子集"},
    {"code": "S006.002", "name": "阴道分娩记录子集"},
    {"code": "S006.003", "name": "剖宫产手术记录子集"},
    {"code": "S007.001", "name": "一般护理记录子集"},
    {"code": "S007.002", "name": "病危（重）护理记录子集"},
    {"code": "S007.003", "name": "手术护理记录子集"},
    {"code": "S007.004", "name": "生命体征测量记录子集"},
    {"code": "S007.005", "name": "出入量记录子集"},
    {"code": "S007.006", "name": "高值耗材使用记录子集"},
    {"code": "S008.001", "name": "入院评估记录子集"},
    {"code": "S008.002", "name": "护理计划记录子集"},
    {"code": "S008.003", "name": "出院评估与指导记录子集"},
    {"code": "S009.001", "name": "手术同意书子集"},
    {"code": "S009.002", "name": "麻醉知情同意书子集"},
    {"code": "S009.003", "name": "输血治疗同意书子集"},
    {"code": "S009.004", "name": "特殊检查及特殊治疗同意书子集"},
    {"code": "S009.005", "name": "病危（重）通知书子集"},
    {"code": "S009.006", "name": "其他知情同意书子集"},
    {"code": "S010.001", "name": "住院病案首页子集"},
    {"code": "S011.001", "name": "中医住院病案首页子集"},
    {"code": "S012.001", "name": "入院记录子集"},
    {"code": "S012.002", "name": "24 h内入出院记录子集"},
    {"code": "S012.003", "name": "24 h内入院死亡记录子集"},
    {"code": "S013.000", "name": "住院病程记录子集"},
    {"code": "S013.002", "name": "日常病程记录子集"},
    {"code": "S013.003", "name": "上级医师查房记录子集"},
    {"code": "S013.004", "name": "疑难病例讨论子集"},
    {"code": "S013.005", "name": "交接班记录子集"},
    {"code": "S013.006", "name": "转科记录子集"},
    {"code": "S013.007", "name": "阶段小结子集"},
    {"code": "S013.008", "name": "抢救记录子集"},
    {"code": "S013.009", "name": "会诊记录子集"},
    {"code": "S013.010", "name": "术前小结子集"},
    {"code": "S013.011", "name": "术前讨论子集"},
    {"code": "S013.012", "name": "术后首次病程记录子集"},
    {"code": "S013.013", "name": "出院记录子集"},
    {"code": "S013.014", "name": "死亡记录子集"},
    {"code": "S013.015", "name": "死亡病例讨论记录子集"},
    {"code": "S014.001", "name": "住院医嘱子集"},
    {"code": "S015.001", "name": "出院小结子集"},
    {"code": "S016.001", "name": "转诊（院）记录子集"},
    {"code": "S017.001", "name": "医疗机构信息子集"},
    {"code": "S999.001", "name": "护理表单记录子集"},
    {"code": "Z999.001", "name": "其他数据集"}
]

def run_task():
    sql_statements = [
        "-- ========================================================",
        "-- 电子病历数据初始化 SQL (共 60 个数据集)",
        "-- 生成时间: " + time.strftime("%Y-%m-%d %H:%M:%S"),
        "-- ========================================================",
        "BEGIN;"
    ]

    count_success = 0

    for ds in dataset_list:
        ds_code = ds['code']
        ds_name = ds['name']

        print(f"📦 正在处理 [{count_success + 1}/60]: {ds_code} ({ds_name})...", end=" ")

        try:
            # 发起请求
            resp = requests.get(REF_API_URL.format(ds_code), timeout=15)
            res_data = resp.json()

            # 提取列表：res_data['data']['data']
            elements = res_data.get("data", {}).get("data", [])

            if isinstance(elements, list) and len(elements) > 0:
                # 1. 插入主表
                sql_statements.append(f"\n-- 数据集: {ds_code} {ds_name}")
                sql_statements.append(
                    f"INSERT INTO emr_data_set (dataset_code, dataset_name) "
                    f"VALUES ('{ds_code}', '{ds_name}') ON CONFLICT (dataset_code) DO NOTHING;"
                )

                # 2. 插入子表元素
                for index, item in enumerate(elements):
                    e_code = item.get("refCode") or item.get("code") # 容错处理
                    e_name = item.get("name")

                    if e_code:
                        # 转义名称中的单引号，防止 SQL 出错
                        safe_name = str(e_name).replace("'", "''")
                        sub_sql = (
                            f"INSERT INTO emr_data_set_element (dataset_code, element_code, element_name, display_order) "
                            f"VALUES ('{ds_code}', '{e_code}', '{safe_name}', {index + 1}) "
                            f"ON CONFLICT (dataset_code, element_code) DO NOTHING;"
                        )
                        sql_statements.append(sub_sql)

                print(f"✅ 成功抓取 {len(elements)} 条数据")
                count_success += 1
            else:
                print(f"⚠️ 接口返回为空 (Code: {ds_code})")

        except Exception as e:
            print(f"🔥 失败: {str(e)}")

        # 频率控制
        time.sleep(0.3)

    sql_statements.append("\nCOMMIT;")

    # 写入文件
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write("\n".join(sql_statements))

    print(f"\n✨ 处理完毕！")
    print(f"📈 成功处理: {count_success} 个数据集")
    print(f"💾 SQL 文件已保存在: {OUTPUT_FILE}")

if __name__ == "__main__":
    run_task()