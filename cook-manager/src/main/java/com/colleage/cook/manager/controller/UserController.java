package com.colleage.cook.manager.controller;

import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Classname UserController
 * @Description TODO
 * @Date 2019\4\30 0030
 * @Created by David
 */
@RequestMapping("u")
@Controller
public class UserController {

    @RequestMapping("test.do")
    @ResponseBody
    public String test() {
        return "test";
    }
}
