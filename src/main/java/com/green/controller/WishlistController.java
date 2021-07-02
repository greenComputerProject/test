package com.green.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.domain.WishlistListVO;
import com.green.domain.WishlistVO;
import com.green.oauth2.domain.SessionUser;
import com.green.service.WishlistServiceImpl;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/wishlist")
@Log4j
public class WishlistController {

	@Autowired
	private WishlistServiceImpl service;
	
	@Autowired
	private HttpSession session;
	
	private static SessionUser user;
	
	@GetMapping
	public String getList(Model model){
		log.info("==========> " + getSessionUserId());
		model.addAttribute("games", service.getList(getSessionUserId()));
		return "/user/wishlist";
	}
	
	@GetMapping("/get")
	@ResponseBody
	public List<WishlistListVO> getResponseBody(){
		return service.getList(getSessionUserId());
	}
	
	@PostMapping("/{gno}")
	@ResponseBody
	public Integer addWishlist(@PathVariable("gno") Long gno ) {
		WishlistVO vo = new WishlistVO();
		
		if(service.checkIfExists(getSessionUserId(), gno)) {
			return null;
		}else {
		
		vo.setUserid(getSessionUserId());
		vo.setGno(gno);
		service.addWishlist(vo);
		
		return getWishlistCount();
		}
	}
	
	@DeleteMapping("/{wno}")
	@ResponseBody
	public Integer deleteWishlist(@PathVariable("wno") Long wno) {
		
		service.delete(wno);
		return getWishlistCount();
	}
	
	@DeleteMapping("/delete/{gno}")
	@ResponseBody
	public Integer deleteWishWithGno(@PathVariable("gno") Long gno) {
		
		return service.deleteWithGno(getSessionUserId(), gno);
	}
	
	@GetMapping("/count")
	@ResponseBody
	public Integer getCount() {
		
		System.out.println("getCount ==========> " + getWishlistCount());
		return getWishlistCount();
	}
	
	private Integer getWishlistCount() {
		
		if(getSessionUserId() != null) return service.getCount(getSessionUserId());
		else return null;
	}
	
	private String getSessionUserId() {
		user = (SessionUser)session.getAttribute("user");
		
		if(user != null) return user.getUserid();
		else return null;
	}
}
