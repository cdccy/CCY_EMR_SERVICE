package com.ccy.emr.ai.prompt;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;

@Component
public class MedicalPromptProvider {

    private volatile String cached;

    public String systemPrompt() {
        if (cached != null) {
            return cached;
        }
        try {
            ClassPathResource resource = new ClassPathResource("prompts/medical_assistant_system.txt");
            cached = new String(resource.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
        } catch (Exception e) {
            cached = "你是医院门诊AI医疗助手。请使用中文，回答简洁、准确、结构化。";
        }
        return cached;
    }
}
