package com.colleage.cook.oauth.utils;

import org.apache.commons.lang.StringUtils;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.SecureRandom;
import java.util.Map;
import java.util.Map.Entry;

import static com.colleage.cook.constants.CharacterConstants.CHARACETE_AND;
import static com.colleage.cook.constants.CharacterConstants.CHARACTER_EQULA;
import static com.colleage.cook.constants.CharacterConstants.CHARACTER_QUESTION_MARK;

/**
 * @Classname HttpUtils
 * @Description 模拟发送http请求工具类
 * @Date 2019\4\17 0016
 * @Created by David
 */
public class HttpUtils {
    private static final Charset DEFAULT_CHARSET = StandardCharsets.UTF_8;
    private static final String _GET = "GET";
    private static final String _POST = "POST";

    private static HttpURLConnection initHttp(String url, String method, Map<String, String> headers)
            throws IOException {
        URL _url = new URL(url);
        HttpURLConnection http = (HttpURLConnection) _url.openConnection();

        http.setConnectTimeout(25000);
        http.setReadTimeout(25000);
        http.setRequestMethod(method);
        http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        http.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36");

        if ((headers != null) && (!headers.isEmpty())) {
            for (Entry entry : headers.entrySet()) {
                http.setRequestProperty((String) entry.getKey(), (String) entry.getValue());
            }
        }
        http.setDoOutput(true);
        http.setDoInput(true);
        http.connect();
        return http;
    }

    private static HttpsURLConnection initHttps(String url, String method, Map<String, String> headers)
            throws IOException, NoSuchAlgorithmException, NoSuchProviderException, KeyManagementException {
        TrustManager[] tm = {new SimpleX509TrustManager()};
        SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
        sslContext.init(null, tm, new SecureRandom());

        SSLSocketFactory ssf = sslContext.getSocketFactory();
        URL _url = new URL(url);
        HttpsURLConnection http = (HttpsURLConnection) _url.openConnection();
        http.setHostnameVerifier(new TrustAnyHostnameVerifier());

        http.setConnectTimeout(25000);

        http.setReadTimeout(25000);
        http.setRequestMethod(method);
        http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        http.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36");

        if ((headers != null) && (!headers.isEmpty())) {
            for (Entry entry : headers.entrySet()) {
                http.setRequestProperty((String) entry.getKey(), (String) entry.getValue());
            }
        }
        http.setSSLSocketFactory(ssf);
        http.setDoOutput(true);
        http.setDoInput(true);
        http.connect();
        return http;
    }

    public static String get(String url) {
        return get(url, null);
    }

    public static String get(String url, Map<String, String> params) {
        return get(url, params, null);
    }

    public static String get(String url, Map<String, String> params, Map<String, String> headers) {
        StringBuffer bufferRes = new StringBuffer();
        InputStream in = null;
        HttpURLConnection http = null;
        String valueString;
        try {
            if (isHttps(url)) {
                http = initHttps(initParams(url, params), _GET, headers);
            } else {
                http = initHttp(initParams(url, params), _GET, headers);
            }
            in = http.getInputStream();
            BufferedReader read = new BufferedReader(new InputStreamReader(in, DEFAULT_CHARSET));
            while ((valueString = read.readLine()) != null) {
                bufferRes.append(valueString);
            }
            return bufferRes.toString();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
                if (http != null) {
                    http.disconnect();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public static String post(String url, Map<String, String> params) throws UnsupportedEncodingException {
        return post(url, map2Url(params), null);
    }

    public static String post(String url, Map<String, String> params, Map<String, String> headers) throws UnsupportedEncodingException {
        return post(url, map2Url(params), headers);
    }

    public static String post(String url, String params, Map<String, String> headers) {
        StringBuffer bufferRes = new StringBuffer();
        HttpURLConnection http = null;
        InputStream in = null;
        String valueString;
        try {
            if (isHttps(url)) {
                http = initHttps(url, _POST, headers);
            } else {
                http = initHttp(url, _POST, headers);
            }
            OutputStream out = http.getOutputStream();
            out.write(params.getBytes(DEFAULT_CHARSET));
            out.flush();
            out.close();

            in = http.getInputStream();
            BufferedReader read = new BufferedReader(new InputStreamReader(in, DEFAULT_CHARSET));

            while ((valueString = read.readLine()) != null) {
                bufferRes.append(valueString);
            }
            return bufferRes.toString();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
                if (http != null) {
                    http.disconnect();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public static String initParams(String url, Map<String, String> params) throws UnsupportedEncodingException {
        if ((params == null) || (params.isEmpty())) {
            return url;
        }
        StringBuilder sb = new StringBuilder(url);
        if (url.indexOf(CHARACTER_QUESTION_MARK) == -1) {
            sb.append(CHARACTER_QUESTION_MARK);
        }
        sb.append(map2Url(params));
        return sb.toString();
    }

    public static String map2Url(Map<String, String> paramToMap) throws UnsupportedEncodingException {
        if ((paramToMap == null) || (paramToMap.isEmpty())) {
            return null;
        }
        StringBuffer url = new StringBuffer();
        boolean isfist = true;
        for (Entry entry : paramToMap.entrySet()) {
            if (isfist) {
                isfist = false;
            } else {
                url.append(CHARACETE_AND);
            }
            url.append((String) entry.getKey()).append(CHARACTER_EQULA);
            String value = (String) entry.getValue();
            if (StringUtils.isNotEmpty(value)) {
                url.append(URLEncoder.encode(value, DEFAULT_CHARSET.name()));
            }
        }
        return url.toString();
    }

    private static boolean isHttps(String url) {
        return url.startsWith("https");
    }
}
