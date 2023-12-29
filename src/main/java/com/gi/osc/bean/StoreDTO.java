package com.gi.osc.bean;

import lombok.Data;

@Data
public class StoreDTO {
	private int id;
	private int userId;
	private int storeName;
	private int storeIntro;
	
	private String type;
	private String keyword;

}
