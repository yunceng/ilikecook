package com.colleage.cook.domain;

import java.io.Serializable;
import java.util.List;

/**
 * @Classname BigFoodClassificationInfo
 * @Description 食材分类的一级分类信息
 * @Date 2019\4\22 0022
 * @Created by David
 */
public class BigFoodClassificationInfo implements Serializable {

    private String name;

    private int category;

    private List<SmallFoodClassificationInfo> smallFoodClassificationInfos;

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

    public List<SmallFoodClassificationInfo> getSmallFoodClassificationInfos() {
        return smallFoodClassificationInfos;
    }

    public void setSmallFoodClassificationInfos(List<SmallFoodClassificationInfo> smallFoodClassificationInfos) {
        this.smallFoodClassificationInfos = smallFoodClassificationInfos;
    }
}
