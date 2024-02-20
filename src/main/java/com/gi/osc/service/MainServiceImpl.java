package com.gi.osc.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gi.osc.bean.CategoryDTO;
import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.HashtagPostingDTO;
import com.gi.osc.bean.PaymentDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.repository.MainMapper;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainMapper mapper;

	@Override
	public List<StoreDTO> searchStoreByName(String searchKeyword) {
		return mapper.searchStoreByName(searchKeyword);
	}

	@Override
	public List<ProductDTO> searchProductsByName(String searchKeyword) {
		return mapper.searchProductsByName(searchKeyword);
	}
	

	@Override
	public List<PaymentDTO> countPopularProducts(int rownum) {
	    List<PaymentDTO> popularProducts = mapper.countPopularProducts(rownum);
	    return popularProducts;
	}

	@Override
	public List<HashtagDTO> searchHashtagByName(String searchKeyword) {
		// TODO Auto-generated method stub
		return mapper.searchHashtagByName(searchKeyword);
	}

	 /*@Override
	    public List<CategoryDTO> getCategoriesByRange() {
	        return mapper.getCategoriesByRange();
	    }*/

	@Override
	public List<CategoryDTO> getCategories() {
		// TODO Auto-generated method stub
		 return mapper.getCategories();
	}

	@Override
	public List<PostingDTO> getPostingsByCategoryId(Long categoryId) {
		// TODO Auto-generated method stub
		return mapper.getPostingsByCategoryId(categoryId);
	}

	@Override
	public void insertKeyword(String keyword) {
		// TODO Auto-generated method stub
		mapper.insertKeyword(keyword);
	}

	@Override
	public List<Map<String, Object>> selectPopularWords() {
		// TODO Auto-generated method stub
		return mapper.selectPopularWords();
	}

	

	
	
	


	
	

}
