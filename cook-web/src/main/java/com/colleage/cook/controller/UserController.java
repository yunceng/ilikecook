package com.colleage.cook.controller;

import com.colleage.cook.bean.SimpleUserInfo;
import com.colleage.cook.service.FoodMenuInfoService;
import com.colleage.cook.vo.WebResponseData;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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

    @RequestMapping("collectMenu.do")
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


}
