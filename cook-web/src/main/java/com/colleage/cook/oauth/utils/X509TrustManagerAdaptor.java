package com.colleage.cook.oauth.utils;

import javax.net.ssl.X509TrustManager;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/**
 * @Classname X509TrustManagerAdaptor
 * @Description HTTPS证书信任管理器的适配器
 * @Date 2019\4\17 0016
 * @Created by David
 */
public abstract class X509TrustManagerAdaptor implements X509TrustManager {

    @Override
    public void checkClientTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
    }

    @Override
    public void checkServerTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
    }

    @Override
    public X509Certificate[] getAcceptedIssuers() {
        return null;
    }
}
