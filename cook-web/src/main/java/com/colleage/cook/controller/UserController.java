package com.colleage.cook.controller;

import com.colleage.cook.bean.DetailMenuInfo;
import com.colleage.cook.bean.SimpleUserInfo;
import com.colleage.cook.constants.WebServiceConstants;
import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.service.FoodMenuInfoService;
import com.colleage.cook.service.UserInfoService;
import com.colleage.cook.vo.WebResponseData;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

import static com.colleage.cook.constants.WebServiceConstants.SESSION_USER;

/**
 * @Classname UserController
 * @Description 用户请求链接
 * @Date 2019\4\12 0012
 * @Created by David
 */
@RestController
@RequestMapping("u")
public class UserController {

    @Autowired
    private FoodMenuInfoService foodMenuInfoService;

    @Autowired
    private UserInfoService userInfoService;

    @PostMapping("collectMenu.do")
    public WebResponseData collectMenu(HttpServletRequest request, String uuid) {
        WebResponseData webResponseData = new WebResponseData();
        try {
            Integer userId = ((SimpleUserInfo) request.getSession().getAttribute(SESSION_USER)).getId();
            if (StringUtils.isNotBlank(uuid) && foodMenuInfoService.updateMenuCollectNum(userId, uuid)) {
                webResponseData.setCode(WebResponseData.Code.SUCCESS);
                webResponseData.setMessage(WebResponseData.Message.SUCCESS);
            } else {
                webResponseData.setCode(WebResponseData.Code.ERROR);
                webResponseData.setMessage(WebResponseData.Message.PARAM_NOT_NULL);
            }
        } catch (Exception e) {
            webResponseData.setCode(WebResponseData.Code.ERROR);
            webResponseData.setMessage(WebResponseData.Message.COLLECT_MENU_ERROR);
        }
        return webResponseData;
    }

    @RequestMapping
    public WebResponseData getUserInfo(HttpServletRequest request) {
        WebResponseData webResponseData = new WebResponseData();
        try {
            SimpleUserInfo simpleUserInfo = ((SimpleUserInfo) request.getSession().getAttribute(WebServiceConstants.SESSION_USER));
            UserInfo userInfo = userInfoService.getUserInfoByUsername(simpleUserInfo.getUsername());
            webResponseData.setCode(WebResponseData.Code.SUCCESS);
            webResponseData.setMessage(WebResponseData.Message.SUCCESS);
            webResponseData.setData(userInfo);
        } catch (Exception e) {
            webResponseData.setCode(WebResponseData.Code.ERROR);
            webResponseData.setMessage(WebResponseData.Message.ERROR);
        }
        return webResponseData;
    }

    @PostMapping("updateUserInfo.do")
    public WebResponseData updateUserInfo(UserInfo userInfo) {
        WebResponseData webResponseData = new WebResponseData();
        try {
            userInfoService.updateUserInfo(userInfo);
            webResponseData.setCode(WebResponseData.Code.SUCCESS);
            webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        } catch (Exception e) {
            webResponseData.setCode(WebResponseData.Code.ERROR);
            webResponseData.setMessage(WebResponseData.Message.ERROR);
        }
        return webResponseData;
    }

    @PostMapping("createMenu.do")
    public WebResponseData createMenu(HttpServletRequest request, @RequestBody DetailMenuInfo menuInfo) {
        //如果使用的是json方式传递的数据，则使用
        // @RequestBody JSONObject jsonObject
        // 接收数据，然后使用
        // DetailMenuInfo menuInfo1 = JSONObject.toJavaObject(jsonObject, DetailMenuInfo.class);
        // 解析数据
        if (menuInfo == null || menuInfo.getSummaryInfo() == null || menuInfo.getMenuFoodInfoList() == null
                || menuInfo.getMenuStepInfoList() == null) {
            return new WebResponseData(WebResponseData.Code.PARAM_NOINVALID, WebResponseData.Message.PARAM_NOINVALID);
        }
        try {
            SimpleUserInfo userInfo = ((SimpleUserInfo) request.getSession().getAttribute(WebServiceConstants.SESSION_USER));
            menuInfo.setUser(userInfo);
            foodMenuInfoService.createMenu(menuInfo);
            return new WebResponseData(WebResponseData.Code.SUCCESS, WebResponseData.Message.SUCCESS);
        } catch (Exception e) {
            return new WebResponseData(WebResponseData.Code.ERROR, WebResponseData.Message.ERROR);
        }
    }
}
