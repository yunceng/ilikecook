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

    List<BigFoodClassificationInfo> getAllBig();

    List<SmallFoodClassificationInfo> getAllSmallByCategory(int bigId);

    List<TinyFoodClassificationInfo> getAllTinyByCategory(int smallId);
}
