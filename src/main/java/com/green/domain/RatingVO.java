package com.green.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class RatingVO {
	
	private Long rating_no;
	private String userid;
	private Long gno;
	private Long rating;
}
