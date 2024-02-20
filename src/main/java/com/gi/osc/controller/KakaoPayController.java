package com.gi.osc.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gi.osc.bean.DeliveryTypeDTO;
import com.gi.osc.bean.KakaoPayReadyVO;
import com.gi.osc.bean.MyOrderProductDTO;
import com.gi.osc.service.KakaoPayService;
import com.gi.osc.service.MyPageService;

import lombok.Setter;
import lombok.extern.java.Log;


@Controller
@Log
public class KakaoPayController {
	
		@Setter(onMethod_ = @Autowired)
	    private KakaoPayService kakaoPayService;
	    
		@Setter(onMethod_ = @Autowired)
	    private MyPageService myPageService;
		
	    @GetMapping("/kakaoPay")
	    public void kakaoPayGet() {
	        
	    }
	    
	    @PostMapping("/kakaoPay")
	    public String kakaoPay(int paymentId,HttpServletRequest request) {
	    	System.out.println("kakaoPay post............................................");
	    	int count = myPageService.selectPaymentProductCount(paymentId);
	    	String productName = myPageService.selectKakaoPayProductName(paymentId);
	    	if(count > 1){
	    		productName = myPageService.selectKakaoPayProductName(paymentId)+"외"+ (count-1); 
	    	}
	    	List<Integer> quantityList = myPageService.selectKakaoPayQuantity(paymentId);
	    	int sum = 0;
	    	for(int i = 0 ; i < quantityList.size(); i++) {
	    		sum += quantityList.get(i);
	    	}
	    	int quantity = sum; 
	    	int priceSum = 0;
	    	List<MyOrderProductDTO> priceList = myPageService.selectKakaoPayPrice(paymentId);
	    	for(int i = 0; i < priceList.size(); i++) {
	    		priceSum += priceList.get(i).getAmount()* priceList.get(i).getPrice();
	    	}
	    	int price = priceSum;
	    	int deliveryTypeId = myPageService.selectPaymentEtc(paymentId).getDeliveryTypeId();
			DeliveryTypeDTO deliveryTypeDTO = myPageService.selectDeliveryTypeInfo(deliveryTypeId);
			int deliveryTypePrice = deliveryTypeDTO.getDeliveryTypePrice();
			price += deliveryTypePrice;
	    	String deliveryTypeName = deliveryTypeDTO.getDeliveryTypeName(); 
	
	        return "redirect:" + kakaoPayService.kakaoPayReady(request,productName, quantity, deliveryTypeName, price, paymentId);
	 
	    }
	    
	    @RequestMapping("/kakaoPaySuccess")
	    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model,HttpServletRequest request) {
	    	System.out.println("kakaoPaySuccess get............................................");
	    	System.out.println("kakaoPaySuccess pg_token : " + pg_token);
	    	model.addAttribute("info", kakaoPayService.kakaoPayInfo(pg_token,request));
	    	KakaoPayReadyVO kakaoPayReadyVO = (KakaoPayReadyVO) request.getSession().getAttribute("kakaoPayReadyVO");
	    	int paymentId = kakaoPayReadyVO.getPaymentId();
	    	myPageService.updateStatus1(paymentId);
	    	model.addAttribute("paymentId",paymentId);
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
