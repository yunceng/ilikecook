package com.colleage.cook.utils;

import com.alibaba.fastjson.JSONObject;
import com.colleage.cook.vo.WebResponseData;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

/**
 * @Classname RestTemplateTest
 * @Description TODO
 * @Date 2019\4\28 0028
 * @Created by David
 */
public class RestTemplateTest {

    public static void main(String[] args) {

        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<WebResponseData> forEntity = restTemplate.getForEntity("http://localhost:8080/m/getLastCreate.do", WebResponseData.class);
        System.out.println("getForEntity:" + JSONObject.toJSONString(forEntity));

        WebResponseData pageInfo = restTemplate.getForObject("http://localhost:8080/m/getLastCreate.do?pageNo={1}&pageSize={2}"
                , WebResponseData.class, 2, 2);
        System.out.println(JSONObject.toJSONString(pageInfo));

        Map<String, Integer> params = new HashMap<>();
        params.put("pageNo", 2);
        params.put("pageSize", 1);
        WebResponseData forObject = restTemplate.getForObject("http://localhost:8080/m/getLastCreate.do", WebResponseData.class, params);
        System.out.println(JSONObject.toJSONString(forObject));

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        MultiValueMap<String, String> postParams = new LinkedMultiValueMap<>();
        postParams.add("username", "test2");
        postParams.add("password", "123456");
        postParams.add("remember", "true");

        HttpEntity postEntity = new HttpEntity<>(postParams, httpHeaders);
        ResponseEntity<WebResponseData> responseEntity = restTemplate.postForEntity("http://localhost:8080/login.do", postEntity, WebResponseData.class);
        System.out.println(JSONObject.toJSONString(responseEntity));

        HttpEntity requestEntity = new HttpEntity(httpHeaders);
        ResponseEntity<String> exchange = restTemplate.exchange("http://localhost:8080/u/getDetailUserInfo.do", HttpMethod.GET, requestEntity, String.class);
        System.out.println(JSONObject.toJSONString(exchange));


    }

}
