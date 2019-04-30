package com.colleage.cook.exception;

/**
 * @Classname FileNotNullException
 * @Description 文件不能为空异常
 * @Date 2019\4\30 0030
 * @Created by David
 */
public class FileNotNullException extends RuntimeException {

    public FileNotNullException() {
        this("文件不能为空");
    }

    public FileNotNullException(String message) {
        super(message);
    }
}
