package com.colleage.cook.service;

import com.colleage.cook.domain.MenuInfo;

import java.util.List;

/**
 * @Classname MenuService
 * @Description 菜单业务层接口
 * @Date 2019\4\12 0012
 * @Created by David
 */
public interface MenuService {

    List<MenuInfo> getMenusByRoleId(Integer roleId);

}
