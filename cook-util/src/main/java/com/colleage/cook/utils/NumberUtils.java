package com.colleage.cook.utils;

import org.apache.commons.lang3.StringUtils;

import java.util.HashSet;
import java.util.Set;

/**
 * @Classname NumberUtils
 * @Description 数字处理工具类
 * @Date 2019\4\11 0011
 * @Created by David
 */
public class NumberUtils {

    public static int changeToInt(Object obj) {
        int i = 0;
        if (obj != null && StringUtils.isNumeric(obj.toString())) {
            i = ((Number) obj).intValue();
        }
        return i;
    }

    public static Set<Long> toList(String ids) {
        Set<Long> ret = new HashSet<>();
        if (StringUtils.isNotBlank(ids)) {
            for (String s : ids.split(",")) {
                long id = org.apache.commons.lang3.math.NumberUtils.toLong(s);
                if (id > 0) {
                    ret.add(id);
                }
            }
        }
        return ret;
    }
}
