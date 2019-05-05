package com.colleage.cook.manager.service.impl;

import com.colleage.cook.domain.MenuSummaryInfo;
import com.colleage.cook.manager.mapper.FoodMenuInfoMapper;
import com.colleage.cook.manager.service.FoodMenuInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname FoodMenuInfoServiceImpl
 * @Description 菜谱业务实现接口
 * @Date 2019\4\23 0023
 * @Created by David
 */
@Service("foodMenuInfoService")
public class FoodMenuInfoServiceImpl implements FoodMenuInfoService {

    @Autowired
    private FoodMenuInfoMapper foodMenuInfoMapper;

    @Override
    public List<MenuSummaryInfo> getOnlineMenuRotation() {
        return foodMenuInfoMapper.getMenuRotation(MenuSummaryInfo.Status.ONLINE.getCode());
    }

    @Override
    public List<MenuSummaryInfo> getOfflineMenuRotation() {
        return foodMenuInfoMapper.getMenuRotation(MenuSummaryInfo.Status.OFFLINE.getCode());
    }

    @Override
    public boolean offlineMenuRotation(String uuid) {
        return foodMenuInfoMapper.updateMenuRotationStatus(uuid, MenuSummaryInfo.Status.OFFLINE.getCode());
    }


}
