import requests
import time

# =========================================================
# 配置区：38个标准字典代码与名称
# =========================================================
dict_configs = [
    # 第一组 (20个)
    {"code": "CV02.01.204", "name": "医疗保险类别代码表"},
    {"code": "CV02.01.205", "name": "地址类别代码表"},
    {"code": "CV04.50.020", "name": "Rh(D)血型代码表"},
    {"code": "CV04.50.021", "name": "输血品种代码表"},
    {"code": "CV05.01.040", "name": "输血反应类型代码表"},
    {"code": "CV05.10.021", "name": "美国麻醉医师协会（ASA)分级标准代码表"},
    {"code": "CV05.10.024", "name": "手术级别代码表"},
    {"code": "CV06.00.103", "name": "麻醉方法代码表"},
    {"code": "CV06.00.223", "name": "手术体位代码表"},
    {"code": "CV06.00.227", "name": "操作部位代码表"},
    {"code": "CV06.00.228", "name": "药物使用频次代码表"},
    {"code": "CV06.00.229", "name": "医嘱项目类型代码表"},
    {"code": "CV07.10.005", "name": "医疗付费方式代码表"},
    {"code": "CV09.00.404", "name": "患者类型代码表"},
    {"code": "EMR01.01.001", "name": "出院情况"},
    {"code": "EMR01.01.002", "name": "是否"},
    {"code": "EMR01.01.003", "name": "有无"},
    {"code": "EMR01.01.004", "name": "检验结果（阴/阳）"},
    {"code": "EMR01.01.005", "name": "手术并发症名称代码表"},
    {"code": "EMR01.01.006", "name": "肿瘤（TNM）分期"},
    # 第二组 (18个)
    {"code": "WT01.01.000", "name": "身份证件类别"},
    {"code": "WT01.01.001", "name": "性别代码"},
    {"code": "WT01.01.002", "name": "民族代码"},
    {"code": "WT01.01.003", "name": "从事专业类别代码"},
    {"code": "WT01.01.004", "name": "医师执业类别代码"},
    {"code": "WT01.01.005", "name": "国籍代码"},
    {"code": "WT01.01.006", "name": "职业代码"},
    {"code": "WT01.01.007", "name": "婚姻状况代码"},
    {"code": "WT01.01.008", "name": "联系人关系代码"},
    {"code": "WT01.01.009", "name": "入院途径"},
    {"code": "WT01.01.010", "name": "入院病情代码"},
    {"code": "WT01.01.011", "name": "血型编码"},
    {"code": "WT01.01.012", "name": "病案质量"},
    {"code": "WT01.01.014", "name": "切口愈合等级"},
    {"code": "WT01.01.015", "name": "切口愈合类别"},
    {"code": "WT01.01.017", "name": "离院方式"},
    {"code": "WT01.01.018", "name": "有无"},
    {"code": "WT01.01.019", "name": "实施临床路径"}
]

API_BASE = "https://editor.huimei.com/hmEditor/admin-service/datasource/dict/getDictVerData?dictVerId="
SQL_FILE = "数据元值域（2张表初始化）.sql"

def main():
    print(f"开始生成 SQL，共计 {len(dict_configs)} 个字典项目...")

    with open(SQL_FILE, "w", encoding="utf-8") as f:
        f.write("-- 电子病历标准化字典数据导入\n")
        f.write("-- 生成日期: " + time.strftime("%Y-%m-%d %H:%M:%S") + "\n")
        f.write("BEGIN;\n\n")

        for i, cfg in enumerate(dict_configs, 1):
            code = cfg['code']
            name = cfg['name']

            print(f"[{i}/38] 正在抓取: {code} ({name})...", end="", flush=True)

            # 1. 写入父表 (emr_value_domain)
            f.write(f"-- 字典: {name}\n")
            f.write(f"INSERT INTO emr_value_domain (domain_code, domain_name, domain_type, status) \n")
            f.write(f"VALUES ('{code}', '{name}', 'ENUM', 1) ON CONFLICT (domain_code) DO NOTHING;\n")

            try:
                response = requests.get(API_BASE + code, timeout=10)
                if response.status_code == 200:
                    items = response.json().get('data', [])

                    if not items:
                        f.write(f"-- [提示] 该字典下无具体条目\n\n")
                        print(" (空数据)")
                        continue

                    # 2. 写入子表 (emr_value_domain_item)
                    f.write("INSERT INTO emr_value_domain_item (domain_code, item_code, item_name, item_order) VALUES\n")

                    rows = []
                    for item in items:
                        item_code = item.get('val', '')
                        # 处理单引号转义
                        item_name = item.get('description', '').replace("'", "''")
                        # 处理排序号，非数字转为 0
                        try:
                            order_raw = item.get('order', 0)
                            item_order = int(float(order_raw)) if order_raw != "" else 0
                        except:
                            item_order = 0

                        rows.append(f"('{code}', '{item_code}', '{item_name}', {item_order})")

                    f.write(",\n".join(rows))
                    f.write("\nON CONFLICT (domain_code, item_code) DO NOTHING;\n\n")
                    print(f" (成功，抓取到 {len(items)} 条)")
                else:
                    print(f" (失败，HTTP {response.status_code})")
            except Exception as e:
                print(f" (异常: {str(e)})")

            # 适当延时，保护对方服务器
            time.sleep(0.5)

        f.write("COMMIT;\n")

    print(f"\n✅ 全部完成！SQL 文件已生成至: {SQL_FILE}")

if __name__ == "__main__":
    main()