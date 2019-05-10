package com.colleage.cook.constants;

import com.colleage.cook.domain.SystemInfo;

import java.util.Map;

/**
 * @Classname SystemInfoConstants
 * @Description 系统信息常量
 * @Date 2019\4\11 0011
 * @Created by David
 */
public class SystemInfoConstants {

    private SystemInfoConstants(){}

    /**
     * 系统信息存放，只加载一次
     */
    public static Map<String, String> all_system_info;

    /**
     * 用户默认的头像
     */
    public static final String DEFAULT_USER_AVATAR = "default_user_avatar";

    /**
     * 管理员默认的头像
     */
    public static final String DEFAULT_ADMIN_AVATAR = "default_user_avatar";

    /**
     * 站点名称
     */
    public static final String SITE_NAME = "site_name";

    /**
     * 站点域名
     */
    public static final String SITE_DOMAIN = "site_domain";

    /**
     * 站点所有权
     */
    public static final String SITE_COPYRIGHT = "site_copyright";
    /**
     * 备案号
     */
    public static final String SITE_ICP = "site_icp";

    /**
     * 第三方登录-QQ回调地址
     */
    public static final String SITE_OAUTH_QQ = "site_oauth_qq";
    /**
     * QQ互联APP_ID
     */
    public static final String QQ_APP_ID = "qq_app_id";
    /**
     * QQ互联APP_KEY
     */
    public static final String QQ_APP_KEY = "qq_app_key";

    /**
     * 第三方登录-微博回调地址
     */
    public static final String SITE_OAUTH_WEIBO = "site_oauth_weibo";
    /**
     * 微博应用CLIENT_ID
     */
    public static final String WEIBO_CLIENT_ID = "weibo_client_id";
    /**
     * 微博应用CLIENT_SERCRET
     */
    public static final String WEIBO_CLIENT_SERCRET = "weibo_client_sercret";

    /**
     * 第三方登录-豆瓣回调地址
     */
    public static final String SITE_OAUTH_DOUBAN = "site_oauth_douban";
    /**
     * 豆瓣API_KEY
     */
    public static final String DOUBAN_API_KEY = "douban_api_key";
    /**
     * 豆瓣SECRET_KEY
     */
    public static final String DOUBAN_SECRET_KEY = "douban_secret_key";

}
