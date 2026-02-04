package com.ccy.emr;

import apijson.framework.APIJSONApplication;
import apijson.framework.APIJSONCreator;
import apijson.framework.APIJSONFunctionParser;
import apijson.framework.APIJSONParser;
import apijson.framework.APIJSONSQLConfig;
import apijson.framework.APIJSONVerifier;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ccy.emr.apijson.DemoParser;
import com.ccy.emr.apijson.DemoSQLConfig;
import com.ccy.emr.apijson.DemoVerifier;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import jakarta.annotation.PostConstruct;

/**
 * CCY 电子病历管理系统启动类
 */
@SpringBootApplication
public class EmrApplication {

    public static void main(String[] args) {


        SpringApplication.run(EmrApplication.class, args);
        System.out.println("\n" +
                "  ______  ______  __   __     ______  __    __  ______    \n" +
                " /\\  ___\\/\\  ___\\/\\ \\ / /    /\\  ___\\/\\ \"-./  \\/\\  == \\   \n" +
                " \\ \\ \\___\\ \\ \\___\\ \\ \\'/     \\ \\  __\\\\ \\ \\-./\\ \\ \\  __<   \n" +
                "  \\ \\_____\\ \\_____\\ \\__|      \\ \\_____\\ \\_\\ \\ \\_\\ \\_\\ \\_\\ \n" +
                "   \\/_____/\\/_____/\\/_/        \\/_____/\\/_/  \\/_/\\/_/ /_/ \n" +
                "                                                          \n" +
                "  :: CCY EMR Service ::  (v1.0.0-SNAPSHOT)                \n" +
                "  :: 电子病历管理系统 ::                                    \n");
    }

    @PostConstruct
    public void init() {
        try {
            // 1. 初始化 JSON 解析器
            apijson.JSON.DEFAULT_JSON_PARSER = new apijson.JSONParser<JSONObject, JSONArray>() {
                @Override public JSONObject createJSONObject() { return new JSONObject(true); }
                @Override public JSONArray createJSONArray() { return new JSONArray(); }
                @Override public Object parse(Object obj) { return obj == null ? null : com.alibaba.fastjson.JSON.parse(obj.toString()); }
                @Override public JSONObject parseObject(Object obj) { return obj == null ? null : com.alibaba.fastjson.JSON.parseObject(obj.toString()); }
                @Override public <T> T parseObject(Object obj, Class<T> clazz) { return obj == null ? null : com.alibaba.fastjson.JSON.parseObject(obj.toString(), clazz); }
                @Override public JSONArray parseArray(Object obj) { return obj == null ? null : com.alibaba.fastjson.JSON.parseArray(obj.toString()); }
                @Override public <T> java.util.List<T> parseArray(Object obj, Class<T> clazz) { return obj == null ? null : com.alibaba.fastjson.JSON.parseArray(obj.toString(), clazz); }
                @Override public String toJSONString(Object obj, boolean prettyFormat) {
                    if (obj == null) return null;
                    return prettyFormat ? com.alibaba.fastjson.JSON.toJSONString(obj, com.alibaba.fastjson.serializer.SerializerFeature.PrettyFormat) : com.alibaba.fastjson.JSON.toJSONString(obj);
                }
            };

            // 2. APIJSON 核心初始化
            APIJSONApplication.DEFAULT_APIJSON_CREATOR = new APIJSONCreator<Long, JSONObject, JSONArray>() {
                @Override public APIJSONSQLConfig<Long, JSONObject, JSONArray> createSQLConfig() { return new DemoSQLConfig(); }
                @Override public APIJSONParser<Long, JSONObject, JSONArray> createParser() { return new DemoParser(); }
                @Override public APIJSONVerifier<Long, JSONObject, JSONArray> createVerifier() { return new DemoVerifier(); }
                @Override public APIJSONFunctionParser<Long, JSONObject, JSONArray> createFunctionParser() { return new APIJSONFunctionParser<>(); }
            };
            
            // 关键：强制设置表名映射，确保 DataSet 对应 emr_data_set
            APIJSONApplication.init(false);

            // 放宽最大查询条数

            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
