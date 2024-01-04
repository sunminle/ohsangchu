package com.gi.osc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class QNADTO {
	private int id;
	private int userId;
	private String title;
	private String content;
	private Date regDate;
}
