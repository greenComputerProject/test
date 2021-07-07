package com.green.jms.domain;

import lombok.Data;

@Data
public class MessageDto {

	private String from;
	private String to;
	private String content;
}
