package com.ccy.emr.ai.tool;

import com.ccy.emr.ai.tool.runtime.FrontendToolInvoker;
import com.ccy.emr.ai.tool.runtime.FrontendToolInvokerHolder;
import com.ccy.emr.ai.tool.registry.MedicalToolProvider;
import com.fasterxml.jackson.databind.ObjectMapper;
import dev.langchain4j.agent.tool.Tool;
import org.springframework.stereotype.Component;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;

@Component
public class MedicalFrontendTools implements MedicalToolProvider {

    private final FrontendToolInvokerHolder invokerHolder;
    private final ObjectMapper objectMapper;

    public MedicalFrontendTools(FrontendToolInvokerHolder invokerHolder, ObjectMapper objectMapper) {
        this.invokerHolder = invokerHolder;
        this.objectMapper = objectMapper;
    }

    @Tool(name = "get_current_visit_context", value = "获取当前门诊就诊上下文，包括患者、就诊、医生、病历与医嘱概要")
    public String getCurrentVisitContext() {
        FrontendToolInvoker invoker = invokerHolder.currentInvoker().orElse(null);
        if (invoker == null) {
            return "{}";
        }
        try {
            String actionId = invokerHolder.currentToolCall()
                    .map(FrontendToolInvokerHolder.ToolCallContext::toolId)
                    .filter(id -> !id.isBlank())
                    .orElse(UUID.randomUUID().toString());
            Map<String, Object> payload = new LinkedHashMap<>();
            payload.put("need", "current_visit_context");
            Map<String, Object> result = invoker.invoke(actionId, "get_current_visit_context", payload, 20_000L);
            Object output = result.getOrDefault("output", result);
            return objectMapper.writeValueAsString(output);
        } catch (Exception e) {
            return "{\"error\":\"" + e.getMessage().replace("\"", "'") + "\"}";
        }
    }
}
