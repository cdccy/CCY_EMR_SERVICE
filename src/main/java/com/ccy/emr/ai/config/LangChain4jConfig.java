package com.ccy.emr.ai.config;

import com.ccy.emr.ai.prompt.MedicalPromptProvider;
import com.ccy.emr.ai.service.StreamingMedicalAssistant;
import com.ccy.emr.ai.tool.registry.MedicalToolRegistry;
import dev.langchain4j.memory.ChatMemory;
import dev.langchain4j.memory.chat.ChatMemoryProvider;
import dev.langchain4j.memory.chat.MessageWindowChatMemory;
import dev.langchain4j.model.chat.StreamingChatModel;
import dev.langchain4j.model.openai.OpenAiStreamingChatModel;
import dev.langchain4j.service.AiServices;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.StringUtils;

import java.time.Duration;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Configuration
public class LangChain4jConfig {

    @Bean
    @ConditionalOnProperty(prefix = "app.llm", name = "enabled", havingValue = "true")
    public StreamingChatModel streamingChatModel(
            @Value("${app.llm.base-url:}") String baseUrl,
            @Value("${app.llm.api-key:}") String apiKey,
            @Value("${app.llm.model:deepseek-chat}") String model,
            @Value("${app.llm.temperature:0.2}") Double temperature,
            @Value("${app.llm.timeout-seconds:60}") Integer timeoutSeconds
    ) {
        OpenAiStreamingChatModel.OpenAiStreamingChatModelBuilder builder = OpenAiStreamingChatModel.builder()
                .apiKey(apiKey)
                .modelName(model)
                .temperature(temperature)
                .timeout(Duration.ofSeconds(timeoutSeconds));
        if (StringUtils.hasText(baseUrl)) {
            builder.baseUrl(baseUrl);
        }
        return builder.build();
    }

    @Bean
    public ChatMemoryProvider chatMemoryProvider(@Value("${app.chat.memory-window:40}") Integer maxMessages) {
        Map<Object, ChatMemory> memories = new ConcurrentHashMap<>();
        return memoryId -> memories.computeIfAbsent(memoryId, ignored -> MessageWindowChatMemory.withMaxMessages(maxMessages));
    }

    @Bean
    @ConditionalOnProperty(prefix = "app.llm", name = "enabled", havingValue = "true")
    public StreamingMedicalAssistant streamingMedicalAssistant(StreamingChatModel streamingChatModel,
                                                               MedicalPromptProvider promptProvider,
                                                               ChatMemoryProvider chatMemoryProvider,
                                                               MedicalToolRegistry medicalToolRegistry) {
        return AiServices.builder(StreamingMedicalAssistant.class)
                .streamingChatModel(streamingChatModel)
                .chatMemoryProvider(chatMemoryProvider)
                .systemMessageProvider(memoryId -> promptProvider.systemPrompt())
                .tools(medicalToolRegistry.toolObjects())
                .build();
    }
}
