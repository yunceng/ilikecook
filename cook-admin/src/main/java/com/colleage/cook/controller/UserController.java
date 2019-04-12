package com.colleage.cook.controller;

import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("u")
public class UserController {

    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping("findUserInfoByUsername.do")
    @ResponseBody
    public UserInfo findUserInfoByUsername(String username, String password){
        return userInfoService.findUserInfoByUsername(username, password);
    }

}
