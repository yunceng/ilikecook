package com.colleage.cook.constants;

import java.util.Map;

/**
 * @Classname 系统信息常量
 * @Description TODO
 * @Date 2019\4\11 0011
 * @Created by David
 */
public class SystemInfoConstants {

    public static Map<String, String> all_system_info;

    public static final String DEFAULT_USER_AVATAR = "default_user_avatar";

    public static final String SITE_NAME = "site_name"; // 站点名称

    public static final String SITE_DOMAIN   = "site_domain"; // 站点域名

    public static final String SITE_COPYRIGHT = "site_copyright";
    public static final String SITE_ICP = "site_icp"; // 备案号

    public static final String SITE_OAUTH_QQ = "site_oauth_qq"; // 第三方登录-QQ回调地址
    public static final String QQ_APP_ID = "qq_app_id";			// QQ互联APP_ID
    public static final String QQ_APP_KEY = "qq_app_key";		// QQ互联APP_KEY

    public static final String SITE_OAUTH_WEIBO = "site_oauth_weibo"; // 第三方登录-微博回调地址
    public static final String WEIBO_CLIENT_ID = "weibo_client_id";		// 微博应用CLIENT_ID
    public static final String WEIBO_CLIENT_SERCRET = "weibo_client_sercret";	// 微博应用CLIENT_SERCRET

    public static final String SITE_OAUTH_DOUBAN = "site_oauth_douban";	// 第三方登录-豆瓣回调地址
    public static final String DOUBAN_API_KEY = "douban_api_key";		// 豆瓣API_KEY
    public static final String DOUBAN_SECRET_KEY = "douban_secret_key";		// 豆瓣SECRET_KEY

}
