package com.colleage.cook.service;

import com.colleage.cook.domain.MenuFoodCommentInfo;
import com.colleage.cook.vo.AllMenuFoodCommentInfo;

import java.util.List;

/**
 * @Classname FoodMenuCommentInfoService
 * @Description 菜谱评论业务访问接口
 * @Date 2019\5\10 0010
 * @Created by David
 */
public interface FoodMenuCommentInfoService {

    /**
     * 插入评论
     * @param info
     * @return
     */
    boolean insertComment(MenuFoodCommentInfo info, Integer parent_commentId);

    /**
     * 获取菜谱的所有评论消息
     * @param uuid
     * @return
     */
    List<AllMenuFoodCommentInfo> selectCommentsByMenuId(String uuid);
}
