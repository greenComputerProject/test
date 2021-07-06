package com.green.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.green.domain.CompanyVO;
import com.green.domain.Criteria;
import com.green.domain.GamePictureVO;
import com.green.domain.GameResourceVO;
import com.green.domain.GameVO;
import com.green.domain.SpecVO;
import com.green.domain.TagVO;
import com.green.oauth2.domain.SessionUser;
import com.green.service.GameService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/game/*")
@Log4j
public class GameController {
	@Setter(onMethod_=@Autowired)
	private GameService service;
	
	@Setter(onMethod_=@Autowired)
	private HttpSession session;
	
	
	@GetMapping("/get")
	public void get(@RequestParam("title") String title, Model model, @ModelAttribute Criteria cri) {
		GameVO game = service.read(title);
		
		System.out.println("게임 컨트롤러에서 게임 조회 타이틀 :  " + title);
		model.addAttribute("game", game);
		
		TagVO tag = game.getTagvo();
		String[] tagList = tag.getTagName().split(",");
		String a = "";
		
		model.addAttribute("game", game);
		model.addAttribute("tag0", tagList[0]); //태그(장르)
		
		for(int i=1; i<tagList.length;i++) {
			a += tagList[i]+" "; 
		}
		model.addAttribute("tag", a); //태그(태그)
	}
	
	
	
	/*
	 * @GetMapping("/list") public void list(Criteria cri,Model model) {
	 * System.out.println("게임 컨트롤러에서의 전체 목록 조회 "); model.addAttribute("list",
	 * service.getList(cri)); }
	 */
	 
	
	@GetMapping("/register")
	public void register() {
		System.out.println("게임 컨트롤러에서 게임 하나 추가");
	}
	
	@PostMapping("/register")
	public String registerpost(CompanyVO company, GameVO game, TagVO tag, SpecVO spec, GameResourceVO resource, ArrayList<GamePictureVO> pictureList) {
		SessionUser sessionUser = (SessionUser)session.getAttribute("user");
		String userid =  sessionUser.getUserid();
		game.setUserid(userid);
		
		System.out.println("게임 컨트롤러에서 게임 register post");
		System.out.println(company.toString());
		System.out.println(game.toString());
		System.out.println(tag.toString());
		System.out.println(spec.toString());
		service.register(company, game, tag, spec, resource, pictureList);
		
		return "redirect:/browse";
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("title") String title, Model model, @ModelAttribute("cri") Criteria cri) {
		System.out.println("게임 컨트롤러에서 수정");
		GameVO game = service.read(title);
		
		TagVO tag = game.getTagvo();
		String[] tagList = tag.getTagName().split(",");
		String a = "";
		
		model.addAttribute("game", game);
		model.addAttribute("tag0", tagList[0]); //태그(장르)
		
		for(int i=1; i<tagList.length;i++) {
			a += tagList[i]+" "; //태그(태그)
		}
		model.addAttribute("tag", a);
		
		
	}
	@PostMapping("/modify")
	public String modify(CompanyVO company, GameVO game, TagVO tag, SpecVO spec, GameResourceVO resource, ArrayList<GamePictureVO> pictureList, RedirectAttributes rttr) {
		System.out.println("게임 컨트롤러에서 게임 modify post");
		service.modify(company, game, tag, spec, resource, pictureList);
		return "redirect:/browse";
	}
	
	@GetMapping("/isExists/{title}")
	@ResponseBody
	public Boolean isExists(@PathVariable("title") String title) {
		log.info("title ======> " + title);
		log.info(service.isExists(title));
		return service.isExists(title);
	}
	
	@GetMapping("/delete/{gno}")
	@ResponseBody
	public Boolean delete(@PathVariable("gno") Long gno) {
		
		return service.delete(gno);
	}
}
