package com.ccy.emr.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * Spring MVC 配置
 * 配置资源处理器，防止 API 请求被当作静态资源处理
 *
 * @author CCY
 * @date 2026-01-27
 */
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    /**
     * 配置资源处理器
     * 排除 API 路径，防止被当作静态资源处理
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 排除 APIJSON 相关路径
        registry.addResourceHandler("/apijson/**")
                .addResourceLocations("classpath:/static/")
                .setCachePeriod(3600);
        
        // 排除认证相关路径
        registry.addResourceHandler("/auth/**")
                .addResourceLocations("classpath:/static/")
                .setCachePeriod(3600);
        
        // 其他静态资源使用默认配置
        registry.addResourceHandler(
                "/css/**",
                "/js/**",
                "/images/**",
                "/img/**",
                "/fonts/**",
                "/favicon.ico"
        ).addResourceLocations(
                "classpath:/static/css/",
                "classpath:/static/js/",
                "classpath:/static/images/",
                "classpath:/static/img/",
                "classpath:/static/fonts/",
                "classpath:/static/"
        );
    }
}
