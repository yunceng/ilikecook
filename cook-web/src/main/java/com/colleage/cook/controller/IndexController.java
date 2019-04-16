package com.colleage.cook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Classname IndexController
 * @Description 首页访问链接
 * @Date 2019\4\12 0012
 * @Created by David
 */
@Controller
public class IndexController {

    @RequestMapping(value = {"/", "index.html"})
    public String index(){
        return "index";
    }

}
