package com.gi.osc.bean;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
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
	private List<AuthDTO> authList;  // 권한
	private int chatAlarmCount;
	
}
