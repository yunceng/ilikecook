package com.colleage.cook.controller;

import com.colleage.cook.constants.SessionAttributeKeyConstants;
import com.colleage.cook.domain.MenuFoodCommentInfo;
import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.service.FoodMenuCommentInfoService;
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
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

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

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private FoodMenuCommentInfoService foodMenuCommentInfoService;

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "uuid", value = "菜谱的唯一标识", paramType = "form", dataType = "string", required = true),
                    @ApiImplicitParam(name = "commentUserId", value = "评论者ID", paramType = "form", dataType = "int"),
                    @ApiImplicitParam(name = "commentNickname", value = "评论者昵称", paramType = "form", dataType = "string"),
                    @ApiImplicitParam(name = "message", value = "评论内容", paramType = "form", dataType = "string", required = true),
                    @ApiImplicitParam(name = "parent_commentId", value = "第一次评论者ID", paramType = "form", dataType = "int")
            })
    @ApiOperation(value = "评论菜谱", httpMethod = "POST")
    @PostMapping("commentMenu.do")
    public WebResponseData commentMenu(HttpServletRequest request, String uuid, String message,
                                       @RequestParam(required = false) Integer commentUserId,
                                       @RequestParam(required = false) String commentNickname,
                                       @RequestParam(required = false) Integer parent_commentId){
        if(StringUtils.isBlank(uuid) || StringUtils.isBlank(message)){
            return WebResponseData.paramIsNull();
        }
        SimpleUserInfo userInfo = (SimpleUserInfo)request.getSession().getAttribute(SessionAttributeKeyConstants.SESSION_USER);

        try {
            MenuFoodCommentInfo info = new MenuFoodCommentInfo(uuid, commentUserId, commentNickname, userInfo.getId(), userInfo.getNickname(), message);
            foodMenuCommentInfoService.insertComment(info, parent_commentId);
            return WebResponseData.success();
        }catch (Exception e){
            return WebResponseData.error();
        }
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "uuid", value = "菜谱的唯一标识", paramType = "form", dataType = "string", required = true)
            })
    @ApiOperation(value = "收藏菜谱", httpMethod = "POST")
    @PostMapping("collectMenu.do")
    public WebResponseData collectMenu(HttpServletRequest request, String uuid) {
        WebResponseData webResponseData;
        try {
            Integer userId = ((SimpleUserInfo) request.getSession().getAttribute(SESSION_USER)).getId();
            if (StringUtils.isNotBlank(uuid) && foodMenuInfoService.updateMenuCollectNum(userId, uuid)) {
                webResponseData = WebResponseData.success();
            } else {
                webResponseData = WebResponseData.paramIsNull();
            }
        } catch (Exception e) {
            webResponseData = new WebResponseData(WebResponseData.Code.ERROR, WebResponseData.Message.COLLECT_MENU_ERROR);
        }
        return webResponseData;
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "pageNo", value = "页号", paramType = "query", dataType = "int"),
                    @ApiImplicitParam(name = "pageSize", value = "页大小", paramType = "query", dataType = "int")
            })
    @ApiOperation(value = "获取用户收藏的菜谱", httpMethod = "GET")
    @GetMapping("getUserCollectedMenus.do")
    public WebResponseData getUserCollectedMenus(HttpServletRequest request,
                                                 @RequestParam(required = false, defaultValue = "1") int pageNo,
                                                 @RequestParam(required = false,
                                                         defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {
        WebResponseData webResponseData;
        try {
            SimpleUserInfo simpleUserInfo = ((SimpleUserInfo) request.getSession().getAttribute(SessionAttributeKeyConstants.SESSION_USER));
            PageInfo pageInfo = foodMenuInfoService.getUserCollectedMenus(simpleUserInfo.getId(), pageNo, pageSize);
            webResponseData = WebResponseData.success();
            webResponseData.setData(pageInfo);
        } catch (Exception e) {
            webResponseData = WebResponseData.error();
        }
        return webResponseData;

    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "pageNo", value = "页号", paramType = "query", dataType = "int"),
                    @ApiImplicitParam(name = "pageSize", value = "页大小", paramType = "query", dataType = "int")
            })
    @ApiOperation(value = "获取用户的菜谱", httpMethod = "GET")
    @GetMapping("getUserOwnMenus.do")
    public WebResponseData getUserOwnMenus(HttpServletRequest request,
                                           @RequestParam(required = false, defaultValue = "1") int pageNo,
                                           @RequestParam(required = false,
                                                   defaultValue = PageConstants.DEFAULT_PAGE_SIZE + "") int pageSize) {
        WebResponseData webResponseData;
        try {
            SimpleUserInfo simpleUserInfo = ((SimpleUserInfo) request.getSession().getAttribute(SessionAttributeKeyConstants.SESSION_USER));
            PageInfo pageInfo = foodMenuInfoService.getUserOwnMenus(simpleUserInfo.getId(), pageNo, pageSize);
            webResponseData = WebResponseData.success();
            webResponseData.setData(pageInfo);
        } catch (Exception e) {
            webResponseData = WebResponseData.error();
        }
        return webResponseData;
    }


    @ApiOperation(value = "获取用户信息", httpMethod = "GET")
    @GetMapping("getDetailUserInfo.do")
    public WebResponseData getUserInfo(HttpServletRequest request) {
        WebResponseData webResponseData;
        try {
            SimpleUserInfo simpleUserInfo = ((SimpleUserInfo) request.getSession().getAttribute(SessionAttributeKeyConstants.SESSION_USER));
            UserInfo userInfo = userInfoService.getUserInfoByUsername(simpleUserInfo.getUsername());
            webResponseData = WebResponseData.success();
            webResponseData.setData(userInfo);
        } catch (Exception e) {
            webResponseData = WebResponseData.error();
        }
        return webResponseData;
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "username", value = "用户名", paramType = "form", dataType = "string", required = true),
                    @ApiImplicitParam(name = "nickname", value = "昵称", paramType = "form", dataType = "string"),
                    @ApiImplicitParam(name = "gender", value = "性别（1：男，2：女）", paramType = "form", dataType = "string", required = true),
                    @ApiImplicitParam(name = "avatar", value = "头像地址", paramType = "form", dataType = "string"),
                    @ApiImplicitParam(name = "email", value = "邮箱地址", paramType = "form", dataType = "string"),
                    @ApiImplicitParam(name = "mobile", value = "手机号", paramType = "form", dataType = "int")
            })
    @ApiOperation(value = "更新用户信息", httpMethod = "POST")
    @PostMapping("updateUserInfo.do")
    public WebResponseData updateUserInfo(HttpServletRequest request, @RequestBody UserInfo userInfo) {
        SimpleUserInfo simpleUserInfo = ((SimpleUserInfo) request.getSession().getAttribute(SessionAttributeKeyConstants.SESSION_USER));
        try {
            if(userInfoService.updateUserInfo(simpleUserInfo.getUsername(), userInfo.getNickname(), userInfo.getGender(),
                    userInfo.getAvatar(), userInfo.getEmail(), userInfo.getMobile()+"")){
                simpleUserInfo.setNickname(userInfo.getNickname());
                simpleUserInfo.setAvatar(userInfo.getAvatar());
                request.getSession().setAttribute(SessionAttributeKeyConstants.SESSION_USER, simpleUserInfo);
                WebResponseData responseData = WebResponseData.success();
                responseData.setData(simpleUserInfo);
                return responseData;
            }
            return WebResponseData.error();
        } catch (Exception e) {
           return WebResponseData.error();
        }
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
            return WebResponseData.paramIsNull();
        }
        try {
            SimpleUserInfo userInfo = ((SimpleUserInfo) request.getSession().getAttribute(SessionAttributeKeyConstants.SESSION_USER));
            menuInfo.setUser(userInfo);
            foodMenuInfoService.createMenu(menuInfo);
            return WebResponseData.success();
        } catch (Exception e) {
            return WebResponseData.error();
        }
    }

    @ApiImplicitParams(
            value = {
                    @ApiImplicitParam(name = "oldPassword", value = "旧密码", paramType = "form", dataType = "string", required = true),
                    @ApiImplicitParam(name = "newPassword", value = "新密码", paramType = "form", dataType = "string", required = true)
            })
    @ApiOperation(value = "更新用户密码", httpMethod = "POST")
    @PostMapping("updatePassword.do")
    public WebResponseData updatePassword(String oldPassword, String newPassword) {
        if (StringUtils.isBlank(oldPassword) || StringUtils.isBlank(newPassword)) {
            return WebResponseData.paramIsNull();
        }

        WebResponseData webResponseData = new WebResponseData();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserInfo user = ((com.colleage.cook.vo.UserInfo) authentication.getPrincipal()).getUser();

        if(passwordEncoder.matches(newPassword, user.getPassword())){
            webResponseData.setCode(WebResponseData.Code.NEW_OLD_PASSWORD_EQUAL_ERROR);
            webResponseData.setMessage(WebResponseData.Message.NEW_OLD_PASSWORD_EQUAL_ERROR);
            return webResponseData;
        }
        if (!passwordEncoder.matches(oldPassword, user.getPassword())) {
            webResponseData.setCode(WebResponseData.Code.PASSWORD_ERROR);
            webResponseData.setMessage(WebResponseData.Message.PASSWORD_ERROR);
            return webResponseData;
        }

        if (userInfoService.updatePassword(user.getUsername(), passwordEncoder.encode(newPassword))) {
            webResponseData.setCode(WebResponseData.Code.SUCCESS);
            webResponseData.setMessage(WebResponseData.Message.SUCCESS);
        } else {
            webResponseData.setCode(WebResponseData.Code.UPDATE_PASSWORD_ERROR);
            webResponseData.setMessage(WebResponseData.Message.UPDATE_PASSWORD_ERROR);
        }
        return webResponseData;
    }
}