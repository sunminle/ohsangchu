package com.gi.osc.service;

import java.io.File;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
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
import com.gi.osc.repository.MyPageMapper;


@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageMapper mapper;
	
	@Autowired
	private HashMap pageMap;
	
	@Override
	public UsersDTO selectUsers(String realId) {
		return mapper.selectUsers(realId);
	}
	
	@Override
	public int selectStoreId(String realId) {
		return mapper.selectStoreId(realId);
	}
	
	@Override
	public int postingCount(int StoreId) {
		return mapper.postingCount(StoreId);
	}
	
	@Override
	public int storeCount(int userId) {
		return mapper.storeCount(userId);
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
	public ProductDTO selectProductInfo(int productId) {
		return mapper.selectProductInfo(productId);
	}
	
	@Override
	public PostingDTO selectPostingInfo(int postingId) {
		return mapper.selectPostingInfo(postingId);
	}
	
	@Override
	public void postingList(String realId,int pageNum, Model model) {
		int storeId = mapper.selectStoreId(realId);
		int pageSize = 10;
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		int count = mapper.postingCount(storeId);
		
		List<PostingDTO> list = Collections.EMPTY_LIST;
		if(count > 0) {
			pageMap.put("start",startRow);
			pageMap.put("end",endRow);
			pageMap.put("realId",realId);
			list = mapper.postingList(pageMap);
		}
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("pageSize",pageSize);
		
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (pageNum/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount){
			endPage = pageCount;
		}
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("endPage",endPage);

	}
	
	@Override
	public void addPosting(PostingDTO dto, MultipartFile thumnails, String productPath, String realId) {
		
		String thumnailIMG;
		int storeId = selectStoreId(realId);
		int count = postingCount(storeId)+1;
		
		if(thumnails != null && !thumnails.isEmpty()) {
			String orgName = thumnails.getOriginalFilename(); // 파일이름
			if (orgName != null && orgName.contains(".")) {
			String ext = orgName.substring(orgName.lastIndexOf("."));
			thumnailIMG = storeId+"_"+count+ext;
			dto.setThumnail(thumnailIMG);
			
			File copy = new File(productPath+thumnailIMG);
			try {
				thumnails.transferTo(copy);
			}catch (Exception e) {
				e.printStackTrace();
			}
			}
			}
		mapper.addPosting(dto);
	}
	
	@Override
	public void addproduct(ProductDTO dto) {
		mapper.addproduct(dto);
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
	public void addStore(StoreDTO dto, String realId) {
		int userId = mapper.selectUsers(realId).getId();
		dto.setUserId(userId);
		mapper.addStore(dto);
	}

	@Override
	public void myReview(String realId,int pageNum, Model model) {
		int userId = mapper.selectUsers(realId).getId();
		
		int pageSize = 10;
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		int count = mapper.myReviewCount(userId);
		
		List<ReviewDTO> list = Collections.EMPTY_LIST;
		
		if(count > 0) {
			pageMap.put("start",startRow);
			pageMap.put("end",endRow);
			pageMap.put("userId",userId);
			list = mapper.myReview(pageMap);
		}
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("pageSize",pageSize);
		
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (pageNum/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount){
			endPage = pageCount;
		}
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("endPage",endPage);
		
		
	}

	@Override
	public void myReviewDelete(int reviewNum) {
		mapper.myReviewDelete(reviewNum);
	}

	@Override
	public void getReview(String realId,int pageNum, Model model) {
		int pageSize = 10;
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		int count = mapper.getReviewCount(realId);
		
		List<ReviewDTO> list = Collections.EMPTY_LIST;
		
		if(count > 0) {
			pageMap.put("start",startRow);
			pageMap.put("end",endRow);
			pageMap.put("realId",realId);
			list = mapper.getReview(pageMap);
		}
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("pageSize",pageSize);
		
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (pageNum/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount){
			endPage = pageCount;
		}
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("endPage",endPage);

	}

	@Override
	public void myQNA(String realId,int pageNum, Model model) {
		int userId = mapper.selectUsers(realId).getId();
		
		int pageSize = 10;
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		int count = mapper.myQNACount(userId);
		
		List<QNADTO> list = Collections.EMPTY_LIST;
		
		if(count > 0) {
			pageMap.put("start",startRow);
			pageMap.put("end",endRow);
			pageMap.put("userId",userId);
			list = mapper.myQNA(pageMap);
		}
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("pageSize",pageSize);
		
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (pageNum/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount){
			endPage = pageCount;
		}
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("endPage",endPage);
		
	
	}

	@Override
	public List<PaymentDTO> myProductBuyer(@Param("postingId") int postingId, @Param("orderType")String orderType) {
		return mapper.myProductBuyer(postingId,orderType);
	}
	
	@Override
	public void addPostingImg(List<String>liveFileName,PostingDTO postingDTO,String copyPath,String productPath, String[] fileName,String realId) {
		int storeId = mapper.storeId(realId);
		int postingId = postingDTO.getId();
		if(!liveFileName.isEmpty()) {
		for(String imgUrl : liveFileName) {
		File copyFile = new File(copyPath+imgUrl);
		File productFile = new File(productPath+imgUrl);
		
		try {
			FileUtils.copyFile(copyFile, productFile);
			mapper.addPostingImg(storeId, postingId, imgUrl);
		}catch(Exception e) {e.printStackTrace();}
		}
		}
		if(fileName != null && fileName.length>0) {
		for(String dummy : fileName) {
			File dummyFile = new File(copyPath+dummy);
			
			try {
				dummyFile.delete();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		}
	}

	@Override
	public void myBuyList(String realId,int pageNum, Model model) {
		
		int pageSize = 10;
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		int count = mapper.myBuyListCount(realId);
		
		List<PostingDTO> list = Collections.EMPTY_LIST;
		
		if(count > 0) {
			pageMap.put("start",startRow);
			pageMap.put("end",endRow);
			pageMap.put("realId",realId);
			list = mapper.myBuyList(pageMap);
		}
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("pageSize",pageSize);
		
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (pageNum/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount){
			endPage = pageCount;
		}
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("endPage",endPage);
		
	}


	@Override
	public void myHeartList(String realId,int pageNum, Model model) {
		
		int pageSize = 10;
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		int count = mapper.myHeartListCount(realId);
		
		List<PostingDTO> list = Collections.EMPTY_LIST;
		
		if(count > 0) {
			pageMap.put("start",startRow);
			pageMap.put("end",endRow);
			pageMap.put("realId",realId);
			list = mapper.myHeartList(pageMap);
		}
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("pageSize",pageSize);
		
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (pageNum/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount){
			endPage = pageCount;
		}
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("endPage",endPage);
		

	}


	@Override
	public void mySubscribeList(String realId,int pageNum, Model model) {
		
		int pageSize = 10;
		int startRow = (pageNum - 1) * pageSize + 1;
		int endRow = pageNum * pageSize;
		int count = mapper.mySubscribeListCount(realId);
		
		List<StoreDTO> list = Collections.EMPTY_LIST;
		
		if(count > 0) {
			pageMap.put("start",startRow);
			pageMap.put("end",endRow);
			pageMap.put("realId",realId);
			list = mapper.mySubscribeList(pageMap);
		}
		model.addAttribute("list",list);
		model.addAttribute("count",count);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("pageSize",pageSize);
		
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (pageNum/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount){
			endPage = pageCount;
		}
		model.addAttribute("pageCount",pageCount);
		model.addAttribute("startPage",startPage);
		model.addAttribute("pageBlock",pageBlock);
		model.addAttribute("endPage",endPage);
		
	}

	@Override
	public ProductDTO product(int productId) {
		return mapper.product(productId);
	}

	@Override
	public void addHashtag(HashtagDTO hashtagDTO, HashtagPostingDTO hashtagPostingDTO, String hashtag) {
		int chk = mapper.hashtagChk(hashtag);
		hashtagDTO.setHashtagName(hashtag);
		int hashtagId;
		if(chk == 0) {
		mapper.addHashtag(hashtagDTO);
		hashtagPostingDTO.setHashtagId(hashtagDTO.getId());
		mapper.addHashtagPosting(hashtagPostingDTO);
		}
		else if (chk == 1){
			hashtagId = mapper.selectHashtagId(hashtag);
			hashtagPostingDTO.setHashtagId(hashtagId);
			mapper.addHashtagPosting(hashtagPostingDTO);
		}
		
	}

	

	

	
	

	

	

	

	

	

}
