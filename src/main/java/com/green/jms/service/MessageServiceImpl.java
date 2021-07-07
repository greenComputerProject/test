package com.green.jms.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;

import com.green.jms.domain.MessageDto;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private JmsTemplate jmsTemplate;
	
	Logger logger = LoggerFactory.getLogger(this.getClass().getName());
	
	public void send(MessageDto message) {
		
		jmsTemplate.convertAndSend(message);
	};
}
