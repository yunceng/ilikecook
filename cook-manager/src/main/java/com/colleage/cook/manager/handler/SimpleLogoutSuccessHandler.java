package com.colleage.cook.manager.handler;

import com.colleage.cook.constants.CharacterConstants;
import com.colleage.cook.constants.HeaderConstants;
import com.colleage.cook.vo.WebResponseData;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

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
//@Component("logoutSuccessHandler")
public class SimpleLogoutSuccessHandler implements LogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        httpServletResponse.setContentType(HeaderConstants.CONTENT_TYPE);
        httpServletResponse.setHeader(HeaderConstants.ACCESS_CONTROL_ALLOW_ORIGIN, CharacterConstants.CHARACTER_ARBITRARILY);
        PrintWriter out = httpServletResponse.getWriter();
        WebResponseData response = new WebResponseData(WebResponseData.Code.LOGOUT_SUCCESS, WebResponseData.Message.LOGOUT_SUCCESS);
        out.write(response.toJSONString());
        out.flush();
        out.close();
    }
}
