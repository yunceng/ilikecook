package com.colleage.cook.exception;

/**
 * @Classname FileFormatNotSupportException
 * @Description 文件格式不支持异常
 * @Date 2019\4\30 0030
 * @Created by David
 */
public class FileFormatNotSupportException extends RuntimeException {

    public FileFormatNotSupportException() {
        this("文件格式不支持");
    }

    public FileFormatNotSupportException(String message) {
        super(message);
    }
}
