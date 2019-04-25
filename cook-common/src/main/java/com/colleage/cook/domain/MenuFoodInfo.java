package com.colleage.cook.domain;

import java.io.Serializable;

/**
 * @Classname MenuFoodInfo
 * @Description 菜谱的原料
 * @Date 2019\4\23 0023
 * @Created by David
 */
public class MenuFoodInfo implements Serializable {


    private int id;

    /**
     * 菜谱的id
     */
    private String menu_id;

    /**
     * 用料的名称
     */
    private String name;

    /**
     * 用料的数量
     */
    private String num;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }
}
