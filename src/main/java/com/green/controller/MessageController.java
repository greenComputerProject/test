package com.green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.listener.adapter.MessageListenerAdapter;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.jms.domain.MessageDto;
import com.green.jms.service.MessageService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/message")
public class MessageController {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MessageService service;
	
	@Autowired
	private MessageListenerAdapter	adapter;
	
	@PostMapping("/send")
	public void send(@RequestBody MessageDto message) {
		
		log.info(adapter.getSubscriptionName());
		service.send(message);
	}
}
