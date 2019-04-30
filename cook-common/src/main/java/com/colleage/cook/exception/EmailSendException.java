package com.colleage.cook.exception;

/**
 * @Classname EmailSendException
 * @Description Email发送中的异常
 * @Date 2019\4\29 0029
 * @Created by David
 */
public class EmailSendException  extends RuntimeException {

    private static final long serialVersionUID = -7443213283905815106L;

    public EmailSendException() {
        this("邮件发送失败");
    }

    public EmailSendException(String message) {
        super(message);
    }
}
