package com.ccy.emr.apijson;

import apijson.RequestMethod;
import apijson.framework.APIJSONController;
import apijson.framework.APIJSONParser;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ccy.emr.modules.system.entity.SysUser;
import com.ccy.emr.modules.system.service.SysUserService;
import java.util.List;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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

    @Autowired
    private SysUserService sysUserService;

    @Override
    public APIJSONParser<Long, JSONObject, JSONArray> newParser(HttpSession session, RequestMethod method) {
        APIJSONParser<Long, JSONObject, JSONArray> parser = super.newParser(session, method);
        // 关闭 APIJSON 权限/请求结构校验，按当前联调需求放开所有表访问
        parser.setNeedVerify(false);

        // 注入当前用户身份给 APIJSON
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (auth != null) {
                String username = null;
                Object principal = auth.getPrincipal();
                if (principal instanceof UserDetails) {
                    username = ((UserDetails) principal).getUsername();
                } else if (principal instanceof String) {
                    String name = ((String) principal).trim();
                    if (!name.isEmpty() && !"anonymousUser".equalsIgnoreCase(name)) {
                        username = name;
                    }
                } else if (auth.getName() != null && !auth.getName().isBlank()) {
                    String name = auth.getName().trim();
                    if (!"anonymousUser".equalsIgnoreCase(name)) {
                        username = name;
                    }
                }

                if (username != null) {
                    SysUser user = sysUserService.findByUsername(username);
                    if (user != null) {
                        parser.setVisitor(
                            new apijson.orm.Visitor<Long>() {
                                @Override
                                public Long getId() {
                                    return user.getId();
                                }

                                @Override
                                public List<Long> getContactIdList() {
                                    return null;
                                }
                            }
                        );
                    }
                }
            } else {
                // 如果没有认证信息，设置为 UNKNOWN 角色 (visitorId = null)
                // 这样 APIJSON 会将其识别为 UNKNOWN 角色
            }
        } catch (Exception e) {
            log.error("APIJSON 设置用户身份失败", e);
        }

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
