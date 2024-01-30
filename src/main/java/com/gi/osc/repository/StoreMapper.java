package com.gi.osc.repository;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gi.osc.bean.ReviewDTO;

public interface StoreMapper {
	
	public int followCheck(@Param("storeId") int storeId,
						   @Param("userId") int userId);
	public int follow(@Param("storeId") int storeId,
					  @Param("userId") int userId);
	public int unfollow(@Param("storeId") int storeId,
						@Param("userId") int userId);
	public int getFollow(int userId);
	public int getfollower(int storeId);
	public ArrayList<ReviewDTO> getReviews(int userId);
	public int like(@Param("postingId") int postingId,
			  		@Param("userId") int userId);
	public int unlike(@Param("postingId") int postingId,
					  @Param("userId") int userId);
	
}
