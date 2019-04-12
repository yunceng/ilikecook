package com.colleage.cook.service;

import com.colleage.cook.domain.UserInfo;

public interface UserInfoService{

    UserInfo findUserInfoByUsername(String username, String password);

}
