package com.colleage.cook.vo;

import com.colleage.cook.domain.MenuFoodCommentInfo;

import java.io.Serializable;
import java.util.List;

/**
 * @Classname AllMenuFoodCommentInfo
 * @Description 所有评论信息
 * @Date 2019\5\10 0010
 * @Created by David
 */
public class AllMenuFoodCommentInfo {

    //第一个评论的所有回复
    private List<MenuFoodCommentInfo> replys;

    private int id;
    //菜谱唯一键
    private String menuId;
    //评论者ID
    private int commentUserId;
    //评论者昵称
    private String commentNickname;
    //回复者ID
    private int replyUserId;
    //回复者昵称
    private String replyNickname;
    //消息
    private String message;
    //评论时间
    private String createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public int getCommentUserId() {
        return commentUserId;
    }

    public void setCommentUserId(int commentUserId) {
        this.commentUserId = commentUserId;
    }

    public String getCommentNickname() {
        return commentNickname;
    }

    public void setCommentNickname(String commentNickname) {
        this.commentNickname = commentNickname;
    }

    public int getReplyUserId() {
        return replyUserId;
    }

    public void setReplyUserId(int replyUserId) {
        this.replyUserId = replyUserId;
    }

    public String getReplyNickname() {
        return replyNickname;
    }

    public void setReplyNickname(String replyNickname) {
        this.replyNickname = replyNickname;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public List<MenuFoodCommentInfo> getReplys() {
        return replys;
    }

    public void setReplys(List<MenuFoodCommentInfo> replys) {
        this.replys = replys;
    }
}
