package com.ccy.emr.apijson;

import apijson.RequestMethod;
import apijson.framework.APIJSONParser;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * APIJSON 请求解析器
 *
 * @author CCY
 * @date 2026-01-27
 */
public class DemoParser extends APIJSONParser<Long, JSONObject, JSONArray> {

//    static {
//        // 放宽分页限制，允许翻页到 5000 页
//        MAX_PAGE = 5000;
//    }

    public DemoParser() {
        super();
    }

    public DemoParser(RequestMethod requestMethod) {
        super(requestMethod);
    }

    public DemoParser(RequestMethod requestMethod, boolean needVerify) {
        super(requestMethod, needVerify);
    }

    @Override
    public APIJSONParser<Long, JSONObject, JSONArray> setNeedVerify(boolean needVerify) {
        // 在 MVP 阶段，为了方便调试，如果要禁用权限校验，可以在这里放水
        // 比如 return super.setNeedVerify(false);
        // 但建议保留校验机制，通过配置表来控制
        return super.setNeedVerify(needVerify);
    }

    // 可以在这里重写 onVerify 等方法来自定义业务逻辑校验
}
