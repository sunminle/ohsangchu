package com.gi.osc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@RequestMapping("detail")
	public String productDetail(HttpServletRequest request, Model model) {
		//파라미터로 포스팅 넘버받아오기
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		//포스트넘버를 주면 
		
		
		return "product/productDetail";
	}
	
}
