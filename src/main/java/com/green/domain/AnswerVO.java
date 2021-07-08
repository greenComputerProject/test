package com.green.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerVO {
	//답변
	private Long answer_no;
    private String answer_title;
    private String answer_content;
    private Date answer_regDate;
    private String userid;
    private String qna_no;
}
