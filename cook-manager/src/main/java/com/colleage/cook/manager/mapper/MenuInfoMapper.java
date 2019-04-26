package com.colleage.cook.manager.mapper;

import com.colleage.cook.domain.MenuInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Classname MenuInfoMapper
 * @Description 菜单操作映射
 * @Date 2019\4\12 0012
 * @Created by David
 */
public interface MenuInfoMapper {

    List<MenuInfo> getMenusByRoleId(@Param("role_id") Integer roleId);

}
