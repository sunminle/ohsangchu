package com.gi.osc.repository;

import java.util.List;

import com.gi.osc.bean.NoticeDTO;

public interface NoticeMapper {
	int addNotice(NoticeDTO dto);
	public List<NoticeDTO> noticeList(int id);
}
	