package com.colleage.cook.domain;

import java.io.Serializable;

/**
 * @Classname SystemInfo
 * @Description 系统配置信息
 * @Date 2019\4\11 0011
 * @Created by David
 */
public class SystemInfo implements Serializable {

    private int id;

    private String key;

    private String value;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return String.format("%s, key: %s, value: %s", getClass(), getKey(), getValue());
    }
}
