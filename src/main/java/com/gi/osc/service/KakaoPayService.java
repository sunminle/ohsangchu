package com.gi.osc.service;

import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.gi.osc.bean.KakaoPayApprovalVO;
import com.gi.osc.bean.KakaoPayReadyVO;

@Service
public class KakaoPayService {
	
private static final String HOST = "https://kapi.kakao.com";
    
	private KakaoPayReadyVO kakaoPayReadyVO;
    
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
    public String kakaoPayReady(HttpServletRequest request, String productName, int quantity, String deliveryTypeName, int price) {
 
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "a945a1dd4dd146e478c587b347b71fa0");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "sunmin0393");
        params.add("item_name", productName);
        params.add("quantity", String.valueOf(quantity));
        params.add("total_amount", String.valueOf(price));
        params.add("tax_free_amount", "21000");
        params.add("approval_url", "http://localhost:8080/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:8080/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            System.out.println("kakaoPayReadyVo=======" + kakaoPayReadyVO);
            
            kakaoPayReadyVO.setDeliveryTypeName(deliveryTypeName);
            kakaoPayReadyVO.setProductName(productName);
            kakaoPayReadyVO.setQuantity(quantity);
            kakaoPayReadyVO.setPrice(price);
            request.getSession().setAttribute("kakaoPayReadyVO", kakaoPayReadyVO);
            
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        }
        catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    
    
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token,HttpServletRequest request) {
    	 
        System.out.println("KakaoPayInfoVO............................................");
        System.out.println("-----------------------------");
        RestTemplate restTemplate = new RestTemplate();
        KakaoPayReadyVO kakaoPayReadyVO = (KakaoPayReadyVO) request.getSession().getAttribute("kakaoPayReadyVO");
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "a945a1dd4dd146e478c587b347b71fa0");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "sunmin0393");
        params.add("pg_token", pg_token);
        params.add("total_amount", String.valueOf(kakaoPayReadyVO.getPrice()));
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            System.out.println("" + kakaoPayApprovalVO);
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
	
}
