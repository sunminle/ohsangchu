package com.gi.osc.repository;

import java.util.List;

import com.gi.osc.bean.ProductDTO;

public interface ProductMapper {
	public void addProduct(ProductDTO dto);
	public List<ProductDTO> productList(int storeId);
}
