package com.gi.osc.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.gi.osc.bean.UsersDTO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	private UsersDTO dto;
	public CustomUser(String userName, String userPw, Collection<? extends GrantedAuthority> authorities) {
		super(userName, userPw, authorities);
	}
	
	public CustomUser(UsersDTO dto) {
		super(dto.getRealId(),dto.getUserPw(), dto.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
	
	   this.dto = dto;
	}
}
