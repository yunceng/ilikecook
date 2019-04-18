package com.colleage.cook.utils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * @Classname WebUtils
 * @Description web服务中常用的工具
 * @Date 2019\4\17 0017
 * @Created by David
 */
public class WebUtils {

    public static final String THEME = "_THEME";

    public static String getView(HttpServletRequest request, String view) {
        String theme = request.getSession().getAttribute(THEME).toString();
        return theme + File.separator + view;
    }

}
