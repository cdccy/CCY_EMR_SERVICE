package com.ccy.emr.ai.controller;

import com.ccy.emr.ai.service.AiChatHistoryService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/ai/api")
public class AiHistoryController {

    private final AiChatHistoryService historyService;

    public AiHistoryController(AiChatHistoryService historyService) {
        this.historyService = historyService;
    }

    @GetMapping("/sessions")
    public Map<String, Object> sessions(@RequestParam(defaultValue = "20") int limit) {
        return Map.of(
                "success", true,
                "data", historyService.listSessions(limit),
                "returned", historyService.listSessions(limit).size()
        );
    }

    @GetMapping("/history")
    public Map<String, Object> history(@RequestParam(name = "session_id", required = false) String sessionId,
                                       @RequestParam(defaultValue = "50") int limit) {
        var data = historyService.listHistory(sessionId, limit);
        return Map.of(
                "success", true,
                "data", data,
                "returned", data.size(),
                "session_id", sessionId == null ? "" : sessionId
        );
    }
}
