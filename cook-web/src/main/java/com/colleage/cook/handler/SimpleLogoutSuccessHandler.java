package com.colleage.cook.handler;

import com.colleage.cook.constants.CharacterConst;
import com.colleage.cook.constants.HeaderConst;
import com.colleage.cook.vo.WebResponseData;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Classname SimpleLogoutSuccessHandler
 * @Description TODO
 * @Date 2019\4\18 0018
 * @Created by David
 */
@Component("logoutSuccessHandler")
public class SimpleLogoutSuccessHandler implements LogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        httpServletResponse.setContentType(HeaderConst.CONTENT_TYPE);
        httpServletResponse.setHeader(HeaderConst.ACCESS_CONTROL_ALLOW_ORIGIN, CharacterConst.CHARACTER_ARBITRARILY);
        PrintWriter out = httpServletResponse.getWriter();
        WebResponseData response = new WebResponseData();
        response.setCode(WebResponseData.Code.LOGOUT_SUCCESS);
        response.setMessage(WebResponseData.Message.LOGOUT_SUCCESS);
        out.write(response.toJSONString());
        out.flush();
        out.close();
    }
}
