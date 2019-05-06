package com.colleage.cook.oauth.bean;

import com.colleage.cook.exception.ThirdPartyLoginException;

/**
 * @Classname OauthTypeEnum
 * @Description 第三方认证的类型
 * @Date 2019\4\16 0016
 * @Created by David
 */
public enum OauthTypeEnum {

    TYPE_DOUBAN("豆瓣登录", 3),
    TYPE_QQ("QQ登录", 2),
    TYPE_SINA("微博登录", 1),
    TYPE_NULL("无", 0);

    private String description;
    private int value;

    private OauthTypeEnum(String desc, int value) {
        this.description = desc;
        this.value = value;
    }

    public String getDescription() {
        return this.description;
    }

    public int getValue() {
        return this.value;
    }

    public static OauthTypeEnum getEnumStatus(int type) throws Exception {
        OauthTypeEnum[] status = values();
        for (int i = 0; i < status.length; i++) {
            if (status[i].getValue() == type) {
                return status[i];
            }
        }
        throw new ThirdPartyLoginException("不存在该第三方登录");
    }
}
