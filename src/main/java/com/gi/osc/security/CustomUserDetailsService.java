package com.gi.osc.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.gi.osc.bean.UsersDTO;
import com.gi.osc.repository.SecurityMapper;


public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private SecurityMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		UsersDTO dto = mapper.read(userName); 
		
		return dto == null ? null : new CustomUser(dto);
	}

	
}
