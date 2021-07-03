package com.green.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class NewsVO {
	private Long nno;
	private String title;
	private String content;
	private Date regDate;
	private Date updateDate;
	private String userid;
	
	private FileUploadVO getFile;
}