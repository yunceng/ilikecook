package com.colleage.cook.constants;

/**
 * @Classname SessionAttributeKeyConstants
 * @Description web服务中的常量
 * @Date 2019\4\25 0025
 * @Created by David
 */
public class SessionAttributeKeyConstants {

    private SessionAttributeKeyConstants(){}

    /**
     * 第三方登录保存状态
     */
    public static final String SESSION_STATE = "_SESSION_STATE_";

    /**
     * 用户信息
     */
    public static final String SESSION_USER = "_SESSION_USER_";

    /**
     * 保存用户验证后的上下文
     */
    public static final String SESSION_CONTEXT = "SPRING_SECURITY_CONTEXT";
}
