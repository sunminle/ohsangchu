package com.gi.osc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewAnswerDTO {
	private int id;
	private int reviewId;
	private int userId;
	private String content;
	private Date regDate;
}
