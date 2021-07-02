package com.green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.oauth2.domain.SessionUser;
import com.green.service.PurchaseService;

@Controller
@RequestMapping("/library")
public class LibraryController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private PurchaseService purchaseService;
	
	@GetMapping
	public String getPurchaseList(Model model) {
		
		model.addAttribute("games", purchaseService.getList(getSessionUserId()));
		
		return "/user/library";
	}
	
	public String getSessionUserId() {
		SessionUser user = (SessionUser)session.getAttribute("user");
		return user.getUserid();
	}
}
