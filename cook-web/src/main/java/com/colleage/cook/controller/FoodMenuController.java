package com.colleage.cook.controller;

import com.colleage.cook.service.FoodMenuInfoService;
import com.colleage.cook.utils.page.PageConstants;
import com.colleage.cook.vo.WebResponseData;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Classname FoodMenuController
 * @Description 菜谱的访问接口
 * @Date 2019\4\23 0023
 * @Created by David
 */
@RequestMapping("m")
@RestController
public class FoodMenuController {

    @Autowired
    private FoodMenuInfoService foodMenuInfoService;

    @RequestMapping("getMenuByLikeWord.do")
    public WebResponseData getMenuByLikeWord(String word) {
        WebResponseData webResponseData = new WebResponseData();
        if (StringUtils.isNullOrEmpty(word)) {
            webResponseData.setCode(WebResponseData.Code.PARAM_NOT_NULL);
            webResponseData.setMessage(WebResponseData.Message.PARAM_NOT_NULL);
            return webResponseData;
        }
        webResponseData.setData(foodMenuInfoService.getMenuByLikeWord(word));
        webResponseData.setCode(WebResponseData.Code.SUCCESS);
        webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        return webResponseData;
    }

    @RequestMapping("getCurrentWeekPopular.do")
    public WebResponseData getCurrentWeekPopular(@RequestParam(required = false, defaultValue = "1") int pageNo,
                                                 @RequestParam(required = false,
                                                         defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodMenuInfoService.getCurrentWeekPopular(pageNo, pageSize));
        return webResponseData;
    }

    @RequestMapping("getLastMonthPopular.do")
    public WebResponseData getLastMonthPopular(@RequestParam(required = false, defaultValue = "1") int pageNo,
                                               @RequestParam(required = false,
                                                       defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodMenuInfoService.getLastMonthPopular(1, pageNo, pageSize));
        return webResponseData;
    }

    @RequestMapping("getLastCreate.do")
    public WebResponseData getLastCreate(@RequestParam(required = false, defaultValue = "1") int pageNo,
                                         @RequestParam(required = false,
                                                 defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodMenuInfoService.getLastCreate(pageNo, pageSize));
        return webResponseData;
    }

    @RequestMapping("getPopularMenu.do")
    public WebResponseData getPopularMenu(@RequestParam(required = false, defaultValue = "1") int pageNo,
                                          @RequestParam(required = false,
                                                  defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodMenuInfoService.getPopularMenu(pageNo, pageSize));
        return webResponseData;
    }

    @RequestMapping("getDetailMenuInfo.do")
    public WebResponseData getDetailMenuInfo(String uuid) {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodMenuInfoService.getDetailMenuInfo(uuid));
        return webResponseData;
    }

}
