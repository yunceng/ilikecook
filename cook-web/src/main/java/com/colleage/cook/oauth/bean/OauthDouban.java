package com.colleage.cook.oauth.bean;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.colleage.cook.constants.AccessDataCacheConstants;
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

import static com.colleage.cook.constants.HeaderConstants.ACCESS_TOKEN;

/**
 * @Classname OauthDouban
 * @Description 豆瓣认证
 * @Date 2019\4\16 0016
 * @Created by David
 */
public class OauthDouban extends AbstractOauth {

    private static final Logger LOGGER = Logger.getLogger(OauthDouban.class);
    private static final String AUTH_URL = "https://www.douban.com/service/auth2/auth";
    private static final String TOKEN_URL = "https://www.douban.com/service/auth2/token";
    private static final String USER_INFO_URL = "https://api.douban.com/v2/user/~me";

    private static OauthDouban oauthDouban = null;

    private OauthDouban() {
        setClientId(AccessDataCacheConstants.all_system_info.get(SystemInfoConstants.DOUBAN_API_KEY));
        setClientSecret(AccessDataCacheConstants.all_system_info.get(SystemInfoConstants.DOUBAN_SECRET_KEY));
        setRedirectUri(AccessDataCacheConstants.all_system_info.get(SystemInfoConstants.SITE_OAUTH_DOUBAN));
    }

    public static AbstractOauth getOauthInstance() {
        if (oauthDouban == null) {
            synchronized (oauthDouban) {
                if (oauthDouban == null) {
                    oauthDouban = new OauthDouban();
                }
            }
        }
        return oauthDouban;
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

    @Override
    public String getUserInfo(String accessToken, String uid) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        Map params = new HashMap();
        params.put("Authorization", "Bearer " + accessToken);
        String userInfo = super.doGetWithHeaders(USER_INFO_URL, params);
        JSONObject dataMap = JSON.parseObject(userInfo);
        LOGGER.debug(dataMap.toJSONString());
        return dataMap.toJSONString();
    }

    @Override
    public JSONObject getUserInfoByCode(String code) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        String accessToken = getTokenByCode(code);
        if (StringUtils.isBlank(accessToken)) {
            return null;
        }
        JSONObject dataMap = JSONObject.parseObject(getUserInfo(accessToken, null));
        dataMap.put(ACCESS_TOKEN, accessToken);
        LOGGER.debug(dataMap);
        return dataMap;
    }

    public OpenOauthBean getUserBeanByCode(String code)
            throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        OpenOauthBean openOauthBean = new OpenOauthBean();
        JSONObject userInfo = getOauthInstance().getUserInfoByCode(code);

        String openid = userInfo.getString("uid");
        String accessToken = userInfo.getString(ACCESS_TOKEN);
        String nickname = userInfo.getString("name");
        String photoUrl = userInfo.getString("large_avatar");

        openOauthBean.setOauthCode(code);
        openOauthBean.setAccessToken(accessToken);
        openOauthBean.setExpireIn("");
        openOauthBean.setOauthUserId(openid);
        openOauthBean.setOauthType(OauthTypeEnum.TYPE_DOUBAN.getValue());
        openOauthBean.setUsername("DB" + openid.getBytes().hashCode());
        openOauthBean.setNickname(nickname);
        openOauthBean.setAvatar(photoUrl);

        return openOauthBean;
    }
}
