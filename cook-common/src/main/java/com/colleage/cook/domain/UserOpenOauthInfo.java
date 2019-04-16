package com.colleage.cook.domain;

import java.io.Serializable;

/**
 * @Classname UserOpenOauthInfo
 * @Description 认证信息存储类
 * @Date 2019\4\16 0016
 * @Created by David
 */
public class UserOpenOauthInfo implements Serializable {

    private int id;

    //访问token
    private String access_token;
    //有效期
    private String expire_in;
    //认证码
    private String oauth_code;
    //认证类型
    private Integer oauth_type;
    //认证方用户id
    private String oauth_user_id;
    //刷新token
    private String refresh_token;
    //系统的用户id
    private Integer user_id;

    // extends
    private String username;
    private String nickname;
    private String email;
    private String avatar;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public String getExpire_in() {
        return expire_in;
    }

    public void setExpire_in(String expire_in) {
        this.expire_in = expire_in;
    }

    public String getOauth_code() {
        return oauth_code;
    }

    public void setOauth_code(String oauth_code) {
        this.oauth_code = oauth_code;
    }

    public Integer getOauth_type() {
        return oauth_type;
    }

    public void setOauth_type(Integer oauth_type) {
        this.oauth_type = oauth_type;
    }

    public String getOauth_user_id() {
        return oauth_user_id;
    }

    public void setOauth_user_id(String oauth_user_id) {
        this.oauth_user_id = oauth_user_id;
    }

    public String getRefresh_token() {
        return refresh_token;
    }

    public void setRefresh_token(String refresh_token) {
        this.refresh_token = refresh_token;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
