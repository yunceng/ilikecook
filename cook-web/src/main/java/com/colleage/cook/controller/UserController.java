package com.colleage.cook.controller;

import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Classname UserController
 * @Description 用户请求链接
 * @Date 2019\4\12 0012
 * @Created by David
 */
@Controller
@RequestMapping("u")
public class UserController {

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping("getUser.do")
    @ResponseBody
    public UserInfo getUser(String username) {
        return userInfoService.getUserInfoByUsername(username);
    }

}
