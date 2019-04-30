package com.colleage.cook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import springfox.documentation.annotations.ApiIgnore;

/**
 * @Classname ExceptionHandlerControlelr
 * @Description TODO
 * @Date 2019\4\30 0030
 * @Created by David
 */
@ApiIgnore
@RequestMapping
@Controller
public class ExceptionHandlerControlelr {

    @RequestMapping("404.html")
    public String handler404() {
        return "e/404";
    }

    @RequestMapping("500.html")
    public String handler500() {
        return "e/500";
    }

}
