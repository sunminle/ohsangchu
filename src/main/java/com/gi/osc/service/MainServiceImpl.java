package com.gi.osc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.gi.osc.bean.Criteria;
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
	public List<ProductDTO> getList(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}
	
	


	
	

}
