package com.green.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.green.domain.PurchaseVO;
import com.green.oauth2.domain.SessionUser;
import com.green.service.PurchaseService;

@RequestMapping("/purchase")
@RestController
public class PurchaseController {
	
	@Autowired
	private PurchaseService service;
	
	@Autowired
	private HttpSession session;
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/new", method=RequestMethod.POST)
	@ResponseBody
	public void insert(String userid, Long gno){
		System.out.println("gno :"+ gno);
		System.out.println("userid :"+ userid);
		
		service.purchase(userid, gno);
		
	}
	
	@GetMapping("/check/{gno}")
	@ResponseBody
	public Boolean check(@PathVariable("gno") Long gno) {
		
		SessionUser user =  (SessionUser)session.getAttribute("user");
		
		if(user == null) {
			return false;
		}
		
		return service.isPurchased(user.getUserid(), gno);
	}
	
}
