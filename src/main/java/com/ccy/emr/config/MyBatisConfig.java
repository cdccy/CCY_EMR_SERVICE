package com.ccy.emr.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

/**
 * MyBatis配置类
 *
 * @author CCY
 * @date 2026-01-27
 */
@Configuration
@MapperScan("com.ccy.emr.modules.**.mapper")
public class MyBatisConfig {
    // MyBatis配置，自动扫描Mapper接口
}