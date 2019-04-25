package com.colleage.cook.service;

import com.colleage.cook.bean.DetailMenuInfo;
import com.colleage.cook.domain.MenuSummaryInfo;
import com.colleage.cook.utils.page.PageInfo;

import java.util.List;

/**
 * @Classname FoodMenuInfoService
 * @Description 菜谱的业务接口
 * @Date 2019\4\23 0023
 * @Created by David
 */
public interface FoodMenuInfoService {

    /**
     * 根据关键词获得相应的菜谱
     *
     * @param word
     * @return
     */
    List<MenuSummaryInfo> getMenuByLikeWord(String word);

    /**
     * 获取最近几天最受欢迎的菜谱
     *
     * @return
     * @Param pageNo
     * @Param pageSize
     */
    PageInfo getCurrentWeekPopular(int pageNo, int pageSize);

    /**
     * 获取最近哪个月最受欢迎的菜谱
     *
     * @param months 从当前月份开始，1为上个月，2为上上个月
     * @return
     * @Param pageNo
     * @Param pageSize
     */
    PageInfo getLastMonthPopular(int months, int pageNo, int pageSize);

    /**
     * 获取最近创建的菜谱
     *
     * @return
     * @Param pageNo
     * @Param pageSize
     */
    PageInfo getLastCreate(int pageNo, int pageSize);

    /**
     * 获取流行菜单
     *
     * @return
     * @Param pageNo
     * @Param pageSize
     */
    PageInfo getPopularMenu(int pageNo, int pageSize);

    /**
     * 获取菜谱的详细信息
     *
     * @param uuid
     * @return
     */
    DetailMenuInfo getDetailMenuInfo(String uuid);

}
