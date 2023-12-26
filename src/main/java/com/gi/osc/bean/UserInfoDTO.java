package com.gi.osc.bean;

import lombok.Data;

@Data
public class UserInfoDTO {
	private int userId;
	private String tel;
	private String email;
	private String address;
	private String bankName;
	private String account;
	private int social;
}
