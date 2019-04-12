package com.colleage.cook.exception;

/**
 * @Classname ConstumeException
 * @Description TODO
 * @Date 2019\4\11 0011
 * @Created by David
 */
public class ConstumeException extends RuntimeException {
    private static final long serialVersionUID = -7443213283905815106L;
    private int code;

    public ConstumeException() {
    }

    /**
     * ConstumeException
     * @param code 错误代码
     */
    public ConstumeException(int code) {
        super("code=" + code);
        this.code = code;
    }

    /**
     * ConstumeException
     * @param message 错误消息
     */
    public ConstumeException(String message) {
        super(message);
    }

    /**
     * ConstumeException
     * @param cause 捕获的异常
     */
    public ConstumeException(Throwable cause) {
        super(cause);
    }

    /**
     * ConstumeException
     * @param message 错误消息
     * @param cause 捕获的异常
     */
    public ConstumeException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * ConstumeException
     * @param code 错误代码
     * @param message 错误消息
     */
    public ConstumeException(int code, String message) {
        super(message);
        this.code = code;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}

