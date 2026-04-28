package com.ccy.emr.ai.controller;

import com.ccy.emr.ai.tool.registry.MedicalToolRegistry;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/ai/api")
public class AiToolController {

    private final MedicalToolRegistry medicalToolRegistry;

    public AiToolController(MedicalToolRegistry medicalToolRegistry) {
        this.medicalToolRegistry = medicalToolRegistry;
    }

    @GetMapping("/tools")
    public Map<String, Object> tools() {
        return Map.of(
                "success", true,
                "data", medicalToolRegistry.listToolNames()
        );
    }
}
