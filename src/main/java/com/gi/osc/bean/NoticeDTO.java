package com.gi.osc.bean;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
	//  글번호
    private int id;
    
    private String userid;
    //  제목
    private String title;
    //  내용
    private String content;
  
    //  작성일
    private Date regDate;
 
 

}
