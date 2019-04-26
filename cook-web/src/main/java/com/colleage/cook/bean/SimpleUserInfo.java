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

    public SimpleUserInfo(int id, String username, String nickname, String avatar) {
        this.id = id;
        this.username = username;
        this.nickname = nickname;
        this.avatar = avatar;
    }

    private int id;

    private String username;

    private String nickname;

    private String avatar;

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

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
