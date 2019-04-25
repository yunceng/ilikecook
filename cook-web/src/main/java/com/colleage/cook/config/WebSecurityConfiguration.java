package com.colleage.cook.config;

import com.colleage.cook.constants.HeaderConst;
import com.colleage.cook.constants.ViewConstants;
import com.colleage.cook.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.LoginUrlAuthenticationEntryPoint;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;

import javax.sql.DataSource;

/**
 * @Classname WebSecurityConfiguration
 * @Description 权限控制配置类
 * @Date 2019\4\15 0012
 * @Created by David
 */
@Configuration
@EnableWebSecurity // 注解开启Spring Security的功能
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserInfoService userService;

    @Autowired
    private DataSource dataSource;

    @Autowired
    private AuthenticationFailureHandler loginFailureHandler;

    @Autowired
    private AuthenticationSuccessHandler loginSuccessHandler;

    @Autowired
    private LogoutSuccessHandler logoutSuccessHandler;

    @Autowired
    private AccessDeniedHandler accessDeniedHandler;

    @Bean
    public LoginUrlAuthenticationEntryPoint authenticationEntryPoint() {
        return new LoginUrlAuthenticationEntryPoint(ViewConstants.LOGIN_REQUEST);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public JdbcTokenRepositoryImpl tokenRepository() {
        JdbcTokenRepositoryImpl j = new JdbcTokenRepositoryImpl();
        j.setDataSource(dataSource);
        return j;
    }

    @Autowired
    private JdbcTokenRepositoryImpl tokenRepository;

    @Autowired
    private AuthenticationEntryPoint authenticationEntryPoint;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/", "/index.html", "/login**",
                        "/oauth/**", "/register**", "/f/**", "/m/**", "/w/**").permitAll()
                .anyRequest().authenticated()
                .and().formLogin()
                .loginPage(ViewConstants.LOGIN_REQUEST).loginProcessingUrl("/login.do")
                .successHandler(loginSuccessHandler)
                .failureHandler(loginFailureHandler).permitAll()
                .and().logout().permitAll().invalidateHttpSession(true).clearAuthentication(true)
                .deleteCookies(HeaderConst.JESSIONID).logoutSuccessHandler(logoutSuccessHandler)
                .and().rememberMe().rememberMeParameter("remember").tokenValiditySeconds(3600 * 24).tokenRepository(tokenRepository)
                .and().exceptionHandling().accessDeniedHandler(accessDeniedHandler).authenticationEntryPoint(authenticationEntryPoint)
                .and().csrf().disable().httpBasic();
    }

    @Override
    public void configure(WebSecurity web) {
        web.ignoring().antMatchers("/favicon.ico", "/static/**");
    }
}
