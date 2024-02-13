package com.gi.osc.bean;

import lombok.Data;

@Data
public class PaymentProductDTO {
	private int id;
	private int paymentId;
	private int productId;
	private int amount;
}
