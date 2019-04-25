package com.colleage.cook.service.impl;

import com.colleage.cook.domain.BigFoodClassificationInfo;
import com.colleage.cook.domain.SmallFoodClassificationInfo;
import com.colleage.cook.domain.TinyFoodClassificationInfo;
import com.colleage.cook.mapper.FoodClassificationInfoMapper;
import com.colleage.cook.service.FoodClassificationInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname FoodClassificationInfoServiceImpl
 * @Description 获取菜谱分类信息接口实现类
 * @Date 2019\4\22 0022
 * @Created by David
 */
@Service("foodClassificationInfoService")
public class FoodClassificationInfoServiceImpl implements FoodClassificationInfoService {

    @Autowired
    private FoodClassificationInfoMapper foodClassificationInfoMapper;

    @Override
    public List<BigFoodClassificationInfo> getAllBig() {
        return foodClassificationInfoMapper.getAllBig();
    }

    @Override
    public List<SmallFoodClassificationInfo> getAllSmallByCategory(int bigId) {
        return foodClassificationInfoMapper.getAllSmallByCategory(bigId);
    }

    @Override
    public List<TinyFoodClassificationInfo> getAllTinyByCategory(int smallId) {
        return foodClassificationInfoMapper.getAllTinyByCategory(smallId);
    }
}
