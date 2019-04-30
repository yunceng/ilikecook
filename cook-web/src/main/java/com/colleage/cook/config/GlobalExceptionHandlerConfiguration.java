package com.colleage.cook.config;

import com.colleage.cook.exception.EmailSendException;
import com.colleage.cook.exception.FileFormatNotSupportException;
import com.colleage.cook.exception.FileNotNullException;
import com.colleage.cook.exception.ThirdPartyLoginException;
import com.colleage.cook.vo.WebResponseData;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Classname GlobalExceptionHandler
 * @Description 全局异常处理代码 Controller层没有对异常进行catch处理,可以捕获到Controller层的异常;在Controller中不做异常catch处理，
 * 在service中抛出异常（service中也不错异常catch处理），那么也是可以在这里捕获到异常的
 * @Date 2019\4\29 0029
 * @Created by David
 */
@ControllerAdvice
public class GlobalExceptionHandlerConfiguration {

    /**
     * 处理自定义的邮件发送异常
     * @param exception
     * @return
     */
    @ExceptionHandler(EmailSendException.class)
    @ResponseBody
    public WebResponseData emailSendExceptionHandler(EmailSendException exception){
        return handleErrorInfo(exception.getMessage());
    }

    /**
     * 处理自定义的文件格式不支持异常
     * @param exception
     * @return
     */
    @ExceptionHandler(FileFormatNotSupportException.class)
    @ResponseBody
    public WebResponseData fileFormatNotSupportExceptionHandler(FileFormatNotSupportException exception){
        return handleErrorInfo(exception.getMessage());
    }

    /**
     * 处理自定义的文件不能为空异常
     * @param exception
     * @return
     */
    @ExceptionHandler(FileNotNullException.class)
    @ResponseBody
    public WebResponseData fileNotNullExceptionHandler(FileNotNullException exception){
        return handleErrorInfo(exception.getMessage());
    }

    /**
     * 处理自定义的第三方登录中的异常
     * @param exception
     * @return
     */
    @ExceptionHandler(ThirdPartyLoginException.class)
    @ResponseBody
    public WebResponseData thirdPartyLoginExceptionHandler(ThirdPartyLoginException exception){
        return handleErrorInfo(exception.getMessage());
    }

    /**
     * 全局异常处理
     * @param exception
     * @return
     */
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public WebResponseData exceptionHandler(Exception exception){
        return handleErrorInfo(exception.getMessage());
    }

    private WebResponseData handleErrorInfo(String message) {
        WebResponseData errorMessage = new WebResponseData();
        errorMessage.setMessage(message);
        errorMessage.setCode(WebResponseData.Code.ERROR);
        return errorMessage;
    }

}
