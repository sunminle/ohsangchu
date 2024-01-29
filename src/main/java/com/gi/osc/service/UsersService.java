package com.gi.osc.service;


import org.springframework.web.multipart.MultipartFile;

import com.gi.osc.bean.UsersDTO;

public interface UsersService {
	public int loginChk(UsersDTO dto);
	
	//회원가입 처리
	 public boolean registerPro(UsersDTO dto) throws Exception;
	
	//userName주면 userId 가져오기
	public int getUserId(String userName);
	
	//header 프로필사진
	public void headerprofile(UsersDTO usersDTO, MultipartFile file, String filePath, String realId);
	
	 public UsersDTO aaa(String realId);
}
