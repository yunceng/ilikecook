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
     * 根据分类查找菜谱数量
     *
     * @param category
     * @return
     */
    Integer getMenuByCategoryIdCount(@Param("category") int category);

    /**
     * 根据分类查找菜谱
     *
     * @param category
     * @param start
     * @param limit
     * @return
     */
    List<MenuSummaryInfo> getMenuByCategoryId(@Param("category") int category, @Param("start") int start, @Param("limit") int limit);

    /**
     * 根据关键词获得相应的菜谱数量
     *
     * @param word
     * @return
     */
    Integer getMenuByLikeWordCount(@Param("word") String word);

    /**
     * 根据关键词获得相应的菜谱
     *
     * @param word
     * @return
     */
    List<MenuSummaryInfo> getMenuByLikeWord(@Param("word") String word, @Param("start") int start, @Param("limit") int limit);

    /**
     * 获取推荐的菜谱
     *
     * @param start
     * @param limit
     * @return
     */
    List<MenuSummaryInfo> getRecommendMenu(@Param("mixScore") float mixScore, @Param("start") int start, @Param("limit") int limit);

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
    Integer getLastCreateCount(@Param("recentDays") int recentDays);

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

    /**
     * 更新菜谱的收藏数量
     *
     * @param uuid
     * @return
     */
    boolean updateMenuCollected(@Param("uuid") String uuid);

    /**
     * 更新菜谱的浏览数量
     *
     * @param uuid
     * @return
     */
    boolean updateMenuBrowsed(@Param("uuid") String uuid, @Param("nums") int nums);

    /**
     * 更新菜谱的推荐指数
     *
     * @return
     */
    boolean updateMenuRecommend();

    /**
     * 创建菜谱与用户的关系
     * @param uuid
     * @param userId
     * @return
     */
    boolean insertUserMenuRel(@Param("uuid") String uuid, @Param("userId") int userId);

    /**
     * 判断菜谱是否被用户收藏
     * @param uuid
     * @param userId
     * @return
     */
    boolean menuIsCollected(@Param("uuid") String uuid, @Param("userId") int userId);

    /**
     * 创建菜谱与分类的关系
     *
     * @param uuid
     * @param categorys
     * @return
     */
    boolean insertMenuCategoryRel(@Param("uuid") String uuid, @Param("categorys") List categorys);

    /**
     * 创建菜谱信息
     *
     * @param summaryInfo
     * @param userId
     * @return
     */
    boolean insertMenuSummary(@Param("summaryInfo") MenuSummaryInfo summaryInfo, @Param("userId") int userId);

    /**
     * 插入菜谱的原材料信息
     *
     * @param uuid
     * @param menuFoodInfoList
     * @return
     */
    boolean insertMenuFoods(@Param("uuid") String uuid, @Param("menuFoods") List<MenuFoodInfo> menuFoodInfoList);

    /**
     * 插入菜谱的步骤信息
     *
     * @param uuid
     * @param menuStepInfoList
     * @return
     */
    boolean insertMenuSteps(@Param("uuid") String uuid, @Param("menuSteps") List<MenuStepInfo> menuStepInfoList);
}
