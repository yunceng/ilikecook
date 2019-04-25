package com.colleage.cook.bean;

import java.io.Serializable;

/**
 * @Classname SimpleUserInfo
 * @Description 简略用户信息
 * @Date 2019\4\24 0024
 * @Created by David
 */
public class SimpleUserInfo implements Serializable {

    public SimpleUserInfo() {
    }

    public SimpleUserInfo(int id, String username, String avator) {
        this.id = id;
        this.username = username;
        this.avator = avator;
    }

    public SimpleUserInfo(com.colleage.cook.domain.UserInfo userInfo) {
        this.id = userInfo.getId();
        this.username = userInfo.getUsername();
        this.avator = userInfo.getAvatar();
    }

    private int id;

    private String username;

    private String avator;

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

    public String getAvator() {
        return avator;
    }

    public void setAvator(String avator) {
        this.avator = avator;
    }
}
