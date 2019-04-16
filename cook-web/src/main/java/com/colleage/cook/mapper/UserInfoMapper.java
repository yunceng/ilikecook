package com.colleage.cook.mapper;

import com.colleage.cook.domain.UserInfo;
import org.apache.ibatis.annotations.Param;

/**
 * @Classname UserInfoMapper
 * @Description 用户信息访问操作
 * @Date 2019\4\12 0012
 * @Created by David
 */
public interface UserInfoMapper {

    UserInfo findUserInfoByUsername(@Param("username") String username);

    UserInfo findUserInfoByUserId(@Param("userId") int userId);

    boolean register(@Param("userInfo") UserInfo userInfo);

    boolean updateAvatar(@Param("userId") int userId, @Param("avatar") String avatar);

}
