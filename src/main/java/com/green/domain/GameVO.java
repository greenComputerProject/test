package com.green.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class GameVO {
	private Long gno;
	private String title;
	private String content;
	private Long price;
	private Long rating;
	private String isOnSale;
	private Date regDate;
	private Long cno;
	private String ageLimit;
	
	private SpecVO specvo;
	private CompanyVO companyvo;
	private TagVO tagvo;
	private GameResourceVO resourcevo;
	
	private List<WarningVO> warningList;
	
	private List<ReplyVO> reviewList;
	
	private List<GamePictureVO> pictureList;
	

}
