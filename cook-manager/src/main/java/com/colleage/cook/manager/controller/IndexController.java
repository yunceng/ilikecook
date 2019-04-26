package com.colleage.cook.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import static com.colleage.cook.manager.constants.ViewConstants.INDEX_VIEW;

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
        return INDEX_VIEW;
    }

}
