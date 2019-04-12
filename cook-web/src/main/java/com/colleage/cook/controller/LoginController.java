package com.colleage.cook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @Classname LoginController
 * @Description TODO
 * @Date 2019\4\12 0012
 * @Created by David
 */
@Controller
public class LoginController {

    @GetMapping("login")
    public String login(){
        return "login";
    }

    @PostMapping("login")
    public String login(String username, String post){

        return "index";
    }

}
