package com.colleage.cook.service.impl;

import com.colleage.cook.mapper.SearchWordInfoMapper;
import com.colleage.cook.service.SearchWordInfoService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Classname SearchWordInfoServiceImpl
 * @Description TODO
 * @Date 2019\4\25 0025
 * @Created by David
 */
@Service("searchWordInfoService")
public class SearchWordInfoServiceImpl implements SearchWordInfoService {

    @Autowired
    private SearchWordInfoMapper searchWordInfoMapper;

    @Override
    public List<String> getSearchWords(String word) {
        return searchWordInfoMapper.getSearchWords(word, 0, 10);
    }

    @Override
    public void insertOrUpdate(Map<String, Integer> search_word_nums) {
        search_word_nums.forEach((word, nums) -> {
            if (StringUtils.isNotBlank(word) && nums > 0) {
                searchWordInfoMapper.insertOrUpdate(word, nums);
            }
        });
    }
}
