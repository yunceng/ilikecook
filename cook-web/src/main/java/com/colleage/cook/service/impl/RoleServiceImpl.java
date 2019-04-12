package com.colleage.cook.service.impl;

import com.colleage.cook.domain.RoleInfo;
import com.colleage.cook.mapper.RoleInfoMapper;
import com.colleage.cook.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("roleSerivice")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleInfoMapper roleInfoMapper;

    @Override
    public List<RoleInfo> getRoleValuesByRoleId(Integer userId) {
        return roleInfoMapper.getRoleValuesByRoleId(userId);
    }
}
