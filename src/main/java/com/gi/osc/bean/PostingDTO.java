package com.gi.osc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class PostingDTO {
	private int id;
	private int storeId;
	private String title;
	private String content;
	private int isPublic;
	private int categoryId;
	private Date regDate;
}
