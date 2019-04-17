/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package com.colleage.cook.utils.upload.impl;

import com.colleage.cook.utils.FilePathUtils;
import org.springframework.stereotype.Service;

/**
 * @Classname FileRepoImpl
 * @Description 文件存储具体实现类
 * @Date 2019\4\11 0011
 * @Created by David
 */
@Service
public class FileRepoImpl extends AbstractFileRepo {

	@Override
	public String getRoot() {
		return ROOT;
	}

	public static String getAvaPath(long uid, int size) {
		String base = FilePathUtils.getAvatar(uid);
		return String.format("/%s_%d.jpg", base, size);
	}
}
