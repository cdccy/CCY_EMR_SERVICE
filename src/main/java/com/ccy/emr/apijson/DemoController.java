package com.ccy.emr.apijson;

import apijson.RequestMethod;
import apijson.framework.APIJSONController;
import apijson.framework.APIJSONParser;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

/**
 * APIJSON 通用控制器
 * 提供通用的增删改查接口
 *
 * @author CCY
 * @date 2026-01-27
 */
@Slf4j
@RestController
@RequestMapping("/apijson") // 前端需要以此开头调用接口，例如 /apijson/get
public class DemoController extends APIJSONController<Long, JSONObject, JSONArray> {

    @Override
    public APIJSONParser<Long, JSONObject, JSONArray> newParser(HttpSession session, RequestMethod method) {
        APIJSONParser<Long, JSONObject, JSONArray> parser = super.newParser(session, method);
        parser.setNeedVerify(false); // 开启校验

        // 此处可以注入当前用户身份给 APIJSON，用于权限判断
        // 从 SecurityContext 或者 Header 获取用户 ID

        // 示例：这里只是占位，具体要在 Parser 中做更多逻辑
        // parser.setVisitorId(...);

        return parser;
    }

    /**
     * 增删改查统一入口
     *
     * @param method  请求方法 get/head/gets/heads/post/put/delete
     * @param request JSON 请求体
     * @param session HTTP Session
     * @return 结果 JSON
     */
    @PostMapping("/{method}")
    public String router(@PathVariable("method") String method, @RequestBody String request, HttpSession session) {
        return super.crud(method, request, session);
    }
}
