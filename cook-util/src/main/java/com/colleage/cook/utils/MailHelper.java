package com.colleage.cook.utils;

import com.colleage.cook.exception.EmailSendException;
import com.colleage.cook.exception.ThirdPartyLoginException;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.thymeleaf.context.WebContext;
import org.thymeleaf.spring4.view.ThymeleafViewResolver;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Classname MailHelper
 * @Description 邮件发送工具类
 * @Date 2019\4\11 0011
 * @Created by David
 */
@Component
public class MailHelper {
    private final static Logger log = Logger.getLogger(MailHelper.class);
    @Autowired
    private Environment env;
    @Autowired
    private ThymeleafViewResolver thymeleafViewResolver;
    @Autowired
    private JavaMailSender javaMailSender;

    public void sendEmail(String to, String title, HttpServletRequest request, HttpServletResponse response,
                          String templateName, Model model) {
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            helper.setFrom(env.getProperty("spring.mail.username"));
            helper.setTo(to);

            helper.setSubject(title);
            helper.setText(render(request, response, templateName, model), true);
            javaMailSender.send(mimeMessage);

        } catch (Exception e) {
            e.printStackTrace();
            throw new EmailSendException("邮件发送失败");
        }
    }

    public String render(HttpServletRequest request, HttpServletResponse response, String templateName, Model model) {
        try {
            WebContext ctx = new WebContext(request,response,
                    request.getServletContext(),request.getLocale(), model.asMap());

            return thymeleafViewResolver.getTemplateEngine().process(templateName, ctx);
        } catch (Exception e) {
            throw new ThirdPartyLoginException(e.getMessage(), e);
        }
    }
}
