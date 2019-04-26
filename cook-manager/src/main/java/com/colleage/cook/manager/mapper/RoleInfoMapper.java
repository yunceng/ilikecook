package com.colleage.cook.manager.mapper;

import com.colleage.cook.domain.RoleInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Classname RoleInfoMapper
 * @Description 角色访问操作
 * @Date 2019\4\12 0012
 * @Created by David
 */
public interface RoleInfoMapper {

    List<RoleInfo> getRoleValuesByRoleId(@Param("role_id") Integer role_id);
}
