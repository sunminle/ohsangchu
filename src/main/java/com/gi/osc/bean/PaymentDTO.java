package com.gi.osc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentDTO {
	
	private int id;
	private int userId;
	private int postingId;
	private int categoryId;
	private String address;
	private String paymentType;
	private int status;
	private Date orderDate;
	
	private int totalCount;
	private String title;
    private String thumnail;
    private int price;
    private String storeName;
    private String profile;
    private String productname;
	// 닉네임 받기위해
	private String nickname;
	
}
