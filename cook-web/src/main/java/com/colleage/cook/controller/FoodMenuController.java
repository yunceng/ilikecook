package com.colleage.cook.controller;

import com.colleage.cook.exception.EmailSendException;
import com.colleage.cook.service.FoodMenuInfoService;
import com.colleage.cook.utils.page.PageConstants;
import com.colleage.cook.vo.SimpleUserInfo;
import com.colleage.cook.vo.WebResponseData;
import com.mysql.jdbc.StringUtils;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

import static com.colleage.cook.constants.AccessDataCacheConstants.MENU_BROWSE_NUMS;
import static com.colleage.cook.constants.SessionAttributeKeyConstants.SESSION_USER;

/**
 * @Classname FoodMenuController
 * @Description 菜谱的访问接口
 * @Date 2019\4\23 0023
 * @Created by David
 */
@Api(value = "菜谱访问", description = "允许用户通过各种方式获取菜谱列表和详细信息")
@RequestMapping("m")
@RestController
public class FoodMenuController {

    @Autowired
    private FoodMenuInfoService foodMenuInfoService;

    @ApiOperation(value = "获取首页轮播菜谱信息", httpMethod = "GET")
    @GetMapping("getMenuRotation.do")
    public WebResponseData getMenuRotation(){
        WebResponseData webResponseData = new WebResponseData();
        webResponseData.setCode(WebResponseData.Code.SUCCESS);
        webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        webResponseData.setData(foodMenuInfoService.getOnlineMenuRotation());
        return webResponseData;

    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "category", value = "分类ID", paramType = "query", dataType="int", required = true),
                    @ApiImplicitParam(name = "pageNo", value = "当前页号", paramType = "query", dataType="int", defaultValue = "1"),
                    @ApiImplicitParam(name = "pageSize", value = "页大小", paramType = "query", dataType="int", defaultValue = "8")
            })
    @ApiOperation(value = "根据分类获得菜谱列表信息", httpMethod = "GET")
    @GetMapping("getMenuByCategory.do")
    public WebResponseData getMenuByCategoryId(int category,
                                               @RequestParam(required = false, defaultValue = "1") int pageNo,
                                               @RequestParam(required = false,
                                                       defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {

        WebResponseData webResponseData = new WebResponseData();
        if (category < 101 || category > 99999) {
            webResponseData.setCode(WebResponseData.Code.PARAM_NOINVALID);
            webResponseData.setMessage(WebResponseData.Message.PARAM_NOINVALID);
        }
        webResponseData.setCode(WebResponseData.Code.SUCCESS);
        webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        webResponseData.setData(foodMenuInfoService.getMenuByCategoryId(category, pageNo, pageSize));
        return webResponseData;
    }

    @ApiOperation(value = "获得推荐菜谱信息", httpMethod = "GET")
    @GetMapping("getRecommendMenus.do")
    public WebResponseData getRecommendMenus() {
        WebResponseData webResponseData = new WebResponseData();
        webResponseData.setData(foodMenuInfoService.getRecommendMenu(PageConstants.DEFAULT_PAGE_NO,
                PageConstants.DEFAULT_PAGE_SIZE));
        webResponseData.setCode(WebResponseData.Code.SUCCESS);
        webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        return webResponseData;
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "word", value = "关键词", paramType = "query", dataType="string", required = true),
                    @ApiImplicitParam(name = "pageNo", value = "当前页号", paramType = "query", dataType="int", defaultValue = "1"),
                    @ApiImplicitParam(name = "pageSize", value = "页大小", paramType = "query", dataType="int", defaultValue = "8")
            })
    @ApiOperation(value = "根据关键词搜索菜谱", httpMethod = "GET")
    @GetMapping("getMenuByLikeWord.do")
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

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "pageNo", value = "当前页号", paramType = "query", dataType="int", defaultValue = "1"),
                    @ApiImplicitParam(name = "pageSize", value = "页大小", paramType = "query", dataType="int", defaultValue = "8")
            })
    @ApiOperation(value = "获得上周最受欢迎的菜谱", httpMethod = "GET")
    @GetMapping("getCurrentWeekPopular.do")
    public WebResponseData getCurrentWeekPopular(@RequestParam(required = false, defaultValue = "1") int pageNo,
                                                 @RequestParam(required = false,
                                                         defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodMenuInfoService.getCurrentWeekPopular(pageNo, pageSize));
        return webResponseData;
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "pageNo", value = "当前页号", paramType = "query", dataType="int", defaultValue = "1"),
                    @ApiImplicitParam(name = "pageSize", value = "页大小", paramType = "query", dataType="int", defaultValue = "8")
            })
    @ApiOperation(value = "获得上月最受欢迎的菜谱", httpMethod = "GET")
    @GetMapping("getLastMonthPopular.do")
    public WebResponseData getLastMonthPopular(@RequestParam(required = false, defaultValue = "1") int pageNo,
                                               @RequestParam(required = false,
                                                       defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodMenuInfoService.getLastMonthPopular(pageNo, pageSize));
        return webResponseData;
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "pageNo", value = "当前页号", paramType = "query", dataType="int", defaultValue = "1"),
                    @ApiImplicitParam(name = "pageSize", value = "页大小", paramType = "query", dataType="int", defaultValue = "8")
            })
    @ApiOperation(value = "获得最新创建的菜谱", httpMethod = "GET")
    @GetMapping("getLastCreate.do")
    public WebResponseData getLastCreate(@RequestParam(required = false, defaultValue = "1") int pageNo,
                                         @RequestParam(required = false,
                                                 defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodMenuInfoService.getLastCreate(pageNo, pageSize));
        return webResponseData;
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "pageNo", value = "当前页号", paramType = "query", dataType="int", defaultValue = "1"),
                    @ApiImplicitParam(name = "pageSize", value = "页大小", paramType = "query", dataType="int", defaultValue = "8")
            })
    @ApiOperation(value = "获得本年最受欢迎的菜谱", httpMethod = "GET")
    @GetMapping("getPopularMenu.do")
    public WebResponseData getPopularMenu(@RequestParam(required = false, defaultValue = "1") int pageNo,
                                          @RequestParam(required = false,
                                                  defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {
        WebResponseData webResponseData = new WebResponseData(WebResponseData.Code.SUCCESS,
                WebResponseData.Message.SUCCESS, foodMenuInfoService.getPopularMenu(pageNo, pageSize));
        return webResponseData;
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "uuid", value = "菜谱的唯一标识", paramType = "query", dataType="string", required = true)
            })
    @ApiOperation(value = "获得菜谱的详细信息", httpMethod = "GET")
    @GetMapping("getDetailMenuInfo.do")
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
