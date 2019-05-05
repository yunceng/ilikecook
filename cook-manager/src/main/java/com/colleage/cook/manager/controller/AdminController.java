package com.colleage.cook.manager.controller;

import com.colleage.cook.manager.service.FoodMenuInfoService;
import com.colleage.cook.vo.WebResponseData;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Classname AdminController
 * @Description 管理员操作
 * @Date 2019\4\30 0030
 * @Created by David
 */
@RequestMapping("a")
@Controller
public class AdminController {

    @Autowired
    private FoodMenuInfoService foodMenuInfoService;

    @RequestMapping("getOnlineMenuRotation.do")
    @ResponseBody
    public WebResponseData getOnlineMenuRotation() {
        WebResponseData webResponseData = new WebResponseData();
        try {
            webResponseData.setData(foodMenuInfoService.getOnlineMenuRotation());
            webResponseData.setCode(WebResponseData.Code.SUCCESS);
            webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        } catch (Exception e) {
            webResponseData.setCode(WebResponseData.Code.ERROR);
            webResponseData.setMessage(WebResponseData.Message.ERROR);
        }
        return webResponseData;
    }

    @RequestMapping("getOfflineMenuRotation.do")
    @ResponseBody
    public WebResponseData getOfflineMenuRotation() {
        WebResponseData webResponseData = new WebResponseData();
        try {
            webResponseData.setData(foodMenuInfoService.getOfflineMenuRotation());
            webResponseData.setCode(WebResponseData.Code.SUCCESS);
            webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        } catch (Exception e) {
            webResponseData.setCode(WebResponseData.Code.ERROR);
            webResponseData.setMessage(WebResponseData.Message.ERROR);
        }
        return webResponseData;
    }

    @RequestMapping("offlineMenuRotationStatus.do")
    @ResponseBody
    public WebResponseData offlineMenuRotationStatus(String uuid) {
        WebResponseData webResponseData = new WebResponseData();
        try {
            if (StringUtils.isBlank(uuid)) {
                webResponseData.setCode(WebResponseData.Code.PARAM_NOT_NULL);
                webResponseData.setMessage(WebResponseData.Message.PARAM_NOT_NULL);
                return webResponseData;
            }

            webResponseData.setData(foodMenuInfoService.offlineMenuRotation(uuid));
            webResponseData.setCode(WebResponseData.Code.SUCCESS);
            webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        } catch (Exception e) {
            webResponseData.setCode(WebResponseData.Code.ERROR);
            webResponseData.setMessage(WebResponseData.Message.ERROR);
        }
        return webResponseData;
    }
}
