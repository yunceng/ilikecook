/*
+--------------------------------------------------------------------------
|   Mblog [#RELEASE_VERSION#]
|   ========================================
|   Copyright (c) 2014, 2015 mtons. All Rights Reserved
|   http://www.mtons.com
|
+---------------------------------------------------------------------------
*/
package com.colleage.cook.utils.upload;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @Classname FileRepo
 * @Description 文件存储接口
 * @Date 2019\4\11 0011
 * @Created by David
 */
public interface FileRepo {

	/**
	 * 文件存储-根目录
	 */
	public static final String ROOT = "/data/ilikecook";

	/**
	 * 文件存储-原文件目录
	 */
	public static final String ORIGDIR = "/store/orig";

	/**
	 * 文件存储-压缩目录
	 */
	public static final String THUMBSDIR = "/store/thumbs";

	/**
	 * 文件存储-头像目录
	 */
	public static final String AVADIR = "/store/ava";

	/**
	 * 文件存储-临时文件目录
	 */
	public static final String TEMPDIR = "/store/temp";

	/**
	 * 存储图片
	 * @param file
	 * @param basePath
	 * @return
	 * @throws IOException
	 */
	String store(MultipartFile file, String basePath) throws IOException;
	
	/**
	 * 存储压缩图片
	 * @param file
	 * @param basePath
	 * @return
	 * @throws IOException
	 */
	String storeScale(MultipartFile file, String basePath, int maxWidth) throws Exception;

	/**
	 * 存储压缩图片
	 * @param file
	 * @param basePath
	 * @return
	 * @throws IOException
	 */
	String storeScale(MultipartFile file, String basePath, int width, int height) throws Exception;
	
	/**
	 * 获取图片大小
	 *
	 * @param storePath
	 * @return
	 */
	int[] imageSize(String storePath);

	String getRoot();

	/**
	 * 存储路径
	 * @param storePath
	 */
	void deleteFile(String storePath);
}
