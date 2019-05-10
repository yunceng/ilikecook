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


import com.colleage.cook.exception.FileFormatNotSupportException;
import com.colleage.cook.exception.FileNotNullException;
import com.colleage.cook.utils.FileNameUtils;
import com.colleage.cook.utils.ImageUtils;
import com.colleage.cook.utils.upload.FileRepo;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;

import static com.colleage.cook.constants.CharacterConstants.CHARACTER_SPOT;

/**
 * @Classname AbstractFileRepo
 * @Description 文件存储抽象实现类
 * @Date 2019\4\11 0011
 * @Created by David
 */
public abstract class AbstractFileRepo implements FileRepo {

    private static final Logger log = Logger.getLogger(AbstractFileRepo.class);

    // 文件允许格式
    protected String[] allowFiles = {".gif", ".png", ".jpg", ".jpeg", ".bmp"};

    /**
     * 验证文件是否为空，并且验证是否支持其格式
     * @param file
     */
    protected void validateFile(MultipartFile file) {
        if (file == null || file.isEmpty()) {
            throw new FileNotNullException();
        }

        if (!checkFileType(file.getOriginalFilename())) {
            throw new FileFormatNotSupportException();
        }
    }

    /**
     * 文件类型判断
     *
     * @param fileName
     * @return
     */
    protected boolean checkFileType(String fileName) {
        Iterator<String> type = Arrays.asList(this.allowFiles).iterator();
        while (type.hasNext()) {
            String ext = type.next();
            if (fileName.toLowerCase().endsWith(ext)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取文件后缀
     * @param filename
     * @return
     */
    protected String getExt(String filename) {
        int pos = filename.lastIndexOf(CHARACTER_SPOT);
        return filename.substring(pos + 1);
    }

    protected void checkDirAndCreate(File file) {
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
    }

    @Override
    public String store(MultipartFile file, String basePath) throws IOException {
        validateFile(file);

        String path = basePath + FileNameUtils.genPathAndFileName(getExt(file.getOriginalFilename()));
        File temp = new File(getRoot() + path);
        checkDirAndCreate(temp);
        file.transferTo(temp);
        return path;
    }

    @Override
    public String storeScale(MultipartFile file, String basePath, int maxWidth) throws Exception {
        validateFile(file);

        String path = basePath + FileNameUtils.genPathAndFileName(getExt(file.getOriginalFilename()));
        // 根据临时文件生成略缩图
        String dest = getRoot() + path;
        ImageUtils.scaleImageByWidth(file, dest, maxWidth);
        return path;
    }

    @Override
    public String storeScale(MultipartFile file, String basePath, int width, int height) throws Exception {
        validateFile(file);

        String path = basePath + FileNameUtils.genPathAndFileName(getExt(file.getOriginalFilename()));

        // 根据临时文件生成略缩图
        String dest = getRoot() + path;
        ImageUtils.scale(file, dest, width, height);
        return path;
    }

    @Override
    public int[] imageSize(String storePath) {
        String root = getRoot();

        File dest = new File(root + storePath);
        int[] ret = new int[2];

        try {
            // 读入文件
            BufferedImage src = ImageIO.read(dest);
            int w = src.getWidth();
            int h = src.getHeight();

            ret = new int[]{w, h};

        } catch (IOException e) {
            e.printStackTrace();
        }

        return ret;
    }

    @Override
    public void deleteFile(String storePath) {
        File file = new File(getRoot() + storePath);

        // 文件存在, 且不是目录
        if (file.exists() && !file.isDirectory()) {
            file.delete();
            log.info("fileRepo delete " + storePath);
        }
    }

}
