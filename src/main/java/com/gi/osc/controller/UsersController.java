package com.gi.osc.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gi.osc.bean.UsersDTO;
import com.gi.osc.service.MyPageServiceImpl;
import com.gi.osc.service.UsersService;
import com.gi.osc.service.UsersServiceImpl;

@Controller
@RequestMapping("/users/*")
public class UsersController {
	
	@Autowired
	private UsersServiceImpl service;
	
	@Autowired
	private MyPageServiceImpl myPageService;
	
	@RequestMapping("/main")
	public String main(@RequestParam(defaultValue="main") String backURI , Model model) {
		model.addAttribute("backURI", backURI);
		return "users/main";
	}
	
	@RequestMapping("/login")
	public String login(UsersDTO dto,String backURI, String profile,Model model) {
		int chk = service.loginChk(dto);
		model.addAttribute("chk",chk);
		model.addAttribute("usersDTO",dto);
		model.addAttribute("backURI", backURI);
		
		return "users/login";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		
		return "users/logout";
	}
	
	@RequestMapping("register")
	public String register() {
		
		
		return "users/register";
	}
	
	@RequestMapping("/registerPro")
	public String registerPro(UsersDTO dto, Model model) {
		int chk = service.loginChk(dto);
		model.addAttribute("chk",chk);
		model.addAttribute("usersDTO",dto);
		return "users/registerPro";
	}
	//---------------------------
//	@RequestMapping("/header")
//	public String modifyMePro(UsersDTO usersDTO, MultipartFile file, HttpServletRequest request, HttpSession session, Model model) {
//		String realId = (String) session.getAttribute("usersId");
////		String filePath = request.getServletContext().getRealPath("/resources/images/profiles/");
////		service.headerprofile(usersDTO, file, filePath, realId);
//		
//		usersDTO = myPageService.selectUsers(realId);
//		System.out.println(usersDTO.getProfile());
//		model.addAttribute("usersDTO",usersDTO);
//		return "include/header";
//	}
	
	//---------------------------

	        
		private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
		
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

		@RequestMapping(value = "/header", method = RequestMethod.GET)
	    @ResponseBody
	    public ResponseEntity<String> getProfileImage(HttpSession session) {
	        String realId = (String) session.getAttribute("usersId");
	        UsersDTO usersDTO = myPageService.selectUsers(realId);

	        String profileImageUrl = "/resources/images/profiles/" + usersDTO.getProfile();

	        return new ResponseEntity<>(profileImageUrl, HttpStatus.OK);
	    }
		
		
		
	}


