package com.colleage.cook.service;

import com.colleage.cook.utils.page.PageInfo;
import com.colleage.cook.vo.DetailMenuInfo;
import com.colleage.cook.vo.SimpleMenuInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * @Classname FoodMenuInfoService
 * @Description 菜谱的业务接口
 * @Date 2019\4\23 0023
 * @Created by David
 */
public interface FoodMenuInfoService {

    /**
     * 根据分类查找菜谱
     *
     * @param category
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageInfo getMenuByCategoryId(int category, int pageNo, int pageSize);

    /**
     * 根据关键词获得相应的菜谱
     *
     * @param word
     * @return
     */
    PageInfo getMenuByLikeWord(String word, int pageNo, int pageSize);

    /**
     * 获取推荐的菜谱
     *
     * @return
     * @Param pageNo
     * @Param pageSize
     */
    List<SimpleMenuInfo> getRecommendMenu(int pageNo, int pageSize);

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
     * @return
     * @Param pageNo
     * @Param pageSize
     */
    PageInfo getLastMonthPopular(int pageNo, int pageSize);

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
    DetailMenuInfo getDetailMenuInfo(int userId, String uuid);

    /**
     * 修改菜谱收藏数量
     *
     * @param userId
     * @param uuid
     * @return
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW, isolation = Isolation.DEFAULT,
            timeout = 3600, rollbackFor = Exception.class)
    boolean updateMenuCollectNum(@Param("userId") int userId, @Param("uuid") String uuid);

    /**
     * 修改菜谱浏览数和推荐指数
     * @param data
     * @return
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW, isolation = Isolation.DEFAULT,
            timeout = 3600, rollbackFor = Exception.class)
    boolean updateMenuBrowseAndRecommend(Map<String, Integer> data);

    /**
     * 创建菜谱
     *
     * @param menu
     * @return
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW, isolation = Isolation.DEFAULT,
            timeout = 3600, rollbackFor = Exception.class)
    boolean createMenu(DetailMenuInfo menu);
}
