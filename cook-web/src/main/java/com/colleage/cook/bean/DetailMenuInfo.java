package com.colleage.cook.bean;

import com.colleage.cook.domain.MenuFoodInfo;
import com.colleage.cook.domain.MenuStepInfo;
import com.colleage.cook.domain.MenuSummaryInfo;
import com.colleage.cook.domain.TinyFoodClassificationInfo;

import java.util.List;

/**
 * @Classname DetailMenuInfo
 * @Description 菜谱的详细信息
 * @Date 2019\4\23 0023
 * @Created by David
 */
public class DetailMenuInfo {

    public DetailMenuInfo() {
    }

    public DetailMenuInfo(SimpleUserInfo user, MenuSummaryInfo summaryInfo, List<TinyFoodClassificationInfo> categorys,
                          List<MenuFoodInfo> menuFoodInfoList, List<MenuStepInfo> menuStepInfoList) {
        this.user = user;
        this.summaryInfo = summaryInfo;
        this.categorys = categorys;
        this.menuFoodInfoList = menuFoodInfoList;
        this.menuStepInfoList = menuStepInfoList;
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
    private List<TinyFoodClassificationInfo> categorys;

    /**
     * 菜单材料
     */
    private List<MenuFoodInfo> menuFoodInfoList;

    /**
     * 菜单步骤
     */
    private List<MenuStepInfo> menuStepInfoList;

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

    public List<TinyFoodClassificationInfo> getCategorys() {
        return categorys;
    }

    public void setCategorys(List<TinyFoodClassificationInfo> categorys) {
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
}
