package com.colleage.cook.mapper;

import com.colleage.cook.domain.BigFoodClassificationInfo;
import com.colleage.cook.domain.SmallFoodClassificationInfo;
import com.colleage.cook.domain.TinyFoodClassificationInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Classname FoodClassificationInfoMapper
 * @Description 获取菜谱分类信息
 * @Date 2019\4\22 0022
 * @Created by David
 */
public interface FoodClassificationInfoMapper {

    /**
     * 获得所有的分类信息
     *
     * @return
     */
    List<BigFoodClassificationInfo> getAllClassification();

    /**
     * 获取第一级分类
     *
     * @return
     */
    List<BigFoodClassificationInfo> getAllBig();

    /**
     * 获取第二级分类
     *
     * @param bigId
     * @return
     */
    List<SmallFoodClassificationInfo> getAllSmallByCategory(@Param("bigId") int bigId);

    /**
     * 获取第三级分类
     *
     * @param smallId
     * @return
     */
    List<TinyFoodClassificationInfo> getAllTinyByCategory(@Param("smallId") int smallId);

    /**
     * 获取菜谱所属的分类的名称
     *
     * @param uuid
     * @return
     */
    List<String> getCategoryNameByMenu(@Param("uuid") String uuid);

    /**
     * 获取菜谱所属的详细分类信息
     *
     * @param uuid
     * @return
     */
    List<TinyFoodClassificationInfo> getCategorysByMenu(@Param("uuid") String uuid);
}
