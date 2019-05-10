package com.colleage.cook.handler;

import com.colleage.cook.constants.CharacterConstants;
import com.colleage.cook.constants.HeaderConstants;
import com.colleage.cook.vo.SimpleUserInfo;
import com.colleage.cook.vo.UserInfo;
import com.colleage.cook.vo.WebResponseData;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static com.colleage.cook.constants.SessionAttributeKeyConstants.SESSION_USER;

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

        httpServletResponse.setContentType(HeaderConstants.CONTENT_TYPE);
        httpServletResponse.setHeader(HeaderConstants.ACCESS_CONTROL_ALLOW_ORIGIN, CharacterConstants.CHARACTER_ARBITRARILY);
        httpServletResponse.setHeader(HeaderConstants.ACCESS_CONTROL_EXPOSE_HEADERS, HeaderConstants.AUTHORIZATION);
        httpServletResponse.setHeader(HeaderConstants.AUTHORIZATION, httpServletRequest.getSession().getId());

        com.colleage.cook.domain.UserInfo user = ((UserInfo) authentication.getPrincipal()).getUser();
        SimpleUserInfo userInfo = new SimpleUserInfo(user.getId(), user.getUsername(), user.getNickname(), user.getAvatar());
        httpServletRequest.getSession().setAttribute(SESSION_USER, userInfo);

        PrintWriter out = httpServletResponse.getWriter();

        WebResponseData response = new WebResponseData(WebResponseData.Code.SUCCESS, WebResponseData.Message.SUCCESS, userInfo);
        out.write(response.toJSONString());
        out.flush();
        out.close();
    }
}
