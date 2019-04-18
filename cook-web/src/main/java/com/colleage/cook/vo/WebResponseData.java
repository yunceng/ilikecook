package com.colleage.cook.vo;

import com.alibaba.fastjson.JSONObject;

import java.io.Serializable;

/**
 * @Classname WebResponseData
 * @Description TODO
 * @Date 2019\4\15 0015
 * @Created by David
 */
public class WebResponseData implements Serializable {

    //返回消息的状态码
    private int code;
    //返回的具体消息
    private String message;
    //返回的数据
    private Object data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String toJSONString() {
        return JSONObject.toJSONString(this);
    }

    /**
     * 返回消息的状态码常量
     */
    public static class Code {

        public static final int SUCCESS = 0;

        public static final int LOGOUT_SUCCESS = 0;

        public static final int ERROR = -1;

        public static final int NO_PRIVILEGES = -2;

        public static final int LOGIN_ERROR = -3;

    }

    /**
     * 返回消息的具体信息常量
     */
    public static class Message {

        public static final String SUCCESS = "success";

        public static final String LOGOUT_SUCCESS = "login_success";

        public static final String ERROR = "error";

        public static final String NO_PRIVILEGES = "用户无权限";

        public static final String LOGIN_ERROR_DISABLE = "账户登录失败";

        public static final String LOGIN_PARAMS_ERROR = "用户名或密码输入错误，登录失败";

        public static final String LOGIN_PARAMS_NOT_NULL = "用户名和密码不能为空";

        public static final String USER_ACCOUNT_STATUS_ERROR = "用户账户异常";


    }
}
