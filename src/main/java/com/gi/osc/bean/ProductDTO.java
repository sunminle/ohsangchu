package com.gi.osc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private String realId;
	private int id;
	private int storeId;
	private int postingId;
	private String productName;
	private int price;
	private int quantity;
	
	private String IMG_URL;
	private String content;
	private String title;
	
	private String storeName;
	private String searchKeyword;
	
	
	//주문날짜 뽑아오기위해
	private Date orderDate;
	
	//찜아이디 뽑아오기위해
	private int heartId;
}
