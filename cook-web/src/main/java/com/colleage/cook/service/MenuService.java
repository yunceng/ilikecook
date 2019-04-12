package com.colleage.cook.service;

import com.colleage.cook.domain.MenuInfo;

import java.util.List;

public interface MenuService {

    List<MenuInfo> getMenusByRoleId(Integer roleId);

}
