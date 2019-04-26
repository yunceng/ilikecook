package com.colleage.cook.domain;

import java.io.Serializable;

/**
 * @Classname TinyFoodClassificationInfo
 * @Description 食材分类的三级分类信息
 * @Date 2019\4\22 0022
 * @Created by David
 */
public class TinyFoodClassificationInfo implements Serializable {

    private String name;

    private int category;

    private int score;

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

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

}
