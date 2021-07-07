package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.green.domain.PurchaseVO;
import com.green.service.PurchaseService;

@RequestMapping("/purchase")
@RestController
public class PurchaseController {

	@Autowired
	private PurchaseService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insert(@RequestBody PurchaseVO vo){
		
		System.out.println("Purchase 컨트롤러 : " +vo);
		
		int insertCount = service.insert(vo);
		
		System.out.println("구매 추가 갯수 : " +insertCount);
		
		return insertCount ==1 ?
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
}
