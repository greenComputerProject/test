package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.domain.MailDTO;
import com.green.service.MailService;
import com.green.service.MailServiceImpl;

@Controller
@RequestMapping("/support")
public class SupportController {
	
	@Autowired
	private MailService service;
	
	@GetMapping
	public String get() {
		return "support/email-form";
	}
	
	@PostMapping("/send")
	@ResponseBody
	public Boolean sendMail(@RequestBody MailDTO mail) {
		
		service.sendMail(mail);
		return true;
		
	}
	
	
}
