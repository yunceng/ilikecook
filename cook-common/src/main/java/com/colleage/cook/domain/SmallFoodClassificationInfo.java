package com.colleage.cook.domain;

import java.io.Serializable;

/**
 * @Classname SmallFoodClassificationInfo
 * @Description TODO
 * @Date 2019\4\22 0022
 * @Created by David
 */
public class SmallFoodClassificationInfo implements Serializable {

    private int id;

    private String name;

    private int category;

    private int isHref;

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

    public int getIsHref() {
        return isHref;
    }

    public void setIsHref(int isHref) {
        this.isHref = isHref;
    }
}
