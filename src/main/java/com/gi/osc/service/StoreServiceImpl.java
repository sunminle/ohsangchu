package com.gi.osc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gi.osc.repository.StoreMapper;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreMapper mapper;
	
	@Override
	public int following(int storeUserId, int userId) {
		//팔로우 중인지 아닌지 체크
		int fc = followCheck(storeUserId, userId);
		//if 팔로우중이면 언팔로우, 언팔중이면 팔로우
		if(fc == 1) {	//팔로우중
			mapper.unfollow(storeUserId, userId);
			System.out.println("언팔로우완료!");
			return 0;
		}else {	//팔로우안하고 있음
			mapper.follow(storeUserId, userId);
			System.out.println("팔로우완료!");
			return 1;
		}
	}
	
	public int followCheck(int storeUserId, int userId) {
		//팔로우중이면 1, 아니라면 0(null)
		return mapper.followCheck(storeUserId, userId);
	}

}
