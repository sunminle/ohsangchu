package com.gi.osc.service;

import java.util.ArrayList;

import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UsersDTO;

public interface PostingService {
	
	public PostingDTO getPost(int postNum);
	public StoreDTO getStore(int storeId);
	public UsersDTO getUser(int userId);
	public ArrayList<ReviewDTO> getReviews(int postNum);
	public ArrayList<HashtagDTO> getHashes(int postNum);
	public int getHearts(int postNum);
	public int heartCheck(int postNum,int loginUid);
	
}
