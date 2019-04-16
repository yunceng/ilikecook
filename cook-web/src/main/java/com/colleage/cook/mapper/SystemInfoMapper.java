package com.colleage.cook.mapper;

import com.colleage.cook.domain.SystemInfo;

import java.util.List;

/**
 * @Classname SystemInfoMapper
 * @Description 系统信息访问操作
 * @Date 2019\4\12 0012
 * @Created by David
 */
public interface SystemInfoMapper {

    List<SystemInfo> findAll();

}
