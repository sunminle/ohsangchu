package com.gi.osc.repository;

import java.util.List;

import com.gi.osc.bean.NoticeDTO;

public interface NoticeMapper {
	int addNotice(NoticeDTO dto);
	public List<NoticeDTO> noticeList(int id);
	List<NoticeDTO> getNoticeList(); //공지사항 목록 조회
	NoticeDTO getNoticeById(Long id);
}
	