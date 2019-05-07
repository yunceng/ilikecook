package com.colleage.cook.mapper;

import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.vo.SimpleUserInfo;
import org.apache.ibatis.annotations.Param;

/**
 * @Classname UserInfoMapper
 * @Description 用户信息访问操作
 * @Date 2019\4\12 0012
 * @Created by David
 */
public interface UserInfoMapper {

    /**
     * 根据用户名查找用户信息
     *
     * @param username
     * @return
     */
    UserInfo findUserInfoByUsername(@Param("username") String username);

    /**
     * 根据用户主键查找用户信息
     *
     * @param userId
     * @return
     */
    SimpleUserInfo findUserInfoByUserId(@Param("userId") int userId);

    /**
     * 注册用户
     *
     * @param userInfo
     * @return
     */
    boolean register(@Param("userInfo") UserInfo userInfo);

    /**
     * 更新用户头像
     *
     * @param username
     * @param avatar
     * @return
     */
    boolean updateAvatar(@Param("username") String username, @Param("avatar") String avatar);

    /**
     * 更新用户信息
     * @param username
     * @param nickname
     * @param gender
     * @param avatar
     * @param email
     * @param mobile
     * @return
     */
    boolean updateUserInfo(@Param("username") String username, @Param("nickname") String nickname,
                           @Param("gender") Integer gender, @Param("avatar") String avatar,
                           @Param("email") String email, @Param("mobile") String mobile);

    /**
     * 更新用户状态
     *
     * @param username
     * @param status
     * @return
     */
    boolean updateUserStatus(@Param("username") String username, @Param("status") int status);

    /**
     * 更新用户密码
     * @param username
     * @param password
     * @return
     */
    boolean updatePassword(@Param("username") String username, @Param("password") String password);

    /**
     * 检查用户名是不是已经存在
     * @param username
     * @return
     */
    UserInfo checkUsernameIsExists(@Param("username") String username);

    /**
     * 检查邮箱是不是已经存在
     * @param email
     * @return
     */
    UserInfo checkEmailIsExists(@Param("email") String email);
}
