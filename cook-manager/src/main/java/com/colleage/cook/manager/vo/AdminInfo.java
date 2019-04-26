package com.colleage.cook.manager.vo;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

/**
 * @Classname AdminInfo
 * @Description TODO
 * @Date 2019\4\26 0026
 * @Created by David
 */
public class AdminInfo extends User {

    private com.colleage.cook.domain.AdminInfo adminInfo;

    public AdminInfo(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
    }

    public com.colleage.cook.domain.AdminInfo getAdminInfo() {
        return adminInfo;
    }

    public void setAdminInfo(com.colleage.cook.domain.AdminInfo adminInfo) {
        this.adminInfo = adminInfo;
    }
}
