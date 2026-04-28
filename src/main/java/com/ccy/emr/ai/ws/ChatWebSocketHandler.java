package com.ccy.emr.ai.ws;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.time.OffsetDateTime;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@Component
public class ChatWebSocketHandler extends TextWebSocketHandler {

    private final ObjectMapper objectMapper;
    private final WebSocketChatOrchestrator orchestrator;
    private final Map<String, ChatWebSocketSessionState> sessionStates = new ConcurrentHashMap<>();
    private final Map<String, WebSocketSession> sessionsById = new ConcurrentHashMap<>();
    private final Map<String, String> businessSessionToSocketId = new ConcurrentHashMap<>();
    private final ExecutorService executor = Executors.newCachedThreadPool();

    public ChatWebSocketHandler(ObjectMapper objectMapper, WebSocketChatOrchestrator orchestrator) {
        this.objectMapper = objectMapper;
        this.orchestrator = orchestrator;
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) {
        String sessionId = UUID.randomUUID().toString();
        ChatWebSocketSessionState state = new ChatWebSocketSessionState(sessionId);
        sessionStates.put(session.getId(), state);
        sessionsById.put(session.getId(), session);
        businessSessionToSocketId.put(sessionId, session.getId());
        send(session, Map.of("type", "session_info", "session_id", sessionId));
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) {
        ChatWebSocketSessionState state = sessionStates.get(session.getId());
        if (state == null) {
            send(session, msg("error", "content", "会话不存在"));
            return;
        }

        Map<String, Object> payload;
        try {
            payload = objectMapper.readValue(message.getPayload(), new TypeReference<>() {});
        } catch (Exception ex) {
            send(session, msg("error", "content", "消息格式错误，请传JSON"));
            return;
        }

        String type = String.valueOf(payload.getOrDefault("type", ""));
        switch (type) {
            case "set_session" -> handleSetSession(session, state, payload);
            case "ping" -> send(session, msg("pong", "timestamp", OffsetDateTime.now().toString()));
            case "tool_response", "client_action_result" -> handleToolResponse(session, state, payload);
            case "user_msg" -> handleUserMessage(session, state, payload);
            default -> send(session, msg("error", "content", "未知消息类型: " + type));
        }
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
        sessionStates.remove(session.getId());
        sessionsById.remove(session.getId());
        businessSessionToSocketId.entrySet().removeIf(entry -> session.getId().equals(entry.getValue()));
    }

    private void handleSetSession(WebSocketSession session,
                                  ChatWebSocketSessionState state,
                                  Map<String, Object> payload) {
        String requestedSessionId = String.valueOf(payload.getOrDefault("session_id", "")).trim();
        if (!StringUtils.hasText(requestedSessionId)) {
            send(session, msg("error", "content", "set_session 缺少有效的 session_id"));
            return;
        }
        String previousSessionId = state.businessSessionId();
        state.setBusinessSessionId(requestedSessionId);
        if (StringUtils.hasText(previousSessionId)) {
            String mappedSocketId = businessSessionToSocketId.get(previousSessionId);
            if (session.getId().equals(mappedSocketId)) {
                businessSessionToSocketId.remove(previousSessionId);
            }
        }
        businessSessionToSocketId.put(requestedSessionId, session.getId());
        send(session, Map.of("type", "session_info", "session_id", requestedSessionId));
    }

    private void handleUserMessage(WebSocketSession session,
                                   ChatWebSocketSessionState state,
                                   Map<String, Object> payload) {
        String userInput = String.valueOf(payload.getOrDefault("content", "")).trim();
        if (!StringUtils.hasText(userInput)) {
            send(session, msg("error", "content", "用户输入不能为空"));
            return;
        }
        executor.submit(() -> orchestrator.processUserMessage(session, state, userInput, evt -> send(session, evt)));
    }

    private void handleToolResponse(WebSocketSession session,
                                    ChatWebSocketSessionState state,
                                    Map<String, Object> payload) {
        String actionId = String.valueOf(payload.getOrDefault("action_id", "")).trim();
        if (!StringUtils.hasText(actionId)) {
            actionId = String.valueOf(payload.getOrDefault("tool_call_id", "")).trim();
        }
        if (!StringUtils.hasText(actionId)) {
            actionId = String.valueOf(payload.getOrDefault("tool_id", "")).trim();
        }
        if (!StringUtils.hasText(actionId)) {
            send(session, msg("error", "content", "client_action_result 缺少 action_id/tool_call_id/tool_id"));
            return;
        }
        boolean resolved = state.resolvePendingToolResponse(actionId, payload);
        if (!resolved) {
            send(session, msg("status", "content", "已接收工具结果，但未匹配到等待中的工具调用"));
        }
    }

    private Map<String, Object> msg(String type, String key, String value) {
        Map<String, Object> data = new LinkedHashMap<>();
        data.put("type", type);
        data.put(key, value);
        return data;
    }

    private void send(WebSocketSession session, Map<String, Object> payload) {
        if (session == null || !session.isOpen()) {
            return;
        }
        synchronized (session) {
            try {
                session.sendMessage(new TextMessage(objectMapper.writeValueAsString(payload)));
            } catch (IOException ignored) {
            }
        }
    }
}
