package com.colleage.cook.mapper;

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
     * 根据关键词获得相应的菜谱
     *
     * @param word
     * @return
     */
    List<MenuSummaryInfo> getMenuByLikeWord(@Param("word") String word);

    /**
     * 获取最近几天最受欢迎的菜谱的总量
     *
     * @param recentDays 最近的天数,但天数为0或者负数时，则不限天数
     * @return
     */
    Integer getMostPopularInDaysCount(@Param("recentDays") int recentDays);

    /**
     * 获取最近几天最受欢迎的菜谱
     *
     * @param recentDays 最近的天数,但天数为0或者负数时，则不限天数
     * @param start
     * @param limit
     * @return
     */
    List<MenuSummaryInfo> getMostPopularInDays(@Param("recentDays") int recentDays, @Param("start") int start, @Param("limit") int limit);

    /**
     * 获取最近哪个月最受欢迎的菜谱总量
     *
     * @param months 从当前月份开始，1为上个月，2为上上个月
     * @return
     */
    Integer getLastMonthPopularCount(@Param("months") int months);

    /**
     * 获取最近哪个月最受欢迎的菜谱
     *
     * @param months 从当前月份开始，1为上个月，2为上上个月
     * @param start
     * @param limit
     * @return
     */
    List<MenuSummaryInfo> getLastMonthPopular(@Param("months") int months, @Param("start") int start, @Param("limit") int limit);

    /**
     * 获取最近创建的菜谱总量
     *
     * @return
     */
    Integer getLastCreateCount();

    /**
     * 获取最近创建的菜谱
     *
     * @param start
     * @param limit
     * @return
     */
    List<MenuSummaryInfo> getLastCreate(@Param("recentDays") int recentDays, @Param("start") int start, @Param("limit") int limit);

    /**
     * 获取uuid获取菜谱的原材料
     *
     * @param uuid 菜谱的uuid
     * @return
     */
    List<String> getSimpleFoods(@Param("uuid") String uuid);

    /**
     * 获取流行菜单总量
     *
     * @return
     */
    Integer getPopularMenuCount();

    /**
     * 获取流行菜单
     *
     * @param start
     * @param limit
     * @return
     */
    List<MenuSummaryInfo> getPopularMenu(@Param("start") int start, @Param("limit") int limit);

    /**
     * 获取菜谱的信息
     *
     * @param uuid
     * @return
     */
    MenuSummaryInfo getMenuSummaryInfo(@Param("uuid") String uuid);

    /**
     * 获取菜谱的材料信息
     *
     * @param uuid
     * @return
     */
    List<MenuFoodInfo> getMenuFoodInfos(@Param("uuid") String uuid);

    /**
     * 获取菜谱的步骤信息
     *
     * @param uuid
     * @return
     */
    List<MenuStepInfo> getMenuStepInfos(@Param("uuid") String uuid);

}
