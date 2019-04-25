package com.colleage.cook.bean;

import java.io.Serializable;
import java.util.List;

/**
 * @Classname SimpleMenuInfo
 * @Description 页面显示的菜谱信息
 * @Date 2019\4\23 0023
 * @Created by David
 */
public class SimpleMenuInfo implements Serializable {

    public SimpleMenuInfo() {
    }

    public SimpleMenuInfo(String uuid, String name, String cover_img, String foods, String createTime, String username, List<String> tagNames) {
        this.uuid = uuid;
        this.name = name;
        this.cover_img = cover_img;
        this.foods = foods;
        this.createTime = createTime;
        this.username = username;
        this.tagNames = tagNames;
    }

    private String uuid;
    /**
     * 菜谱的名称
     */
    private String name;
    /**
     * 菜谱的封面
     */
    private String cover_img;
    /**
     * 菜谱的部分原料
     */
    private String foods;

    /**
     * 菜谱创建时间
     */
    private String createTime;

    /**
     * 作者名称
     */
    private String username;

    /**
     * 分类名称
     */
    private List<String> tagNames;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCover_img() {
        return cover_img;
    }

    public void setCover_img(String cover_img) {
        this.cover_img = cover_img;
    }

    public String getFoods() {
        return foods;
    }

    public void setFoods(String foods) {
        this.foods = foods;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<String> getTagNames() {
        return tagNames;
    }

    public void setTagNames(List<String> tagNames) {
        this.tagNames = tagNames;
    }
}
