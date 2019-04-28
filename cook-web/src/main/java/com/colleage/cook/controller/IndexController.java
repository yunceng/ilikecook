package com.colleage.cook.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import springfox.documentation.annotations.ApiIgnore;

import static com.colleage.cook.constants.ViewConstants.INDEX_VIEW;

/**
 * @Classname IndexController
 * @Description 首页访问链接
 * @Date 2019\4\12 0012
 * @Created by David
 */
@ApiIgnore
@Controller
public class IndexController {

    @RequestMapping(value = {"/", "index.html"})
    public String index(){
        return INDEX_VIEW;
    }

}
