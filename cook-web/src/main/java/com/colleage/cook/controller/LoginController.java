package com.colleage.cook.controller;

import com.colleage.cook.constants.SystemInfoConstants;
import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.oauth.bean.EnumOauthTypeBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * @Classname LoginController
 * @Description 登录请求链接
 * @Date 2019\4\12 0012
 * @Created by David
 */
@Controller
public class LoginController extends BaseLoginController {

    @GetMapping("login.html")
    public String login(){
        return "login";
    }

    @PostMapping("login.do")
    public String login(HttpServletRequest request, @RequestParam(required = false) String username,
                        @RequestParam(required = false) String password,
                        @RequestParam(required = false, defaultValue = "false") boolean remeberMe) {
        return doLogin(request, username, password);
    }

    @GetMapping("register.html")
    public String register() {
        return "register";
    }

    @PostMapping("register.do")
    public String register(HttpServletRequest request, @RequestParam(required = false) String username,
                           @RequestParam(required = false) String password,
                           @RequestParam(required = false) String nickname,
                           @RequestParam(required = false) String email) {
        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(username);
        userInfo.setPassword(passwordEncoder.encode(password));
        String avatar = SystemInfoConstants.all_system_info.get(SystemInfoConstants.DEFAULT_USER_AVATAR);
        userInfo.setAvatar(avatar);
        userInfo.setNickname(nickname);
        userInfo.setGender(1);
        userInfo.setOauth_type(EnumOauthTypeBean.TYPE_NULL.getValue());
        userInfo.setEmail(email);

        userInfoService.register(userInfo);
        return doLogin(request, username, password);
    }

}
