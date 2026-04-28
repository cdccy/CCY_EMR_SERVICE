package com.ccy.emr.ai.tool.runtime;

import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class FrontendToolInvokerHolder {

    private final ThreadLocal<FrontendToolInvoker> invokerHolder = new ThreadLocal<>();
    private final ThreadLocal<ToolCallContext> toolCallContextHolder = new ThreadLocal<>();

    public void bindInvoker(FrontendToolInvoker frontendToolInvoker) {
        invokerHolder.set(frontendToolInvoker);
    }

    public Optional<FrontendToolInvoker> currentInvoker() {
        return Optional.ofNullable(invokerHolder.get());
    }

    public void setCurrentToolCall(String toolId, String toolName) {
        toolCallContextHolder.set(new ToolCallContext(toolId, toolName));
    }

    public Optional<ToolCallContext> currentToolCall() {
        return Optional.ofNullable(toolCallContextHolder.get());
    }

    public void clearCurrentToolCall() {
        toolCallContextHolder.remove();
    }

    public void clearInvoker() {
        invokerHolder.remove();
        toolCallContextHolder.remove();
    }

    public record ToolCallContext(String toolId, String toolName) {
    }
}
