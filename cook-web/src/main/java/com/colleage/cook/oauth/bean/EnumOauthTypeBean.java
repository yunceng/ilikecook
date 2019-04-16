package com.colleage.cook.oauth.bean;

/**
 * @Classname EnumOauthTypeBean
 * @Description TODO
 * @Date 2019\4\16 0016
 * @Created by David
 */
public enum EnumOauthTypeBean {

    TYPE_DOUBAN("豆瓣登录", 3),
    TYPE_QQ("QQ登录", 2),
    TYPE_SINA("微博登录", 1),
    TYPE_NULL("无", 0);

    private String description;
    private int value;

    private EnumOauthTypeBean(String desc, int value) {
        this.description = desc;
        this.value = value;
    }

    public String getDescription() {
        return this.description;
    }

    public int getValue() {
        return this.value;
    }

    public static EnumOauthTypeBean getEnumStatus(int type) throws Exception {
        EnumOauthTypeBean[] status = values();
        for (int i = 0; i < status.length; i++) {
            if (status[i].getValue() == type) {
                return status[i];
            }
        }

        throw new Exception();
    }
}
