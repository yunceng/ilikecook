package com.colleage.cook;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableTransactionManagement
@SpringBootApplication
@MapperScan(value = "com.colleage.cook.mapper")
public class LikeCookApplication {

    public static void main(String[] args) {
        SpringApplication.run(LikeCookApplication.class, args);
    }

}
