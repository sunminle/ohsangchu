package com.gi.osc.bean;

import java.util.ArrayList;
import java.util.Date;

import lombok.Data;

@Data
public class PostingDTO {
	private int id;
	private int storeId;
	private String title;
	private String content;
	private int isPublic;
	private int categoryId;
	private Date regDate;
	private String thumnail;
	private String paymentType;
	
	//배송방식
	private ArrayList<DeliveryTypeDTO> deliveryType;
	
	
	// realId받아오기위해
		private String realId;
	
	//payment 쓸때 주문날짜 받아오기 위해
		private Date orderDate;
		private int reviewCount;
		private int paymentId;
}
