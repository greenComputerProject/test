package com.green.utils;

import lombok.Getter;
import lombok.extern.log4j.Log4j;

//화면에 페이지 버튼을 뿌리기 위한 클래스
@Getter
@Log4j
public class PageMaker {

	private int totalCount; // 데이터 총 갯수
	private int startPage; //시작 페이지
	private int endPage; // 끝 페이지
	private Boolean prev; //이전 페이지 버튼
	private Boolean next; // 다음 페이지 버튼
	
	private final int displayPageNum = 10; //보여질 페이지 버튼의 수
	
	private Criteria criteria; // 기준 객체 (페이지 당 데이터 수 , 현재 페이지 넘버)
	
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPage();
	}
	
	private void calcPage() {		

		endPage = (int ) (Math.ceil((double)criteria.getPageNum() / displayPageNum) * displayPageNum);
		
		startPage = endPage - displayPageNum + 1;
		
		int tempEndPage = (int)Math.ceil((double)totalCount / criteria.getAmount());
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage	;
		}
		
		
		
		prev = startPage == 1 ? false : true;
		next = totalCount <= criteria.getAmount() * endPage ? false : true; 
	}
	
}
