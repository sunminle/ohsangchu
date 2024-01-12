package com.gi.osc.repository;

import com.gi.osc.bean.UsersDTO;

public interface UsersMapper {
	public int loginChk(UsersDTO dto);

	// 회원가입 처리
    void register(UsersDTO dto) throws Exception;
    
    public int getUserId(String realId);

}
