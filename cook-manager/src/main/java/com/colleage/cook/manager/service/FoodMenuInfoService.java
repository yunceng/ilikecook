package com.colleage.cook.manager.service;

import com.colleage.cook.domain.MenuSummaryInfo;

import java.util.List;

/**
 * @Classname FoodMenuInfoService
 * @Description 菜谱的业务接口
 * @Date 2019\4\23 0023
 * @Created by David
 */
public interface FoodMenuInfoService {

    /**
     * 获取首页轮播菜谱信息
     *
     * @return
     */
    List<MenuSummaryInfo> getOnlineMenuRotation();

    /**
     * 获取首页轮播菜谱历史信息
     *
     * @return
     */
    List<MenuSummaryInfo> getOfflineMenuRotation();

    /**
     * 下线轮播菜谱
     *
     * @return
     */
    boolean offlineMenuRotation(String uuid);
}
