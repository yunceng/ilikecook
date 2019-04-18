package com.colleage.cook.handler;

import com.colleage.cook.constants.CharacterConst;
import com.colleage.cook.constants.HeaderConst;
import com.colleage.cook.vo.WebResponseData;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Classname SimpleLoginSuccessHandler
 * @Description 登录成功处理器
 * @Date 2019\4\18 0018
 * @Created by David
 */
@Component(value = "loginSuccessHandler")
public class SimpleLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        httpServletResponse.setContentType(HeaderConst.CONTENT_TYPE);
        httpServletResponse.setHeader(HeaderConst.ACCESS_CONTROL_ALLOW_ORIGIN, CharacterConst.CHARACTER_ARBITRARILY);
        PrintWriter out = httpServletResponse.getWriter();
        WebResponseData response = new WebResponseData();
        response.setCode(WebResponseData.Code.SUCCESS);
        response.setMessage(WebResponseData.Message.SUCCESS);
        out.write(response.toJSONString());
        out.flush();
        out.close();
    }
}
