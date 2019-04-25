package com.colleage.cook.service;

import java.util.List;

/**
 * @Classname SearchWordInfoService
 * @Description 搜索关键词接口
 * @Date 2019\4\25 0025
 * @Created by David
 */
public interface SearchWordInfoService {

    /**
     * 根据给的词搜索相近的搜索关键词
     *
     * @param word
     * @return
     */
    List<String> getSearchWords(String word);

    /**
     * 插入或者更新关键词
     *
     * @param word
     */
    void insertOrUpdate(String word);
}
