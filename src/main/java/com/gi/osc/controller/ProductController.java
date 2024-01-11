package com.gi.osc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.service.PostingService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private PostingService service;

	@RequestMapping("detail")
	public String productDetail(HttpServletRequest request, Model model) {
		
		//파라미터로 포스팅 넘버받아오기
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		
		//포스트넘버를 주면 해당 포스트 가져오기
		PostingDTO post = service.getPost(postNum);
		
		//스토어넘버를 주면 해당 스토어 가져오기
		int storeId = post.getStoreId();
		StoreDTO store = service.getStore(storeId);
		
		//유저넘버를 주면 해당 유저 정보 가져오기
		int userId = store.getUserId();
		UsersDTO user = service.getUSer(userId);
		
		//뷰 페이지에 보내기
		model.addAttribute("post", post);
		model.addAttribute("store", store);
		model.addAttribute("user", user);
		
		return "product/productDetail";
	}
	
	@RequestMapping("store")
	public String store(HttpServletRequest request, Model model) {
		
		
		
		return "product/store";
	}
	
}
