package com.ccy.emr.apijson;

import apijson.RequestMethod;
import apijson.framework.APIJSONController;
import apijson.framework.APIJSONParser;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ccy.emr.modules.system.entity.SysUser;
import com.ccy.emr.modules.system.service.SysUserService;
import java.util.List;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public APIJSONParser<Long, JSONObject, JSONArray> newParser(HttpSession session, RequestMethod method) {
        APIJSONParser<Long, JSONObject, JSONArray> parser = super.newParser(session, method);
        parser.setNeedVerify(true); // 开启校验

        // 注入当前用户身份给 APIJSON
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (auth != null && auth.getPrincipal() instanceof UserDetails) {
                String username = ((UserDetails) auth.getPrincipal()).getUsername();
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
        // APIJSON 内部 ADMIN 角色识别偶发不稳定，这里对 Patient 写操作做一次后端兜底鉴权
        if (isPatientWriteRequest(method, request) && !isCurrentUserAdmin()) {
            JSONObject denied = new JSONObject(true);
            denied.put("code", 403);
            denied.put("msg", "Patient 仅允许 ADMIN 角色进行新增/修改/删除");
            denied.put("ok", false);
            return denied.toJSONString();
        }

        // 兜底修复：APIJSON 对 PostgreSQL DATE 的 PUT 绑定有时会按 VARCHAR 传参导致报错。
        // 对 Patient 的 PUT 请求走显式 CAST(? AS DATE) 更新，避免 date/varchar 类型冲突。
        String upperMethod = method == null ? "" : method.toUpperCase();
        if ("PUT".equals(upperMethod)) {
            String patched = tryUpdatePatientWithDateCast(request);
            if (patched != null) {
                return patched;
            }
        }
        return super.crud(method, request, session);
    }

    private boolean isPatientWriteRequest(String method, String request) {
        String m = method == null ? "" : method.toUpperCase();
        if (!("POST".equals(m) || "PUT".equals(m) || "DELETE".equals(m))) {
            return false;
        }
        try {
            JSONObject body = JSON.parseObject(request);
            return body != null && body.containsKey("Patient");
        } catch (Exception ignored) {
            return false;
        }
    }

    private boolean isCurrentUserAdmin() {
        try {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            if (auth == null || !(auth.getPrincipal() instanceof UserDetails)) {
                return false;
            }
            String username = ((UserDetails) auth.getPrincipal()).getUsername();
            Integer count = jdbcTemplate.queryForObject(
                "SELECT COUNT(1) FROM sys_user u " +
                "JOIN sys_user_role ur ON ur.user_id = u.id " +
                "JOIN sys_role r ON r.id = ur.role_id " +
                "WHERE u.username = ? AND u.is_deleted = 0 AND r.is_deleted = 0 AND r.status = 1 AND r.role_code = 'ADMIN'",
                Integer.class,
                username
            );
            return count != null && count > 0;
        } catch (Exception e) {
            log.error("检查管理员角色失败", e);
            return false;
        }
    }

    private String tryUpdatePatientWithDateCast(String request) {
        try {
            JSONObject body = JSON.parseObject(request);
            if (body == null || !body.containsKey("Patient")) {
                return null;
            }
            JSONObject patient = body.getJSONObject("Patient");
            if (patient == null) {
                return null;
            }

            Long id = patient.getLong("id");
            if (id == null) {
                return null;
            }

            String birthday = patient.getString("birthday");
            // 仅在 birthday 为字符串时走兜底 SQL，其它情况仍交给 APIJSON 默认流程
            if (birthday == null || birthday.isBlank()) {
                return null;
            }

            int affected = jdbcTemplate.update(
                "UPDATE patient SET " +
                "patient_name = ?, gender_code = ?, birthday = CAST(? AS DATE), id_card = ?, phone = ?, update_time = now() " +
                "WHERE id = ?",
                patient.getString("patient_name"),
                patient.getString("gender_code"),
                birthday,
                patient.getString("id_card"),
                patient.getString("phone"),
                id
            );

            JSONObject result = new JSONObject(true);
            result.put("ok", affected > 0);
            result.put("code", affected > 0 ? 200 : 404);
            result.put("msg", affected > 0 ? "success" : "未找到要更新的数据");
            JSONObject p = new JSONObject(true);
            p.put("id", id);
            result.put("Patient", p);
            return result.toJSONString();
        } catch (Exception e) {
            log.error("Patient PUT 日期类型兜底更新失败", e);
            return null;
        }
    }
}
