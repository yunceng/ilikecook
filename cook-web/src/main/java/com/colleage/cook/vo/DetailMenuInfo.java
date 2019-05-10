package com.colleage.cook.vo;

import com.colleage.cook.domain.MenuFoodInfo;
import com.colleage.cook.domain.MenuStepInfo;
import com.colleage.cook.domain.MenuSummaryInfo;

import java.io.Serializable;
import java.util.List;

/**
 * @Classname DetailMenuInfo
 * @Description 菜谱的详细信息
 * @Date 2019\4\23 0023
 * @Created by David
 */
public class DetailMenuInfo implements Serializable {

    public DetailMenuInfo() {
    }

    public DetailMenuInfo(SimpleUserInfo user, MenuSummaryInfo summaryInfo, List categorys,
                          List<MenuFoodInfo> menuFoodInfoList, List<MenuStepInfo> menuStepInfoList,
                          List<AllMenuFoodCommentInfo> comments) {
        this.user = user;
        this.summaryInfo = summaryInfo;
        this.categorys = categorys;
        this.menuFoodInfoList = menuFoodInfoList;
        this.menuStepInfoList = menuStepInfoList;
        this.comments = comments;
    }

    /**
     * 作者信息
     */
    private SimpleUserInfo user;

    /**
     * 菜单信息
     */
    private MenuSummaryInfo summaryInfo;

    /**
     * 所属分类信息
     */
    private List categorys;

    /**
     * 菜单材料
     */
    private List<MenuFoodInfo> menuFoodInfoList;

    /**
     * 菜单步骤
     */
    private List<MenuStepInfo> menuStepInfoList;

    /**
     * 菜谱评论
     */
    private List<AllMenuFoodCommentInfo> comments;

    public SimpleUserInfo getUser() {
        return user;
    }

    public void setUser(SimpleUserInfo user) {
        this.user = user;
    }

    public MenuSummaryInfo getSummaryInfo() {
        return summaryInfo;
    }

    public void setSummaryInfo(MenuSummaryInfo summaryInfo) {
        this.summaryInfo = summaryInfo;
    }

    public List getCategorys() {
        return categorys;
    }

    public void setCategorys(List categorys) {
        this.categorys = categorys;
    }

    public List<MenuFoodInfo> getMenuFoodInfoList() {
        return menuFoodInfoList;
    }

    public void setMenuFoodInfoList(List<MenuFoodInfo> menuFoodInfoList) {
        this.menuFoodInfoList = menuFoodInfoList;
    }

    public List<MenuStepInfo> getMenuStepInfoList() {
        return menuStepInfoList;
    }

    public void setMenuStepInfoList(List<MenuStepInfo> menuStepInfoList) {
        this.menuStepInfoList = menuStepInfoList;
    }

    public List<AllMenuFoodCommentInfo> getComments() {
        return comments;
    }

    public void setComments(List<AllMenuFoodCommentInfo> comments) {
        this.comments = comments;
    }
}
