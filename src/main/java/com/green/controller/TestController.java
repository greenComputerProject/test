package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	
	@GetMapping("/navbartest")
	public String getNavbar() {
		return "/layout/navbar";
	}
	
	@GetMapping("/footertest")
	public String getFooter() {
		return "/layout/footer";
	}
}
