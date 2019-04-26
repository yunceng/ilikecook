package com.colleage.cook.manager.mapper;

import com.colleage.cook.domain.AdminInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Classname AdminInfoMapper
 * @Description 管理员信息操作
 * @Date 2019\4\26 0026
 * @Created by David
 */
public interface AdminInfoMapper {

    /**
     * 根据用户名查找管理员信息
     * @param username
     * @return
     */
    AdminInfo findAdminInfoByUsername(@Param("username") String username);

    /**
     * 获取一般管理员数量
     * @param role_id
     * @return
     */
    Integer getBeManagedAdminsCount(@Param("role_id") int role_id);

    /**
     * 获取一般管理员列表信息
     * @param role_id
     * @param start
     * @param limit
     * @return
     */
    List<AdminInfo> getBeManagedAdmins(@Param("role_id") int role_id, @Param("start") int start, @Param("limit") int limit);

    /**
     * 创建一般管理员
     * @param adminInfo
     * @return
     */
    boolean createAdmin(@Param("admin") AdminInfo adminInfo);

    /**
     * 更新一般管理员信息
     * @param adminInfo
     * @return
     */
    boolean updateAdminInfo(@Param("admin") AdminInfo adminInfo);

    /**
     * 更新一般管理员状态
     * @param username
     * @param status
     * @return
     */
    boolean updateAdminStatus(@Param("username") String username, @Param("status") int status);
}
