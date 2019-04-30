package com.colleage.cook.manager.service;

import com.colleage.cook.domain.AdminInfo;
import com.colleage.cook.utils.page.PageInfo;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @Classname AdminInfoService
 * @Description 管理员业务接口
 * @Date 2019\4\26 0026
 * @Created by David
 */
public interface AdminInfoService extends UserDetailsService {

    /**
     * 根据用户名查找管理员信息
     *
     * @param username
     * @return
     */
//    @PreAuthorize("(#principal.username.equals(#username) AND hasRole('ADMIN')) OR hasRole('SUPER')")
    AdminInfo findAdminInfoByUsername(String username);

    /**
     * 获取一般管理员列表信息
     *
     * @param role_id
     * @param pageNo
     * @param pageSize
     * @return
     */
    @PreAuthorize("hasRole('SUPER')")
    PageInfo getBeManagedAdmins(int role_id, int pageNo, int pageSize);

    /**
     * 创建一般管理员
     *
     * @param adminInfo
     * @return
     */
    @PreAuthorize("hasRole('SUPER')")
    boolean createAdmin(AdminInfo adminInfo);

    /**
     * 更新一般管理员信息
     *
     * @param adminInfo
     * @return
     */
    @PreAuthorize("#principal.username.equals(#adminInfo.username) AND hasRole('ADMIN')")
    boolean updateAdminInfo(AdminInfo adminInfo);

    /**
     * 将一般管理员锁定账户
     *
     * @param username
     * @return
     */
    @PreAuthorize("hasRole('SUPER')")
    boolean lockAdminAccount(String username);

    /**
     * 将一般管理员锁定账户
     *
     * @param username
     * @return
     */
    @PreAuthorize("hasRole('SUPER')")
    boolean setAdminBlack(String username);

    /**
     * 将一般管理员锁定账户
     *
     * @param username
     * @return
     */
    @PreAuthorize("hasRole('SUPER')")
    boolean recoverAdminAccount(String username);
}
