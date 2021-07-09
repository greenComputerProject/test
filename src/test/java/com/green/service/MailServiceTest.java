package com.green.service;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.green.domain.MailDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MailServiceTest {

	@Inject
    JavaMailSender mailSender;
	
	@Autowired
	private MailService service;
	
	MailDTO maildto = new MailDTO();
	
	
	@Test
	public void sendmail() {
		
		maildto.setSenderName("보내는사랑");
		maildto.setSenderMail("testoss0713@gmail.com");
		maildto.setReceiveMail("seobno@naver.com");
		maildto.setSubject("제목");
		maildto.setMessage("내용");
		
		service.sendMail(maildto);
		
	}
	
	
	
}
