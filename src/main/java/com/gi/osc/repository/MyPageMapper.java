package com.gi.osc.repository;

import java.util.List;

import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UserInfoDTO;
import com.gi.osc.bean.UsersDTO;

public interface MyPageMapper {
	public UsersDTO selectUsers(String realId);
	public UserInfoDTO selectUsersInfo(int userId);
	public StoreDTO selectStoreInfo(int userId);
	public void addProduct(ProductDTO dto);
	public List<ProductDTO> productList(int storeId);
}
