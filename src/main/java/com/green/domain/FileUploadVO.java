package com.green.domain;

import lombok.Data;

@Data
public class FileUploadVO {
	private String uuid;		//pk 
	private String uploadPath;	//
	private String fileName;	//
	private Long nno;			//foreign key (tbl_new nno pk)
}
