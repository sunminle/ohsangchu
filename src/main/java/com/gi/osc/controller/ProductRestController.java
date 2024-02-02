package com.gi.osc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gi.osc.service.ReviewService;
import com.gi.osc.service.StoreService;
import com.gi.osc.service.UsersService;

@RequestMapping("/store")
@RestController
public class ProductRestController {
	
	@Autowired
	private StoreService storeService;
	@Autowired
	private UsersService userService;
	@Autowired
	private ReviewService reviewService;
	
	
	/**
	 * alt+shift+j
	 * 팔로우
	 * @param postId
	 * @param session
	 * @return
	 */
	@GetMapping("/follow/{storeUserId}")
	public Map<String, Object> follow(@PathVariable int storeUserId,HttpSession session) {

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
	
	@GetMapping("/like/{postingId}")
	public Map<String, Object> like(@PathVariable int postingId,HttpSession session) {

		Map<String, Object> result = new HashMap<>();
		
		// 찜 중이면 삭제, 없으면 추가
		String userName = (String)session.getAttribute("usersId");
		// userName주면 userId 가져오기
		int userId = userService.getUserId(userName);
		// 로그인중인 유저 아이디와 해당 포스트 아이디를 주면 찜/해제
		System.out.println("postingId : "+postingId+", userId : "+userId);
		int hResult = storeService.like(postingId,userId);
		
		if(hResult == 1) {	//찜
			result.put("code", 1);
			result.put("result", "팔로우완료");
		}else {	//찜not
			result.put("code", 1);
			result.put("result", "언팔로우!");
		}
		
		return result;
	}
	
	
	/**
	 * 리뷰업로드
	 * @param session
	 * @param request
	 * @param uploadFiles
	 * @return
	 */
	@PostMapping("/add_review")
	public Map<String, Object> addReview(HttpSession session,HttpServletRequest request,
									@RequestParam("content") String content,
									@RequestParam("postingId") int postingId,
									@RequestParam("point") float point,
									@RequestParam(value="img", required = false) MultipartFile img) {

		Map<String, Object> result = new HashMap<>();
		
		//세션에서 유저 아이디 받아오기
		String realId = (String)session.getAttribute("usersId");
		//realId주면 userId 가져오기
		int userId = userService.getUserId(realId);
		
		//DB INSERT: 해당 유저 넘버로 저장
		int row = reviewService.addReview(userId,content,postingId,point,img);
		System.out.println("리뷰 "+row+"개 작성완료!");
		
		if(row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		}else {
			result.put("code", 500);
			result.put("errorMessage", "리뷰가 업로드 되지 않았습니다.");
		}

		return result;
	}
	
}
