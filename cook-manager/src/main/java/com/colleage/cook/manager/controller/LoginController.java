package com.colleage.cook.manager.controller;

import com.colleage.cook.constants.SystemInfoConstants;
import com.colleage.cook.domain.AdminInfo;
import com.colleage.cook.manager.constants.ViewConstants;
import com.colleage.cook.manager.service.AdminInfoService;
import com.colleage.cook.utils.constants.FileStorePathConstants;
import com.colleage.cook.vo.WebResponseData;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.View;
import java.io.File;
import java.io.IOException;

import static com.colleage.cook.constants.SessionAttributeKeyConstants.SESSION_CONTEXT;
import static com.colleage.cook.manager.constants.ViewConstants.*;

/**
 * @Classname LoginController
 * @Description 登录请求链接
 * @Date 2019\4\12 0012
 * @Created by David
 */
@Controller
public class LoginController {

    @Autowired
    protected AdminInfoService adminInfoService;

    @Autowired
    protected PasswordEncoder passwordEncoder;

    @Autowired
    protected AuthenticationManager authenticationManager;

    @GetMapping("login.html")
    public String login(HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String referer = request.getHeader("Referer");
        if (auth != null && !(auth instanceof AnonymousAuthenticationToken) && auth.isAuthenticated()) {
            return "redirect:" + (StringUtils.isNotBlank(referer) ? referer : INDEX_REQUEST);
        }
        return LOGIN_VIEW;
    }

    //自定义登录实现，不是用 loginSuccessHandler
    // 原请求信息的缓存及恢复
    private RequestCache requestCache = new HttpSessionRequestCache();
    @PostMapping("login.do")
    public String login(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap, String username, String password, String remember){
        if(StringUtils.isBlank(username) || StringUtils.isBlank(password)){
            modelMap.put("code", WebResponseData.Code.PARAM_NOT_NULL);
            modelMap.put("message", WebResponseData.Message.PARAM_NOT_NULL);
            return ViewConstants.LOGIN_VIEW;
        }
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(username, password);
        Authentication authenticate = authenticationManager.authenticate(authentication);
        SecurityContextHolder.getContext().setAuthentication(authenticate);
        request.getSession().setAttribute(SESSION_CONTEXT, SecurityContextHolder.getContext());

        //跳转到用户之前制定的页面或者默认页面
        SavedRequest savedRequest = requestCache.getRequest(request, response);
        if (savedRequest == null) {
            return ViewConstants.INDEX_VIEW;
        } else {
            return savedRequest.getRedirectUrl();
        }
    }

    @GetMapping("createAdmin.html")
    public String register() {
        return REGISTER_VIEW;
    }

    @PostMapping("createAdmin.do")
    public String register(HttpServletRequest request, @RequestParam(required = false) String username,
                           @RequestParam(required = false) String nickname,
                           @RequestParam(required = false) String email,
                           @RequestParam(required = false) String password) {

        AdminInfo adminInfo = new AdminInfo();

        adminInfo.setUsername(username);
        adminInfo.setPassword(passwordEncoder.encode(password));
        adminInfo.setAvatar(FileStorePathConstants.AVADIR + File.separator +
                SystemInfoConstants.DEFAULT_ADMIN_AVATAR);
        adminInfo.setNickname(nickname);
        adminInfo.setGender(1);
        adminInfo.setEmail(email);
        adminInfo.setRole_id(2);    //管理员默认权限为2

        adminInfoService.createAdmin(adminInfo);
        return "createAdmin";
    }

}
