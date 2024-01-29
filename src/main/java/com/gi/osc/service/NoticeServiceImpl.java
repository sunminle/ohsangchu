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
	NoticeMapper mapper;
	

	
	@Override
	public List<NoticeDTO> noticeList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
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

	


	
}
