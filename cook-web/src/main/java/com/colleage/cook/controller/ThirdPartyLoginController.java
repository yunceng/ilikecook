package com.colleage.cook.controller;

import com.colleage.cook.constants.AccessDataCacheConstants;
import com.colleage.cook.constants.SystemInfoConstants;
import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.domain.UserOpenOauthInfo;
import com.colleage.cook.exception.ThirdPartyLoginException;
import com.colleage.cook.oauth.bean.OauthQQ;
import com.colleage.cook.oauth.bean.OpenOauthBean;
import com.colleage.cook.oauth.utils.TokenUtil;
import com.colleage.cook.service.OpenOauthService;
import com.colleage.cook.utils.ImageUtils;
import com.colleage.cook.utils.constants.FileStorePathConstants;
import com.colleage.cook.utils.upload.FileRepo;
import com.colleage.cook.utils.upload.impl.FileRepoImpl;
import com.colleage.cook.vo.WebResponseData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.colleage.cook.constants.SessionAttributeKeyConstants.SESSION_STATE;
import static com.colleage.cook.constants.ViewConstants.OAUTH_REGISTERV;

/**
 * @Classname ThirdPartyLoginController
 * @Description 第三方登录接口
 * @Date 2019\4\15 0015
 * @Created by David
 */
@ApiIgnore
@RequestMapping("oauth")
@Controller
public class ThirdPartyLoginController extends BaseLoginController {

    @Autowired
    private OpenOauthService openOauthService;

    @Autowired
    private FileRepo fileRepo;

    /**
     * 跳转到QQ互联授权界面
     *
     * @param request
     * @param response
     * @author A蛋壳  2015年9月12日 下午3:28:21
     */
    @RequestMapping("qq")
    public void callQQ(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        try {
            String state = TokenUtil.randomState();
            request.getSession().setAttribute(SESSION_STATE, state);
            response.sendRedirect(((OauthQQ) OauthQQ.getOauthInstance()).getAuthorizeUrl(state));
        } catch (Exception e) {
            throw new ThirdPartyLoginException("跳转到QQ授权接口时发生异常");
        }
    }

    /**
     * QQ回调
     *
     * @param code
     * @param request
     * @return
     */
    @RequestMapping("/qq_callback")
    @ResponseBody
    public WebResponseData callback4QQ(String code, String state, HttpServletRequest request, ModelMap model) {
        // --
        String session_state = (String) request.getSession().getAttribute(SESSION_STATE);
        // 取消了授权
        if (StringUtils.isBlank(state) || StringUtils.isBlank(session_state) || !state.equals(session_state) || StringUtils.isBlank(code)) {
            throw new ThirdPartyLoginException("缺少必要的参数");
        }
        request.getSession().removeAttribute(SESSION_STATE);

        OpenOauthBean openOauthBean;
        try {
            openOauthBean = OauthQQ.getOauthInstance().getUserBeanByCode(code);
        } catch (Exception e) {
            throw new ThirdPartyLoginException("解析信息时发生错误");
        }

        UserOpenOauthInfo openOauth = new UserOpenOauthInfo();
        openOauth.setOauth_code(code);
        openOauth.setAccess_token(openOauthBean.getAccessToken());
        openOauth.setExpire_in(openOauthBean.getNickname());
        openOauth.setOauth_user_id(openOauthBean.getOauthUserId());
        openOauth.setOauth_type(openOauthBean.getOauthType());
        openOauth.setUsername(openOauth.getUsername());
        openOauth.setNickname(openOauth.getNickname());
        openOauth.setAvatar(openOauth.getAvatar());

        // 判断是否存在绑定此accessToken的用户
        UserOpenOauthInfo thirdToken = openOauthService.getOauthByOauthUserId(openOauth.getOauth_user_id());

        if (thirdToken == null) {
            model.put("open", openOauth);
            return WebResponseData.error();
        }
        String username = userInfoService.getUserInfoByUserId(thirdToken.getUser_id()).getUsername();
        return doLogin(request, username, thirdToken.getAccess_token());
    }

    /**
     * 执行第三方绑定
     *
     * @param openOauth
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/bind_oauth")
    @ResponseBody
    public WebResponseData bindOauth(UserOpenOauthInfo openOauth, HttpServletRequest request) throws Exception {
        UserOpenOauthInfo thirdToken = openOauthService.getOauthByOauthUserId(openOauth.getOauth_user_id());
        String username = openOauth.getUsername();

        // 已存在：提取用户信息，登录
        if (thirdToken != null) {
            username = userInfoService.getUserInfoByUserId(thirdToken.getUser_id()).getUsername();
            // 不存在：注册新用户，并绑定此token，登录
        } else {
            UserInfo user = userInfoService.getUserInfoByUsername(username);
            if (user == null) {
                UserInfo u = userInfoService.register(wrapUser(openOauth));

                // ===将远程图片下载到本地===
                String avator = fileRepo.getRoot() + FileStorePathConstants.AVADIR + FileRepoImpl.getAvaPath(u.getId(), 100);
                ImageUtils.download(openOauth.getAvatar(), avator);
                userInfoService.updateAvatar(u.getUsername(), avator);

                thirdToken = new UserOpenOauthInfo();
                BeanUtils.copyProperties(openOauth, thirdToken);
                thirdToken.setUser_id(u.getId());
                openOauthService.saveOauthToken(thirdToken);
            } else {
                username = user.getUsername();
            }
        }
        return doLogin(request, username, thirdToken.getAccess_token());
    }

    private UserInfo wrapUser(UserOpenOauthInfo openOauth) {
        UserInfo user = new UserInfo();
        user.setUsername(openOauth.getUsername());
        user.setNickname(openOauth.getNickname());
        user.setPassword(passwordEncoder.encode(openOauth.getAccess_token()));
        user.setGender(1);
        user.setOauth_type(openOauth.getOauth_type());
        if (StringUtils.isNotBlank(openOauth.getAvatar())) {
            //FIXME: 这里使用网络路径，前端应做对应处理
            user.setAvatar(openOauth.getAvatar());
        } else {
            user.setAvatar(AccessDataCacheConstants.all_system_info.get(SystemInfoConstants.DEFAULT_USER_AVATAR));
        }
        return user;
    }
}
