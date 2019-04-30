package com.colleage.cook.exception;

/**
 * @Classname ThirdPartyLoginException
 * @Description TODO
 * @Date 2019\4\11 0011
 * @Created by David
 */
public class ThirdPartyLoginException extends RuntimeException {
    private static final long serialVersionUID = -7443213283905815106L;
    private int code;

    public ThirdPartyLoginException() {
    }

    /**
     * ThirdPartyLoginException
     * @param code 错误代码
     */
    public ThirdPartyLoginException(int code) {
        super("code=" + code);
        this.code = code;
    }

    /**
     * ThirdPartyLoginException
     * @param message 错误消息
     */
    public ThirdPartyLoginException(String message) {
        super(message);
    }

    /**
     * ThirdPartyLoginException
     * @param cause 捕获的异常
     */
    public ThirdPartyLoginException(Throwable cause) {
        super(cause);
    }

    /**
     * ThirdPartyLoginException
     * @param message 错误消息
     * @param cause 捕获的异常
     */
    public ThirdPartyLoginException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * ThirdPartyLoginException
     * @param code 错误代码
     * @param message 错误消息
     */
    public ThirdPartyLoginException(int code, String message) {
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

