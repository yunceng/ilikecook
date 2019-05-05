package com.colleage.cook.utils.page;

import java.util.List;

/**
 * @Classname PageInfo
 * @Description 分页包装类
 * @Date 2019\4\23 0023
 * @Created by David
 */
public class PageInfo {

    public PageInfo() {
    }

    public PageInfo(int currentPage, int pageSize) {
        setCurrentPage(currentPage);
        setPageSize(pageSize);
    }

    /**
     * 当前页号
     */
    private int currentPage;

    /**
     * 下一页页号
     */
    private int nextPage;

    /**
     * 上一页页号
     */
    private int lastPage;

    /**
     * 页大小
     */
    private int pageSize;

    /**
     * 总共页数
     */
    private int totalPages;

    /**
     * 数据总共条数
     */
    private int count;

    /**
     * 是否第一页
     */
    private boolean isFirst;

    /**
     * 是否最后一页
     */
    private boolean isLast;

    private List data;

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage < PageConstants.MIN_PAGE_NO ? PageConstants.DEFAULT_PAGE_NO : currentPage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage() {
        nextPage = currentPage;
        if (currentPage < totalPages) {
            nextPage = currentPage + 1;
        }
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage() {
        lastPage = totalPages;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize < PageConstants.MIN_PAGE_SIZE ? PageConstants.DEFAULT_PAGE_SIZE : pageSize;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages() {
        totalPages = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
        setTotalPages();
        setNextPage();
        setLastPage();
    }

    public boolean isFirst() {
        return isFirst = currentPage == PageConstants.DEFAULT_PAGE_NO;
    }

    public boolean isLast() {
        return isLast = currentPage == totalPages;
    }

    public List getData() {
        return data;
    }

    public void setData(List data) {
        this.data = data;
    }

    /**
     * 获得分页的起始行
     *
     * @return
     */
    public int getStart() {
        return (currentPage - 1) * pageSize;
    }
}
