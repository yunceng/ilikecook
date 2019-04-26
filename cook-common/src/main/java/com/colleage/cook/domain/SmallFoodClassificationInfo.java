package com.colleage.cook.domain;

import java.io.Serializable;
import java.util.List;

/**
 * @Classname SmallFoodClassificationInfo
 * @Description 食材分类的二级分类信息
 * @Date 2019\4\22 0022
 * @Created by David
 */
public class SmallFoodClassificationInfo implements Serializable {

    private String name;

    private int category;

    private int isHref;

    private List<TinyFoodClassificationInfo> tinyFoodClassificationInfos;

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

    public List<TinyFoodClassificationInfo> getTinyFoodClassificationInfos() {
        return tinyFoodClassificationInfos;
    }

    public void setTinyFoodClassificationInfos(List<TinyFoodClassificationInfo> tinyFoodClassificationInfos) {
        this.tinyFoodClassificationInfos = tinyFoodClassificationInfos;
    }

//    public BigFoodClassificationInfo getBigFoodClassificationInfo() {
//        return bigFoodClassificationInfo;
//    }
//
//    public void setBigFoodClassificationInfo(BigFoodClassificationInfo bigFoodClassificationInfo) {
//        this.bigFoodClassificationInfo = bigFoodClassificationInfo;
//    }
}
