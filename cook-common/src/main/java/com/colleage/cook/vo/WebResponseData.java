package com.colleage.cook.vo;

import com.alibaba.fastjson.JSONObject;

import java.io.Serializable;

/**
 * @Classname WebResponseData
 * @Description 网络响应码和消息
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

    public WebResponseData() {
    }

    public WebResponseData(int code) {
        this.code = code;
    }

    public WebResponseData(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public WebResponseData(int code, String message, Object data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

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
     * 成功的响应
     * @return
     */
    public static WebResponseData success(){
        return new WebResponseData(Code.SUCCESS, Message.SUCCESS);
    }

    /**
     * 错误的响应
     * @return
     */
    public static WebResponseData error(){
        return new WebResponseData(Code.ERROR, Message.ERROR);
    }

    /**
     * 参数为空的响应
     * @return
     */
    public static WebResponseData paramIsNull(){
        return new WebResponseData(Code.PARAM_NOT_NULL, Message.PARAM_NOT_NULL);
    }

    /**
     * 参数不符合要求的响应
     * @return
     */
    public static WebResponseData paramInvalid(){
        return new WebResponseData(Code.PARAM_NOINVALID, Message.PARAM_NOINVALID);
    }

    /**
     * 没有权限的响应
     * @return
     */
    public static WebResponseData noPrivilege(){
        return new WebResponseData(Code.NO_PRIVILEGES, Message.NO_PRIVILEGES);
    }

    /**
     * 返回消息的状态码常量
     */
    public static class Code {

        public static final int SUCCESS = 0;

        public static final int LOGOUT_SUCCESS = 0;

        /**
         * 业务级别的错误码全部大于-10000，且小于0
         */
        public static final int ERROR = -1;

        public static final int NO_PRIVILEGES = -2;

        public static final int LOGIN_ERROR = -3;

        /**
         * 业务级别的错误码全部小于-10000
         */
        public static final int PARAM_NOT_NULL = -1001;

        public static final int PARAM_NOINVALID = -1002;

        public static final int PASSWORD_ERROR = -1003;

        public static final int UPDATE_PASSWORD_ERROR = -1004;

        public static final int NEW_OLD_PASSWORD_EQUAL_ERROR = -1005;

        public static final int USER_ALREADY_EXISTS = -1006;

    }

    /**
     * 返回消息的具体信息常量
     */
    public static class Message {

        public static final String SUCCESS = "success";

        public static final String LOGOUT_SUCCESS = "登出系统成功";

        public static final String ERROR = "error";

        public static final String NO_PRIVILEGES = "用户无权限,请联系管理员";

        public static final String LOGIN_ERROR_DISABLE = "账户登录失败";

        public static final String LOGIN_PARAMS_ERROR = "用户名或密码输入错误，登录失败";

        public static final String LOGIN_PARAMS_NOT_NULL = "用户名和密码不能为空";

        public static final String USER_ACCOUNT_STATUS_ERROR = "用户账户异常";

        public static final String PARAM_NOT_NULL = "参数不能为空";

        public static final String PARAM_NOINVALID = "参数不合法";

        public static final String COLLECT_MENU_ERROR = "您可能已经收藏过该菜谱";

        public static final String UPLOAD_FILE_NOT_NULL = "上传的文件不能为空";

        public static final String TRANSFER_FILE_ERROR = "文件传输失败";

        public static final String PASSWORD_ERROR = "原始密码错误";

        public static final String UPDATE_PASSWORD_ERROR = "修改密码错误";

        public static final String NEW_OLD_PASSWORD_EQUAL_ERROR = "新旧密码不能相同";

        public static final String USERNAME_ALREADY_EXISTS = "用户名已经存在";

        public static final String EMAIL_ALREADY_EXISTS = "该邮箱已经被绑定";

    }
}
