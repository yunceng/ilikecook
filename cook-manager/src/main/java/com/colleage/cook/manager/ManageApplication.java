package com.colleage.cook.manager;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @Classname ManageApplication
 * @Description 后台管理启动类
 * @Date 2019\4\25 0025
 * @Created by David
 */

@SpringBootApplication
@MapperScan("com.colleage.cook.manager.mapper")
@EnableTransactionManagement
public class ManageApplication {

    public static void main(String[] args) {
        SpringApplication.run(ManageApplication.class, args);
    }

}
