package com.colleage.cook.service.impl;

import com.colleage.cook.bean.DetailMenuInfo;
import com.colleage.cook.bean.SimpleMenuInfo;
import com.colleage.cook.bean.SimpleUserInfo;
import com.colleage.cook.domain.*;
import com.colleage.cook.mapper.FoodClassificationInfoMapper;
import com.colleage.cook.mapper.FoodMenuInfoMapper;
import com.colleage.cook.mapper.UserInfoMapper;
import com.colleage.cook.service.FoodMenuInfoService;
import com.colleage.cook.utils.PageUtils;
import com.colleage.cook.utils.page.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.colleage.cook.constants.AccessDataCacheConstants.SEARCH_WORD_NUMS;

/**
 * @Classname FoodMenuInfoServiceImpl
 * @Description TODO
 * @Date 2019\4\23 0023
 * @Created by David
 */
@Service("foodMenuInfoService")
public class FoodMenuInfoServiceImpl implements FoodMenuInfoService {

    @Autowired
    private FoodMenuInfoMapper foodMenuInfoMapper;

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Autowired
    private FoodClassificationInfoMapper foodClassificationInfoMapper;


    @Override
    public PageInfo getMenuByLikeWord(String word, int pageNo, int pageSize) {
        SEARCH_WORD_NUMS.put(word, SEARCH_WORD_NUMS.getOrDefault(word, 0) + 1);
        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        int start = PageUtils.getStart(pageInfo.getCurrentPage(), pageInfo.getPageSize());

        int count = foodMenuInfoMapper.getMenuByLikeWordCount(word);
        List<MenuSummaryInfo> menus = foodMenuInfoMapper.getMenuByLikeWord(word, start, pageInfo.getPageSize());
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(menus));

        return pageInfo;
    }

    @Override
    public List<SimpleMenuInfo> getRecommendMenu(int pageNo, int pageSize) {
        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        int start = PageUtils.getStart(pageInfo.getCurrentPage(), pageInfo.getPageSize());
        return getSimpleMenuInfoList(foodMenuInfoMapper.getRecommendMenu(3.5f, start, pageInfo.getPageSize()));
    }

    @Override
    public PageInfo getCurrentWeekPopular(int pageNo, int pageSize) {

        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        int start = PageUtils.getStart(pageInfo.getCurrentPage(), pageInfo.getPageSize());
        List<MenuSummaryInfo> menuSummaryInfos =
                foodMenuInfoMapper.getMostPopularInDays(7, start, pageInfo.getPageSize());
        int count = foodMenuInfoMapper.getMostPopularInDaysCount(7);
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(menuSummaryInfos));

        return pageInfo;
    }

    @Override
    public PageInfo getLastMonthPopular(int months, int pageNo, int pageSize) {

        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        int start = PageUtils.getStart(pageInfo.getCurrentPage(), pageInfo.getPageSize());
        List<MenuSummaryInfo> lastMonthPopular = foodMenuInfoMapper.
                getLastMonthPopular(months, start, pageInfo.getPageSize());
        int count = foodMenuInfoMapper.getLastMonthPopularCount(months);
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(lastMonthPopular));

        return pageInfo;
    }

    @Override
    public PageInfo getLastCreate(int pageNo, int pageSize) {

        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        int start = PageUtils.getStart(pageInfo.getCurrentPage(), pageInfo.getPageSize());
        List<MenuSummaryInfo> lastCreate = foodMenuInfoMapper.
                getLastCreate(30, start, pageInfo.getPageSize());
        int count = foodMenuInfoMapper.getLastCreateCount();
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(lastCreate));

        return pageInfo;
    }

    @Override
    public PageInfo getPopularMenu(int pageNo, int pageSize) {

        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        int start = PageUtils.getStart(pageInfo.getCurrentPage(), pageInfo.getPageSize());
        List<MenuSummaryInfo> popularMenu = foodMenuInfoMapper.getPopularMenu(start,
                pageInfo.getPageSize());
        int count = foodMenuInfoMapper.getPopularMenuCount();
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(popularMenu));

        return pageInfo;
    }

    @Override
    public DetailMenuInfo getDetailMenuInfo(int userId, String uuid) {
        if (StringUtils.isEmptyOrWhitespace(uuid)) {
            return null;
        }
        MenuSummaryInfo menuSummaryInfo = foodMenuInfoMapper.getMenuSummaryInfo(uuid);
        if (menuSummaryInfo == null) {
            return null;
        }
        menuSummaryInfo.isCollected(userId > 0 ? foodMenuInfoMapper.menuIsCollected(uuid, userId) : false);
        List<TinyFoodClassificationInfo> categorys = foodClassificationInfoMapper.getCategorysByMenu(uuid);
        List<MenuFoodInfo> menuFoodInfos = foodMenuInfoMapper.getMenuFoodInfos(uuid);
        List<MenuStepInfo> menuStepInfos = foodMenuInfoMapper.getMenuStepInfos(uuid);
        UserInfo userInfo = userInfoMapper.findUserInfoByUserId(menuSummaryInfo.getUserId());
        return new DetailMenuInfo(new SimpleUserInfo(userInfo), menuSummaryInfo, categorys, menuFoodInfos, menuStepInfos);
    }

    @Override
    public boolean updateMenuCollectNum(int userId, String uuid) {
        return foodMenuInfoMapper.insertUserMenuRel(uuid, userId) && foodMenuInfoMapper.updateMenuCollected(uuid);
    }

    @Override
    public boolean updateMenuBrowseAndRecommend(Map<String, Integer> data) {
        data.forEach((uuid, nums) -> {
            foodMenuInfoMapper.updateMenuBrowsed(uuid, nums);
        });
        foodMenuInfoMapper.updateMenuRecommend();
        return true;
    }


    private List<SimpleMenuInfo> getSimpleMenuInfoList(List<MenuSummaryInfo> menuSummaryInfos) {
        List simpleMenuInfos = new ArrayList<SimpleMenuInfo>();

        menuSummaryInfos.forEach(menuSummaryInfo -> {
            List<String> simpleFoods = foodMenuInfoMapper.getSimpleFoods(menuSummaryInfo.getUuid());
            String foods = StringUtils.join(simpleFoods, "、");
            if (foods.length() > 16) {
                foods = foods.substring(0, 13) + "...";
            }
            String nickname = userInfoMapper.findUserInfoByUserId(menuSummaryInfo.getUserId()).getNickname();
            List<String> categoryNames = foodClassificationInfoMapper.getCategoryNameByMenu(menuSummaryInfo.getUuid());
            SimpleMenuInfo simpleMenuInfo = new SimpleMenuInfo(menuSummaryInfo.getUuid(), menuSummaryInfo.getName(),
                    menuSummaryInfo.getCover_img(), foods, menuSummaryInfo.getCreateTime(), nickname, categoryNames);
            simpleMenuInfos.add(simpleMenuInfo);
        });
        return simpleMenuInfos;
    }
}
