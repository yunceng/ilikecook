package com.colleage.cook.manager.service.impl;

import com.colleage.cook.domain.UserOpenOauthInfo;
import com.colleage.cook.manager.mapper.OpenOauthInfoMapper;
import com.colleage.cook.manager.service.OpenOauthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Classname OpenOauthServiceImpl
 * @Description TODO
 * @Date 2019\4\16 0016
 * @Created by David
 */
@Service("openOauthService")
public class OpenOauthServiceImpl implements OpenOauthService {

    @Autowired
    private OpenOauthInfoMapper openOauthInfoMapper;


    @Override
    public UserOpenOauthInfo getOauthByOauthUserId(String oauthUserId) {
        return openOauthInfoMapper.getOauthByOauthUserId(oauthUserId);
    }

    @Override
    public void saveOauthToken(UserOpenOauthInfo oauth) {
        openOauthInfoMapper.saveOauthToken(oauth);
    }
}
