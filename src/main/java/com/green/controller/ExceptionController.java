package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/error")
public class ExceptionController {

	@GetMapping("/errpage")
	public void errpage(@RequestParam("error") int error, Model model) {
		
		model.addAttribute("error", error);
	}
}
