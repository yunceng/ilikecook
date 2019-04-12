package com.colleage.cook.utils.test;

import com.colleage.cook.utils.PropertiesLoader;
import org.junit.Test;
import org.springframework.core.io.support.PropertiesLoaderUtils;

/**
 * @Classname PropertiesLoaderTest
 * @Description TODO
 * @Date 2019\4\12 0012
 * @Created by David
 */
public class PropertiesLoaderTest {

    @Test
    public void getPropertiy(){
        PropertiesLoader propertiesLoader = new PropertiesLoader("test.properties");
        System.out.println(propertiesLoader.getProperty("alan"));
    }
}
