package com.gi.osc.bean;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReadyVO {
	
	private String tid, next_redirect_pc_url;
    private Date created_at;
    private String productName;
    private int quantity;
    private String deliveryTypeName;
    private int price;
}
