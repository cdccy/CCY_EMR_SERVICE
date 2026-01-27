package com.ccy.emr.apijson;

import apijson.framework.APIJSONVerifier;
import apijson.orm.AbstractVerifier;

/**
 * APIJSON 权限校验器
 *
 * @author CCY
 * @date 2026-01-27
 */
public class DemoVerifier extends APIJSONVerifier<Long> {

    static {
        // 设置校验配置，可以开启调试模式
        AbstractVerifier.IS_UPDATE_MUST_HAVE_ID = true; // 修改操作必须传id
    }

    // 可以重写 verify 方法进行更细粒度的校验
}
