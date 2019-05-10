package com.colleage.cook.mapper;

import com.colleage.cook.domain.MenuFoodCommentInfo;
import com.colleage.cook.vo.AllMenuFoodCommentInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Classname FoodMenuCommentInfoMapper
 * @Description 菜谱评论数据库访问
 * @Date 2019\5\10 0010
 * @Created by David
 */
public interface FoodMenuCommentInfoMapper {

    /**
     * 插入评论
     * @param info
     * @return
     */
    boolean insertComment(@Param("info") MenuFoodCommentInfo info, @Param("parent_commentId") Integer parent_commentId);

    /**
     * 获取菜谱的所有评论消息
     * @param uuid
     * @return
     */
    List<AllMenuFoodCommentInfo> selectCommentsByMenuId(@Param("uuid") String uuid);

}
