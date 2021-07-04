package com.green.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rno; //댓글 고유번호
	
	private Long gno; //게임하나당 댓글 여러개
	
	private Long likes; // 평점
	
    private String content; //댓글내용
    
    private String userid; //댓글작성자
    
    private Date regDate; //작성일
    
    private Date updateDate; //수정일
}
