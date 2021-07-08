package com.green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.oauth2.domain.SessionUser;
import com.green.utils.SessionUserGetter;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/chat")
@Log4j
public class ChatController {

	@Autowired
	private HttpSession session;
	
	@GetMapping
	public String chat(Model model) {
		
		SessionUser user = SessionUserGetter.getSessionUser(session);
		if(user != null) {
			model.addAttribute("username", user.getName());
		} else {
			String randomName = "유저" + (int)(Math.random() * 1000);
			
			model.addAttribute("username", randomName);
		}
		
		return "chat";
	}
}
