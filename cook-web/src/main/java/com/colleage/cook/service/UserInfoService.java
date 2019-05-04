package com.colleage.cook.service;

import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.vo.SimpleUserInfo;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface UserInfoService extends UserDetailsService {

    UserInfo getUserInfoByUsername(String username);

    SimpleUserInfo getUserInfoByUserId(int userId);

    UserInfo register(UserInfo userInfo);

    @PreAuthorize("principal.username.equals(#username)")
    boolean updateAvatar(String username, String avatar);

    @PreAuthorize("principal.username.equals(#username)")
    boolean updateUserInfo(String username, String nickname, Integer gender, String avatar, String email, String mobile);

    @PreAuthorize("principal.username.equals(#username) OR hasRole('ADMIN')")
    boolean lockUserAccount(String username);

    @PreAuthorize("principal.username.equals(#username) OR hasRole('ADMIN')")
    boolean blackUserAccount(String username);

    @PreAuthorize("hasRole('ADMIN')")
    boolean recoverNormalAccount(String username);

    @PreAuthorize("principal.username.equals(#username) OR hasRole('ADMIN')")
    boolean updatePassword(String username, String newPassword);
}
