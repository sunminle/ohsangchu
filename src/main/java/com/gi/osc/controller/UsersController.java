package com.gi.osc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gi.osc.bean.UsersDTO;
import com.gi.osc.service.UsersServiceImpl;

@Controller
@RequestMapping("/users/*")
public class UsersController {
	
	@Autowired
	private UsersServiceImpl service;
	
	@RequestMapping("/main")
	public String main() {
		
		return "users/main";
	}
	
	@RequestMapping("/login")
	public String login(UsersDTO dto, Model model) {
		int chk = service.loginChk(dto);
		model.addAttribute("chk",chk);
		model.addAttribute("usersDTO",dto);
		return "users/login";
	}
}
