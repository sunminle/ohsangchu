package com.gi.osc.repository;

import java.util.List;

import com.gi.osc.bean.QNADTO;
import com.gi.osc.bean.QNAReplyDTO;



public interface QnaMapper {
	int addQna(QNADTO dto);
	
	public List<QNADTO> qnaList(int id);
	List<QNADTO> getQnaList(); //공지사항 목록 조회
	
	QNADTO getQnaById(long id);  // 글번호에 해당하는 공지사항 조회
	QNAReplyDTO getQnaReplyById(long id);
	
	public void addQnaReply(QNAReplyDTO qnaReplyDTO);
	public int qnaReplyCount(int qnaId);
	public QNAReplyDTO qnaReplyList(int qnaId);

}
	