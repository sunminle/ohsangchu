package com.gi.osc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class UsersDTO {
	private int id;
	private String realId;
	private String userName;
	private String userPw;
	private String nickname;
	private String profile;
	private String auth;
	private Date regDate;
	private Date modDate; 
}