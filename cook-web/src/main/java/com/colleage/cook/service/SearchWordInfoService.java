package com.colleage.cook.service;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

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
     * @param search_word_nums
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW, isolation = Isolation.DEFAULT,
            timeout = 3600, rollbackFor = Exception.class)
    void insertOrUpdate(Map<String, Integer> search_word_nums);
}
