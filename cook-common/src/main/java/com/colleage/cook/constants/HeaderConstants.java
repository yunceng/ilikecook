package com.colleage.cook.constants;

/**
 * @Classname HeaderConstants
 * @Description 请求头中的常量
 * @Date 2019\4\18 0018
 * @Created by David
 */
public class HeaderConstants {

    private HeaderConstants(){}

    public static final String ACCESS_TOKEN = "access_token";

    /**
     * 默认编码方式
     */
    public static final String UTF8 = "utf-8";
    /**
     * cookie中的JSESSIONID
     */
    public static final String JESSIONID = "JSESSIONID";
    /**
     * 请求头中的内容类型
     */
    public static final String CONTENT_TYPE = "application/json;charset=utf-8";
    /**
     * 允许跨域访问
     */
    public static final String ACCESS_CONTROL_ALLOW_ORIGIN = "Access-Control-Allow-Origin";

    /**
     * 自定义的header信息
     */
    public static final String ACCESS_CONTROL_EXPOSE_HEADERS = "Access-Control-Expose-Headers";
    /**
     * 认证信息
     */
    public static final String AUTHORIZATION = "Authorization";

}
