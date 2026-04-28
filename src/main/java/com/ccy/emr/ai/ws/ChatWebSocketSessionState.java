package com.ccy.emr.ai.ws;

import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;

public class ChatWebSocketSessionState {

    private volatile String businessSessionId;
    private final AtomicBoolean processing = new AtomicBoolean(false);
    private final Map<String, CompletableFuture<Map<String, Object>>> pendingToolResponses = new ConcurrentHashMap<>();

    public ChatWebSocketSessionState(String businessSessionId) {
        this.businessSessionId = businessSessionId;
    }

    public String businessSessionId() {
        return businessSessionId;
    }

    public void setBusinessSessionId(String businessSessionId) {
        this.businessSessionId = businessSessionId;
    }

    public boolean tryStartProcessing() {
        return processing.compareAndSet(false, true);
    }

    public void finishProcessing() {
        processing.set(false);
    }

    public CompletableFuture<Map<String, Object>> registerPendingToolResponse(String actionId) {
        CompletableFuture<Map<String, Object>> future = new CompletableFuture<>();
        pendingToolResponses.put(actionId, future);
        return future;
    }

    public Map<String, Object> awaitToolResponse(String actionId, long timeoutMs) throws Exception {
        CompletableFuture<Map<String, Object>> future = pendingToolResponses.computeIfAbsent(actionId, k -> new CompletableFuture<>());
        try {
            return future.get(timeoutMs, TimeUnit.MILLISECONDS);
        } catch (TimeoutException e) {
            pendingToolResponses.remove(actionId);
            throw e;
        }
    }

    public boolean resolvePendingToolResponse(String actionId, Map<String, Object> payload) {
        CompletableFuture<Map<String, Object>> future = pendingToolResponses.remove(actionId);
        return future != null && future.complete(payload);
    }
}
