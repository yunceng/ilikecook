package com.colleage.cook;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(value = "com.colleage.cook.mapper")
public class LikeCookApplication {

    public static void main(String[] args) {
        SpringApplication.run(LikeCookApplication.class, args);
    }

}
