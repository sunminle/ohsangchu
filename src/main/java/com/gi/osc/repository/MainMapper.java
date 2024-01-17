package com.gi.osc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gi.osc.bean.Criteria;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.StoreDTO;

public interface MainMapper {
	public List<StoreDTO> searchStoreByName(String searchKeyword);
	public List<ProductDTO> searchProductsByName(String searchKeyword);
	
	public List<ProductDTO> getListWithPaging(Criteria cri);
	

}
