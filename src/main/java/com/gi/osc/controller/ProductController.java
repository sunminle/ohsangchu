package com.gi.osc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gi.osc.bean.ProductDTO;
import com.gi.osc.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("addProduct")
	public String addProduct() {
		return "product/addProduct";
	}
	
	@RequestMapping("addProductPro")
	public String addProductPro(ProductDTO dto,Model model,HttpSession session) {
		String realId = (String) session.getAttribute("usersId");
		dto.setRealId(realId);
		service.addProduct(dto);
		return "product/addProductPro";
	}
	
}
