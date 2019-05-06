package com.colleage.cook.handler;

import com.colleage.cook.constants.HeaderConst;
import com.colleage.cook.vo.WebResponseData;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Classname SimpleAccessDeniedHandler
 * @Description 权限检查被拒绝后的处理
 * @Date 2019\4\18 0018
 * @Created by David
 */
@Component("accessDeniedHandler")
public class SimpleAccessDeniedHandler implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AccessDeniedException e) throws IOException, ServletException {
        httpServletResponse.setCharacterEncoding(HeaderConst.UTF8);
        httpServletResponse.setContentType(HeaderConst.CONTENT_TYPE);
        httpServletResponse.setStatus(HttpServletResponse.SC_FORBIDDEN);
        PrintWriter writer = httpServletResponse.getWriter();
        WebResponseData webResponseData = WebResponseData.noPrivilege();
        writer.print(webResponseData.toJSONString());
        writer.flush();
        writer.close();
    }
}
