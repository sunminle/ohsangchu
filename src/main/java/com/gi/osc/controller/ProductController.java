package com.gi.osc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product/*")
public class ProductController {

	@RequestMapping("detail")
	public String productDetail() {
		
		
		return "product/productDetail";
	}
	
}
