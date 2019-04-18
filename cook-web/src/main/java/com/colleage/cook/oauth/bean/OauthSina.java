package com.colleage.cook.oauth.bean;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.colleage.cook.constants.SystemInfoConstants;
import com.colleage.cook.oauth.utils.TokenUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.HashMap;
import java.util.Map;

/**
 * @Classname OauthSina
 * @Description TODO
 * @Date 2019\4\16 0016
 * @Created by David
 */
public class OauthSina extends AbstractOauth {

    private static final Logger LOGGER = Logger.getLogger(OauthSina.class);
    private static final String AUTH_URL = "https://api.weibo.com/oauth2/authorize";
    private static final String TOKEN_URL = "https://api.weibo.com/oauth2/access_token";
    private static final String TOKEN_INFO_URL = "https://api.weibo.com/oauth2/get_token_info";
    private static final String USER_INFO_URL = "https://api.weibo.com/2/users/show.json";

    private static OauthSina oauthSina = null;

    public static AbstractOauth getOauthInstance() {
        if (oauthSina == null) {
            synchronized (oauthSina) {
                if (oauthSina == null) {
                    oauthSina = new OauthSina();
                }
            }
        }
        return oauthSina;
    }

    private OauthSina() {
        setClientId(SystemInfoConstants.all_system_info.get(SystemInfoConstants.WEIBO_CLIENT_ID));
        setClientSecret(SystemInfoConstants.all_system_info.get(SystemInfoConstants.WEIBO_CLIENT_SERCRET));
        setRedirectUri(SystemInfoConstants.all_system_info.get(SystemInfoConstants.SITE_OAUTH_WEIBO));
    }

    public String getAuthorizeUrl(String state) throws UnsupportedEncodingException {
        Map params = new HashMap();
        params.put("response_type", "code");
        params.put("client_id", getClientId());
        params.put("redirect_uri", getRedirectUri());
        if (StringUtils.isNotBlank(state)) {
            params.put("state", state);
        }
        return super.getAuthorizeUrl(AUTH_URL, params);
    }

    @Override
    public String getTokenByCode(String code) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        Map params = new HashMap();
        params.put("code", code);
        params.put("client_id", getClientId());
        params.put("client_secret", getClientSecret());
        params.put("grant_type", "authorization_code");
        params.put("redirect_uri", getRedirectUri());
        String token = TokenUtil.getAccessToken(super.doPost(TOKEN_URL, params));
        LOGGER.debug(token);
        return token;
    }

    public String getTokenInfo(String accessToken) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        Map params = new HashMap();
        params.put("access_token", accessToken);
        String openid = TokenUtil.getUid(super.doPost(TOKEN_INFO_URL, params));
        LOGGER.debug(openid);
        return openid;
    }

    @Override
    public String getUserInfo(String accessToken, String uid) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        Map params = new HashMap();
        params.put("uid", uid);
        params.put("access_token", accessToken);
        String userInfo = super.doGet(USER_INFO_URL, params);
        LOGGER.debug(userInfo);
        return userInfo;
    }

    @Override
    public JSONObject getUserInfoByCode(String code) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        String accessToken = getTokenByCode(code);
        if (StringUtils.isBlank(accessToken)) {
            return null;
        }
        String uid = getTokenInfo(accessToken);
        if (StringUtils.isBlank(uid)) {
            return null;
        }
        JSONObject dataMap = JSON.parseObject(getUserInfo(accessToken, uid));
        dataMap.put("access_token", accessToken);
        LOGGER.debug(dataMap);
        return dataMap;
    }

    @Override
    public OpenOauthBean getUserBeanByCode(String code)
            throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        OpenOauthBean openOauthBean = new OpenOauthBean();
        JSONObject userInfo = getOauthInstance().getUserInfoByCode(code);

        String openid = userInfo.getString("id");
        String accessToken = userInfo.getString("access_token");
        String nickname = userInfo.getString("screen_name");
        String photoUrl = userInfo.getString("profile_image_url");

        openOauthBean.setOauthCode(code);
        openOauthBean.setAccessToken(accessToken);
        openOauthBean.setExpireIn("");
        openOauthBean.setOauthUserId(openid);
        openOauthBean.setOauthType(OauthTypeEnum.TYPE_SINA.getValue());
        openOauthBean.setUsername("SN" + openid.getBytes().hashCode());
        openOauthBean.setNickname(nickname);
        openOauthBean.setAvatar(photoUrl);

        return openOauthBean;
    }
}
