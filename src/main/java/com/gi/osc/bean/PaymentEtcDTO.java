package com.gi.osc.bean;

import lombok.Data;

@Data
public class PaymentEtcDTO {
	private int id;
	private int paymentId;
	private int deliveryTypeId;
	private String getterName;
	private String getterTel;
	private String postCode;
	private String bankName;
	private String account;
	private String accountHolder;
	private String note;
	
}
