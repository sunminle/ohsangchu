package com.gi.osc.bean;

import lombok.Data;

@Data
public class DeliveryTypeDTO {
	private int id;
	private String deliveryTypeName;
	private int deliveryTypePrice;
	
	private int deliveryTypeId;
	private int postingId;
}
