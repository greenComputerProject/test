package com.green.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class GameIndexVO {
	
	private Long gno;
	private String title;
	private String content;
	private int price;
	private Boolean isOnSale;
	private Date regDate;
	
	
	private String titlePicture;
	private String logo;
}
