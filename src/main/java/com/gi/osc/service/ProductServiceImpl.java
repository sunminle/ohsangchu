package com.gi.osc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gi.osc.bean.ProductDTO;
import com.gi.osc.repository.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper mapper;

	
	@Override
	public void addProduct(ProductDTO dto) {
		mapper.addProduct(dto);
	}

	@Override
	public List<ProductDTO> productList(int storeId) {
		return mapper.productList(storeId);
	}
	
}
