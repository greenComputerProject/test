package com.green.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.green.domain.Criteria;
import com.green.domain.ReplyPageDTO;
import com.green.domain.ReplyVO;
import com.green.service.ReplyService;

@RequestMapping("/replies")
@RestController
public class ReplyController {
	@Autowired
	private ReplyService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json",produces = {MediaType.TEXT_PLAIN_VALUE})
	
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		System.out.println("ReplyVO 댓글 컨트롤러 댓글 생성 : " +vo);
		int insertCount = service.insert(vo);
		System.out.println("댓글 추가 갯수 : " +insertCount);
		
		return insertCount ==1 ?
				new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
	}
	
	@GetMapping(value = "/pages/{gno}/{page}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<ReplyPageDTO>  getList(@PathVariable("page") int page, @PathVariable("gno") Long gno){
		System.out.println("댓글 컨트롤러에서 전체 목록 조회 ...............");
		Criteria cri = new Criteria(page,6);
		System.out.println(cri);
		//return new ResponseEntity<> (service.getList(cri, gno), HttpStatus.OK);
		return new ResponseEntity<> (service.getListWithPaging(cri, gno), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{rno}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE
			})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {
		System.out.println("댓글 컨트롤러에서 데이터 하나 조회  "+ rno);
		return new ResponseEntity<ReplyVO> (service.read(rno), HttpStatus.OK);
	}
	
	@PreAuthorize("principal.username == #vo.userid")
	@DeleteMapping(value = "/{rno}")
	public ResponseEntity<String> remove(
			@RequestBody ReplyVO vo, 
			@PathVariable("rno") Long rno
	) {
		return service.delete(rno) == 1 
				? new ResponseEntity<> ("success", HttpStatus.OK)
				: new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("principal.username == #vo.userid")
	@RequestMapping(
			value = "/{rno}", 
			method = {RequestMethod.PUT, RequestMethod.PATCH},
			consumes = "application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyVO vo, 
			@PathVariable("rno") Long rno
	) {
		vo.setRno(rno);
		return service.update(vo) ==1 ?
				new ResponseEntity<> ("success", HttpStatus.OK)
				:new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
