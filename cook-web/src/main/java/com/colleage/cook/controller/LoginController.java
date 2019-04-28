package com.colleage.cook.controller;

import com.colleage.cook.constants.AccessDataCacheConstants;
import com.colleage.cook.constants.SystemInfoConstants;
import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.oauth.bean.OauthTypeEnum;
import com.colleage.cook.utils.constants.FileStorePathConstants;
import io.swagger.annotations.Api;
import org.apache.commons.lang.StringUtils;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

import static com.colleage.cook.constants.ViewConstants.*;

/**
 * @Classname LoginController
 * @Description 登录请求链接
 * @Date 2019\4\12 0012
 * @Created by David
 */
@ApiIgnore
@Controller
public class LoginController extends BaseLoginController {

    @GetMapping("login.html")
    public String login(HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String referer = request.getHeader("Referer");
        if (auth != null && !(auth instanceof AnonymousAuthenticationToken) && auth.isAuthenticated()) {
            return "redirect:" + (StringUtils.isNotBlank(referer) ? referer : INDEX_REQUEST);
        }
        return LOGIN_VIEW;
    }

    @GetMapping("register.html")
    public String register() {
        return REGISTER_VIEW;
    }

    @PostMapping("register.do")
    public String register(HttpServletRequest request, @RequestParam(required = false) String username,
                           @RequestParam(required = false) String nickname,
                           @RequestParam(required = false) String email,
                           @RequestParam(required = false) String password) {
        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(username);
        userInfo.setPassword(passwordEncoder.encode(password));
        String avatar = AccessDataCacheConstants.all_system_info.get(FileStorePathConstants.APP_CONTEXT_IMG
                + File.separator + SystemInfoConstants.DEFAULT_USER_AVATAR);
        userInfo.setAvatar(avatar);
        userInfo.setNickname(nickname);
        userInfo.setGender(1);
        userInfo.setOauth_type(OauthTypeEnum.TYPE_NULL.getValue());
        userInfo.setEmail(email);

        userInfoService.register(userInfo);
        return doLogin(request, username, password);
    }

}
