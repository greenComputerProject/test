package com.green.utils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
// 페이징 기준 클래스
public class Criteria {
	
	private int pageNum; //현재 페이지 번호
	private int amount; //페이지당 데이터 수
	
	public Criteria() { //기본 생성자 호출했을 시 기본값 세팅
		this.pageNum = 1;
		this.amount = 10;
	}
	
	public Criteria(int pageNum) {
		this.pageNum = pageNum;
		this.amount = 10;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
