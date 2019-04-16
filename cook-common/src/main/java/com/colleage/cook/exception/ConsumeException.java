package com.colleage.cook.exception;

/**
 * @Classname ConsumeException
 * @Description TODO
 * @Date 2019\4\11 0011
 * @Created by David
 */
public class ConsumeException extends RuntimeException {
    private static final long serialVersionUID = -7443213283905815106L;
    private int code;

    public ConsumeException() {
    }

    /**
     * ConsumeException
     * @param code 错误代码
     */
    public ConsumeException(int code) {
        super("code=" + code);
        this.code = code;
    }

    /**
     * ConsumeException
     * @param message 错误消息
     */
    public ConsumeException(String message) {
        super(message);
    }

    /**
     * ConsumeException
     * @param cause 捕获的异常
     */
    public ConsumeException(Throwable cause) {
        super(cause);
    }

    /**
     * ConsumeException
     * @param message 错误消息
     * @param cause 捕获的异常
     */
    public ConsumeException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * ConsumeException
     * @param code 错误代码
     * @param message 错误消息
     */
    public ConsumeException(int code, String message) {
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

