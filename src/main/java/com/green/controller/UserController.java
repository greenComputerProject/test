package com.green.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.oauth2.domain.SessionUser;
import com.green.security.domain.SecurityMemberVO;
import com.green.security.service.SecurityMemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class UserController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private SecurityMemberService service;
	
	@GetMapping
	@ResponseBody
	public SessionUser getSessionUser() {
		log.info(session.getAttribute("user"));
		return (SessionUser)session.getAttribute("user");
	}
	
	//서버 로그인 로직 시작
	
	@GetMapping("/login")
	public String getPages(Model model, @RequestParam(value = "error", required = false) String error,
									@RequestParam(value="success") String success) {
		
		log.info("ERROR => " + error);
		if(error != null && error.equals("error")) {
			model.addAttribute("error", "아이디 또는 비밀번호를 확인해주세요." );
		}
		
		return "/user/login";
	}
	
	
	@GetMapping("/signup")
	public void getSignupPage() {}
	
	
	@PostMapping(value="/check", consumes = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public Boolean checkIfExists(@RequestBody String email) {
		if(email != null) {
			return service.getMember(email) != null ? true: false;
		} else {
			return false;
		}
	}
	
	@PostMapping("/signup")
	@ResponseBody
	public Boolean getSignUp(@RequestBody SecurityMemberVO memberVO) {
		
		if(memberVO != null) {
			log.info(memberVO.toString());
			return service.signUp(memberVO);
			
		} else {
			return false;
		}
	}
	
	@GetMapping("/info")
	public String getUserInfoPage(Model model) {
		
		SessionUser user = (SessionUser) session.getAttribute("user");
		Map<String, String> userMap = new HashMap<String, String>();
		userMap.put("name", user.getName());
		userMap.put("email", user.getEmail());
		userMap.put("picture", user.getPicture());
		model.addAttribute("user", userMap);
		
		return "user/info";
	}
	
	@PostMapping("/info")
	@ResponseBody
	public Boolean getUserInfo(@RequestBody SecurityMemberVO memberVO) {
		
		log.info(memberVO);
		if(memberVO != null) {

			memberVO.setUserid(getSessionUserId());
			
			return service.updateUser(memberVO);
			
		} else {
			return false;
		}
		
	}
	
	@PostMapping("/remove")
	@ResponseBody
	public Boolean removeUser() {
		
		return service.delete(getSessionUserId());
	}
	
	public String getSessionUserId() {
		SessionUser sessionUser = (SessionUser) session.getAttribute("user");
		return sessionUser.getUserid();
	}
		
}
