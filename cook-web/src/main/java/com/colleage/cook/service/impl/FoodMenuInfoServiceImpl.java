package com.colleage.cook.service.impl;

import com.colleage.cook.domain.MenuFoodInfo;
import com.colleage.cook.domain.MenuStepInfo;
import com.colleage.cook.domain.MenuSummaryInfo;
import com.colleage.cook.domain.TinyFoodClassificationInfo;
import com.colleage.cook.mapper.FoodClassificationInfoMapper;
import com.colleage.cook.mapper.FoodMenuInfoMapper;
import com.colleage.cook.mapper.UserInfoMapper;
import com.colleage.cook.service.FoodMenuInfoService;
import com.colleage.cook.utils.page.PageInfo;
import com.colleage.cook.vo.DetailMenuInfo;
import com.colleage.cook.vo.SimpleMenuInfo;
import com.colleage.cook.vo.SimpleUserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import static com.colleage.cook.constants.AccessDataCacheConstants.SEARCH_WORD_NUMS;

/**
 * @Classname FoodMenuInfoServiceImpl
 * @Description 菜谱的业务接口实现
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
    public PageInfo getMenuByCategoryId(int category, int pageNo, int pageSize) {
        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        Integer count = foodMenuInfoMapper.getMenuByCategoryIdCount(category);
        List<MenuSummaryInfo> menus = foodMenuInfoMapper.getMenuByCategoryId(category, pageInfo.getStart(), pageInfo.getPageSize());
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(menus));
        return pageInfo;
    }

    @Override
    public PageInfo getMenuByLikeWord(String word, int pageNo, int pageSize) {
        SEARCH_WORD_NUMS.put(word, SEARCH_WORD_NUMS.getOrDefault(word, 0) + 1);
        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        int count = foodMenuInfoMapper.getMenuByLikeWordCount(word);
        List<MenuSummaryInfo> menus = foodMenuInfoMapper.getMenuByLikeWord(word, pageInfo.getStart(), pageInfo.getPageSize());
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(menus));

        return pageInfo;
    }

    @Override
    public List<SimpleMenuInfo> getRecommendMenu(int pageNo, int pageSize) {
        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        return getSimpleMenuInfoList(foodMenuInfoMapper.getRecommendMenu(3.5f, pageInfo.getStart(), pageInfo.getPageSize()));
    }

    @Override
    public PageInfo getCurrentWeekPopular(int pageNo, int pageSize) {

        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        List<MenuSummaryInfo> menuSummaryInfos =
                foodMenuInfoMapper.getMostPopularInDays(7, pageInfo.getStart(), pageInfo.getPageSize());
        int count = foodMenuInfoMapper.getMostPopularInDaysCount(7);
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(menuSummaryInfos));

        return pageInfo;
    }

    @Override
    public PageInfo getLastMonthPopular(int pageNo, int pageSize) {

        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        List<MenuSummaryInfo> lastMonthPopular = foodMenuInfoMapper.
                getLastMonthPopular(1, pageInfo.getStart(), pageInfo.getPageSize());
        int count = foodMenuInfoMapper.getLastMonthPopularCount(1);
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(lastMonthPopular));

        return pageInfo;
    }

    @Override
    public PageInfo getLastCreate(int pageNo, int pageSize) {

        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        List<MenuSummaryInfo> lastCreate = foodMenuInfoMapper.
                getLastCreate(30, pageInfo.getStart(), pageInfo.getPageSize());
        int count = foodMenuInfoMapper.getLastCreateCount(30);
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(lastCreate));

        return pageInfo;
    }

    @Override
    public PageInfo getPopularMenu(int pageNo, int pageSize) {

        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        List<MenuSummaryInfo> popularMenu = foodMenuInfoMapper.getPopularMenu(pageInfo.getStart(),
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
        SimpleUserInfo userInfo = userInfoMapper.findUserInfoByUserId(menuSummaryInfo.getUserId());
        return new DetailMenuInfo(userInfo, menuSummaryInfo, categorys, menuFoodInfos, menuStepInfos);
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

    @Override
    public boolean createMenu(DetailMenuInfo menu) {
        String menu_uuid = UUID.randomUUID().toString().replace("-", "");
        menu.getSummaryInfo().setUuid(menu_uuid);
        foodMenuInfoMapper.insertMenuSummary(menu.getSummaryInfo(), menu.getUser().getId());
        foodMenuInfoMapper.insertMenuCategoryRel(menu.getSummaryInfo().getUuid(), menu.getCategorys());
        foodMenuInfoMapper.insertMenuFoods(menu.getSummaryInfo().getUuid(), menu.getMenuFoodInfoList());
        foodMenuInfoMapper.insertMenuSteps(menu.getSummaryInfo().getUuid(), menu.getMenuStepInfoList());
        return true;
    }

    @Override
    public PageInfo getUserOwnMenus(int userId, int pageNo, int pageSize) {
        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        Integer count = foodMenuInfoMapper.getUserOwnMenusCount(userId);
        List<MenuSummaryInfo> menus = foodMenuInfoMapper.getUserOwnMenus(userId, pageInfo.getStart(), pageInfo.getPageSize());
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(menus));
        return pageInfo;
    }

    @Override
    public PageInfo getUserCollectedMenus(int userId, int pageNo, int pageSize) {
        PageInfo pageInfo = new PageInfo(pageNo, pageSize);
        Integer count = foodMenuInfoMapper.getUserCollectedMenusCount(userId);
        List<MenuSummaryInfo> menus = foodMenuInfoMapper.getUserCollectedMenus(userId, pageInfo.getStart(), pageInfo.getPageSize());
        pageInfo.setCount(count);
        pageInfo.setData(getSimpleMenuInfoList(menus));
        return pageInfo;
    }

    @Override
    public List<MenuSummaryInfo> getOnlineMenuRotation() {
        return foodMenuInfoMapper.getMenuRotation(MenuSummaryInfo.Status.ONLINE.getCode());
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
