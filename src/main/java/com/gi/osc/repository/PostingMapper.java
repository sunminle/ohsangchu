package com.gi.osc.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UsersDTO;

public interface PostingMapper {
	
	public PostingDTO getPost(int id);
	public StoreDTO getStore(int id);
	public UsersDTO getUser(int id);
	public ArrayList<ReviewDTO> getReviews(int postingid);
	public ArrayList<HashtagDTO> getHashes(int postingid);
	public int getHearts(int postingid);
	public int heartCheck(@Param("postingId") int postingId,
						  @Param("userId") int userId);
	public ArrayList<ProductDTO> getProducts(int postingId);

}
