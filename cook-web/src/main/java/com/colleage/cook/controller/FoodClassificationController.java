package com.colleage.cook.controller;

import com.colleage.cook.constants.AccessDataCacheConstants;
import com.colleage.cook.service.FoodClassificationInfoService;
import com.colleage.cook.vo.WebResponseData;
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
@RestController
@RequestMapping("f")
public class FoodClassificationController {

    @Autowired
    private FoodClassificationInfoService foodClassificationInfoService;

    @GetMapping("getClassification.do")
    public WebResponseData getClassification() {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, AccessDataCacheConstants.ALL_CLASSIFICATION_DATA);
        return webResponseData;
    }

    @GetMapping("getBig.do")
    public WebResponseData getBig() {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodClassificationInfoService.getAllBig());
        return webResponseData;
    }

    @GetMapping("getSmall.do")
    public WebResponseData getSmall(@RequestParam(required = false, defaultValue = "101") int bigId) {
        if (bigId < 101 || bigId > 1000) {
            bigId = 101;
        }
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodClassificationInfoService.getAllSmallByCategory(bigId));
        return webResponseData;
    }

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
