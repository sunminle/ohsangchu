package com.gi.osc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.gi.osc.bean.NoticeDTO;
import com.gi.osc.repository.NoticeMapper;

@Service
@Transactional
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeMapper mapper;

	
	@Override
	@Transactional
	public boolean addNoticePro(NoticeDTO dto) throws Exception {
		 try {
       	  mapper.addNotice(dto);  //db insert
       	  
           return true;
           
       } catch (Exception e) {
           // 오류 발생 시 롤백
           TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
           throw e;
       }
   }
	
	@Override
	public List<NoticeDTO> noticeList() {
	    try {
	        // 데이터베이스에서 공지사항 목록 조회
	        List<NoticeDTO> noticeList = mapper.getNoticeList();
	        return noticeList;
	    } catch (Exception e) {
	        // 예외 처리 로직 추가
	        throw e;

	    }
	}

	@Override
	public NoticeDTO getNoticeById(Long id) {
	
		return mapper.getNoticeById(id);
	}




	


	
}
