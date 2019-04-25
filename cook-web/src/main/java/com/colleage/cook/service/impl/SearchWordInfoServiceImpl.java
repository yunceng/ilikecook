package com.colleage.cook.service.impl;

import com.colleage.cook.mapper.SearchWordInfoMapper;
import com.colleage.cook.service.SearchWordInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public void insertOrUpdate(String word) {
        searchWordInfoMapper.insertOrUpdate(word);
    }
}
