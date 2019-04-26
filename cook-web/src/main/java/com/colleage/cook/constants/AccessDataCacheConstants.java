package com.colleage.cook.constants;

import com.colleage.cook.domain.BigFoodClassificationInfo;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Classname AccessDataCacheConstants
 * @Description 频繁访问的数据
 * @Date 2019\4\25 0025
 * @Created by David
 */
public class AccessDataCacheConstants {

    /**
     * 系统信息存放，只加载一次
     */
    public static Map<String, String> all_system_info;

    /**
     * 搜索词的数量统计，每天更新数据库
     */
    public static Map<String, Integer> SEARCH_WORD_NUMS = new ConcurrentHashMap<>();

    /**
     * 菜谱被浏览的次数统计，每天更新数据库
     */
    public static Map<String, Integer> MENU_BROWSE_NUMS = new ConcurrentHashMap<>();

    /**
     * 所有的分类信息，每天更新数据库
     */
    public static List<BigFoodClassificationInfo> ALL_CLASSIFICATION_DATA;

}
