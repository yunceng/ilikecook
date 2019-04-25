package com.colleage.cook.domain;

import java.io.Serializable;

/**
 * @Classname MenuSummaryInfo
 * @Description 菜谱的信息
 * @Date 2019\4\23 0023
 * @Created by David
 */
public class MenuSummaryInfo implements Serializable {

    private int id;

    private String uuid;

    /**
     * 名称
     */
    private String name;

    /**
     * 封面
     */
    private String cover_img;

    /**
     * 用户id
     */
    private int userId;

    /**
     * 菜谱描述
     */
    private String desc;

    /**
     * 菜谱创建时间
     */
    private String createTime;

    /**
     * 分数，满分为10
     */
    private float score;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }
}
