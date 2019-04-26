package com.colleage.cook.manager.service.impl;

import com.colleage.cook.domain.AdminInfo;
import com.colleage.cook.domain.MenuInfo;
import com.colleage.cook.domain.RoleInfo;
import com.colleage.cook.domain.UserInfo;
import com.colleage.cook.manager.mapper.AdminInfoMapper;
import com.colleage.cook.manager.mapper.MenuInfoMapper;
import com.colleage.cook.manager.mapper.RoleInfoMapper;
import com.colleage.cook.manager.service.AdminInfoService;
import com.colleage.cook.utils.page.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @Classname AdminInfoServiceImpl
 * @Description 管理员访问接口实现类
 * @Date 2019\4\26 0026
 * @Created by David
 */
@Service("adminInfoService")
public class AdminInfoServiceImpl implements AdminInfoService{

    @Autowired
    private AdminInfoMapper adminInfoMapper;

    @Autowired
    private RoleInfoMapper roleInfoMapper;

    @Autowired
    private MenuInfoMapper menuInfoMapper;

    @Override
    public AdminInfo findAdminInfoByUsername(String username) {
        return adminInfoMapper.findAdminInfoByUsername(username);
    }

    @Override
    public PageInfo getBeManagedAdmins(int role_id, int pageNo, int pageSize) {
        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        int count = adminInfoMapper.getBeManagedAdminsCount(role_id);
        List<AdminInfo> admins = adminInfoMapper.getBeManagedAdmins(role_id, pageInfo.getStart(), pageInfo.getPageSize());
        pageInfo.setData(admins);
        return pageInfo;
    }

    @Override
    public boolean createAdmin(AdminInfo adminInfo) {
        return adminInfoMapper.createAdmin(adminInfo);
    }

    @Override
    public boolean updateAdminInfo(AdminInfo adminInfo) {
        return adminInfoMapper.updateAdminInfo(adminInfo);
    }

    @Override
    public boolean lockAdminAccount(String username) {
        return adminInfoMapper.updateAdminStatus(username, AdminInfo.Status.ACCOUNT_LOCK.getCode());
    }

    @Override
    public boolean setAdminBlack(String username) {
        return adminInfoMapper.updateAdminStatus(username, AdminInfo.Status.ACCOUNT_BLACK.getCode());
    }

    @Override
    public boolean recoverAdminAccount(String username) {
        return adminInfoMapper.updateAdminStatus(username, AdminInfo.Status.NORMAL.getCode());
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        AdminInfo admin = adminInfoMapper.findAdminInfoByUsername(username);
        return new com.colleage.cook.manager.vo.AdminInfo(admin.getUsername(), admin.getPassword(),
                true, true,true,
                admin.getStatus() == AdminInfo.Status.NORMAL.getCode() ? true : false,
                getAuthorities(admin.getRole_id()));
    }

    private Collection<? extends GrantedAuthority> getAuthorities(int role_id) {
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        List<RoleInfo> roleValues = roleInfoMapper.getRoleValuesByRoleId(role_id);
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
