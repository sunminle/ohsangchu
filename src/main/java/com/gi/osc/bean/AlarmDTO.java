package com.gi.osc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class AlarmDTO {
	private int id;
	private int userId;
	private int chatId;
	private String code;
	private String checked;
	private Date createDate;
	private String prefix;
}
