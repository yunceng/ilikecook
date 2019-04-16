package com.colleage.cook.controller;

import com.colleage.cook.constants.SystemInfoConstants;
import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.domain.UserOpenOauthInfo;
import com.colleage.cook.exception.ConsumeException;
import com.colleage.cook.oauth.bean.OauthQQ;
import com.colleage.cook.oauth.bean.OpenOauthBean;
import com.colleage.cook.oauth.bean.TokenUtil;
import com.colleage.cook.service.OpenOauthService;
import com.colleage.cook.utils.FilePathUtils;
import com.colleage.cook.utils.ImageUtils;
import com.colleage.cook.utils.upload.FileRepo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Classname ThirdPartyLoginController
 * @Description 第三方登录接口
 * @Date 2019\4\15 0015
 * @Created by David
 */
@RequestMapping("oauth")
@Controller
public class ThirdPartyLoginController extends BaseLoginController {

    private static final String SESSION_STATE = "_SESSION_STATE_";

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
            throw new ConsumeException("跳转到QQ授权接口时发生异常");
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
    public String callback4QQ(String code, String state, HttpServletRequest request, ModelMap model) {
        // --
        String session_state = (String) request.getSession().getAttribute(SESSION_STATE);
        // 取消了授权
        if (StringUtils.isBlank(state) || StringUtils.isBlank(session_state) || !state.equals(session_state) || StringUtils.isBlank(code)) {
            throw new ConsumeException("缺少必要的参数");
        }
        request.getSession().removeAttribute(SESSION_STATE);

        OpenOauthBean openOauthBean;
        try {
            openOauthBean = OauthQQ.getOauthInstance().getUserBeanByCode(code);
        } catch (Exception e) {
            throw new ConsumeException("解析信息时发生错误");
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
            return "register";
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
    public String bindOauth(UserOpenOauthInfo openOauth, HttpServletRequest request) throws Exception {
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
                String ava100 = SystemInfoConstants.AVADIR + getAvaPath(u.getId(), 100);
                ImageUtils.download(openOauth.getAvatar(), fileRepo.getRoot() + ava100);
                userInfoService.updateAvatar(u.getId(), ava100);

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
            user.setAvatar(SystemInfoConstants.all_system_info.get(SystemInfoConstants.DEFAULT_USER_AVATAR));
        }
        return user;
    }

    public String getAvaPath(long uid, int size) {
        String base = FilePathUtils.getAvatar(uid);
        return String.format("/%s_%d.jpg", base, size);
    }
}
