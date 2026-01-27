package com.ccy.emr.modules.health;

import com.ccy.emr.common.result.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * 健康检查控制器
 *
 * @author CCY
 * @date 2026-01-27
 */
@RestController
@Tag(name = "健康检查", description = "服务健康状态检查")
public class HealthController {

    @GetMapping("/health")
    @Operation(summary = "健康检查", description = "检查服务是否正常运行")
    public Result<Map<String, Object>> health() {
        Map<String, Object> data = new HashMap<>();
        data.put("status", "UP");
        data.put("service", "CCY EMR Service");
        data.put("version", "1.0.0");
        data.put("timestamp", LocalDateTime.now());
        return Result.ok(data);
    }
}
