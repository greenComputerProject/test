package com.green.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	//질문
	private Long qna_no;
    private String qna_title;
    private String qna_content;
    private Date qna_regDate;
    private String userid;
}
