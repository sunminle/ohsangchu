package com.gi.osc.bean;

import lombok.Data;

@Data
public class StoreDTO {
	private int id;
	private int userId;
	private String storeName;
	private String storeIntro;
	
	private String type;
	private String Keyword;
	private String profile;

}
