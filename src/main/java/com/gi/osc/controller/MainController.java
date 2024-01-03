package com.gi.osc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.service.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("")
	public String main2() {
		
		return "main";
	}
	
	@RequestMapping("/main")
	public String main() {
		
		return "main/main";
	}
	
	@GetMapping("/main")
	public String showSearchForm() {
	    return "main/main";
	}


	@GetMapping("/search")
	public String searchProductsByName(@ModelAttribute("productDTO") ProductDTO productDTO, Model model) {
	    // 이제 productName은 ProductDTO 안에 있습니다.
	    String productName = productDTO.getProductName();

	    // ProductService에서 검색 메서드 호출
	    List<ProductDTO> productList = service.searchProductsByName(productDTO);

	    // 결과를 모델에 추가하여 뷰에 전달
	    model.addAttribute("productList", productList);

	    // 결과를 보여줄 뷰의 이름 반환
	    return "main/search";
	}


}
