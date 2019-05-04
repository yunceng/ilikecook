package com.colleage.cook.controller;

import com.colleage.cook.constants.SessionAttributeKeyConstants;
import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.service.FoodMenuInfoService;
import com.colleage.cook.service.UserInfoService;
import com.colleage.cook.utils.page.PageConstants;
import com.colleage.cook.utils.page.PageInfo;
import com.colleage.cook.vo.DetailMenuInfo;
import com.colleage.cook.vo.SimpleUserInfo;
import com.colleage.cook.vo.WebResponseData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;

import static com.colleage.cook.constants.SessionAttributeKeyConstants.SESSION_USER;

/**
 * @Classname UserController
 * @Description 用户请求链接
 * @Date 2019\4\12 0012
 * @Created by David
 */
@Api(value = "用户访问服务", description = "提供用户信息的访问")
@RestController
@RequestMapping("u")
public class UserController {

    @Autowired
    private FoodMenuInfoService foodMenuInfoService;

    @Autowired
    private UserInfoService userInfoService;

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "uuid", value = "菜谱的唯一标识", paramType = "form", dataType="string", required = true)
            })
    @ApiOperation(value = "收藏菜谱", httpMethod = "POST")
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

    @ApiOperation(value = "获取用户收藏的菜谱", httpMethod = "GET")
    @GetMapping("getUserCollectedMenus.do")
    public WebResponseData getUserCollectedMenus(HttpServletRequest request,
                                                 @RequestParam(required = false, defaultValue = "1") int pageNo,
                                                 @RequestParam(required = false,
                                                         defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize){
        WebResponseData webResponseData = new WebResponseData();
        try {
            SimpleUserInfo simpleUserInfo = ((SimpleUserInfo) request.getSession().getAttribute(SessionAttributeKeyConstants.SESSION_USER));
            PageInfo pageInfo = foodMenuInfoService.getUserCollectedMenus(simpleUserInfo.getId(), pageNo, pageSize);
            webResponseData.setCode(WebResponseData.Code.SUCCESS);
            webResponseData.setMessage(WebResponseData.Message.SUCCESS);
            webResponseData.setData(pageInfo);
        } catch (Exception e) {
            webResponseData.setCode(WebResponseData.Code.ERROR);
            webResponseData.setMessage(WebResponseData.Message.ERROR);
        }
        return webResponseData;

    }

    @ApiOperation(value = "获取用户的菜谱", httpMethod = "GET")
    @GetMapping("getUserOwnMenus.do")
    public WebResponseData getUserOwnMenus(HttpServletRequest request,
                                           @RequestParam(required = false, defaultValue = "1") int pageNo,
                                           @RequestParam(required = false,
                                                   defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize){
        WebResponseData webResponseData = new WebResponseData();
        try {
            SimpleUserInfo simpleUserInfo = ((SimpleUserInfo) request.getSession().getAttribute(SessionAttributeKeyConstants.SESSION_USER));
            PageInfo pageInfo = foodMenuInfoService.getUserOwnMenus(simpleUserInfo.getId(), pageNo, pageSize);
            webResponseData.setCode(WebResponseData.Code.SUCCESS);
            webResponseData.setMessage(WebResponseData.Message.SUCCESS);
            webResponseData.setData(pageInfo);
        } catch (Exception e) {
            webResponseData.setCode(WebResponseData.Code.ERROR);
            webResponseData.setMessage(WebResponseData.Message.ERROR);
        }
        return webResponseData;
    }


    @ApiOperation(value = "获取用户信息", httpMethod = "GET")
    @GetMapping("getDetailUserInfo.do")
    public WebResponseData getUserInfo(HttpServletRequest request) {
        WebResponseData webResponseData = new WebResponseData();
        try {
            SimpleUserInfo simpleUserInfo = ((SimpleUserInfo) request.getSession().getAttribute(SessionAttributeKeyConstants.SESSION_USER));
            UserInfo userInfo = userInfoService.getUserInfoByUsername(simpleUserInfo.getUsername());
            userInfo.setPassword("");
            webResponseData.setCode(WebResponseData.Code.SUCCESS);
            webResponseData.setMessage(WebResponseData.Message.SUCCESS);
            webResponseData.setData(userInfo);
        } catch (Exception e) {
            webResponseData.setCode(WebResponseData.Code.ERROR);
            webResponseData.setMessage(WebResponseData.Message.ERROR);
        }
        return webResponseData;
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "username", value = "用户名", paramType = "form", dataType="string", required = true),
                    @ApiImplicitParam(name = "nickname", value = "昵称", paramType = "form", dataType="string"),
                    @ApiImplicitParam(name = "gender", value = "性别（1：男，2：女）", paramType = "form", dataType="string", required = true),
                    @ApiImplicitParam(name = "avatar", value = "头像地址", paramType = "form", dataType="string"),
                    @ApiImplicitParam(name = "email", value = "邮箱地址", paramType = "form", dataType="string"),
                    @ApiImplicitParam(name = "mobile", value = "手机号", paramType = "form", dataType="int")
            })
    @ApiOperation(value = "更新用户信息", httpMethod = "POST")
    @PostMapping("updateUserInfo.do")
    public WebResponseData updateUserInfo(String username, String nickname, Integer gender, String avatar, String email, String mobile) {
        WebResponseData webResponseData = new WebResponseData();
        try {
            if(StringUtils.isBlank(username) || gender == null){
                throw new NullPointerException();
            }
            userInfoService.updateUserInfo(username, nickname, gender, avatar, email, mobile);
            webResponseData.setCode(WebResponseData.Code.SUCCESS);
            webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        } catch (Exception e) {
            webResponseData.setCode(WebResponseData.Code.ERROR);
            webResponseData.setMessage(WebResponseData.Message.ERROR);
        }
        return webResponseData;
    }

    @ApiOperation(value = "创建菜谱", httpMethod = "POST")
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
            SimpleUserInfo userInfo = ((SimpleUserInfo) request.getSession().getAttribute(SessionAttributeKeyConstants.SESSION_USER));
            menuInfo.setUser(userInfo);
            foodMenuInfoService.createMenu(menuInfo);
            return new WebResponseData(WebResponseData.Code.SUCCESS, WebResponseData.Message.SUCCESS);
        } catch (Exception e) {
            return new WebResponseData(WebResponseData.Code.ERROR, WebResponseData.Message.ERROR);
        }
    }
}
