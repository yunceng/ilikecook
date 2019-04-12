package com.colleage.cook.utils.test;

import com.colleage.cook.utils.URLUtils;
import org.junit.Test;

/**
 * @Classname URLUtilsTest
 * @Description TODO
 * @Date 2019\4\12 0012
 * @Created by David
 */
public class URLUtilsTest {

    @Test
    public void getHost(){
        System.out.println(URLUtils.getHost("https://blog.csdn.net/lwjdear/article/details/78282073"));
    }

}
