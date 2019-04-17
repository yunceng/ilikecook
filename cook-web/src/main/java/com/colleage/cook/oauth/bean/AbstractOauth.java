package com.colleage.cook.oauth.bean;

import com.alibaba.fastjson.JSONObject;
import com.colleage.cook.oauth.utils.HttpUtils;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.Map;

/**
 * @Classname AbstractOauth
 * @Description 第三方登录认证的抽象类
 * @Date 2019\4\16 0016
 * @Created by David
 */
public abstract class AbstractOauth {

    private String clientId;
    private String clientSecret;
    private String redirectUri;

    protected String getAuthorizeUrl(String authorize, Map<String, String> params) throws java.io.UnsupportedEncodingException {
        return HttpUtils.initParams(authorize, params);
    }

    protected String doPost(String url, Map<String, String> params) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        return HttpUtils.post(url, params);
    }

    protected String doGet(String url, Map<String, String> params) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        return HttpUtils.get(url, params);
    }

    protected String doGetWithHeaders(String url, Map<String, String> headers) throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException {
        return HttpUtils.get(url, null, headers);
    }

    public String getClientId() {
        return this.clientId;
    }

    public AbstractOauth setClientId(String clientId) {
        this.clientId = clientId;
        return this;
    }

    public String getClientSecret() {
        return this.clientSecret;
    }

    public AbstractOauth setClientSecret(String clientSecret) {
        this.clientSecret = clientSecret;
        return this;
    }

    public String getRedirectUri() {
        return this.redirectUri;
    }

    public AbstractOauth setRedirectUri(String redirectUri) {
        this.redirectUri = redirectUri;
        return this;
    }

    public abstract String getTokenByCode(String code)
            throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException;

    public abstract String getUserInfo(String accessToken, String uid)
            throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException;

    public abstract JSONObject getUserInfoByCode(String code)
            throws IOException, KeyManagementException, NoSuchAlgorithmException, NoSuchProviderException;

    public abstract OpenOauthBean getUserBeanByCode(String code) throws Exception;
}
