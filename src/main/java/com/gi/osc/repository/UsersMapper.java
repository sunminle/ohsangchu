package com.gi.osc.repository;

import java.util.List;

import com.gi.osc.bean.UserInfoDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.domain.Users;

public interface UsersMapper {
	public int loginChk(UsersDTO dto);

	// 회원가입 처리
  //  void register(UsersDTO dto) throws Exception;
    int register(UsersDTO user);
    int registerUserInfo(UserInfoDTO userInfo);
    
    public int getUserId(String realId);
    
    public UsersDTO aaa(String realId);

	public List<Users> getAllUsers();

}
