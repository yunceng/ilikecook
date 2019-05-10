package com.colleage.cook.service.impl;

import com.colleage.cook.domain.MenuFoodCommentInfo;
import com.colleage.cook.mapper.FoodMenuCommentInfoMapper;
import com.colleage.cook.service.FoodMenuCommentInfoService;
import com.colleage.cook.vo.AllMenuFoodCommentInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname FoodMenuCommentInfoServiceImpl
 * @Description 菜谱评论业务访问接口实现
 * @Date 2019\5\10 0010
 * @Created by David
 */
@Service("foodMenuCommentInfoService")
public class FoodMenuCommentInfoServiceImpl implements FoodMenuCommentInfoService {

    @Autowired
    private FoodMenuCommentInfoMapper foodMenuCommentInfoMapper;

    @Override
    public boolean insertComment(MenuFoodCommentInfo info, Integer parent_commentId) {
        return foodMenuCommentInfoMapper.insertComment(info, parent_commentId);
    }

    @Override
    public List<AllMenuFoodCommentInfo> selectCommentsByMenuId(String uuid) {
        return foodMenuCommentInfoMapper.selectCommentsByMenuId(uuid);
    }
}
