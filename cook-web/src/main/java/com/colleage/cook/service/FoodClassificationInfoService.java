package com.colleage.cook.service;

import com.colleage.cook.domain.BigFoodClassificationInfo;
import com.colleage.cook.domain.SmallFoodClassificationInfo;
import com.colleage.cook.domain.TinyFoodClassificationInfo;

import java.util.List;

/**
 * @Classname FoodClassificationInfoService
 * @Description 获取菜谱分类信息接口
 * @Date 2019\4\22 0022
 * @Created by David
 */
public interface FoodClassificationInfoService {

    /**
     * 获得所有的分类信息
     *
     * @return
     */
    List<BigFoodClassificationInfo> getAllClassification();

    /**
     * 获得一级分类信息
     *
     * @return
     */
    List<BigFoodClassificationInfo> getAllBig();

    /**
     * 获得二级分类信息
     *
     * @param bigId
     * @return
     */
    List<SmallFoodClassificationInfo> getAllSmallByCategory(int bigId);

    /**
     * 获得三级分类信息
     * @param smallId
     * @return
     */
    List<TinyFoodClassificationInfo> getAllTinyByCategory(int smallId);
}
