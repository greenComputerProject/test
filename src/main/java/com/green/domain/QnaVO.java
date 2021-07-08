package com.green.domain;

import lombok.Data;

@Data
public class QnaVO {
	private Long qno_no;
	private String qna_title;
	private String qna_content;
	private Data qna_regDate;
	private String userid;
}
