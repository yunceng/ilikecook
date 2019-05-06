/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package com.colleage.cook.utils;

import java.net.MalformedURLException;
import java.net.URL;

/**
 * @Classname URLUtils
 * @Description URL处理工具类
 * @Date 2019\4\11 0011
 * @Created by David
 */
public class URLUtils {

	/**
	 * 从url中获取域名
	 * @param link
	 * @return
	 */
	public static String getHost(String link) {
		URL url;
		String host = "";
		try {
			url = new URL(link);
			host = url.getHost();
		} catch (MalformedURLException e) {
		}
		return host;
	}
}
