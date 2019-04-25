package com.colleage.cook.controller;

import com.colleage.cook.service.SearchWordInfoService;
import com.colleage.cook.vo.WebResponseData;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Classname SearchWordController
 * @Description TODO
 * @Date 2019\4\25 0025
 * @Created by David
 */
@RestController
@RequestMapping("w")
public class SearchWordController {

    @Autowired
    private SearchWordInfoService searchWordInfoService;

    @RequestMapping("search.do")
    public WebResponseData getSearchWords(String word) {
        WebResponseData webResponseData = new WebResponseData();
        if (StringUtils.isNullOrEmpty(word)) {
            webResponseData.setCode(WebResponseData.Code.PARAM_NOT_NULL);
            webResponseData.setMessage(WebResponseData.Message.PARAM_NOT_NULL);
            return webResponseData;
        }

        webResponseData.setCode(WebResponseData.Code.SUCCESS);
        webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        webResponseData.setData(searchWordInfoService.getSearchWords(word));
        return webResponseData;
    }

}
