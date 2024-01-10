package com.gi.osc.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gi.osc.bean.PaymentDTO;
import com.gi.osc.bean.PostingImgDTO;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.QNADTO;
import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UserInfoDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.service.MyPageService;

@Controller
@RequestMapping("/my/*")
public class MyPageController {

	@Autowired
	private MyPageService service;

	@RequestMapping("addProduct")
	public String addProduct() {
		return "product/addProduct";
	}

//	@RequestMapping("addProductPro")
//	public String addProductPro(HttpServletRequest request, ProductDTO dto, Model model, HttpSession session,@RequestParam(value = "fileName", required = false) String[] fileName) {
//		String realId = (String) session.getAttribute("usersId");
//		dto.setRealId(realId);
//		dto.setProductIntro(dto.getProductIntro().replace("src=\"/resources/summernoteImage/", "src=\"/resources/images/product/"));
//		List<String> liveFileName = new ArrayList<String>();
//		String copyPath = request.getServletContext().getRealPath("/resources/summernoteImage/");
//		String productPath = request.getServletContext().getRealPath("/resources/images/product/");
//		//List<String> dieFileName = new ArrayList<String>();
//		if(fileName != null && fileName.length>0) {
//		for(String file : fileName) {
//			if(dto.getProductIntro().contains(file)) {
//				liveFileName.add(file);
//			}
//			/*else {
//				dieFileName.add(file);
//			}*/
//		}
//		}
//		service.addProduct(dto);
//		service.addProductImg(liveFileName, dto, copyPath, productPath,fileName,realId);
//		
//		return "product/addProductPro";
//	}

	@RequestMapping(value = "uploadSummernoteImageFile", produces = "application/json", consumes = "multipart/form-data")
	public ResponseEntity<JsonNode> uploadSummernoteImageFile(@RequestPart("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode responseJson;
		String fileRoot = request.getServletContext().getRealPath("/resources/summernoteImage/");

		try {
			String originalFileName = multipartFile.getOriginalFilename();
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
			String savedFileName = UUID.randomUUID() + extension;
			Path targetPath = Path.of(fileRoot, savedFileName);
			Files.copy(multipartFile.getInputStream(), targetPath, StandardCopyOption.REPLACE_EXISTING);

			String imageUrl = request.getContextPath() + "/resources/summernoteImage/" + savedFileName;
			responseJson = objectMapper.createObjectNode()
					.put("url", imageUrl)
					.put("responseCode", "success")
					.put("fileName", savedFileName);
			return ResponseEntity.ok(responseJson);
		} catch (IOException e) {
			responseJson = objectMapper.createObjectNode().put("responseCode", "error");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(responseJson);
		}
	}

	@RequestMapping("productList")
	public String productList(HttpSession session,Model model) {
		String realId = (String) session.getAttribute("usersId");
		List<ProductDTO> productList = service.productList(realId);
		model.addAttribute("productList", productList);
		return "product/productList";
	}

	@RequestMapping("myPageMain")
	public String myPageMain(HttpSession session, Model model) {
		if (session.getAttribute("usersId") != null) {
			String realId = (String) session.getAttribute("usersId");
			UsersDTO usersDTO = service.selectUsers(realId);
			model.addAttribute("users", usersDTO);
		}
		return "myPage/myPageMain";
	}

	@RequestMapping("modifyMe")
	public String modifyMe(HttpSession session, Model model) {
		String realId = (String) session.getAttribute("usersId");
		UsersDTO usersDTO = service.selectUsers(realId);
		int userId = usersDTO.getId();
		UserInfoDTO userInfoDTO = service.selectUsersInfo(userId);
		model.addAttribute("usersDTO", usersDTO);
		model.addAttribute("userInfoDTO", userInfoDTO);
		return "myPage/modifyMe";
	}

	@RequestMapping("modifyStore")
	public String modifyStore(HttpSession session, Model model) {
		String realId = (String) session.getAttribute("usersId");
		UsersDTO usersDTO = service.selectUsers(realId);
		int userId = usersDTO.getId();
		StoreDTO storeDTO = service.selectStoreInfo(userId);
		model.addAttribute("storeDTO", storeDTO);
		return "myPage/modifyStore";
	}

	@RequestMapping("nickCheck")
	public String nickCheck(String nickname, Model model) {
		int check = service.nickCheck(nickname);
		model.addAttribute("check", check);

		return "myPage/nickCheck";
	}

	@RequestMapping("modifyMePro")
	public String modifyMePro(UsersDTO usersDTO, MultipartFile file, HttpServletRequest request, HttpSession session) {
		String realId = (String) session.getAttribute("usersId");
		String filePath = request.getServletContext().getRealPath("/resources/images/profiles/");
		service.modifyUsers(usersDTO, file, filePath, realId);

		return "myPage/modifyMePro";
	}

	@RequestMapping("storeNameCheck")
	public String storeNameCheck(String storeName, Model model) {
		int check = service.storeNameCheck(storeName);
		model.addAttribute("check", check);

		return "myPage/storeNameCheck";
	}

	@RequestMapping("modifyStorePro")
	public String modifyStorePro(HttpSession session, StoreDTO storeDTO) {
		String realId = (String) session.getAttribute("usersId");
		service.modifyStore(storeDTO, realId);
		return "myPage/modifyStorePro";
	}

	@RequestMapping("reviewAll")
	public String reviewAll() {
		return "myPage/reviewAll";
	}

	@RequestMapping("myReview")
	public String myReview(HttpSession session, Model model) {
		String realId = (String) session.getAttribute("usersId");
		List<ReviewDTO> myReviewList = service.myReview(realId);
		model.addAttribute("myReviewList", myReviewList);
		return "myPage/myReview";
	}

	@RequestMapping("getReview")
	public String getReview(HttpSession session, Model model) {
		String realId = (String) session.getAttribute("usersId");
		List<ReviewDTO> getReviewList = service.getReview(realId);
		model.addAttribute("getReviewList", getReviewList);
		return "myPage/getReview";
	}

	@RequestMapping("myReviewUpdate")
	public String myReviewUpdate(@RequestParam("reviewNum") int reviewNum, Model model) {
		model.addAttribute("reviewNum", reviewNum);
		return "myPage/myReviewUpdate";
	}

	@RequestMapping("myReviewDelete")
	public String myReviewDelete(@RequestParam("reviewNum") int reviewNum) {
		service.myReviewDelete(reviewNum);
		return "myPage/myReviewDelete";
	}

	@RequestMapping("myQNA")
	public String myQNA(HttpSession session, Model model) {
		String realId = (String) session.getAttribute("usersId");
		List<QNADTO> QNAList = service.myQNA(realId);
		model.addAttribute("QNAList", QNAList);
		return "myPage/myQNA";
	}
	
	@RequestMapping("myProduct")
	public String myProduct(HttpSession session, Model model) {
		String realId = (String) session.getAttribute("usersId");
		List<ProductDTO> productList = service.productList(realId);
		model.addAttribute("productList",productList);
		return "myPage/myProduct";
	}
	
	@RequestMapping("myProductBuyer")
	public String myProductBuyer(int productId, Model model,@RequestParam(value = "orderType" , defaultValue = "idDESC")String orderType) {
		List<PaymentDTO> paymentList = service.myProductBuyer(productId,orderType);
		ProductDTO productDTO = service.selectProductInfo(productId);
		model.addAttribute("paymentList",paymentList);
		model.addAttribute("product",productDTO);
		model.addAttribute("orderType",orderType);
		return "myPage/myProductBuyer";
	}
	
	@RequestMapping("myBuyList")
	public String myBuyList(HttpSession session, Model model) {
		String realId = (String) session.getAttribute("usersId");
		List<ProductDTO> productList = service.myBuyList(realId);
		List<PostingImgDTO> imgList = service.myBuyListImg(realId);
		
		model.addAttribute("productList",productList);
		model.addAttribute("imgList",imgList);
		
		return "myPage/myBuyList";
	}
	
	@RequestMapping("HSList")
	public String HSList() {
		return "myPage/HSList";
	}
	
	@RequestMapping("heartList")
	public String heartList(Model model, HttpSession session) {
		String realId = (String) session.getAttribute("usersId");
		List<ProductDTO> productList = service.myHeartList(realId);
		List<PostingImgDTO> imgList = service.myHeartListImg(realId);
		model.addAttribute("productList",productList);
		model.addAttribute("imgList",imgList);
		return "myPage/heartList";
	}
	
	@RequestMapping("subscribeList")
	public String subscribeList(Model model, HttpSession session) {
		String realId = (String) session.getAttribute("usersId");
		List<StoreDTO> storeList = service.mySubscribeList(realId);
		model.addAttribute("storeList",storeList);
		return "myPage/subscribeList";
	}
	
	@RequestMapping("product")
	public String product(int productId,Model model) {
		
		ProductDTO product = service.product(productId);
		model.addAttribute("product", product);
		return "myPage/product";
	}
	
}
