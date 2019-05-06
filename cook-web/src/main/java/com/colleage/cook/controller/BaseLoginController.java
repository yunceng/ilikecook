package com.colleage.cook.controller;

import com.colleage.cook.service.UserInfoService;
import com.colleage.cook.vo.WebResponseData;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.servlet.http.HttpServletRequest;

import static com.colleage.cook.constants.ViewConstants.LOGIN_VIEW;
import static com.colleage.cook.constants.ViewConstants.REDIRECT_INDEX_REQUEST;

/**
 * @Classname BaseLoginController
 * @Description 登录请求的共用方法
 * @Date 2019\4\16 0016
 * @Created by David
 */
public class BaseLoginController {

    @Autowired
    protected UserInfoService userInfoService;

    @Autowired
    protected PasswordEncoder passwordEncoder;

    @Autowired
    protected AuthenticationManager authenticationManager;

    protected WebResponseData doLogin(HttpServletRequest request, String username, String password) {
        WebResponseData responseData = new WebResponseData();
        if (StringUtils.isNullOrEmpty(username) || StringUtils.isNullOrEmpty(password)) {
            responseData.setCode(WebResponseData.Code.LOGIN_ERROR);
            responseData.setMessage(WebResponseData.Message.LOGIN_PARAMS_NOT_NULL);
        }
        UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username,
                password);
        try {
            Authentication authenticate = authenticationManager.authenticate(authRequest);
            SecurityContextHolder.getContext().setAuthentication(authenticate);
            request.getSession().setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
            responseData = WebResponseData.success();
        } catch (AuthenticationException e) {
            responseData.setCode(WebResponseData.Code.LOGIN_ERROR);
            responseData.setMessage(WebResponseData.Message.LOGIN_PARAMS_ERROR);
        }
        return responseData;
    }

}
