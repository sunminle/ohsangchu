package com.gi.osc.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.service.PostingService;
import com.gi.osc.service.StoreService;
import com.gi.osc.service.UsersService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private PostingService postService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private UsersService userService;

	@RequestMapping("detail")
	public String productDetail(HttpServletRequest request, Model model
								,HttpSession session) {
		
		//파라미터로 포스팅 넘버받아오기
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		
		//포스트넘버를 주면 해당 포스트 가져오기
		PostingDTO post = postService.getPost(postNum);
		
		//스토어넘버를 주면 해당 스토어 가져오기
		int storeId = post.getStoreId();
		StoreDTO store = postService.getStore(storeId);
		
		//유저넘버를 주면 해당 유저 정보 가져오기
		int userId = store.getUserId();
		UsersDTO user = postService.getUser(userId);
		
		//포스트넘버를 주면 해당 포스트의 해시태그 가져오기
		ArrayList<HashtagDTO> hashes = postService.getHashes(postNum);
		
		//포스트넘버를 주면 해당 포스트의 찜갯수 가져오기
		int likeCnt = postService.getHearts(postNum); 
		
		//포스트넘버를 주면 해당 포스트의 리뷰 가져오기
		ArrayList<ReviewDTO> reviews = postService.getReviews(postNum);
		//리뷰에 해당 유저 정보 추가하기
		for(ReviewDTO review : reviews) {
			review.setUsers(postService.getUser(review.getUserId()));
		}
		int revCnt = reviews.size();
		
		//유저 넘버 주면 해당 유저 리뷰 평균
		ArrayList<ReviewDTO> userRe = storeService.getReviews(userId);
		double sum = 0;
		for(ReviewDTO r:userRe) {
			sum += r.getPoint();
		}
		double revAvg = sum/(userRe.size());
		
		//찜 버튼 : 페이지 로드시
		//로그인 유저 id
		if(session.getAttribute("usersId") != null) {
			String userName = (String)session.getAttribute("usersId");
			int loginUid = userService.getUserId(userName);
			int heartCheck = postService.heartCheck(postNum, loginUid);
			
			model.addAttribute("heartCheck",heartCheck);
		}else {
			int heartCheck = 3;
			model.addAttribute("heartCheck",heartCheck);
		}
		
		//뷰 페이지에 보내기
		model.addAttribute("post", post);
		model.addAttribute("store", store);
		model.addAttribute("storeUser", user);
		model.addAttribute("reviews", reviews);
		model.addAttribute("revCnt", revCnt);
		model.addAttribute("revAvg", revAvg);
		model.addAttribute("hashes", hashes);
		model.addAttribute("likeCnt", likeCnt);
		
		return "product/productDetail";
	}
	
	@RequestMapping("store")
	public String store(HttpServletRequest request, Model model,HttpSession session) {
		
		//스토어넘버를 주면 해당 스토어 가져오기
		//파라미터로 스토어 넘버 받기
		int storeId = Integer.parseInt(request.getParameter("storeNum"));
		StoreDTO store = postService.getStore(storeId);
		
		//유저넘버를 주면 해당 유저 정보 가져오기
		int userId = store.getUserId();
		UsersDTO user = postService.getUser(userId);
		
		
		//뷰 페이지에 보내기
		model.addAttribute("store", store);
		model.addAttribute("storeUser", user);
		
		//팔로잉&팔로우 유저수 표시
		Map<String, Integer> folcnt = storeService.folcnt(storeId,store.getUserId());
		
		model.addAttribute("folcnt", folcnt);
		
		//팔로우 버튼 : 페이지 로드시
		//로그인 유저 id
		if(session.getAttribute("usersId") != null) {
			String userName = (String)session.getAttribute("usersId");
			int loginUid = userService.getUserId(userName);
			int followCheck = storeService.followCheck(storeId, loginUid);
			
			model.addAttribute("followCheck",followCheck);
		}else {
			int followCheck = 3;
			model.addAttribute("followCheck",followCheck);
		}
		
		
		return "product/store";
	}
	
}
