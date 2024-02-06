package com.gi.osc.bean;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
	//  글번호
    private long id;
    
    private int userId;
    //  제목
    private String title;
    //  내용
    private String content;
  
    //  작성일
    private Date regDate;
 
   
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userid) {
        this.userId = userid;
    }

    private String detailUrl;


	public NoticeDTO orElse(Object object) {
		// TODO Auto-generated method stub
		return null;
	}

}
