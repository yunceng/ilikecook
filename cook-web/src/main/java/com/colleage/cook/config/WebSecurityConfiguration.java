package com.colleage.cook.config;

import com.colleage.cook.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;

@Configuration
@EnableWebSecurity // 注解开启Spring Security的功能
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserInfoService userService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AccessDeniedHandler accessDeniedHandler(){
        return new AccessDeniedHandlerImpl();
    }

    @Autowired
    private AccessDeniedHandler accessDeniedHandler;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService)
                .passwordEncoder(passwordEncoder());
        System.out.println(passwordEncoder().encode("root"));
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/oauth/**", "/e/**", "index/", "login**").permitAll()
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .and().exceptionHandling().accessDeniedHandler(accessDeniedHandler)
                .and().csrf().disable()
                .httpBasic();

    }

    @Override
    public void configure(WebSecurity web) {
        web.ignoring().antMatchers("/favor.ioc");
    }
}
