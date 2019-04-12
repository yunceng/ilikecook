package com.colleage.cook.service.impl;


import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.mapper.UserInfoMapper;
import com.colleage.cook.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Override
    public UserInfo findUserInfoByUsername(String username, String password) {
        return userInfoMapper.findUserInfoByUsername(username, password);
    }
}
