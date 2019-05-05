package com.colleage.cook.manager.mapper;

import com.colleage.cook.domain.MenuFoodInfo;
import com.colleage.cook.domain.MenuStepInfo;
import com.colleage.cook.domain.MenuSummaryInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Classname FoodMenuInfoMapper
 * @Description 菜谱的数据库访问接口
 * @Date 2019\4\23 0023
 * @Created by David
 */
public interface FoodMenuInfoMapper {

    /**
     * 获取首页轮播菜谱信息
     * @return
     */
    List<MenuSummaryInfo> getMenuRotation(@Param("status") int status);

    /**
     * 更新首页轮询菜谱展示项
     * @param uuid
     * @param status
     * @return
     */
    boolean updateMenuRotationStatus(@Param("uuid") String uuid, @Param("status") int status);
}
