package com.gi.osc.repository;

import java.util.List;

import com.gi.osc.bean.QNADTO;



public interface QnaMapper {
	int addQna(QNADTO dto);
	
	public List<QNADTO> qnaList(int id);
	List<QNADTO> getQnaList(); //공지사항 목록 조회
	
	QNADTO getQnaById(long id);  // 글번호에 해당하는 공지사항 조회

}
	