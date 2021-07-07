package com.green.jms;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.green.jms.domain.MessageDto;
import com.green.oauth2.domain.SessionUser;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class PushNotification {
	
	@Autowired
	private HttpSession session;
	
	//queue에 메시지가 들어오면 실행
	public void handleMessage(MessageDto dto) {
		log.info("Handle Message Invoked");
		log.info(dto.toString());
		//사용자 이메일로 온 메시지가 잇으면 세션에 정보를 추가
		
		SessionUser user = (SessionUser) session.getAttribute("user");
		if(user == null) {
			return;
		} 
		
		if(user.getEmail() == dto.getTo()) {
			
			session.setAttribute("newMessage", dto);
		}
		//화면에서 jstl 과 자바스크립트로 새 창을 띄움
	}
}
