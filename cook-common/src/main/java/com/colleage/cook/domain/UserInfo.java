package com.colleage.cook.domain;

import java.io.Serializable;

/**
 * 用户信息存储类
 *
 * @author david
 * @since 2019.04.11
 * @version 1.0
 *
 */
public class UserInfo implements Serializable{

    private int id;
    //用户名，具有唯一性
    private String username;
    //密码
    private String password;
    //头像
    private String avatar;
    //用户创建时间
    private String create_time;
    //用户邮箱
    private String email;
    //最后一次登录时间
    private String last_login;
    //手机号码
    private int mobile;
    //用户状态（0：正常，1：锁定，2：异常，3：注销）
    private int status;
    //昵称
    private String nickname;
    //性别（0：未知，1：男，2：女，）
    private int gender;
    //关注数
    private int favors;
    //被关注数
    private int follows;
    //签名
    private String signature;
    //作品数量
    private int production;
    //发布的菜谱数量
    private int menus;
    //用户拥有的角色的id
    private int role_id;
    //认证类型
    private int oauth_type;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getLast_login() {
        return last_login;
    }

    public void setLast_login(String last_login) {
        this.last_login = last_login;
    }

    public int getMobile() {
        return mobile;
    }

    public void setMobile(int mobile) {
        this.mobile = mobile;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getFavors() {
        return favors;
    }

    public void setFavors(int favors) {
        this.favors = favors;
    }

    public int getFollows() {
        return follows;
    }

    public void setFollows(int follows) {
        this.follows = follows;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public int getProduction() {
        return production;
    }

    public void setProduction(int production) {
        this.production = production;
    }

    public int getMenus() {
        return menus;
    }

    public void setMenus(int menus) {
        this.menus = menus;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public int getOauth_type() {
        return oauth_type;
    }

    public void setOauth_type(int oauth_type) {
        this.oauth_type = oauth_type;
    }

    @Override
    public String toString() {
        return String.format("%s, username: %s, status: %d", getClass(), username, status);
    }
}
