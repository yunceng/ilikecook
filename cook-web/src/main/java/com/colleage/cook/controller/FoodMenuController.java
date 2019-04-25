package com.colleage.cook.controller;

import com.colleage.cook.bean.SimpleUserInfo;
import com.colleage.cook.service.FoodMenuInfoService;
import com.colleage.cook.utils.page.PageConstants;
import com.colleage.cook.vo.WebResponseData;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

import static com.colleage.cook.constants.AccessDataCacheConstants.MENU_BROWSE_NUMS;
import static com.colleage.cook.constants.WebServiceConstants.SESSION_USER;

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

    @RequestMapping("getRecommendMenus.do")
    public WebResponseData getRecommendMenus() {
        WebResponseData webResponseData = new WebResponseData();
        webResponseData.setData(foodMenuInfoService.getRecommendMenu(PageConstants.DEFAULT_PAGE_NO,
                PageConstants.DEFAULT_PAGE_SIZE));
        webResponseData.setCode(WebResponseData.Code.SUCCESS);
        webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        return webResponseData;
    }

    @RequestMapping("getMenuByLikeWord.do")
    public WebResponseData getMenuByLikeWord(String word,
                                             @RequestParam(required = false, defaultValue = "1") int pageNo,
                                             @RequestParam(required = false,
                                                     defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {
        WebResponseData webResponseData = new WebResponseData();
        if (StringUtils.isNullOrEmpty(word)) {
            webResponseData.setCode(WebResponseData.Code.PARAM_NOT_NULL);
            webResponseData.setMessage(WebResponseData.Message.PARAM_NOT_NULL);
            return webResponseData;
        }
        webResponseData.setData(foodMenuInfoService.getMenuByLikeWord(word, pageNo, pageSize));
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
    public WebResponseData getDetailMenuInfo(HttpServletRequest request, String uuid) {
        WebResponseData webResponseData = new WebResponseData();
        if (StringUtils.isNullOrEmpty(uuid)) {
            webResponseData.setCode(WebResponseData.Code.PARAM_NOT_NULL);
            webResponseData.setMessage(WebResponseData.Message.PARAM_NOT_NULL);
            return webResponseData;
        }

        Integer userId = 0;
        if (request.getSession().getAttribute(SESSION_USER) != null) {
            userId = ((SimpleUserInfo) request.getSession().getAttribute(SESSION_USER)).getId();
        }

        MENU_BROWSE_NUMS.put(uuid, MENU_BROWSE_NUMS.getOrDefault(uuid, 0) + 1);
        webResponseData.setCode(WebResponseData.Code.SUCCESS);
        webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        webResponseData.setData(foodMenuInfoService.getDetailMenuInfo(userId, uuid));
        return webResponseData;
    }

}
