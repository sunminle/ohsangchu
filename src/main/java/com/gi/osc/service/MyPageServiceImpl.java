package com.gi.osc.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.QNADTO;
import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UserInfoDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.repository.MyPageMapper;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageMapper mapper;

	@Override
	public UsersDTO selectUsers(String realId) {
		return mapper.selectUsers(realId);
	}
	
	@Override
	public UserInfoDTO selectUsersInfo(int userId) {
		return mapper.selectUsersInfo(userId);
	}
	
	@Override
	public StoreDTO selectStoreInfo(int userId) {
		return mapper.selectStoreInfo(userId);
	}
	
	@Override
	public void addProduct(ProductDTO dto) {
		mapper.addProduct(dto);
	}

	@Override
	public List<ProductDTO> productList(String realId) {
		int userId = mapper.selectUsers(realId).getId();
		int storeId = mapper.selectStoreInfo(userId).getId();
		return mapper.productList(storeId);
	}

	@Override
	public int nickCheck(String nickname) {
		return mapper.nickCheck(nickname);
	}

	@Override
	public void modifyUsers(UsersDTO dto, MultipartFile file, String filePath, String realId) {
		dto.setRealId(realId);
		String img ;
		if(file != null && !file.isEmpty()) {
		String orgName = file.getOriginalFilename(); // 파일이름
		if (orgName != null && orgName.contains(".")) {
		String ext = orgName.substring(orgName.lastIndexOf(".")) ;
		img = realId+ext;
		dto.setProfile(img);
		
		File copy = new File(filePath+realId+ext);
		try {
			file.transferTo(copy);
		}catch (Exception e) {
			e.printStackTrace();
		}
		}
		}
		else {
			img = mapper.selectUsers(realId).getProfile();
			dto.setProfile(img);
		}
		mapper.modifyUsers(dto);
	}

	@Override
	public int storeNameCheck(String storeName) {
		return mapper.storeNameCheck(storeName);
	}

	@Override
	public void modifyStore(StoreDTO dto, String realId) {
		int userId = mapper.selectUsers(realId).getId();
		dto.setUserId(userId);
		mapper.modifyStore(dto);
	}

	@Override
	public List<ReviewDTO> myReview(String realId) {
		int userId = mapper.selectUsers(realId).getId();
		return mapper.myReview(userId);
	}

	@Override
	public void myReviewDelete(int reviewNum) {
		mapper.myReviewDelete(reviewNum);
	}

	@Override
	public List<ReviewDTO> getReview(String realId) {
		return mapper.getReview(realId);
	}

	@Override
	public List<QNADTO> myQNA(String realId) {
		int userId = mapper.selectUsers(realId).getId();
		return mapper.myQNA(userId);
	}

	

	
	

}
