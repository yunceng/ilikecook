package com.colleage.cook.mapper;

import com.colleage.cook.domain.UserOpenOauthInfo;
import org.apache.ibatis.annotations.Param;


/**
 * @Classname OpenOauthInfoMapper
 * @Description 认证信息数据访问操作
 * @Date 2019\4\16 0016
 * @Created by David
 */
public interface OpenOauthInfoMapper {

    //通过 oauth_token 查询 user
//    UserInfo getUserByOauthToken(@Param("oauth_token") String oauth_token);

//    OpenOauthVO getOauthByToken(@Param("oauth_token") String oauth_token);

    UserOpenOauthInfo getOauthByOauthUserId(@Param("oauth_user_id") String oauthUserId);

//    OpenOauthVO getOauthByUid(@Param("userId") int userId);

//    boolean checkIsOriginalPassword(@Param("userId") int userId);

    void saveOauthToken(@Param("oauth") UserOpenOauthInfo oauth);

}
