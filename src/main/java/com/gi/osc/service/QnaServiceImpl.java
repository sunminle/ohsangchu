package com.gi.osc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.gi.osc.bean.QNADTO;
import com.gi.osc.repository.QnaMapper;



@Service
@Transactional
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaMapper mapper;

	
	@Override
	@Transactional
	public boolean addQnaPro(QNADTO dto) throws Exception {
		 try {
       	  mapper.addQna(dto);  //db insert
       	  
           return true;
           
       } catch (Exception e) {
           // 오류 발생 시 롤백
           TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
           throw e;
       }
   }
	
	// Qna 목록 _ 일반 user
	@Override
	public List<QNADTO> qnaList() {
	    try {
	        List<QNADTO> qnaList = mapper.getQnaList();
	        return qnaList;
	    } catch (Exception e) {
	        // 예외 처리 로직 추가
	        throw e;

	    }
	}
	 // Qna 목록 _ admin
		@Override      
		public List<QNADTO> qnaListAdmin() {
			  try {
			        List<QNADTO> qnaList = mapper.getQnaList();
			        return qnaList;
			    } catch (Exception e) {
			        // 예외 처리 로직 추가
			        throw e;

			    }
		}
		
	private final QnaMapper qnaMapper;

    @Autowired
    public QnaServiceImpl(QnaMapper qnaMapper) {
        this.qnaMapper = qnaMapper;
    }

    @Override
    public QNADTO getQnaById(Long id) {
        return qnaMapper.getQnaById(id);
    }


	



	
}
