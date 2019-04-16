package com.colleage.cook.service;

import com.colleage.cook.domain.UserInfo;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.Collection;

public interface UserInfoService extends UserDetailsService {

    @PreAuthorize("principal.username.equals(#username) OR hasRole('ADMIN')")
    UserInfo getUserInfoByUsername(String username);

    UserInfo getUserInfoByUserId(int userId);

    UserInfo register(UserInfo userInfo);

    boolean updateAvatar(int userId, String avatar);

    Collection<? extends GrantedAuthority> getAuthorities(String username);

}
