package com.green.domain;

import lombok.Data;

@Data
public class MailDTO {
	private String senderName;
	private final String senderMail = "testoss0713@gmail.com";
	private final String receiveMail = "cksdnr066@naver.com" ;
	private String subject = "새로운 고객 문의가 들어왔습니다.";
	private String customerEmail;
	private String message;

	
}
