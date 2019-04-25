package com.colleage.cook;

import java.util.UUID;

/**
 * @Classname Test
 * @Description TODO
 * @Date 2019\4\23 0023
 * @Created by David
 */
public class Test {

    public static void main(String[] args) {
        try {
            for (int i = 0; i < 10; i++) {
                String instance = UUID.randomUUID().toString().replace("-", "");
                System.out.println(instance);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
