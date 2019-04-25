package com.colleage.cook.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Classname SearchWordInfoMapper
 * @Description 搜索关键词
 * @Date 2019\4\25 0025
 * @Created by David
 */
public interface SearchWordInfoMapper {

    /**
     * 根据给的词搜索相近的搜索关键词
     *
     * @param word
     * @return
     */
    List<String> getSearchWords(@Param("word") String word, @Param("start") int start, @Param("limit") int limit);

    /**
     * 插入或者更新关键词
     *
     * @param word
     */
    void insertOrUpdate(@Param("word") String word);

}
