package com.colleage.cook.mapper;

import com.colleage.cook.domain.UserInfo;
import org.apache.ibatis.annotations.Param;

public interface UserInfoMapper {

    UserInfo findUserInfoByUsername(@Param("username") String username, @Param("password") String password);

}
