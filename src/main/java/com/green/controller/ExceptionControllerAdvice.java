package com.green.controller;

import javax.naming.AuthenticationException;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class ExceptionControllerAdvice {

	//401
	@ExceptionHandler({ AccessDeniedException.class})
	public String accessDenied() {
		return "redirect:/error/errpage?error=401";
	}
	
	//500
	@ExceptionHandler({Exception.class})
	public String exception() {
		return "redirect:/error/errpage?error=500";
	}
}
