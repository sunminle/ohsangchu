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
	
	// 공지사항 목록 _ 일반 user
	@Override
	public List<NoticeDTO> noticeList() {
	    try {
	        List<NoticeDTO> noticeList = mapper.getNoticeList();
	        return noticeList;
	    } catch (Exception e) {
	        // 예외 처리 로직 추가
	        throw e;

	    }
	}
	 // 공지사항 목록 _ admin
		@Override
		public List<NoticeDTO> noticeListAdmin() {
			  try {
			        List<NoticeDTO> noticeList = mapper.getNoticeList();
			        return noticeList;
			    } catch (Exception e) {
			        // 예외 처리 로직 추가
			        throw e;

			    }
		}
		
	private final NoticeMapper noticeMapper;

    @Autowired
    public NoticeServiceImpl(NoticeMapper noticeMapper) {
        this.noticeMapper = noticeMapper;
    }

    @Override
    public NoticeDTO getNoticeById(Long id) {
        return noticeMapper.getNoticeById(id);
    }

	@Override
	public void updateNotice(NoticeDTO noticeDTO) {
		// 공지사항 수정
		
	}



	
}
