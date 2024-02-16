package com.gi.osc.bean;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QNAReplyDTO {
	private int qnaId;
	private int userId;
	private String title;
	private String content;
	private Date regDate;
	
	
}
