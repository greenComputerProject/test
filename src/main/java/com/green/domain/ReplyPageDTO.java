package com.green.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Data
public class ReplyPageDTO {
	private int replyCnt;
	private List<ReplyVO> list;
	public ReplyPageDTO(int replyCnt , List<ReplyVO> list) {
		this.list= list;
		this.replyCnt =replyCnt;
	}
}
