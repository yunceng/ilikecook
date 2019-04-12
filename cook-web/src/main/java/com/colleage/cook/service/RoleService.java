package com.colleage.cook.service;

import com.colleage.cook.domain.RoleInfo;

import java.util.List;

public interface RoleService {

    List<RoleInfo> getRoleValuesByRoleId(Integer userId);

}
