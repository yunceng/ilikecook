package com.colleage.cook.controller;

import com.colleage.cook.service.SearchWordInfoService;
import com.colleage.cook.vo.WebResponseData;
import com.mysql.jdbc.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Classname SearchWordController
 * @Description TODO
 * @Date 2019\4\25 0025
 * @Created by David
 */
@Api(value = "搜索词访问", description = "用于提供搜索词服务")
@RestController
@RequestMapping("w")
public class SearchWordController {

    @Autowired
    private SearchWordInfoService searchWordInfoService;

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "word", value = "关键词", paramType = "query", dataType="string", required = true)
            })
    @ApiOperation(value = "根据用户输入提示相应的关键词列表", httpMethod = "GET")
    @GetMapping("search.do")
    public WebResponseData getSearchWords(String word) {

        if (StringUtils.isNullOrEmpty(word)) {
            return WebResponseData.paramIsNull();
        }
        WebResponseData webResponseData = WebResponseData.success();
        webResponseData.setData(searchWordInfoService.getSearchWords(word));
        return webResponseData;
    }

}
