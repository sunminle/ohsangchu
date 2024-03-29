package com.gi.osc.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gi.osc.bean.DeliveryTypeDTO;
import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UsersDTO;

public interface PostingMapper {
	
	public PostingDTO getPost(int id);
	public ArrayList<DeliveryTypeDTO> getDelivery(int postingId);
	public StoreDTO getStore(int id);
	public UsersDTO getUser(int id);
	public ArrayList<ReviewDTO> getReviews(int postingid);
	public ArrayList<HashtagDTO> getHashes(int postingid);
	public int getHearts(int postingid);
	public int heartCheck(@Param("postingId") int postingId,
						  @Param("userId") int userId);
	public ArrayList<ProductDTO> getProducts(int postingId);
	public int paymentReviewCount(@Param("postingId") int postingId, @Param("reviewUserId") int reviewUserId);
	public int postingReviewCount(@Param("postingId") int postingId, @Param("reviewUserId") int reviewUserId);
	public List<ProductDTO> getProductListByStoreId(int storeId);

}
