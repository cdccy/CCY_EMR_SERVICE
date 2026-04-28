package com.ccy.emr.ai.service;

import dev.langchain4j.service.MemoryId;
import dev.langchain4j.service.TokenStream;
import dev.langchain4j.service.UserMessage;

public interface StreamingMedicalAssistant {
    TokenStream chat(@MemoryId String sessionId, @UserMessage String userMessage);
}
