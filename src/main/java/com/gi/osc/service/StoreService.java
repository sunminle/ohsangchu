package com.gi.osc.service;

import java.util.ArrayList;
import java.util.Map;

import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ReviewDTO;

public interface StoreService {
	
	public int following(int storeUserId, int userId);
	public int followCheck(int storeUserId, int userId);
	public Map<String,Integer> folcnt(int storeId, int storeUserId);
	public ArrayList<ReviewDTO> getReviews(int userId);
	public int like(int postingId, int userId);
	public ArrayList<ReviewDTO> getReviewsByStoreID(int storeId);
	public ArrayList<PostingDTO> getPosts(int storeId);
	
}
