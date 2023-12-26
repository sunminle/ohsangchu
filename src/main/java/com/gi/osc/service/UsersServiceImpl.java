package com.gi.osc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gi.osc.bean.UsersDTO;
import com.gi.osc.repository.UsersMapper;

@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersMapper mapper;
	
	@Override
	public int loginChk(UsersDTO dto) {
		
		return mapper.loginChk(dto);
	}
	
}
