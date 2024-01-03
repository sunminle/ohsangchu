package com.gi.osc.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gi.osc.bean.UsersDTO;
import com.gi.osc.service.UsersService;
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
	
	@RequestMapping("register")
	public String register() {
		
		return "users/register";
	}
	
		private static final Logger logger = LoggerFactory.getLogger(UserRegisterController.class);
		
		@Inject
		UsersService usersservice;
		
		// 회원가입 get
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public void getRegister() throws Exception {
			logger.info("get register");
		}
		
		// 회원가입 post
		@RequestMapping(value = "/register", method = RequestMethod.POST)
		public String postRegister(UsersDTO dto) throws Exception {
			logger.info("post register");
			
			service.register(dto);
			
			return null;
	}
}
