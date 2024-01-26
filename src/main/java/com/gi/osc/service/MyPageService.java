package com.gi.osc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gi.osc.bean.AlarmDTO;
import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.HashtagPostingDTO;
import com.gi.osc.bean.PaymentDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.PostingImgDTO;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.QNADTO;
import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UserInfoDTO;
import com.gi.osc.bean.UsersDTO;

public interface MyPageService {
	public UsersDTO selectUsers(String realId);
	public int selectStoreId(String realId);
	public int postingCount(int StoreId);
	public int storeCount(int userId);
	public UserInfoDTO selectUsersInfo(int userId);
	public StoreDTO selectStoreInfo(int userId);
	public ProductDTO selectProductInfo(int productId);
	public PostingDTO selectPostingInfo(int postingId);
	public void postingList(String realId,int pageNum, Model model);
	public void addPosting(PostingDTO dto,MultipartFile thumnail,String productPath,String realId);
	public void addproduct(ProductDTO dto);
	public int nickCheck(String nickname);
	public void modifyUsers(UsersDTO dto, MultipartFile file,String filePath,String realId);
	public int storeNameCheck(String storeName);
	public void modifyStore(StoreDTO dto,String realId);
	public void myReview(String realId,int pageNum, Model model);
	public void myReviewDelete(int reviewNum);
	public void getReview(String realId,int pageNum, Model model);
	public void myQNA(String realId,int pageNum, Model model);
	public List<PaymentDTO> myProductBuyer(@Param("postingId") int postingId, @Param("orderType")String orderType);
	public void addPostingImg(List<String>liveFileName,PostingDTO postingDTO,String copyPath,String productPath,String[] fileName,String realId);
	public void myBuyList(String realId,int pageNum, Model model);
	public void myHeartList(String realId,int pageNum, Model model);
	public void mySubscribeList(String realId,int pageNum, Model model);
	public ProductDTO product(int productId);
	public void addHashtag(HashtagDTO hashtagDTO, HashtagPostingDTO hashtagPostingDTO, String hashtag);
	
}
