package com.gi.osc.service;

import java.util.List;

import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.HashtagPostingDTO;
import com.gi.osc.bean.PaymentDTO;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.StoreDTO;

public interface MainService {
	public List<StoreDTO> searchStoreByName(String searchKeyword);
	public List<ProductDTO> searchProductsByName(String searchKeyword);
	public List<PaymentDTO> countPopularProducts(int rownum);
	public List<HashtagDTO> searchHashtagByName(String searchKeyword);
	
	
	

}
