package com.gi.osc.service;

import java.util.List;

import com.gi.osc.bean.NoticeDTO;
import com.gi.osc.bean.UsersDTO;

public interface NoticeService {
	
	//글 작성 처리
	public boolean addNoticePro(NoticeDTO dto) throws Exception;
		 
	
	 
	 public List<NoticeDTO> noticeList();
}
