/**
 * 
 */
package com.colleage.cook.utils;

/**
 * @Classname FilePathUtils
 * @Description 文件路径工具类
 * @Date 2019\4\11 0011
 * @Created by David
 */
public class FilePathUtils {
	private static String template = "%09d";
	private static int[] grids = new int[] {3,2,2,2};
	private static int length = 9;

	/**
	 * 获取用户头像的名称
	 * @param key
	 * @return
	 */
	public static String getAvatar(long key) {
		String r = String.format(template, key);
		StringBuffer buf = new StringBuffer(32);
		
		int pos = 0;
		for (int t: grids) {
			buf.append(r.substring(pos, pos + t));
			pos += t;
			if (pos < length) {
				buf.append('/');
			}
		}
        return buf.toString();
	}

}
