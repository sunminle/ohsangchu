package com.gi.osc.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.gi.osc.bean.UsersDTO;
import com.gi.osc.domain.Users;

public interface UsersService {
	public int loginChk(UsersDTO dto);
	
	//회원가입 처리
	 public boolean registerPro(UsersDTO dto) throws Exception;
	
	//userName주면 userId 가져오기
	public int getUserId(String userName);
	
	//header 프로필사진
	public void headerprofile(UsersDTO usersDTO, MultipartFile file, String filePath, String realId);
	
	 public UsersDTO aaa(String realId);

	public List<Users> getAllUsers();
	
	 // 사용자 권한 변경 메서드 
	 UsersDTO getUserByRealId(String realId);
	    void updateUserAuth(UsersDTO dto);

		public void changeUserAuth(String realId, String auth);
}
