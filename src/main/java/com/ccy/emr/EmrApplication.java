package com.ccy.emr;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * CCY 电子病历管理系统启动类
 *
 * @author CCY
 * @date 2026-01-27
 */
@SpringBootApplication
public class EmrApplication {

    public static void main(String[] args) {
        SpringApplication.run(EmrApplication.class, args);
        System.out.println("\n" +
                "  ______  ______  __   __     ______  __    __  ______    \n" +
                " /\\  ___\\/\\  ___\\/\\ \\ / /    /\\  ___\\/\\ \"-./  \\/\\  == \\   \n" +
                " \\ \\ \\___\\ \\ \\___\\ \\ \\'/     \\ \\  __\\\\ \\ \\-./\\ \\ \\  __<   \n" +
                "  \\ \\_____\\ \\_____\\ \\__|      \\ \\_____\\ \\_\\ \\ \\_\\ \\_\\ \\_\\ \n" +
                "   \\/_____/\\/_____/\\/_/        \\/_____/\\/_/  \\/_/\\/_/ /_/ \n" +
                "                                                          \n" +
                "  :: CCY EMR Service ::  (v1.0.0-SNAPSHOT)                \n" +
                "  :: 电子病历管理系统 ::                                    \n" +
                "\n" +
                "  Swagger UI: http://localhost:8080/api/swagger-ui.html   \n" +
                "  API Docs:   http://localhost:8080/api/v3/api-docs       \n");
    }
}
