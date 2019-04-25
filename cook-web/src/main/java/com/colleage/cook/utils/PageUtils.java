package com.colleage.cook.utils;

import com.colleage.cook.utils.page.PageConstants;

/**
 * @Classname PageUtils
 * @Description 分页工具
 * @Date 2019\4\23 0023
 * @Created by David
 */
public class PageUtils {

    /**
     * 获得分页的起始行
     *
     * @param pageNo
     * @param pageSize
     * @return
     */
    public static int getStart(Integer pageNo, Integer pageSize) {
        if (pageNo < PageConstants.DEFAULT_PAGE_NO) {
            pageNo = PageConstants.DEFAULT_PAGE_NO;
        }
        if (pageSize <= 0) {
            pageSize = PageConstants.DEFAULT_PAGE_SIZE;
        }
        return (pageNo - 1) * pageSize;
    }
}
