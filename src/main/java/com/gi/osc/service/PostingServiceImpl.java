package com.gi.osc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.repository.PostingMapper;

@Service
public class PostingServiceImpl implements PostingService{
	
	@Autowired
	private PostingMapper mapper;

	@Override
	public PostingDTO getPost(int postNum) {		
		return mapper.getPost(postNum);
	}

	@Override
	public StoreDTO getStore(int storeId) {
		return mapper.getStore(storeId);
	}

	@Override
	public UsersDTO getUSer(int userId) {
		return mapper.getUser(userId);
	}
	

}
