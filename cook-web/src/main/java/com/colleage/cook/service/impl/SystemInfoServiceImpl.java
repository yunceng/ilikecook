package com.colleage.cook.service.impl;

import com.colleage.cook.domain.SystemInfo;
import com.colleage.cook.mapper.SystemInfoMapper;
import com.colleage.cook.service.SystemInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @Classname SystemInfoServiceImpl
 * @Description TODO
 * @Date 2019\4\11 0011
 * @Created by David
 */
@Service("systemInfoService")
public class SystemInfoServiceImpl implements SystemInfoService {

    @Autowired
    private SystemInfoMapper systemInfoMapper;

    @Override
    public Map getSystemInfo() {
        List<SystemInfo> systemInfos = systemInfoMapper.findAll();
        ConcurrentHashMap allSystemInfo = new ConcurrentHashMap();
        systemInfos.forEach(systemInfo -> {
            allSystemInfo.putIfAbsent(systemInfo.getKey(), systemInfo.getValue());
        });
        return allSystemInfo;
    }
}
