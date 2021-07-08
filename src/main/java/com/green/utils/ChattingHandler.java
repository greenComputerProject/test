package com.green.utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class ChattingHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		log.info("afterConnectionEstablished");
		sessionList.add(session);
		
		if(session.getPrincipal() != null) {
		log.info(session.getPrincipal().getName() + "님이 입장하셧습니다");
		} else {
			log.info(session.getAttributes().toString() + " 님이 입장하셨습니다.");
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		log.info("handleTextMessage");
		
		log.info(session.getId() +  " : " + message);
		
		for(WebSocketSession s : sessionList) {
			s.sendMessage(new TextMessage(session.getPrincipal().getName() + " : " + message.getPayload()));
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		log.info("afterConnectionClosed");
		sessionList.remove(session);
		
		if(session.getPrincipal() != null) {
			log.info(session.getPrincipal().getName() + "님이 퇴장하셧습니다");
			} else {
				log.info(session.getAttributes().toString() + " 님이 퇴장하셨습니다.");
			}
	}
	
	
}
