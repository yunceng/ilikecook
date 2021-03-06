package com.colleage.cook.task;

import com.colleage.cook.constants.AccessDataCacheConstants;
import com.colleage.cook.domain.BigFoodClassificationInfo;
import com.colleage.cook.service.FoodClassificationInfoService;
import com.colleage.cook.service.FoodMenuInfoService;
import com.colleage.cook.service.SearchWordInfoService;
import com.colleage.cook.service.SystemInfoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import static com.colleage.cook.constants.AccessDataCacheConstants.MENU_BROWSE_NUMS;
import static com.colleage.cook.constants.AccessDataCacheConstants.SEARCH_WORD_NUMS;

/**
 * @Classname Task
 * @Description 定时执行任务
 * @Date 2019\4\11 0011
 * @Created by David
 */
@Component
@Order(2)
public class Task {

    private static final Logger LOGGER = LoggerFactory.getLogger(Task.class);

    @Autowired
    private SystemInfoService systemInfoService;

    @Autowired
    private SearchWordInfoService searchWordInfoService;

    @Autowired
    private FoodMenuInfoService foodMenuInfoService;

    @Autowired
    private FoodClassificationInfoService foodClassificationInfoService;

    /**
     * 系统启动时获取系统信息并加载
     */
    @PostConstruct
    public void getSysteInfo(){
        try {
            AccessDataCacheConstants.all_system_info = systemInfoService.getSystemInfo();
        } catch (Exception e) {
            LOGGER.warn("系统获取分类信息出现异常，请检查");
            while ((AccessDataCacheConstants.all_system_info = systemInfoService.getSystemInfo()) == null) ;
        }
    }

    /**
     * 定时将关键词的搜索次数保存到数据库中
     */
    @Scheduled(cron = "0 0 0 * * ?")
    @PreDestroy
    public void saveSearchWordNums() {
        Map<String, Integer> data = new ConcurrentHashMap<>(SEARCH_WORD_NUMS);
        try {
            SEARCH_WORD_NUMS.clear();
            searchWordInfoService.insertOrUpdate(data);
            data = null;
        } catch (Exception e) {
            SEARCH_WORD_NUMS.putAll(data);
            LOGGER.warn("保存搜索词搜索次数出现异常，请检查");
        }
    }

    /**
     * 保存菜谱浏览数量
     */
    @Scheduled(cron = "0 15 0 * * ?")
    @PreDestroy
    public void saveMenuBrowseNums() {
        Map<String, Integer> data = new ConcurrentHashMap<>(MENU_BROWSE_NUMS);
        try {
            MENU_BROWSE_NUMS.clear();
            foodMenuInfoService.updateMenuBrowseAndRecommend(data);
        } catch (Exception e) {
            SEARCH_WORD_NUMS.putAll(data);
            LOGGER.warn("保存菜单浏览数出现异常，请检查");
        }
    }

    /**
     * 加载分类信息，一次加载永久使用
     */
    @PostConstruct
    @Scheduled(cron = "0 25 0 * * ?")
    public void getClassification() {
        List<BigFoodClassificationInfo> newData = AccessDataCacheConstants.ALL_CLASSIFICATION_DATA;
        try {
            AccessDataCacheConstants.ALL_CLASSIFICATION_DATA = foodClassificationInfoService.getAllClassification();
        } catch (Exception e) {
            LOGGER.warn("系统获取分类信息出现异常，请检查");
            if (newData == null) {
                while ((AccessDataCacheConstants.ALL_CLASSIFICATION_DATA = foodClassificationInfoService.getAllClassification()) == null)
                    ;
            } else {
                AccessDataCacheConstants.ALL_CLASSIFICATION_DATA = newData;
            }
        }
    }

}
