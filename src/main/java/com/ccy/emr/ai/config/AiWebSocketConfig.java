package com.ccy.emr.ai.config;

import com.ccy.emr.ai.ws.ChatWebSocketHandler;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

@Configuration
@EnableWebSocket
public class AiWebSocketConfig implements WebSocketConfigurer {

    private final ChatWebSocketHandler chatWebSocketHandler;
    private final int maxTextMessageBufferSize;
    private final int maxBinaryMessageBufferSize;

    public AiWebSocketConfig(ChatWebSocketHandler chatWebSocketHandler,
                             @Value("${app.ws.max-text-message-buffer-size:10485760}") int maxTextMessageBufferSize,
                             @Value("${app.ws.max-binary-message-buffer-size:10485760}") int maxBinaryMessageBufferSize) {
        this.chatWebSocketHandler = chatWebSocketHandler;
        this.maxTextMessageBufferSize = maxTextMessageBufferSize;
        this.maxBinaryMessageBufferSize = maxBinaryMessageBufferSize;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(chatWebSocketHandler, "/ai/ws/chat").setAllowedOriginPatterns("*");
    }

    @Bean
    public ServletServerContainerFactoryBean webSocketContainer() {
        ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
        container.setMaxTextMessageBufferSize(maxTextMessageBufferSize);
        container.setMaxBinaryMessageBufferSize(maxBinaryMessageBufferSize);
        return container;
    }
}
