package com.colleage.cook.service.impl;


import com.colleage.cook.domain.MenuInfo;
import com.colleage.cook.domain.RoleInfo;
import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.mapper.MenuInfoMapper;
import com.colleage.cook.mapper.RoleInfoMapper;
import com.colleage.cook.mapper.UserInfoMapper;
import com.colleage.cook.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("userInfoService")
public class UserInfoServiceImpl implements UserInfoService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private MenuInfoMapper menuInfoMapper;

    @Autowired
    private RoleInfoMapper roleInfoMapper;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        /*模拟数据库操作*/
        UserInfo user = userInfoMapper.findUserInfoByUsername(s);
        if (user == null) {
            throw new InsufficientAuthenticationException("用户:" + s + ",不存在!");
        }
        return new com.colleage.cook.bean.UserInfo(user, true, true, getAuthorities(user.getUsername()));
    }


    @Override
    public UserInfo getUserInfoByUsername(String username) {
        return userInfoMapper.findUserInfoByUsername(username);
    }

    @Override
    public UserInfo getUserInfoByUserId(int userId) {
        return userInfoMapper.findUserInfoByUserId(userId);
    }

    @Override
    public UserInfo register(UserInfo userInfo) {
        userInfoMapper.register(userInfo);
        return userInfo;
    }

    @Override
    public boolean updateAvatar(int userId, String avatar) {
        return userInfoMapper.updateAvatar(userId, avatar);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities(String username) {
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        UserInfo userInfo;
        if ((userInfo = userInfoMapper.findUserInfoByUsername(username)) == null) {
            return grantedAuthorities;
        }
        List<RoleInfo> roleValues = roleInfoMapper.getRoleValuesByRoleId(userInfo.getRole_id());
        for (RoleInfo role : roleValues){
            //角色必须是ROLE_开头，可以在数据库中设置
            GrantedAuthority grantedAuthority = new SimpleGrantedAuthority("ROLE_"+role.getValue());
            grantedAuthorities.add(grantedAuthority);
            //获取权限
            List<MenuInfo> permissionList = menuInfoMapper.getMenusByRoleId(role.getId());
            for (MenuInfo menu : permissionList) {
                GrantedAuthority authority = new SimpleGrantedAuthority(menu.getCode());
                grantedAuthorities.add(authority);
            }
        }
        return grantedAuthorities;
    }
}
