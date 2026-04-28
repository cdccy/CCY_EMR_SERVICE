package com.ccy.emr.ai.service;

import org.springframework.stereotype.Service;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class AiChatHistoryService {

    private final Map<String, List<Map<String, Object>>> roundsBySession = new ConcurrentHashMap<>();

    public void saveRound(String sessionId, String userInput, String aiResponse) {
        Map<String, Object> row = new LinkedHashMap<>();
        row.put("session_id", sessionId);
        row.put("user_input", userInput);
        row.put("ai_response", aiResponse);
        row.put("created_at", OffsetDateTime.now().toString());
        roundsBySession.computeIfAbsent(sessionId, k -> new ArrayList<>()).add(row);
    }

    public List<Map<String, Object>> listSessions(int limit) {
        return roundsBySession.entrySet().stream()
                .sorted(Comparator.comparing(e -> e.getValue().size(), Comparator.reverseOrder()))
                .limit(limit)
                .map(e -> {
                    Map<String, Object> item = new LinkedHashMap<>();
                    item.put("session_id", e.getKey());
                    item.put("round_count", e.getValue().size());
                    return item;
                })
                .toList();
    }

    public List<Map<String, Object>> listHistory(String sessionId, int limit) {
        if (sessionId == null || sessionId.isBlank()) {
            return roundsBySession.values().stream().flatMap(List::stream).limit(limit).toList();
        }
        List<Map<String, Object>> rows = roundsBySession.getOrDefault(sessionId, List.of());
        int size = rows.size();
        int from = Math.max(0, size - limit);
        return rows.subList(from, size);
    }
}
