package com.colleage.cook.task;

import com.colleage.cook.constants.SystemInfoConstants;
import com.colleage.cook.service.SystemInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * @Classname Task
 * @Description 定时执行任务
 * @Date 2019\4\11 0011
 * @Created by David
 */
@Component
@Order(2)
public class Task {

    @Autowired
    private SystemInfoService systemInfoService;

    /**
     * 系统启动时获取系统信息并加载
     */
    @PostConstruct
    public void getSysteInfo(){
        SystemInfoConstants.all_system_info = systemInfoService.getSystemInfo();
    }

}
