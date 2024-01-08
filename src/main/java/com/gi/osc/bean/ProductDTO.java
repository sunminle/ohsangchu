package com.gi.osc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private String realId;
	private int id;
	private int storeId;
	private String productName;
	private int price;
	private int quantity;
	private String productIntro;
	private int isPublic;
	private int categoryId;
	private Date regDate;
	private String IMG_URL;
	
	private String storeName;
	private String searchKeyword;
}
