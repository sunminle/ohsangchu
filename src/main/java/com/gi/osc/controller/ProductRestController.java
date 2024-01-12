package com.gi.osc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gi.osc.service.StoreService;
import com.gi.osc.service.UsersService;

@RequestMapping("/store/*")
@RestController
public class ProductRestController {
	
	@Autowired
	private StoreService storeService;
	@Autowired
	private UsersService userService;
	/**
	 * alt+shift+j
	 * 팔로우
	 * @param postId
	 * @param session
	 * @return
	 */
	@GetMapping("/follow/{storeUserId}")
	public Map<String, Object> like(@PathVariable int storeUserId,HttpSession session) {

		Map<String, Object> result = new HashMap<>();
		
		// 팔로우 중이면 삭제, 없으면 추가
		String userName = (String)session.getAttribute("usersId");
		// userName주면 userId 가져오기
		int userId = userService.getUserId(userName);
		// 로그인중인 유저 아이디와 해당 상점 아이디를 주면 팔로우 or 언팔로우
		System.out.println("storeId : "+storeUserId+", userId : "+userId);
		int fResult = storeService.following(storeUserId,userId);
		
		if(fResult == 1) {	//팔로우
			result.put("code", 1);
			result.put("result", "팔로우완료");
		}else {	//언팔로우
			result.put("code", 1);
			result.put("result", "언팔로우!");
		}
		

		return result;
	}
	
}
