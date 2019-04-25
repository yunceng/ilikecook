package com.colleage.cook.handler;

import com.colleage.cook.constants.CharacterConst;
import com.colleage.cook.constants.HeaderConst;
import com.colleage.cook.vo.WebResponseData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AccountStatusException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Classname SimpleLoginFailureHandler
 * @Description 登陆出错的处理器
 * @Date 2019\4\15 0015
 * @Created by David
 */
@Component(value = "loginFailureHandler")
public class SimpleLoginFailureHandler implements AuthenticationFailureHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(SimpleLoginFailureHandler.class);

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("登录失败", exception);
        }
        returnJson(response, exception);
    }

    /**
     * 直接返回需要返回的 json 数据
     */
    private void returnJson(HttpServletResponse response,
                            AuthenticationException exception) throws IOException {
        response.setCharacterEncoding(HeaderConst.UTF8);
        response.setContentType(HeaderConst.CONTENT_TYPE);
        response.setHeader(HeaderConst.ACCESS_CONTROL_ALLOW_ORIGIN, CharacterConst.CHARACTER_ARBITRARILY);
        PrintWriter out = response.getWriter();
        WebResponseData responseData = new WebResponseData(WebResponseData.Code.LOGIN_ERROR);
        if (exception instanceof UsernameNotFoundException || exception instanceof BadCredentialsException) {
            responseData.setMessage(WebResponseData.Message.LOGIN_PARAMS_ERROR);
        } else if (exception instanceof DisabledException) {
            responseData.setMessage(WebResponseData.Message.LOGIN_ERROR_DISABLE);
        } else if (exception instanceof AccountStatusException) {
            responseData.setMessage(WebResponseData.Message.USER_ACCOUNT_STATUS_ERROR);
        }
        out.write(responseData.toJSONString());
        out.flush();
        out.close();
    }
}
