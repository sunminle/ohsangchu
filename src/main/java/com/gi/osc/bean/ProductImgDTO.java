package com.gi.osc.bean;

import lombok.Data;

@Data
public class ProductImgDTO {
	private int id;
	private int storeId;
	private int productId;
	private String img_URL;
}
