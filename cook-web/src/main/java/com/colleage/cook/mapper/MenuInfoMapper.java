package com.colleage.cook.mapper;

import com.colleage.cook.domain.MenuInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Classname MenuInfoMapper
 * @Description TODO
 * @Date 2019\4\12 0012
 * @Created by David
 */
public interface MenuInfoMapper {

    List<MenuInfo> getMenusByRoleId(@Param("role_id") Integer roleId);

}
