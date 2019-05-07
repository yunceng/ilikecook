package com.colleage.cook.service;

import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.vo.SimpleUserInfo;
import com.colleage.cook.vo.WebResponseData;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @Classname UserInfoService
 * @Description 用户信息访问接口
 * @Date 2019\4\11 0011
 * @Created by David
 */
public interface UserInfoService extends UserDetailsService {

    /**
     * 检查用户是否已经存在
     * @param username
     * @return
     */
    UserInfo checkUsernameIsExists(String username);

    /**
     * 检查邮箱是否已经存在
     * @param email
     * @return
     */
    UserInfo checkEmailIsExists(String email);

    /**
     * 通过用户名获取用户信息
     * @param username
     * @return
     */
    UserInfo getUserInfoByUsername(String username);

    /**
     * 通过用户id获取用户简略信息
     * @param userId
     * @return
     */
    SimpleUserInfo getUserInfoByUserId(int userId);

    /**
     * 注册
     * @param userInfo
     * @return
     */
    UserInfo register(UserInfo userInfo);

    /**
     * 更新用户头像
     * @param username
     * @param avatar
     * @return
     */
    @PreAuthorize("principal.username.equals(#username)")
    boolean updateAvatar(String username, String avatar);

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
    @PreAuthorize("principal.username.equals(#username)")
    boolean updateUserInfo(String username, String nickname, Integer gender, String avatar, String email, String mobile);

    /**
     * 锁住用户账号
     * @param username
     * @return
     */
    @PreAuthorize("principal.username.equals(#username) OR hasRole('ADMIN')")
    boolean lockUserAccount(String username);

    /**
     * 拉黑用户账号
     * @param username
     * @return
     */
    @PreAuthorize("principal.username.equals(#username) OR hasRole('ADMIN')")
    boolean blackUserAccount(String username);

    /**
     * 用户账号恢复正常状态
     * @param username
     * @return
     */
    @PreAuthorize("hasRole('ADMIN')")
    boolean recoverNormalAccount(String username);

    /**
     * 更新密码
     * @param username
     * @param newPassword
     * @return
     */
    @PreAuthorize("principal.username.equals(#username) OR hasRole('ADMIN')")
    boolean updatePassword(String username, String newPassword);
}
