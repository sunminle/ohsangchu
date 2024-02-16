package com.gi.osc.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ProductDTO;
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
	public ArrayList<ProductDTO> getProducts(int postNum);
	public int paymentReviewCount(@Param("postingId") int postingId, @Param("reviewUserId") int reviewUserId);
	public int postingReviewCount(@Param("postingId") int postingId, @Param("reviewUserId") int reviewUserId);
	List<ProductDTO> productList(int storeId);
	
}
