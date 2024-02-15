package com.gi.osc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gi.osc.bean.UserInfoDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.domain.Users;
@Mapper
public interface UsersMapper {
	public int loginChk(UsersDTO dto);

	// 회원가입 처리
  //  void register(UsersDTO dto) throws Exception;
    int register(UsersDTO user);
    int registerUserInfo(UserInfoDTO userInfo);
    
    public int getUserId(String realId);
    
    public UsersDTO aaa(String realId);

	public List<Users> getAllUsers();

    // 사용자의 실제 ID로 사용자 정보 가져오기
	UsersDTO getUserByRealId(String realId);
    

    // 사용자 권한 업데이트
    void updateUserAuth(UsersDTO user);
}
