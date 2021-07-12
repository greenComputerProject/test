package com.green.service;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.green.domain.MailDTO;

@Service
public class MailServiceImpl implements MailService {
	
	@Inject
    JavaMailSender mailSender; // root-context.xml에 설정한 bean, 의존성을 주입
 
    @Override
    public void sendMail(MailDTO dto) {
        try {
            // 이메일 객체
            MimeMessage msg = mailSender.createMimeMessage();
 
            // 받는 사람을 설정 (받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
            msg.addRecipient(RecipientType.TO, new InternetAddress(dto.getReceiveMail()));
 
            // 보내는 사람(이메일주소+이름)
            msg.addFrom(new InternetAddress[] { new InternetAddress(dto.getSenderMail(), dto.getSenderName()) });
 
            // 이메일 제목
            msg.setSubject(dto.getSubject(), "utf-8");
            // 이메일 본문
            String content = dto.getCustomerEmail() + "님의 문의 \n" + dto.getMessage();
            
            msg.setText(content, "utf-8");
 
            // 이메일 보내기
            mailSender.send(msg);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
