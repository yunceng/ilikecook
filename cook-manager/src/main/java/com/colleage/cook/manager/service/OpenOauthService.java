package com.colleage.cook.manager.service;

import com.colleage.cook.domain.UserOpenOauthInfo;

/**
 * @Classname OpenOauthServiceImpl
 * @Description 认证信息数据业务操作接口
 * @Date 2019\4\16 0016
 * @Created by David
 */
public interface OpenOauthService {

    //通过 oauth_token 查询 user
//    UserInfo getUserByOauthToken(String oauth_token);
//
//    OpenOauthVO getOauthByToken(String oauth_token);

    UserOpenOauthInfo getOauthByOauthUserId(String oauthUserId);

//    OpenOauthVO getOauthByUid(int userId);
//
//    boolean checkIsOriginalPassword(int userId);

    void saveOauthToken(UserOpenOauthInfo oauth);

}
