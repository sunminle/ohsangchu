package com.gi.osc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gi.osc.bean.PostingDTO;
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
	public String productDetail(HttpServletRequest request, Model model) {
		
		//파라미터로 포스팅 넘버받아오기
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		
		//포스트넘버를 주면 해당 포스트 가져오기
		PostingDTO post = postService.getPost(postNum);
		
		//스토어넘버를 주면 해당 스토어 가져오기
		int storeId = post.getStoreId();
		StoreDTO store = postService.getStore(storeId);
		
		//유저넘버를 주면 해당 유저 정보 가져오기
		int userId = store.getUserId();
		UsersDTO user = postService.getUSer(userId);
		
		//뷰 페이지에 보내기
		model.addAttribute("post", post);
		model.addAttribute("store", store);
		model.addAttribute("storeUser", user);
		
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
		UsersDTO user = postService.getUSer(userId);
		
		//뷰 페이지에 보내기
		model.addAttribute("store", store);
		model.addAttribute("storeUser", user);
		
		//팔로우 버튼 : 페이지 로드시
		//로그인 유저 id
		String userName = (String)session.getAttribute("usersId");
		int loginUid = userService.getUserId(userName);
		int followCheck = storeService.followCheck(storeId, loginUid);
		
		model.addAttribute("followCheck",followCheck);
		
		return "product/store";
	}
	
}
