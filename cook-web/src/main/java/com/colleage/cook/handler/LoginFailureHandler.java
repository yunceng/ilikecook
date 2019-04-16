package com.colleage.cook.handler;

import com.alibaba.fastjson.JSONObject;
import com.colleage.cook.vo.WebResponseData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AccountStatusException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Classname LoginFailureHandler
 * @Description 登陆出错的处理器
 * @Date 2019\4\15 0015
 * @Created by David
 */
@Component(value = "loginFailureHandler")
public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(LoginFailureHandler.class);

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("登录失败", exception);
        }
        this.returnJson(response, exception);
    }

    /**
     * 直接返回需要返回的 json 数据
     */
    private void returnJson(HttpServletResponse response,
                            AuthenticationException exception) throws IOException {
        WebResponseData webResponseData = new WebResponseData();
        webResponseData.setCode(WebResponseData.Code.LOGIN_ERROR);
        if (exception instanceof UsernameNotFoundException || exception instanceof BadCredentialsException) {
            webResponseData.setMessage(WebResponseData.Message.USER_PASSWORD_ERROR);
        } else if (exception instanceof AccountStatusException) {
            webResponseData.setMessage(WebResponseData.Message.USER_ACCOUNT_STATUS_ERROR);
        }

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.getWriter().println(JSONObject.toJSONString(webResponseData));
    }
}
