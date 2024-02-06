package com.gi.osc.bean;

import java.util.List;

import lombok.Data;

@Data
public class OrderDTO {
	
	private List<ProductData> products;
	private String deliveryMethod;
	private String postingId;

}
