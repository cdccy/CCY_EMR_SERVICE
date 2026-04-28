package com.ccy.emr.ai.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.OffsetDateTime;
import java.util.Map;

@RestController
@RequestMapping("/ai/api")
public class AiHealthController {

    @GetMapping("/health")
    public Map<String, Object> health() {
        return Map.of(
                "success", true,
                "data", Map.of(
                        "status", "UP",
                        "service", "emr-ai-assistant",
                        "time", OffsetDateTime.now().toString()
                )
        );
    }
}
