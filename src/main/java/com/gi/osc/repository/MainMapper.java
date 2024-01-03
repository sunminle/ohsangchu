package com.gi.osc.repository;

import java.util.List;

import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.StoreDTO;

public interface MainMapper {
	public List<StoreDTO> searchList(StoreDTO dto);
	public List<ProductDTO> searchProductsByName(ProductDTO dto);
	public List<ProductDTO> searchProductsByName(String searchKeyword);

}
