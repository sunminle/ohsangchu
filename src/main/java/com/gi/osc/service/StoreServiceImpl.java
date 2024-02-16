package com.gi.osc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.repository.StoreMapper;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreMapper mapper;
	@Autowired
	private PostingServiceImpl postService;
	
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

	@Override
	public Map<String, Integer> folcnt(int storeId, int storeUserId) {
		Map<String, Integer> folcnt = new HashMap<String, Integer>();
		int following = mapper.getFollow(storeUserId);
		int follower = mapper.getfollower(storeId);
		
		//가져온 팔로잉 팔로워 풋
		folcnt.put("following", following);
		folcnt.put("follower", follower);
		
		return folcnt;
	}

	@Override
	public ArrayList<ReviewDTO> getReviews(int userId) {
		return mapper.getReviews(userId);
	}

	@Override
	public int like(int postingId, int userId) {
		//찜 중인지 아닌지 체크
		int hc = postService.heartCheck(postingId, userId);
		//if 팔로우중이면 언팔로우, 언팔중이면 팔로우
		if(hc == 1) {	//찜하고 있음
			mapper.unlike(postingId, userId);
			System.out.println("찜 해제!");
			return 0;
		}else {	//찜 안하고 있음
			mapper.like(postingId, userId);
			System.out.println("찜 완료!");
			return 1;
		}
	}

	@Override
	public ArrayList<ReviewDTO> getReviewsByStoreID(int storeId) {
		return mapper.getReviewsByStoreID(storeId);
	}

}
