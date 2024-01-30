package com.gi.osc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gi.osc.common.FileManagerService;
import com.gi.osc.repository.ReviewMapper;

@Service
public class ReviewImpl implements ReviewService{
	
	@Autowired
	private ReviewMapper mapper;
	@Autowired
	private FileManagerService fileManagerService; 
	
	//리뷰 업로드 insert
	@Override
	public int addReview(int userId, String content, int postingId, float point, MultipartFile img) {
		
		//file > imgPath
		String imgPath = null;
		if(img != null) {	// 파일이 있으면,
			imgPath = fileManagerService.saveFile(img, "review/");
		}
		
		return mapper.insertReview(userId,content,postingId,point,imgPath);
	}

}
