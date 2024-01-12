package com.gi.osc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gi.osc.bean.PaymentDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.PostingImgDTO;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.QNADTO;
import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UserInfoDTO;
import com.gi.osc.bean.UsersDTO;

public interface MyPageMapper {
	public UsersDTO selectUsers(String realId);
	public UserInfoDTO selectUsersInfo(int userId);
	public StoreDTO selectStoreInfo(int userId);
	public ProductDTO selectProductInfo(int productId);
	public PostingDTO selectPostingInfo(int postingId);
	public List<PostingDTO> postingList(String realId);
	public void addPosting(PostingDTO dto);
	public int nickCheck(String nickname);
	public void modifyUsers(UsersDTO dto);
	public int storeNameCheck(String storeName);
	public void modifyStore(StoreDTO dto);
	public List<ReviewDTO> myReview(int userId);
	public void myReviewDelete(int reviewNum);
	public List<ReviewDTO> getReview(String realId);
	public List<QNADTO> myQNA(int userId);
	public List<PaymentDTO> myProductBuyer(@Param("postingId") int postingId, @Param("orderType")String orderType);
	public void addPostingImg(@Param("storeId")int storeId, @Param("postingId")int postingId, @Param("imgUrl")String imgUrl);
	public int storeId(String realId);
	public List<PostingDTO> myBuyList(String realId);
	public List<PostingDTO> myHeartList(String realId);
	public List<StoreDTO> mySubscribeList(String realId);
	public ProductDTO product(int productId);
}
