package com.gi.osc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gi.osc.bean.DeliveryTypeDTO;
import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ProductDTO;
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
		
		PostingDTO post = mapper.getPost(postNum);
		
		ArrayList<DeliveryTypeDTO> dList = mapper.getDelivery(postNum);
		post.setDeliveryType(dList);
		
		return post;
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

	@Override
	public ArrayList<ProductDTO> getProducts(int postNum) {
		return mapper.getProducts(postNum);
	}

	@Override
	public int paymentReviewCount(int postingId, int reviewUserId) {
		return mapper.paymentReviewCount(postingId, reviewUserId);
	}

	@Override
	public int postingReviewCount(int postingId, int reviewUserId) {
		return mapper.postingReviewCount(postingId, reviewUserId);
	}
	
	  @Override
	    public List<ProductDTO> productList(int storeId) {
	        // 상점 ID를 기준으로 상품 리스트를 데이터베이스에서 가져옴
	        return mapper.getProductListByStoreId(storeId);
	    }

}
