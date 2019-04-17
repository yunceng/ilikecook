package com.colleage.cook.oauth.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;

import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;
import java.io.FileInputStream;
import java.security.KeyStore;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/**
 * @Classname SimpleX509TrustManager
 * @Description HTTPS证书信任管理器的简单实现
 * @Date 2019\4\17 0017
 * @Created by David
 */
public class SimpleX509TrustManager extends X509TrustManagerAdaptor {

    private static final Logger LOGGER = LoggerFactory.getLogger(SimpleX509TrustManager.class);

    private static X509TrustManager sunJSSEX509TrustManager;

    static {
        try {
            KeyStore ks = KeyStore.getInstance("JKS");
            ks.load(new FileInputStream("trustedCerts"),
                    "passphrase".toCharArray());
            TrustManagerFactory tmf =
                    TrustManagerFactory.getInstance("SunX509", "SunJSSE");
            tmf.init(ks);
            TrustManager tms[] = tmf.getTrustManagers();
            for (int i = 0; i < tms.length; i++) {
                if (tms[i] instanceof X509TrustManager) {
                    sunJSSEX509TrustManager = (X509TrustManager) tms[i];
                    break;
                }
            }
        } catch (Exception e) {
            LOGGER.error("初始化失败");
        }
    }

    @Override
    public void checkClientTrusted(X509Certificate[] chain, String authType) {
        try {
            sunJSSEX509TrustManager.checkClientTrusted(chain, authType);
        } catch (CertificateException excep) {
            LOGGER.warn("客户端凭证验证信任失败");
        }
    }

    @Override
    public void checkServerTrusted(X509Certificate[] chain, String authType) {
        try {
            sunJSSEX509TrustManager.checkServerTrusted(chain, authType);
        } catch (CertificateException excep) {
            LOGGER.warn("服务器凭证验证信任失败");
        }
    }

    @Order
    public X509Certificate[] getAcceptedIssuers() {
        return sunJSSEX509TrustManager.getAcceptedIssuers();
    }
}
