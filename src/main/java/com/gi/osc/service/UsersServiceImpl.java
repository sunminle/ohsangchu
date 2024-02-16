package com.gi.osc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.gi.osc.bean.UserInfoDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.domain.Users;
import com.gi.osc.repository.UsersMapper;

@Service
@Transactional
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	UsersMapper mapper;

	@Override
	public int loginChk(UsersDTO dto) {
		
		return mapper.loginChk(dto);
	}
	



	 // 회원 가입 처리
	 @Override
	    public boolean registerPro(UsersDTO dto) throws Exception {
	        // 트랜잭션 내에서 데이터베이스 작업 수행
	        try {
	        	  mapper.register(dto);  //db insert
	        	  
	            return true;
	        } catch (Exception e) {
	            // 오류 발생 시 롤백
	            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	            throw e;
	        }
	    }

		@Override
		public boolean registerInfoPro(UserInfoDTO dto) throws Exception {
			mapper.registerUserInfo(dto);  //db insert
			return false;
		}

	@Override
	public int getUserId(String userName) {
		return mapper.getUserId(userName);
	}

	public void headerprofile(UsersDTO usersDTO, MultipartFile file, String filePath, String realId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public UsersDTO aaa(String realId) {
		return mapper.aaa(realId);
	}




	@Override
	public List<Users> getAllUsers() {
		 return mapper.getAllUsers();
	}
	

	// 사용자 권한 변경 메서드 구현
	 @Override
	    public UsersDTO getUserByRealId(String realId) {
	        return mapper.getUserByRealId(realId);
	    }

	    @Override
	    public void updateUserAuth(UsersDTO dto) {
	        mapper.updateUserAuth(dto);
	    }



		@Override
		public void changeUserAuth(String realId, String auth) {
			// TODO Auto-generated method stub
			
		}




		
}
	

