package com.gi.osc.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gi.osc.service.KakaoPayService;

import lombok.Setter;
import lombok.extern.java.Log;


@Controller
@Log
public class KakaoPayController {
	
		@Setter(onMethod_ = @Autowired)
	    private KakaoPayService kakaoPayService;
	    
	    @GetMapping("/kakaoPay")
	    public void kakaoPayGet() {
	        
	    }
	    
	    @PostMapping("/kakaoPay")
	    public String kakaoPay(String productName, int quantity, String deliveryTypeName, int price,HttpServletRequest request) {
	    	System.out.println("kakaoPay post............................................");
	        
	        return "redirect:" + kakaoPayService.kakaoPayReady(request,productName, quantity, deliveryTypeName, price);
	 
	    }
	    
	    @RequestMapping("/kakaoPaySuccess")
	    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model,HttpServletRequest request) {
	    	System.out.println("kakaoPaySuccess get............................................");
	    	System.out.println("kakaoPaySuccess pg_token : " + pg_token);
	    	model.addAttribute("info", kakaoPayService.kakaoPayInfo(pg_token,request));
	    	
	    	return "kakaoPay/kakaoPaySuccess";
	        
	    }
	@RequestMapping("start")
	public String main() {
		return "kakaoPay/start";
	}
	
	@RequestMapping("ready")
	public @ResponseBody void ready() {
		
	}
}
