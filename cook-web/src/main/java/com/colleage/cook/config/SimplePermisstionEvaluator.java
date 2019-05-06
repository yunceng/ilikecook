package com.colleage.cook.config;

import com.colleage.cook.domain.UserInfo;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.Collection;

/**
 * @Classname SimplePermisstionEvaluator
 * @Description 简单的权限检查实现
 * @Date 2019\4\16 0016
 * @Created by David
 */

@Component
public class SimplePermisstionEvaluator implements PermissionEvaluator {

    @Override
    public boolean hasPermission(Authentication authentication, Object o, Object o1) {
        if (o instanceof UserInfo) {
            return hasPermission(authentication, o1);
        }
        return false;
    }

    @Override
    public boolean hasPermission(Authentication authentication, Serializable serializable, String s, Object o) {
        return false;
    }

    private boolean hasPermission(Authentication authentication, Object o1) {
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        if (authorities.contains(o1)) {
            return true;
        } else {
            return false;
        }
    }
}
