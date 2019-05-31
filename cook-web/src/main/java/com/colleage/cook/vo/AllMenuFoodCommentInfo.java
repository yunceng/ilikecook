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

    private int pid;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public List<MenuFoodCommentInfo> getReplys() {
        return replys;
    }

    public void setReplys(List<MenuFoodCommentInfo> replys) {
        this.replys = replys;
    }
}
