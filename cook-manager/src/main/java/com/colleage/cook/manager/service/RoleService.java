package com.colleage.cook.manager.service;

import com.colleage.cook.domain.RoleInfo;

import java.util.List;

/**
 * @Classname RoleService
 * @Description 用户角色业务层接口
 * @Date 2019\4\12 0012
 * @Created by David
 */
public interface RoleService {

    List<RoleInfo> getRoleValuesByRoleId(Integer userId);

}
