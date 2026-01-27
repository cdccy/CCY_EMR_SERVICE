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

/**
 * CCY 电子病历管理系统启动类
 *
 * @author CCY
 * @date 2026-01-27
 */
@SpringBootApplication
public class EmrApplication {

    public static void main(String[] args) {
        try {
            // 1. 初始化 JSON 解析器 (APIJSON 8.0+ 必须)
            apijson.JSON.DEFAULT_JSON_PARSER = new apijson.JSONParser<JSONObject, JSONArray>() {
                @Override
                public JSONObject createJSONObject() {
                    return new JSONObject(true); // true 保持顺序
                }

                @Override
                public JSONArray createJSONArray() {
                    return new JSONArray();
                }

                @Override
                public Object parse(Object obj) {
                    if (obj == null)
                        return null;
                    return com.alibaba.fastjson.JSON.parse(obj.toString());
                }

                @Override
                public JSONObject parseObject(Object obj) {
                    if (obj == null)
                        return null;
                    return com.alibaba.fastjson.JSON.parseObject(obj.toString());
                }

                @Override
                public <T> T parseObject(Object obj, Class<T> clazz) {
                    if (obj == null)
                        return null;
                    return com.alibaba.fastjson.JSON.parseObject(obj.toString(), clazz);
                }

                @Override
                public JSONArray parseArray(Object obj) {
                    if (obj == null)
                        return null;
                    return com.alibaba.fastjson.JSON.parseArray(obj.toString());
                }

                @Override
                public <T> java.util.List<T> parseArray(Object obj, Class<T> clazz) {
                    if (obj == null)
                        return null;
                    return com.alibaba.fastjson.JSON.parseArray(obj.toString(), clazz);
                }

                @Override
                public String toJSONString(Object obj, boolean prettyFormat) {
                    if (obj == null)
                        return null;
                    if (prettyFormat) {
                        return com.alibaba.fastjson.JSON.toJSONString(obj,
                                com.alibaba.fastjson.serializer.SerializerFeature.PrettyFormat);
                    }
                    return com.alibaba.fastjson.JSON.toJSONString(obj);
                }
            };

            // 2. APIJSON 核心初始化
            APIJSONApplication.init(false); // false: 调试模式关闭，true: 调试模式开启 (生产环境建议 false)
            APIJSONApplication.DEFAULT_APIJSON_CREATOR = new APIJSONCreator<Long, JSONObject, JSONArray>() {
                @Override
                public APIJSONSQLConfig<Long, JSONObject, JSONArray> createSQLConfig() {
                    return new DemoSQLConfig();
                }

                @Override
                public APIJSONParser<Long, JSONObject, JSONArray> createParser() {
                    return new DemoParser();
                }

                @Override
                public APIJSONVerifier<Long, JSONObject, JSONArray> createVerifier() {
                    return new DemoVerifier();
                }

                @Override
                public APIJSONFunctionParser<Long, JSONObject, JSONArray> createFunctionParser() {
                    return new APIJSONFunctionParser<>();
                }
            };
        } catch (Exception e) {
            e.printStackTrace();
        }

        SpringApplication.run(EmrApplication.class, args);
        System.out.println("\n" +
                "  ______  ______  __   __     ______  __    __  ______    \n" +
                " /\\  ___\\/\\  ___\\/\\ \\ / /    /\\  ___\\/\\ \"-./  \\/\\  == \\   \n" +
                " \\ \\ \\___\\ \\ \\___\\ \\ \\'/     \\ \\  __\\\\ \\ \\-./\\ \\ \\  __<   \n" +
                "  \\ \\_____\\ \\_____\\ \\__|      \\ \\_____\\ \\_\\ \\ \\_\\ \\_\\ \\_\\ \n" +
                "   \\/_____/\\/_____/\\/_/        \\/_____/\\/_/  \\/_/\\/_/ /_/ \n" +
                "                                                          \n" +
                "  :: CCY EMR Service ::  (v1.0.0-SNAPSHOT)                \n" +
                "  :: 电子病历管理系统 ::                                    \n" +
                "\n" +
                "  Swagger UI: http://localhost:8080/api/swagger-ui.html   \n" +
                "  API Docs:   http://localhost:8080/api/v3/api-docs       \n");
    }
}
