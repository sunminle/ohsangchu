package com.gi.osc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gi.osc.bean.QNADTO;
import com.gi.osc.bean.QNAReplyDTO;


@Service
public interface QnaService {

	// 글 작성 처리
	public boolean addQnaPro(QNADTO dto) throws Exception;

	public List<QNADTO> qnaList();

	public static String processHtmlContent(String htmlContent) {
		// TODO Auto-generated method stub
		return null;
	}

	public QNADTO getQnaById(Long id);
	public QNAReplyDTO getQnaReplyById(Long id);
	

	// realId check
	public default boolean checkRealId(String realId) {
		String admin = "admin"; 
		
		return admin.equals(realId);
	    }

	public List<QNADTO> qnaListAdmin();
	
	public void addQnaReply(QNAReplyDTO qnaReplyDTO);
	public int qnaReplyCount(int qnaId);
	public QNAReplyDTO qnaReplyList(int qnaId);
	
}
