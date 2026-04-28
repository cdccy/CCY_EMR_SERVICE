package com.ccy.emr.ai.ws;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ccy.emr.ai.service.AiChatHistoryService;
import com.ccy.emr.ai.service.StreamingMedicalAssistant;
import com.ccy.emr.ai.tool.runtime.FrontendToolInvoker;
import com.ccy.emr.ai.tool.runtime.FrontendToolInvokerHolder;
import dev.langchain4j.agent.tool.ToolExecutionRequest;
import dev.langchain4j.service.TokenStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketSession;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;

@Service
public class WebSocketChatOrchestrator {

    private static final Logger log = LoggerFactory.getLogger(WebSocketChatOrchestrator.class);

    private final Optional<StreamingMedicalAssistant> assistant;
    private final AiChatHistoryService historyService;
    private final boolean llmEnabled;
    private final ObjectMapper objectMapper;
    private final FrontendToolInvokerHolder frontendToolInvokerHolder;

    public WebSocketChatOrchestrator(ObjectProvider<StreamingMedicalAssistant> assistantProvider,
                                     AiChatHistoryService historyService,
                                     ObjectMapper objectMapper,
                                     FrontendToolInvokerHolder frontendToolInvokerHolder,
                                     @Value("${app.llm.enabled:false}") boolean llmEnabled) {
        this.assistant = Optional.ofNullable(assistantProvider.getIfAvailable());
        this.historyService = historyService;
        this.objectMapper = objectMapper;
        this.frontendToolInvokerHolder = frontendToolInvokerHolder;
        this.llmEnabled = llmEnabled;
    }

    public void processUserMessage(WebSocketSession session,
                                   ChatWebSocketSessionState state,
                                   String userInput,
                                   Consumer<Map<String, Object>> sender) {
        if (!state.tryStartProcessing()) {
            sender.accept(msg("error", "content", "当前会话有消息处理中，请稍后再试"));
            return;
        }

        String runId = UUID.randomUUID().toString();
        StringBuilder answer = new StringBuilder();

        try {
            frontendToolInvokerHolder.bindInvoker(createFrontendToolInvoker(sender, state));
            sender.accept(msg("user_msg_received", "content", userInput));
            sender.accept(Map.of(
                    "type", "run_start",
                    "run_id", runId,
                    "session_id", state.businessSessionId(),
                    "content", "本轮请求开始"
            ));

            if (!llmEnabled || assistant.isEmpty()) {
                String fallback = "当前处于AI最小启动模式（未启用模型或模型未加载）。";
                sender.accept(msg("ai_response_start", "content", ""));
                sender.accept(msg("ai_response_chunk", "content", fallback));
                sender.accept(msg("ai_response_end", "content", fallback));
                sender.accept(Map.of(
                        "type", "run_end",
                        "run_id", runId,
                        "session_id", state.businessSessionId(),
                        "status", "success",
                        "finish_reason", "LLM_DISABLED",
                        "can_ask_next", true
                ));
                historyService.saveRound(state.businessSessionId(), userInput, fallback);
                logAiJson("ai_round_fallback", state.businessSessionId(), runId, userInput, fallback, "LLM_DISABLED");
                return;
            }

            CountDownLatch completion = new CountDownLatch(1);
            AtomicReference<String> errorRef = new AtomicReference<>(null);

            TokenStream stream = assistant.get().chat(state.businessSessionId(), userInput)
                    .beforeToolExecution(before -> {
                        ToolExecutionRequest request = before.request();
                        if (request == null) {
                            return;
                        }
                        String toolId = request.id() == null || request.id().isBlank()
                                ? UUID.randomUUID().toString()
                                : request.id();
                        frontendToolInvokerHolder.bindInvoker(createFrontendToolInvoker(sender, state));
                        frontendToolInvokerHolder.setCurrentToolCall(toolId, request.name());
                        sender.accept(Map.of(
                                "type", "tool_call_start",
                                "tool_call_id", toolId,
                                "tool_name", request.name() == null ? "" : request.name(),
                                "args", request.arguments() == null ? "" : request.arguments()
                        ));
                    })
                    .onToolExecuted(execution -> {
                        ToolExecutionRequest request = execution.request();
                        if (request == null) {
                            return;
                        }
                        String toolId = request.id() == null || request.id().isBlank()
                                ? frontendToolInvokerHolder.currentToolCall()
                                .map(FrontendToolInvokerHolder.ToolCallContext::toolId)
                                .orElse("")
                                : request.id();
                        String result = execution.result() == null ? "" : execution.result();
                        sender.accept(Map.of(
                                "type", "tool_call_end",
                                "tool_call_id", toolId,
                                "tool_name", request.name() == null ? "" : request.name(),
                                "is_error", execution.hasFailed(),
                                "output", result
                        ));
                        frontendToolInvokerHolder.clearCurrentToolCall();
                        frontendToolInvokerHolder.clearInvoker();
                    })
                    .onPartialResponse(chunk -> {
                        if (chunk == null || chunk.isEmpty()) {
                            return;
                        }
                        if (answer.isEmpty()) {
                            sender.accept(msg("ai_response_start", "content", ""));
                        }
                        answer.append(chunk);
                        logAiChunkJson(state.businessSessionId(), runId, chunk);
                        sender.accept(msg("ai_response_chunk", "content", chunk));
                    })
                    .onCompleteResponse(response -> {
                        sender.accept(msg("ai_response_end", "content", answer.toString()));
                        sender.accept(Map.of(
                                "type", "run_end",
                                "run_id", runId,
                                "session_id", state.businessSessionId(),
                                "status", "success",
                                "finish_reason", "STOP",
                                "can_ask_next", true
                        ));
                        completion.countDown();
                    })
                    .onError(err -> {
                        errorRef.set(err.getMessage());
                        sender.accept(msg("error", "content", "模型调用失败: " + err.getMessage()));
                        sender.accept(Map.of(
                                "type", "run_end",
                                "run_id", runId,
                                "session_id", state.businessSessionId(),
                                "status", "error",
                                "finish_reason", "ERROR",
                                "can_ask_next", true
                        ));
                        completion.countDown();
                    });

            stream.start();
            completion.await();

            if (errorRef.get() == null) {
                historyService.saveRound(state.businessSessionId(), userInput, answer.toString());
                logAiJson("ai_round_success", state.businessSessionId(), runId, userInput, answer.toString(), "STOP");
            }
        } catch (Exception ex) {
            sender.accept(msg("error", "content", "处理消息失败: " + ex.getMessage()));
            sender.accept(Map.of(
                    "type", "run_end",
                    "run_id", runId,
                    "session_id", state.businessSessionId(),
                    "status", "error",
                    "finish_reason", "EXCEPTION",
                    "can_ask_next", true
            ));
            logAiJson("ai_round_exception", state.businessSessionId(), runId, userInput, ex.getMessage(), "EXCEPTION");
        } finally {
            frontendToolInvokerHolder.clearCurrentToolCall();
            frontendToolInvokerHolder.clearInvoker();
            state.finishProcessing();
        }
    }

    private Map<String, Object> msg(String type, String key, String value) {
        Map<String, Object> data = new LinkedHashMap<>();
        data.put("type", type);
        data.put(key, value);
        return data;
    }

    private void logAiChunkJson(String sessionId, String runId, String chunk) {
        try {
            Map<String, Object> payload = new LinkedHashMap<>();
            payload.put("event", "ai_response_chunk");
            payload.put("session_id", sessionId);
            payload.put("run_id", runId);
            payload.put("chunk", chunk);
            log.info("AI_JSON {}", objectMapper.writeValueAsString(payload));
        } catch (Exception e) {
            log.warn("AI_JSON chunk serialize error: {}", e.getMessage());
        }
    }

    private void logAiJson(String event, String sessionId, String runId, String userInput, String aiResponse, String finishReason) {
        try {
            Map<String, Object> payload = new LinkedHashMap<>();
            payload.put("event", event);
            payload.put("session_id", sessionId);
            payload.put("run_id", runId);
            payload.put("user_input", userInput);
            payload.put("ai_response", aiResponse);
            payload.put("finish_reason", finishReason);
            log.info("AI_JSON {}", objectMapper.writeValueAsString(payload));
        } catch (Exception e) {
            log.warn("AI_JSON serialize error: {}", e.getMessage());
        }
    }

    private FrontendToolInvoker createFrontendToolInvoker(Consumer<Map<String, Object>> sender,
                                                           ChatWebSocketSessionState state) {
        return (actionId, actionName, payload, timeoutMs) -> {
            Map<String, Object> request = new LinkedHashMap<>();
            request.put("type", "client_action_request");
            request.put("action_id", actionId);
            request.put("tool_call_id", actionId);
            request.put("action_name", actionName);
            request.put("tool_id", actionId);
            request.put("tool_name", actionName);
            request.put("payload", payload == null ? Map.of() : payload);
            request.put("timeout_ms", timeoutMs);
            sender.accept(request);
            return state.awaitToolResponse(actionId, timeoutMs);
        };
    }
}
