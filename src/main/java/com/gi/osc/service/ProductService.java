package com.gi.osc.service;

import java.util.List;

import com.gi.osc.bean.ProductDTO;

public interface ProductService {
	public void addProduct(ProductDTO dto);
	public List<ProductDTO> productList(int storeId);
	public List<ProductDTO> productList2(int i);
}
