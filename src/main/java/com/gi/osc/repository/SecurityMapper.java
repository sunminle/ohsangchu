package com.gi.osc.repository;

import com.gi.osc.bean.UsersDTO;

public interface SecurityMapper {
	public UsersDTO read(String realId);
	
}
