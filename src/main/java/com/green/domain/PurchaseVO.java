package com.green.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PurchaseVO {
	
	private Long pno;
	private String orderid;
	private Date purchaseDate;
	private Long gno;
	private String userid;
}
