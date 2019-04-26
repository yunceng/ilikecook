package com.colleage.cook.vo;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

/**
 * @Classname UserInfo
 * @Description 权限控制的userInfo
 * @Date 2019\4\12 0012
 * @Created by David
 */
public class UserInfo extends User{

    private com.colleage.cook.domain.UserInfo user;

    public UserInfo(com.colleage.cook.domain.UserInfo user, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        super(user.getUsername(), user.getPassword(), true, true, credentialsNonExpired, accountNonLocked, authorities);
        this.user = user;
    }

    public com.colleage.cook.domain.UserInfo getUser() {
        return user;
    }

    public void setUser(com.colleage.cook.domain.UserInfo user) {
        this.user = user;
    }
}
