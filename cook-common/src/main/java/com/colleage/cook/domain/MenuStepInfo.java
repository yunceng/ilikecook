package com.colleage.cook.domain;

import java.io.Serializable;

/**
 * @Classname MenuStepInfo
 * @Description 菜谱的步骤
 * @Date 2019\4\23 0023
 * @Created by David
 */
public class MenuStepInfo implements Serializable {

    private int id;

    /**
     * 菜谱的id
     */
    private String menu_id;

    /**
     * 步骤介绍
     */
    private String desc;

    /**
     * 菜谱步骤配图
     */
    private String img;

    /**
     * 菜谱顺序
     */
    private int order;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMenu_id() {
        return menu_id;
    }

    public void setMenu_id(String menu_id) {
        this.menu_id = menu_id;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }
}
