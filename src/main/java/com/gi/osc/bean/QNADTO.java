package com.gi.osc.bean;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QNADTO {
	private int id;
	private int userId;
	private String title;
	private String content;
	private Date regDate;
	
	public int getUserId() {
        return userId;
    }

    public void setUserId(int userid) {
        this.userId = userid;
    }

    private String detailUrl;


	public QNADTO orElse(Object object) {
	
		return null;
	}
}
