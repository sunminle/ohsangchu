package com.gi.osc.service;

import org.springframework.web.multipart.MultipartFile;

public interface ReviewService {
	
	public int addReview(int userId,String content,int postingId,float point,MultipartFile img);

	
	
}
