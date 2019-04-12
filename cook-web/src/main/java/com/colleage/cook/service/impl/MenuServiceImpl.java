package com.colleage.cook.service.impl;

import com.colleage.cook.domain.MenuInfo;
import com.colleage.cook.mapper.MenuInfoMapper;
import com.colleage.cook.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuInfoMapper menuInfoMapper;

    @Override
    public List<MenuInfo> getMenusByRoleId(Integer roleId) {
        return menuInfoMapper.getMenusByRoleId(roleId);
    }
}
