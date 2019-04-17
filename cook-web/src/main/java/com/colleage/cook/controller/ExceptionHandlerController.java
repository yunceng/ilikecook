package com.colleage.cook.controller;

import com.colleage.cook.vo.WebResponseData;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Classname ExceptionHandlerController
 * @Description TODO
 * @Date 2019\4\17 0017
 * @Created by David
 */
@RequestMapping("e")
@Controller
public class ExceptionHandlerController {

    @GetMapping(value = "403.html")
    public String no_privileges(ModelMap modelMap) {
        modelMap.put("code", WebResponseData.Code.NO_PRIVILEGES);
        modelMap.put("message", WebResponseData.Message.NO_PRIVILEGES);
        return "/e/no_privileges";
    }
}
