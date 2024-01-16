package com.gi.osc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public UserInfoDTO selectUsersInfo(int userId);
	public StoreDTO selectStoreInfo(int userId);
	public ProductDTO selectProductInfo(int productId);
	public PostingDTO selectPostingInfo(int postingId);
	public List<PostingDTO> postingList(String realId);
	public void addPosting(PostingDTO dto,MultipartFile thumnail,String productPath,String realId);
	public void addproduct(ProductDTO dto);
	public int nickCheck(String nickname);
	public void modifyUsers(UsersDTO dto, MultipartFile file,String filePath,String realId);
	public int storeNameCheck(String storeName);
	public void modifyStore(StoreDTO dto,String realId);
	public List<ReviewDTO> myReview(String realId);
	public void myReviewDelete(int reviewNum);
	public List<ReviewDTO> getReview(String realId);
	public List<QNADTO> myQNA(String realId);
	public List<PaymentDTO> myProductBuyer(@Param("postingId") int postingId, @Param("orderType")String orderType);
	public void addPostingImg(List<String>liveFileName,PostingDTO postingDTO,String copyPath,String productPath,String[] fileName,String realId);
	public List<PostingDTO> myBuyList(String realId);
	public List<PostingDTO> myHeartList(String realId);
	public List<StoreDTO> mySubscribeList(String realId);
	public ProductDTO product(int productId);
	public void addHashtag(HashtagDTO hashtagDTO, HashtagPostingDTO hashtagPostingDTO, String hashtag);
}
