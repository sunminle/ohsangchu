package com.gi.osc.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gi.osc.bean.PaymentDTO;
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
	public void addProduct(ProductDTO dto);
	public List<ProductDTO> productList(int storeId);
	public int nickCheck(String nickname);
	public void modifyUsers(UsersDTO dto);
	public int storeNameCheck(String storeName);
	public void modifyStore(StoreDTO dto);
	public List<ReviewDTO> myReview(int userId);
	public void myReviewDelete(int reviewNum);
	public List<ReviewDTO> getReview(String realId);
	public List<QNADTO> myQNA(int userId);
	public List<PaymentDTO> myProductBuyer(@Param("productId") int productId, @Param("orderType")String orderType);
	public void addProductImg(@Param("storeId")int storeId, @Param("productId")int productId, @Param("imgUrl")String imgUrl);
	public int storeId(String realId);
	public List<ProductDTO> myBuyList(String realId);
	public List<PostingImgDTO> myBuyListImg(String realId);
	public List<ProductDTO> myHeartList(String realId);
	public List<PostingImgDTO> myHeartListImg(String realId);
	public List<StoreDTO> mySubscribeList(String realId);
	public ProductDTO product(int productId);
}
