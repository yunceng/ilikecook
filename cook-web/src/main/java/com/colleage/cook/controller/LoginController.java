package com.colleage.cook.controller;

import com.colleage.cook.constants.AccessDataCacheConstants;
import com.colleage.cook.constants.SystemInfoConstants;
import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.oauth.bean.OauthTypeEnum;
import com.colleage.cook.utils.constants.FileStorePathConstants;
import com.colleage.cook.vo.WebResponseData;
import io.swagger.annotations.Api;
import org.apache.commons.lang.StringUtils;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
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

    @PostMapping("checkUsernameIsExists.do")
    @ResponseBody
    public WebResponseData checkUsernameIsExists(String username){
        if(StringUtils.isBlank(username)){
            return WebResponseData.paramIsNull();
        }
        if(userInfoService.checkUsernameIsExists(username) == null){
            return null;
        }
        return new WebResponseData(WebResponseData.Code.USER_ALREADY_EXISTS, WebResponseData.Message.USERNAME_ALREADY_EXISTS);
    }

    @PostMapping("checkEmailIsExists.do")
    @ResponseBody
    public WebResponseData checkEmailIsExists(String email){
        if(StringUtils.isBlank(email)){
            return WebResponseData.paramIsNull();
        }
        if(userInfoService.checkEmailIsExists(email) == null){
            return null;
        }
        return new WebResponseData(WebResponseData.Code.USER_ALREADY_EXISTS, WebResponseData.Message.EMAIL_ALREADY_EXISTS);
    }

    @PostMapping("register.do")
    @ResponseBody
    public WebResponseData register(HttpServletRequest request, String username, String password,
                                    @RequestParam(required = false) String nickname,
                                    @RequestParam(required = false) String email) {
        if(StringUtils.isBlank(username) || StringUtils.isBlank(password)){
            return WebResponseData.paramIsNull();
        }

        try{
            UserInfo userInfo = new UserInfo();
            userInfo.setUsername(username);
            userInfo.setPassword(passwordEncoder.encode(password));
            String avatar = AccessDataCacheConstants.all_system_info.get(SystemInfoConstants.DEFAULT_USER_AVATAR);
            userInfo.setAvatar(avatar);
            userInfo.setNickname(StringUtils.isBlank(nickname) ? username : nickname);
            userInfo.setGender(1);
            userInfo.setOauth_type(OauthTypeEnum.TYPE_NULL.getValue());
            userInfo.setEmail(email);

            userInfoService.register(userInfo);

            return WebResponseData.success();
        }catch (Exception e){
            return WebResponseData.error();
        }
    }

}
