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
import com.gi.osc.bean.RecentlyViewedProducts;
import com.gi.osc.bean.RecentlyViewedStores;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.service.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@Autowired
	private MainService service;
	
	@Autowired
    private RecentlyViewedProducts recentlyViewedProducts;  // RecentlyViewedProducts 추가
	
	@Autowired
    private RecentlyViewedStores recentlyViewedStores;

    @RequestMapping("")
    public String main(Model model) {
        // 최근 본 상품 목록을 모델에 추가
        List<ProductDTO> recentlyViewedProductsList = recentlyViewedProducts.getRecentlyViewedProducts();
        model.addAttribute("recentlyViewedProducts", recentlyViewedProductsList);
        List<StoreDTO> recentlyViewedStoresList = recentlyViewedStores.getRecentlyViewedStores();
        model.addAttribute("recentlyViewedStores", recentlyViewedStoresList);
        
        return "main";
    }
	
	@GetMapping("/main")
	public String showSearchForm() {
	    return "main/main";
	}


	@GetMapping("/search")
	public String searchProductsByName(@ModelAttribute("productDTO") ProductDTO productDTO,
	                                  @RequestParam(name = "page", defaultValue = "1") int page,
	                                  Model model) {
	   
	   String productName = productDTO.getProductName();

	   // ProductService에서 검색 메서드 호출 
	   List<ProductDTO> productList = service.searchProductsByName(productDTO);

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

	   // 결과를 보여줄 뷰의 이름 반환
	   return "main/search";
	}
	
	

}
