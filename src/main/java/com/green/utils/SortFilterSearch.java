package com.green.utils;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
//정렬, 필터링, 검색용 클래스
public class SortFilterSearch {
	//!! CASE SENSITIVE 함 (대소문자 구분
	
	//필터 (태그들)
	private List<String> filterList;
	// 정렬 기준
	private String order;
	// 내림차순 or 오름차순
	private String direction;
	// 검색어
	private String keyword;

}
