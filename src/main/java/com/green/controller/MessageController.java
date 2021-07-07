package com.green.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@PostMapping("/send")
	public void send(@RequestBody MessageDto message) {
		
		service.send(message);
	}
}
