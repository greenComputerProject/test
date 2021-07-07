package com.green.jms.service;

import com.green.jms.domain.MessageDto;

public interface MessageService {

	public void send(MessageDto dto);
	
	public void receive(MessageDto dto);
}
