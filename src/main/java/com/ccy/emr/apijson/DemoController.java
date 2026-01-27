package com.ccy.emr.apijson;

import apijson.framework.APIJSONController;
import apijson.orm.Parser;
import com.ccy.emr.common.result.Result;
import com.ccy.emr.common.result.ResultCode;
import com.ccy.emr.common.util.JwtUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

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
public class DemoController extends APIJSONController<Long> {

    @Autowired
    private JwtUtil jwtUtil;

    @Override
    public Parser<Long> newParser(HttpSession session, RequestMethod method) {
        Parser<Long> parser = super.newParser(session, method);
        parser.setNeedVerify(true); // 开启校验

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
    @Override
    @PostMapping("/{method}")
    public String router(@PathVariable("method") String method, @RequestBody String request, HttpSession session) {
        return super.router(method, request, session);
    }
}
