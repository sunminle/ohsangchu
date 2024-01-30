package com.gi.osc.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ReviewDTO;
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
	public UsersDTO getUser(int userId) {
		return mapper.getUser(userId);
	}

	@Override
	public ArrayList<ReviewDTO> getReviews(int postNum) {
		return mapper.getReviews(postNum);
	}

	@Override
	public ArrayList<HashtagDTO> getHashes(int postNum) {
		return mapper.getHashes(postNum);
	}

	@Override
	public int getHearts(int postNum) {
		return mapper.getHearts(postNum);
	}

	@Override
	public int heartCheck(int postNum, int loginUid) {
		return mapper.heartCheck(postNum,loginUid);
	}
	

}
