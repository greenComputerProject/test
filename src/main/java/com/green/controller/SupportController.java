package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/support")
public class SupportController {

	
	@GetMapping("/list")
	public void getList() {};
	
	@GetMapping("/get")
	public void getOne() {};
}
