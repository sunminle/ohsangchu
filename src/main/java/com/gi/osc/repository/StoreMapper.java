package com.gi.osc.repository;

import org.apache.ibatis.annotations.Param;

public interface StoreMapper {
	
	public int followCheck(@Param("storeId") int storeId,
						   @Param("userId") int userId);
	public int follow(@Param("storeId") int storeId,
					  @Param("userId") int userId);
	public int unfollow(@Param("storeId") int storeId,
						@Param("userId") int userId);
	
}
