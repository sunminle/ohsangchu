package com.gi.osc.service;

import java.util.List;

import com.gi.osc.bean.Criteria;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.StoreDTO;

public interface MainService {
	public List<StoreDTO> searchStoreByName(StoreDTO dto);
	public List<ProductDTO> searchProductsByName(ProductDTO dto);
	public List<ProductDTO> getList(Criteria cri);
	

}
