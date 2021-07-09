package com.green.domain;

import lombok.Data;

@Data
public class MailDTO {
	private String senderName;
	private String senderMail;
	private String receiveMail;
	private String subject;
	private String message;
	
	@Override
    public String toString() {
        return "MailDTO [senderName=" + senderName + ", senderMail=" + senderMail + ", receiveMail=" + receiveMail
                + ", subject=" + subject + ", message=" + message + "]";
    }
	
}
