package com.gi.osc.bean;

import lombok.Data;

@Data
public class ChatDTO {
	
	private int id;
	private int userAId;
	private int userBId;
	private String chatLog;
	
}
