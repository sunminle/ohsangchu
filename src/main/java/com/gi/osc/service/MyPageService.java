package com.gi.osc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.QNADTO;
import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UserInfoDTO;
import com.gi.osc.bean.UsersDTO;

public interface MyPageService {
	public UsersDTO selectUsers(String realId);
	public UserInfoDTO selectUsersInfo(int userId);
	public StoreDTO selectStoreInfo(int userId);
	public void addProduct(ProductDTO dto);
	public List<ProductDTO> productList(String realId);
	public int nickCheck(String nickname);
	public void modifyUsers(UsersDTO dto, MultipartFile file,String filePath,String realId);
	public int storeNameCheck(String storeName);
	public void modifyStore(StoreDTO dto,String realId);
	public List<ReviewDTO> myReview(String realId);
	public void myReviewDelete(int reviewNum);
	public List<ReviewDTO> getReview(String realId);
	public List<QNADTO> myQNA(String realId);
}
