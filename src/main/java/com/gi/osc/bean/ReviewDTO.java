package com.gi.osc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private int id;
	private int userId;
	private int postingId;
	private String content;
	private float point;
	private String img;
	private Date regDate;
	
	//리뷰별유저정보
	private UsersDTO users;
	
	
	//프로덕트id를 스트링으로 치환했을때 사용하려고 만듬.
	//private String productName;
	private String title;
}
