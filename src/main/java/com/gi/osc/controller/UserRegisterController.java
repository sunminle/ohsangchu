package com.gi.osc.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gi.osc.bean.UsersDTO;
import com.gi.osc.service.UsersService;

@Controller
	@RequestMapping("/member/*")
	public class UserRegisterController {

		private static final Logger logger = LoggerFactory.getLogger(UserRegisterController.class);
		
		@Inject
		UsersService service;
		
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


