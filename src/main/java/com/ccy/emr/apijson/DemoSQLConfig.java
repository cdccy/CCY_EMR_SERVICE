package com.ccy.emr.apijson;

import apijson.framework.APIJSONSQLConfig;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * APIJSON 数据库配置
 *
 * @author CCY
 * @date 2026-01-27
 */
public class DemoSQLConfig extends APIJSONSQLConfig<Long, JSONObject, JSONArray> {



    static {
        DEFAULT_DATABASE = DATABASE_POSTGRESQL; // 默认数据库类型
        DEFAULT_SCHEMA = "public"; // 默认 Schema
    }


    @Override
    public String gainDBVersion() {
        return "14.0"; // PostgreSQL 版本
    }

    @JSONField(serialize = false)
    @Override
    public String gainDBUri() {
        // 从配置文件中读取，或者硬编码 (MVP简化，建议后续从 application.yml 读取)
        return "jdbc:postgresql://39.106.26.4:5432/emr_db?currentSchema=public";
    }

    @JSONField(serialize = false)
    @Override
    public String gainDBAccount() {
        return "emr_user";
    }

    @JSONField(serialize = false)
    @Override
    public String gainDBPassword() {
        return "emr_password";
    }
    
    @JSONField(serialize = false)
    public String gainDBDriver() {
        return "org.postgresql.Driver";
    }
}