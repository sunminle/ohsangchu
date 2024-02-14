package com.gi.osc.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gi.osc.bean.UsersDTO;
import com.gi.osc.domain.Users;
import com.gi.osc.service.MyPageServiceImpl;
import com.gi.osc.service.UsersService;
import com.gi.osc.service.UsersServiceImpl;

@Controller
@RequestMapping("/users")
public class UsersController {
	
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Inject
	UsersService service;
	
	@Autowired
	private UsersServiceImpl serviceImpl;
	
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
		dto = service.aaa(dto.getRealId());
		model.addAttribute("chk",chk);
		model.addAttribute("usersDTO",dto);
		model.addAttribute("backURI", backURI);
		
		return "users/login";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		
		return "users/logout";
	}

	//-------회원가입--------
	
		// 회원가입 get
		@RequestMapping(value = "/register", method = RequestMethod.GET)
		public void getRegister() throws Exception {
			logger.info("get 회원가입");
		}
		
		// 회원가입 post
		@RequestMapping(value = "/registerPro", method = RequestMethod.POST)
		public String postRegister(UsersDTO dto, Model model) throws Exception {
		    logger.info("post 회원가입");
		    logger.info(dto.toString());

		    // 회원 가입 처리
		    boolean registrationSuccess = service.registerPro(dto);

		    if (registrationSuccess) {
		        // 회원 가입 성공 시
		        model.addAttribute("message", "Registration successful!");
		        return "redirect:/users/main"; // 로그인 페이지로 리다이렉트
		    } else {
		        // 회원 가입 실패 시
		        model.addAttribute("error", "Registration failed. Please try again.");
		        return "users/register"; // 회원 가입 폼 페이지로 이동 
		    }
		}
		//users
		   @GetMapping("/users")
		    public String getUsers(Model model) {
		        List<Users> users = service.getAllUsers();
		        model.addAttribute("users", users);
		        return "admin/adminMain"; 
		    }
		
		
		@RequestMapping(value = "/header", method = RequestMethod.GET)
	    @ResponseBody
	    public ResponseEntity<String> getProfileImage(HttpSession session) {
			if(session.getAttribute("usersId")!=null) {
				String realId = (String) session.getAttribute("usersId");
				UsersDTO usersDTO = myPageService.selectUsers(realId);

				String profileImageUrl = "/resources/images/profiles/" + usersDTO.getProfile();
				return new ResponseEntity<>(profileImageUrl, HttpStatus.OK);
			} else {
				return new ResponseEntity<>(HttpStatus.OK);	
			}
			
	        
	    }
		
		
		
	}


