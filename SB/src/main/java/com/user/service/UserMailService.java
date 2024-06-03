package com.user.service;


import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;


@Service
public class UserMailService {

	@Autowired
    private JavaMailSender mailSender;
	
	public void sendPlainText(Collection<String> receivers, String subject, String content) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        
        helper.setTo(receivers.toArray(new String[0]));
        helper.setSubject(subject);
        helper.setText(content, true);
        helper.setFrom("SocialBook 官方<eeit179socialbook@gmail.com>");
        
        mailSender.send(message);
    }
}
