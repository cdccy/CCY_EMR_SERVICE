import requests
import json
import time

# =================配置区=================
API_URL = "https://editor.huimei.com/hmEditor/admin-service/datasource/ds/getDs"
# ========================================

def fetch_pages(start_page, end_page):
    all_items = []

    for page in range(start_page, end_page + 1):
        params = {
            "text": "",
            "pageSize": 10,
            "pageNo": page
        }
        print(f"🚀 正在抓取第 {page} 页...")

        try:
            response = requests.get(API_URL, params=params, timeout=10)
            if response.status_code == 200:
                res_json = response.json()
                data_root = res_json.get("data", {})

                target_list = []
                if isinstance(data_root, list):
                    target_list = data_root
                elif isinstance(data_root, dict):
                    # 自动探测列表键名
                    for key in ["list", "rows", "data", "content"]:
                        if isinstance(data_root.get(key), list):
                            target_list = data_root[key]
                            break

                if target_list:
                    # 取该页的前 10 条
                    page_items = target_list[:10]
                    all_items.extend(page_items)
                    print(f"   ✅ 已获取第 {page} 页的 {len(page_items)} 条记录")
                else:
                    print(f"   ⚠️ 第 {page} 页未找到数据，可能已超出最大范围。")
                    break
            else:
                print(f"   ❌ 第 {page} 页请求失败，状态码: {response.status_code}")
        except Exception as e:
            print(f"   🔥 第 {page} 页发生异常: {e}")

        time.sleep(0.3)

    return all_items

def generate_sql(items, filename):
    if not items:
        print("❌ 未抓取到任何数据，未生成 SQL 文件。")
        return

    with open(filename, "w", encoding="utf-8") as f:
        f.write(f"/* 电子病历数据元定义 - 初始化脚本 ({filename}) */\n")
        f.write("BEGIN;\n\n")

        for item in items:
            if not isinstance(item, dict): continue

            e_code = item.get("code", "")
            if not e_code: continue

            e_name = str(item.get("name", "")).replace("'", "''")
            e_desc = str(item.get("description", "")).replace("'", "''")
            s_type = item.get("type", "S1")
            v_format = item.get("format", "NONE")

            v_length = item.get("length")
            v_length_sql = str(v_length) if v_length and str(v_length).isdigit() else "NULL"

            v_domain = item.get("dictCode")
            v_domain_sql = f"'{v_domain}'" if v_domain else "NULL"

            sql = f"INSERT INTO emr_data_element (element_code, element_name, element_desc, storage_type, value_format, value_length, value_domain_code) VALUES ('{e_code}', '{e_name}', '{e_desc}', '{s_type}', '{v_format}', {v_length_sql}, {v_domain_sql}) ON CONFLICT (element_code) DO NOTHING;"

            f.write(sql + "\n")

        f.write("\nCOMMIT;")
    print(f"\n✨ 处理完成！共抓取 {len(items)} 条记录。")
    print(f"📄 SQL 文件已保存为: {filename}")

if __name__ == "__main__":
    try:
        print("--- 电子病历数据抓取工具 ---")
        start = int(input("请输入起始页码 (例如 1): "))
        end = int(input("请输入结束页码 (例如 5): "))

        if start > end:
            print("错误：起始页码不能大于结束页码！")
        else:
            # 动态生成符合要求的文件名
            target_filename = f"emr_data_element_init_{start}_{end}.sql"

            results = fetch_pages(start, end)
            generate_sql(results, target_filename)

    except ValueError:
        print("错误：请输入有效的整数页码！")