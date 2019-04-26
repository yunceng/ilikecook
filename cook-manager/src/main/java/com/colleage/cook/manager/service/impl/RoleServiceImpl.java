package com.colleage.cook.manager.service.impl;

import com.colleage.cook.domain.RoleInfo;
import com.colleage.cook.manager.mapper.RoleInfoMapper;
import com.colleage.cook.manager.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname RoleServiceImpl
 * @Description 用户角色业务层实现
 * @Date 2019\4\12 0012
 * @Created by David
 */
@Service("roleSerivice")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleInfoMapper roleInfoMapper;

    @Override
    public List<RoleInfo> getRoleValuesByRoleId(Integer userId) {
        return roleInfoMapper.getRoleValuesByRoleId(userId);
    }
}
