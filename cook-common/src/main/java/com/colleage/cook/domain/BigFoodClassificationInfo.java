package com.colleage.cook.domain;

import java.io.Serializable;

/**
 * @Classname BigFoodClassificationInfo
 * @Description 食材分类的最大类
 * @Date 2019\4\22 0022
 * @Created by David
 */
public class BigFoodClassificationInfo implements Serializable {

    private int id;

    private String name;

    private int category;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }
}
