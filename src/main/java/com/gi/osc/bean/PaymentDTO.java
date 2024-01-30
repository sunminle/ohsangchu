package com.gi.osc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentDTO {
	
	private int id;
	private int userId;
	private int postingId;
	private int productId;
	private int categoryId;
	private int amount;
	private String address;
	private String paymentType;
	private int status;
	private Date orderDate;
	
	private int totalCount;
	private String title;
    private String thumnail;
    
	// 닉네임 받기위해
	private String nickname;
	
}
