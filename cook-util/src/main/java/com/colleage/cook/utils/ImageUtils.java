package com.colleage.cook.utils;

import net.coobird.thumbnailator.Thumbnails;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;

/**
 * @Classname ImageUtils
 * @Description 图片工具类
 * @Date 2019\4\11 0011
 * @Created by David
 */
public class ImageUtils {
    private static Logger log = Logger.getLogger(ImageUtils.class);

    public static void validate(String dest) throws IOException {
        File destFile = new File(dest);
        if(dest == null) {
            throw new NullPointerException("Destination must not be null");
        } else if(destFile.getParentFile() != null && !destFile.getParentFile().exists() && !destFile.getParentFile().mkdirs()) {
            throw new IOException("Destination \'" + dest + "\' directory cannot be created");
        } else if(destFile.exists() && !destFile.canWrite()) {
            throw new IOException("Destination \'" + dest + "\' exists but is read-only");
        }
    }

    /**
     * 下载远程图片到本地，用于第三方登录下载头像
     * @param urlString		图片链接
     * @param savePath		保存路径
     * @throws Exception
     * @author A蛋壳  2015年9月13日 上午9:40:17
     */
    public static void download(String urlString, String savePath) throws Exception {

        URL url = new URL(urlString);	// 构造URL
        URLConnection connection = url.openConnection();	// 打开连接
        connection.setConnectTimeout(5 * 1000);		// 设置请求超时时间
        InputStream is = connection.getInputStream();	// 输入流

        byte[] bs = new byte[1024];		// 1K的数据缓存
        int len;
        File sf = new File(savePath);
        if (sf.getParentFile() != null && sf.getParentFile().exists() == false) {
            if (sf.getParentFile().mkdirs() == false) {
                throw new IOException("Destination '" + savePath + "' directory cannot be created");
            }
        }

        OutputStream os = new FileOutputStream(savePath);
        while((len = is.read(bs)) != -1){
            os.write(bs, 0, len);
        }
        os.close();
        is.close();
    }

    /**
     * 根据最大宽度图片压缩
     *
     * @param file     原图位置
     * @param dest    目标位置
     * @param maxSize 指定压缩后最大边长
     * @return boolean
     * @throws IOException
     */
    public static boolean scaleImageByWidth(MultipartFile file, String dest, int maxSize) throws IOException {
        BufferedImage src = ImageIO.read(file.getInputStream()); // 读入文件
        int w = src.getWidth();
        int h = src.getHeight();

        log.debug("origin with/height " + w + "/" + h);

        int size = (int) Math.max(w, h);
        int tow = w;
        int toh = h;

        if (size > maxSize) {
            if (w > maxSize) {
                tow = maxSize;
                toh = h * maxSize / w;
            } else {
                tow = w * maxSize / h;
                toh = maxSize;
            }
        }
        scale(file, dest, tow, toh);
        return true;
    }

    public static void scale(MultipartFile file, String dest, int width, int height) throws IOException {
        validate(dest);
        log.debug("scaled with/height : " + width + "/" + height);
        Thumbnails.of(file.getInputStream()).size(width, height).toFile(dest);
    }

    public static void scale(File file, String dest, int width, int height) throws IOException {
        validate(dest);
        log.debug("scaled with/height : " + width + "/" + height);
        Thumbnails.of(file).size(width, height).toFile(dest);
    }

    /**
     * 图片压缩,各个边按比例压缩
     *
     * @param file     原图位置
     * @param dest    目标位置
     * @param maxSize 指定压缩后最大边长
     * @return boolean
     * @throws IOException
     */
    public static boolean scaleImage(MultipartFile file, String dest, int maxSize) throws IOException {
        BufferedImage src = ImageIO.read(file.getInputStream()); // 读入文件
        int w = src.getWidth();
        int h = src.getHeight();

        log.debug("origin with/height " + w + "/" + h);

        int size = Math.max(w, h);
        int tow = w;
        int toh = h;

        if (size > maxSize) {
            if (w > maxSize) {
                tow = maxSize;
                toh = h * maxSize / w;
            } else {
                tow = w * maxSize / h;
                toh = maxSize;
            }
        }

        log.debug("scaled with/height : " + tow + "/" + toh);

        scale(file, dest, tow, toh);
        return true;
    }

    public static boolean scaleImage(File file, String dest, int maxSize) throws IOException {
        BufferedImage src = ImageIO.read(file); // 读入文件
        int w = src.getWidth();
        int h = src.getHeight();

        log.debug("origin with/height " + w + "/" + h);

        int size = Math.max(w, h);
        int tow = w;
        int toh = h;

        if (size > maxSize) {
            if (w > maxSize) {
                tow = maxSize;
                toh = h * maxSize / w;
            } else {
                tow = w * maxSize / h;
                toh = maxSize;
            }
        }

        log.debug("scaled with/height : " + tow + "/" + toh);

        scale(file, dest, tow, toh);
        return true;
    }

    /**
     * 裁剪图片
     *
     * @param file  源图片路径
     * @param dest 处理后图片路径
     * @param x    起始X坐标
     * @param y    起始Y坐标
     * @param width  裁剪宽度
     * @param height  裁剪高度
     * @return boolean
     *
     * @throws IOException io异常
     * @throws InterruptedException 中断异常
     */
    public static boolean cutImage(File file, String dest, int x, int y, int width, int height) throws IOException, InterruptedException {
        validate(dest);
        Thumbnails.of(file).sourceRegion(x, y, width, height).size(width,height).keepAspectRatio(false).toFile(dest);
        return true;
    }

    public static boolean cutImage(File file, String dest, int x, int y, int size) throws IOException, InterruptedException {
        return cutImage(file, dest, x, y, size, size);
    }

    /**
     * 给图片增加文字水印
     * @param imgPath
     * @param outImgPath
     * @param text
     */
    public static void mark(String imgPath, String outImgPath, String text){
        try {
            Image image = ImageIO.read(new File(imgPath));
            int x = image.getWidth(null) - text.getBytes().length;
            int y = image.getHeight(null);
            mark(imgPath, outImgPath, text, Font.getFont(Font.SANS_SERIF), Color.BLACK, x, y);
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    /**
     * 给图片增加文字水印
     *
     * @param imgPath
     *            -要添加水印的图片路径
     * @param outImgPath
     *            -输出路径
     * @param text-文字
     * @param font
     *            -字体
     * @param color
     *            -颜色
     * @param x
     *            -文字位于当前图片的横坐标
     * @param y
     *            -文字位于当前图片的竖坐标
     */
    public static void mark(String imgPath, String outImgPath, String text, Font font, Color color, int x, int y) {
        try {
            // 读取原图片信息
            File imgFile = null;
            Image img = null;
            if (imgPath != null) {
                imgFile = new File(imgPath);
            }
            if (imgFile != null && imgFile.exists() && imgFile.isFile() && imgFile.canRead()) {
                img = ImageIO.read(imgFile);
            }
            int imgWidth = img.getWidth(null);
            int imgHeight = img.getHeight(null);
            // 加水印
            BufferedImage bufImg = new BufferedImage(imgWidth, imgHeight, BufferedImage.TYPE_INT_RGB);
            mark(bufImg, img, text, font, color, x, y);
            // 输出图片
            FileOutputStream outImgStream = new FileOutputStream(outImgPath);
            ImageIO.write(bufImg, "jpg", outImgStream);
            outImgStream.flush();
            outImgStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 给图片增加图片水印
     *
     * @param inputImg
     *            -源图片，要添加水印的图片
     * @param markImg
     *            - 水印图片
     * @param outputImg
     *            -输出图片(可以是源图片)
     * @param width
     *            - 水印图片宽度
     * @param height
     *            -水印图片高度
     * @param x
     *            -横坐标，相对于源图片
     * @param y
     *            -纵坐标，同上
     */
    public static void mark(String inputImg, String markImg, String outputImg, int width, int height, int x, int y) {
        // 读取原图片信息
        File inputImgFile = null;
        File markImgFile = null;
        Image img = null;
        Image mark = null;
        try {
            if (inputImg != null && markImg != null) {
                inputImgFile = new File(inputImg);
                markImgFile = new File(markImg);
            }
            if (inputImgFile != null && inputImgFile.exists() && inputImgFile.isFile() && inputImgFile.canRead()) {

                img = ImageIO.read(inputImgFile);

            }
            if (markImgFile != null && markImgFile.exists() && markImgFile.isFile() && markImgFile.canRead()) {

                mark = ImageIO.read(markImgFile);

            }
            int imgWidth = img.getWidth(null);
            int imgHeight = img.getHeight(null);
            BufferedImage bufImg = new BufferedImage(imgWidth, imgHeight, BufferedImage.TYPE_INT_RGB);
            mark(bufImg, img, mark, width, height, x, y);
            FileOutputStream outImgStream = new FileOutputStream(outputImg);
            ImageIO.write(bufImg, "jpg", outImgStream);
            outImgStream.flush();
            outImgStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 给图片加文字水印
     * @param bufImg
     * @param img
     * @param text
     * @param font
     * @param color
     * @param x
     * @param y
     */
    public static void mark(BufferedImage bufImg, Image img, String text, Font font, Color color, int x, int y) {
        Graphics2D g = bufImg.createGraphics();
        g.drawImage(img, 0, 0, bufImg.getWidth(), bufImg.getHeight(), null);
        g.setColor(color);
        g.setFont(font);
        g.drawString(text, x, y);
        g.dispose();
    }

    /**
     *  加图片水印
     * @param bufImg
     * @param img
     * @param markImg
     * @param width
     * @param height
     * @param x
     * @param y
     */
    public static void mark(BufferedImage bufImg, Image img, Image markImg, int width, int height, int x, int y) {
        Graphics2D g = bufImg.createGraphics();
        g.drawImage(img, 0, 0, bufImg.getWidth(), bufImg.getHeight(), null);
        g.drawImage(markImg, x, y, width, height, null);
        g.dispose();
    }
}
