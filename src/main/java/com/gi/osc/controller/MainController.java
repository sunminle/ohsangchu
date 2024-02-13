package com.gi.osc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gi.osc.bean.CategoryDTO;
import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.HashtagPostingDTO;
import com.gi.osc.bean.PaymentDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.service.MainService;
import com.gi.osc.service.PostingService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private MainService service;


	@RequestMapping("")
	public String main(Model model) {
	    List<PaymentDTO> popularProducts = service.countPopularProducts(1);
	    model.addAttribute("popularProducts", popularProducts);
	    
	    List<CategoryDTO> categories = service.getCategories();
        model.addAttribute("categories", categories);
        
	    return "main";
	}


	
	@GetMapping("/main")
	public String showSearchForm() {
	    return "main/main";
	}
	
	@GetMapping("/view")
	public String view(@RequestParam("categoryId") Long categoryId, Model model) {
	    List<PostingDTO> postings = service.getPostingsByCategoryId(categoryId);
	    model.addAttribute("postings", postings);
		
		//List<CategoryDTO> category = service.getCategoriesByRange();
        //model.addAttribute("category", category);
        
        //List<CategoryDTO> categories = service.getCategories();
        //model.addAttribute("categories", categories);
	    return "main/view";
	}


	@GetMapping("/search")
	public String searchProductsByName(@RequestParam(name = "page", defaultValue = "1") int page,
	                                  int searchColumn, String searchKeyword,
	                                  Model model) {
	   		if(searchColumn == 1) {
				List<ProductDTO> productList = service.searchProductsByName(searchKeyword);
				// 페이징 처리를 위한 로직 추가
				int pageSize = 10; // 페이지당 아이템 수
			   int totalItems = productList.size();
			   int pageCount = (totalItems + pageSize - 1) / pageSize;
	
			   // 현재 페이지의 제품 리스트 계산
			   int startIdx = (page - 1) * pageSize;
			   int endIdx = Math.min(startIdx + pageSize, totalItems);
			   List<ProductDTO> currentPageProducts = productList.subList(startIdx, endIdx);
	
			   // 결과 및 페이징 정보를 모델에 추가하여 뷰에 전달
			   model.addAttribute("productList", currentPageProducts);
			   model.addAttribute("pageCount", pageCount);
			   model.addAttribute("currentPage", page);
		}else if(searchColumn == 2) {
			List<StoreDTO> storeList = service.searchStoreByName(searchKeyword);
			int pageSize = 10; // 페이지당 아이템 수
			int totalItems = storeList.size();
			int pageCount = (totalItems + pageSize - 1) / pageSize;

			   // 현재 페이지의 제품 리스트 계산
			int startIdx = (page - 1) * pageSize;
			int endIdx = Math.min(startIdx + pageSize, totalItems);
			List<StoreDTO> currentPageProducts = storeList.subList(startIdx, endIdx);

			   // 결과 및 페이징 정보를 모델에 추가하여 뷰에 전달
			model.addAttribute("storeList", currentPageProducts);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", page);
		}else if(searchColumn == 3){
			List<HashtagDTO> hashtagList = service.searchHashtagByName(searchKeyword);
			int pageSize = 10; // 페이지당 아이템 수
			int totalItems = hashtagList.size();
			int pageCount = (totalItems + pageSize - 1) / pageSize;

			   // 현재 페이지의 제품 리스트 계산
			int startIdx = (page - 1) * pageSize;
			int endIdx = Math.min(startIdx + pageSize, totalItems);
			List<HashtagDTO> currentPageProducts = hashtagList.subList(startIdx, endIdx);

			   // 결과 및 페이징 정보를 모델에 추가하여 뷰에 전달
			model.addAttribute("hashtagList", currentPageProducts);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", page);
		}
	   // 결과를 보여줄 뷰의 이름 반환
	   return "main/search";
	}
	
	

}
