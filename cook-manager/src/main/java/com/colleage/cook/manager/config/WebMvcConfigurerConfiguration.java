package com.colleage.cook.manager.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @Classname WebMvcConfigurerConfiguration
 * @Description TODO
 * @Date 2019\4\24 0024
 * @Created by David
 */
@Configuration
public class WebMvcConfigurerConfiguration extends WebMvcConfigurerAdapter {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("*")
                .allowCredentials(true)
                .allowedHeaders("*")
                .allowedOrigins("http://localhost/")
                .allowedMethods("GET", "POST");

    }
}
