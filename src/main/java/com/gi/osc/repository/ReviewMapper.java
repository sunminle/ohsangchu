package com.gi.osc.repository;

import org.apache.ibatis.annotations.Param;

public interface ReviewMapper {
	
	public int insertReview(@Param("userId") int userId,
							@Param("content") String content,
			   				@Param("postingId") int postingId,
			   				@Param("point") float point,
			   				@Param("img") String img);

}
