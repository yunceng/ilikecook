package com.colleage.cook.controller;

import com.colleage.cook.constants.AccessDataCacheConstants;
import com.colleage.cook.service.FoodClassificationInfoService;
import com.colleage.cook.vo.WebResponseData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Classname FoodClassificationController
 * @Description 分类信息访问
 * @Date 2019\4\22 0022
 * @Created by David
 */
@Api(value = "菜谱分类访问", description = "提供菜谱的分类信息，包含了获取所有分类和各个级别的信息")
@RestController
@RequestMapping("f")
public class FoodClassificationController {

    @Autowired
    private FoodClassificationInfoService foodClassificationInfoService;

    @ApiOperation(value = "获取所有分类信息", httpMethod = "GET")
    @GetMapping("getClassification.do")
    public WebResponseData getClassification() {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, AccessDataCacheConstants.ALL_CLASSIFICATION_DATA);
        return webResponseData;
    }

    @ApiOperation(value = "获取一级分类信息", httpMethod = "GET")
    @GetMapping("getBig.do")
    public WebResponseData getBig() {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodClassificationInfoService.getAllBig());
        return webResponseData;
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "bigId", value = "一级分类ID", paramType = "query", dataType="int", defaultValue = "101")
            })
    @ApiOperation(value = "获取二级分类信息", httpMethod = "GET")
    @GetMapping("getSmall.do")
    public WebResponseData getSmall(@RequestParam(required = false, defaultValue = "101") int bigId) {
        if (bigId < 101 || bigId > 1000) {
            bigId = 101;
        }
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodClassificationInfoService.getAllSmallByCategory(bigId));
        return webResponseData;
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "smallId", value = "二级分类ID", paramType = "query", dataType="int", defaultValue = "1001")
            })
    @ApiOperation(value = "获取三级分类信息", httpMethod = "GET")
    @GetMapping("getTiny.do")
    public WebResponseData getTiny(@RequestParam(required = false, defaultValue = "1001") int smallId) {
        if (smallId < 1001 || smallId > 10000) {
            smallId = 1001;
        }
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodClassificationInfoService.getAllTinyByCategory(smallId));
        return webResponseData;
    }
}
