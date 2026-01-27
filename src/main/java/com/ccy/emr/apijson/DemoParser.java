package com.ccy.emr.apijson;

import apijson.framework.APIJSONParser;
import com.alibaba.fastjson.JSONObject;

/**
 * APIJSON 请求解析器
 *
 * @author CCY
 * @date 2026-01-27
 */
public class DemoParser extends APIJSONParser<Long> {

    public DemoParser() {
        super();
    }

    public DemoParser(String requestMethod) {
        super(requestMethod);
    }

    public DemoParser(String requestMethod, boolean needVerify) {
        super(requestMethod, needVerify);
    }

    @Override
    public APIJSONParser<Long> setNeedVerify(boolean needVerify) {
        // 在 MVP 阶段，为了方便调试，如果要禁用权限校验，可以在这里放水
        // 比如 return super.setNeedVerify(false);
        // 但建议保留校验机制，通过配置表来控制
        return super.setNeedVerify(needVerify);
    }

    // 可以在这里重写 onVerify 等方法来自定义业务逻辑校验
}
