package com.green.domain;

import lombok.Data;

@Data
//게임 목록을 받기 위한 VO클래스
public class GameListVO {
	
	private Long gno;
	private String title;
	private String price;
	private String company;
	private String titlePicture;
}
