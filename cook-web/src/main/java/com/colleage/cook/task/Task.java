package com.colleage.cook.task;

import com.colleage.cook.constants.SystemInfoConstants;
import com.colleage.cook.service.SystemInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;

/**
 * @Classname Task
 * @Description TODO
 * @Date 2019\4\11 0011
 * @Created by David
 */
@Component
public class Task {

    @Autowired
    private SystemInfoService systemInfoService;

    @PostConstruct
    public void getSysteInfo(){
        SystemInfoConstants.all_system_info = systemInfoService.getSystemInfo();
    }

}
