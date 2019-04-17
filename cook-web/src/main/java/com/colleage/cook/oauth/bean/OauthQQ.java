package com.colleage.cook.oauth.bean;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.colleage.cook.constants.SystemInfoConstants;
import com.colleage.cook.oauth.utils.TokenUtil;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.HashMap;
import java.util.Map;

/**
 * @Classname OauthQQ
 * @Description qq认证信息类
 * @Date 2019\4\16 0016
 * @Created by David
 */
public class OauthQQ extends AbstractOauth {

    private static final Logger LOGGER = LoggerFactory.getLogger(OauthQQ.class);
    private static final String AUTH_URL = "https://graph.qq.com/oauth2.0/authorize";
    private static final String TOKEN_URL = "https://graph.qq.com/oauth2.0/token";
    private static final String TOKEN_INFO_URL = "https://graph.qq.com/oauth2.0/me";
    private static final String USER_INFO_URL = "https://graph.qq.com/user/get_user_info";

    private static OauthQQ oauthQQ = null;

    public static AbstractOauth getOauthInstance() {
        if (oauthQQ == null) {
            synchronized (OauthQQ.class) {
                if (oauthQQ == null) {
                    oauthQQ = new OauthQQ();
                }
            }
        }
        return oauthQQ;
    }

    private OauthQQ() {
        setClientId(SystemInfoConstants.all_system_info.get(SystemInfoConstants.QQ_APP_ID));
        setClientSecret(SystemInfoConstants.all_system_info.get(SystemInfoConstants.QQ_APP_KEY));
        setRedirectUri(SystemInfoConstants.all_system_info.get(SystemInfoConstants.SITE_OAUTH_QQ));
    }

    public String getAuthorizeUrl(String state) throws UnsupportedEncodingException {
        Map<String, String> params = new HashMap();
        params.put("response_type", "code");
        params.put("client_id", getClientId());
        params.put("redirect_uri", getRedirectUri());
        if (StringUtils.isNotBlank(state)) {
            params.put("state", state);
        }
        return super.getAuthorizeUrl(AUTH_URL, params);
    }

    public String getTokenByCode(String code) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        Map<String, String> params = new HashMap();
        params.put("code", code);
        params.put("client_id", getClientId());
        params.put("client_secret", getClientSecret());
        params.put("grant_type", "authorization_code");
        params.put("redirect_uri", getRedirectUri());

        String token = TokenUtil.getAccessToken(super.doGet(TOKEN_URL, params));
        LOGGER.debug(token);
        return token;
    }

    public String getTokenInfo(String accessToken) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        Map<String, String> params = new HashMap();
        params.put("access_token", accessToken);

        String openid = TokenUtil.getOpenId(super.doGet(TOKEN_INFO_URL, params));
        LOGGER.debug(openid);
        return openid;
    }

    public String getUserInfo(String accessToken, String uid) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        Map<String, String> params = new HashMap();
        params.put("access_token", accessToken);
        params.put("oauth_consumer_key", getClientId());
        params.put("openid", uid);
        params.put("format", "json");

        String userinfo = super.doGet(USER_INFO_URL, params);
        LOGGER.debug(userinfo);
        return userinfo;
    }

    public JSONObject getUserInfoByCode(String code) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        String accessToken = getTokenByCode(code);
        if (StringUtils.isBlank(accessToken)) {
            return null;
        }
        String openId = getTokenInfo(accessToken);
        if (StringUtils.isBlank(openId)) {
            return null;
        }
        JSONObject dataMap = JSON.parseObject(getUserInfo(accessToken, openId));
        dataMap.put("openid", openId);
        dataMap.put("access_token", accessToken);
        return dataMap;
    }

    @Override
    public OpenOauthBean getUserBeanByCode(String code)
            throws Exception {
        OpenOauthBean openOauthBean;
        JSONObject userInfo = getOauthInstance().getUserInfoByCode(code);

        if (userInfo.containsKey("ret") && userInfo.getString("ret").equals("0")) {
            openOauthBean = new OpenOauthBean();
            String openid = userInfo.getString("openid");
            String accessToken = userInfo.getString("access_token");
            String nickname = userInfo.getString("nickname");
            String photoUrl = userInfo.getString("figureurl_2");

            openOauthBean.setOauthCode(code);
            openOauthBean.setAccessToken(accessToken);
            openOauthBean.setExpireIn("");
            openOauthBean.setOauthUserId(openid);
            openOauthBean.setOauthType(OauthTypeEnum.TYPE_QQ.getValue());
            openOauthBean.setUsername("QQ" + openid.getBytes().hashCode());
            openOauthBean.setNickname(nickname);
            openOauthBean.setAvatar(photoUrl);
        } else {
            throw new Exception("获取用户信息发生异常");
        }
        return openOauthBean;
    }
}
