package com.gi.osc.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gi.osc.bean.CategoryDTO;
import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.HashtagPostingDTO;
import com.gi.osc.bean.PaymentDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.StoreDTO;

public interface MainMapper {
	public List<StoreDTO> searchStoreByName(String searchKeyword);
	public List<ProductDTO> searchProductsByName(String searchKeyword);
	public List<PaymentDTO> countPopularProducts(int rownum);
	public List<HashtagDTO> searchHashtagByName(String searchKeyword);
	//public List<CategoryDTO> getCategoriesByRange();
	public List<CategoryDTO> getCategories();
	public List<PostingDTO> getPostingsByCategoryId(Long categoryId);
	public void insertKeyword(String keyword);
	public List<Map<String, Object>> selectPopularWords();
	
	

}
