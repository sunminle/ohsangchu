package com.gi.osc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UserInfoDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.repository.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageMapper mapper;

	@Override
	public UsersDTO selectUsers(String realId) {
		return mapper.selectUsers(realId);
	}
	
	@Override
	public UserInfoDTO selectUsersInfo(int userId) {
		return mapper.selectUsersInfo(userId);
	}
	
	@Override
	public StoreDTO selectStoreInfo(int userId) {
		return mapper.selectStoreInfo(userId);
	}
	
	@Override
	public void addProduct(ProductDTO dto) {
		mapper.addProduct(dto);
	}

	@Override
	public List<ProductDTO> productList(int storeId) {
		return mapper.productList(storeId);
	}

	

	
	

}
