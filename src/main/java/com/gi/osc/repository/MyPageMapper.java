package com.gi.osc.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gi.osc.bean.AlarmDTO;
import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.HashtagPostingDTO;
import com.gi.osc.bean.PaymentDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.PostingImgDTO;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.QNADTO;
import com.gi.osc.bean.ReviewAnswerDTO;
import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UserInfoDTO;
import com.gi.osc.bean.UsersDTO;

public interface MyPageMapper {
	public UsersDTO selectUsers(String realId);
	public int selectStoreId(String realId);
	public int postingCount(int StoreId);
	public int storeCount(int userId);
	public UserInfoDTO selectUsersInfo(int userId);
	public StoreDTO selectStoreInfo(int userId);
	public ProductDTO selectProductInfo(int productId);
	public PostingDTO selectPostingInfo(int postingId);
	public List<PostingDTO> postingList(HashMap pageMap);
	public void addPosting(PostingDTO dto);
	public void addproduct(ProductDTO dto);
	public int nickCheck(String nickname);
	public void modifyUsers(UsersDTO dto);
	public int storeNameCheck(String storeName);
	public void addStore(StoreDTO dto);
	public void modifyStore(StoreDTO dto);
	public int myReviewCount(int userId);
	public List<ReviewDTO> myReview(HashMap pageMap);
	public void myReviewDelete(int reviewNum);
	public int getReviewCount(String realId);
	public List<ReviewDTO> getReview(HashMap pageMap);
	public List<QNADTO> myQNA(HashMap pageMap);
	public int myQNACount(int userId);
	public List<PaymentDTO> myProductBuyer(@Param("postingId") int postingId, @Param("orderType")String orderType);
	public void addPostingImg(@Param("storeId")int storeId, @Param("postingId")int postingId, @Param("imgUrl")String imgUrl);
	public int storeId(String realId);
	public int myBuyListCount(String realId);
	public List<PostingDTO> myBuyList(HashMap pageMap);
	public int myHeartListCount(String realId);
	public List<PostingDTO> myHeartList(HashMap pageMap);
	public int mySubscribeListCount(String realId);
	public List<StoreDTO> mySubscribeList(HashMap pageMap);
	public ProductDTO product(int productId);
	public int hashtagChk(String hashtag);
	public void addHashtag(HashtagDTO hashtagDTO);
	public void addHashtagPosting(HashtagPostingDTO hashtagPostingDTO);
	public int selectHashtagId(String hashtag);
	public int addReviewAnswer(ReviewAnswerDTO reviewAnswerDTO);
	public int selectReviewAnswerCount(int reviewId);
	

}
