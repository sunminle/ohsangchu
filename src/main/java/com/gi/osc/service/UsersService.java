package com.gi.osc.service;

import com.gi.osc.bean.UsersDTO;

public interface UsersService {
	public int loginChk(UsersDTO dto);
	
	//회원가입 처리
	void register(UsersDTO dto) throws Exception;
	
	//userName주면 userId 가져오기
	public int getUserId(String userName);
}
