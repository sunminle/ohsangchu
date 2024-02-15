package com.gi.osc.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.mapping.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gi.osc.bean.CategoryDTO;
import com.gi.osc.bean.DeliveryTypeDTO;
import com.gi.osc.bean.DeliveryTypePostingDTO;
import com.gi.osc.bean.HashtagDTO;
import com.gi.osc.bean.HashtagPostingDTO;
import com.gi.osc.bean.MyOrderProductDTO;
import com.gi.osc.bean.OrderDTO;
import com.gi.osc.bean.PaymentDTO;
import com.gi.osc.bean.PaymentEtcDTO;
import com.gi.osc.bean.PaymentProductDTO;
import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.ProductData;
import com.gi.osc.bean.QNADTO;
import com.gi.osc.bean.ReviewAnswerDTO;
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
	
	@Autowired
	private HashtagPostingDTO hashtagPostingDTO; 
	
	@Autowired
	private HashtagDTO hashtagDTO;
	
	@Autowired
	private ReviewAnswerDTO reviewAnswerDTO;
	
	@Autowired
	private DeliveryTypePostingDTO deliveryTypePostingDTO;
	
	@Autowired
	private DeliveryTypeDTO deliveryTypeDTO;
	
	@Autowired
	private ProductDTO productDTO;
	
	
	@RequestMapping("addProduct")
	public String addProduct(Model model, HttpSession session) {
		if (session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		int storeCount = service.storeCount(service.selectUsers(realId).getId());
		List<CategoryDTO> catDTO = service.selectCategoryAll();
		model.addAttribute("storeCount",storeCount);
		model.addAttribute("catDTO",catDTO);
		}
		return "product/addProduct";
	}

	@RequestMapping("addProductPro")
	public String addProductPro(HttpServletRequest request,@RequestParam("quantity") int [] quantity, 
			@RequestParam("price")int[] price, @RequestParam("product")String [] product,ProductDTO productDTO, PostingDTO postingDTO, Model model, 
			HttpSession session,@RequestParam(value = "fileName", required = false) String[] fileName, @RequestParam(value = "thumnails", required = false) MultipartFile thumnails
			, @RequestParam(value = "hashtag", required = false) String[] hashtag 
			,@RequestParam(value = "deliveryTypeName" ,required = false) String[] deliveryTypeName
			,@RequestParam(value = "deliveryTypePrice" ,required = false) String[] deliveryTypePrice
			,@RequestParam("paymentType") String paymentType
			) {
		if (session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		postingDTO.setRealId(realId);
		postingDTO.setPaymentType(paymentType);
		postingDTO.setContent(postingDTO.getContent().replace("src=\"/resources/summernoteImage/", "src=\"/resources/images/posting/"));
		List<String> liveFileName = new ArrayList<String>();
		String copyPath = request.getServletContext().getRealPath("/resources/summernoteImage/");
		String productPath = request.getServletContext().getRealPath("/resources/images/posting/");
		//List<String> dieFileName = new ArrayList<String>();
		if(fileName != null && fileName.length>0) {
			for(String file : fileName) {
				if(postingDTO.getContent().contains(file)) {
					liveFileName.add(file);
				}
//			else {
//				dieFileName.add(file);
//			}
			}
		}
		
		service.addPosting(postingDTO, thumnails, productPath, realId);
		service.addPostingImg(liveFileName, postingDTO, copyPath, productPath,fileName,realId);
		
		productDTO.setPostingId(postingDTO.getId());
		productDTO.setRealId(realId);
		
		for(int i = 0; i < product.length; i++) {
			productDTO.setProductName(product[i]);
			productDTO.setPrice(price[i]);
			productDTO.setQuantity(quantity[i]);
			service.addproduct(productDTO);
		}
		
		hashtagPostingDTO.setPostingId(postingDTO.getId());
		
		if(hashtag != null && hashtag.length>0) {
		for(int i = 0; i < hashtag.length; i++) {
			service.addHashtag(hashtagDTO, hashtagPostingDTO, hashtag[i]);
		}
		}
		
		 deliveryTypePostingDTO.setPostingId(postingDTO.getId());
		 
		 
		 
		 if(deliveryTypeName != null && deliveryTypeName.length>0) {
			 for(int i = 0; i < deliveryTypeName.length; i++) {
				 service.addDeliveryType(deliveryTypeDTO, deliveryTypePostingDTO, deliveryTypeName[i],deliveryTypePrice[i]);
			 }
			 
		 }
		
		
		}
		
		return "product/addProductPro";
	}

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

	@RequestMapping("myPageMain")
	public String myPageMain(HttpSession session, Model model) {
		if (session.getAttribute("usersId") != null) {
			String realId = (String) session.getAttribute("usersId");
			UsersDTO usersDTO = service.selectUsers(realId);
			
			List<PostingDTO> recentPaymentList = service.selectRecentPayment(usersDTO.getId());
			
			int myReviewCount = service.myReviewCount(usersDTO.getId());
			int getReviewCount = service.getReviewCount(realId);
			model.addAttribute("users", usersDTO);
			model.addAttribute("recentPaymentList",recentPaymentList);
			model.addAttribute("myReviewCount",myReviewCount);
			model.addAttribute("getReviewCount",getReviewCount);
		}
		return "myPage/myPageMain";
	}

	@RequestMapping("modifyMe")
	public String modifyMe(HttpSession session, Model model) {
		if(session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		UsersDTO usersDTO = service.selectUsers(realId);
		int userId = usersDTO.getId();
		UserInfoDTO userInfoDTO = service.selectUsersInfo(userId);
		model.addAttribute("usersDTO", usersDTO);
		model.addAttribute("userInfoDTO", userInfoDTO);
		}
		return "myPage/modifyMe";
	}

	@RequestMapping("modifyStore")
	public String modifyStore(HttpSession session, Model model) {
		if(session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		UsersDTO usersDTO = service.selectUsers(realId);
		int userId = usersDTO.getId();
		int storeCount = service.storeCount(userId);
		StoreDTO storeDTO = service.selectStoreInfo(userId);
		model.addAttribute("storeDTO", storeDTO);
		model.addAttribute("storeCount",storeCount);
		model.addAttribute("usersDTO",usersDTO);
		}
		return "myPage/modifyStore";
	}
	
	@RequestMapping("addStore")
	public String addStore() {
		return "myPage/addStore";
	}
	
	@RequestMapping("addStorePro")
	public String addStorePro(HttpSession session,StoreDTO storeDTO) {
		String realId = (String) session.getAttribute("usersId");
		service.addStore(storeDTO, realId);
		return "myPage/addStorePro";
	}
	

	@RequestMapping("nickCheck")
	public @ResponseBody ResponseEntity<String> nickCheck(String nickname, HttpSession session) {
		String realId = (String) session.getAttribute("usersId");
		String realNickname = service.selectUsers(realId).getNickname();
		int count = service.nickCheck(nickname);
		String check = "0";
		if(nickname.equals(realNickname)) {
			check = "1";
		}
		if(count == 0) {
			check = "1";
		}

		return new ResponseEntity<>(check, HttpStatus.OK);
	}

	@RequestMapping("modifyMePro")
	public String modifyMePro(UsersDTO usersDTO, MultipartFile file, HttpServletRequest request, HttpSession session) {
		String realId = (String) session.getAttribute("usersId");
		String filePath = request.getServletContext().getRealPath("/resources/images/profiles/");
		service.modifyUsers(usersDTO, file, filePath, realId);

		return "myPage/modifyMePro";
	}

	@RequestMapping("storeNameCheck")
	public @ResponseBody ResponseEntity<String> storeNameCheck(String storeName,HttpSession session) {
		String realId = (String) session.getAttribute("usersId");
		int userId = service.selectUsers(realId).getId();
		int count = service.storeNameCheck(storeName);
		String check = "0";
		String realStoreName = service.selectStoreInfo(userId).getStoreName();
		if(storeName.equals(realStoreName)) {
			check = "1";
		}
		if(count == 0) {
			check = "1";
		}
		return new ResponseEntity<>(check, HttpStatus.OK);
	}

	@RequestMapping("modifyStorePro")
	public String modifyStorePro(HttpSession session, StoreDTO storeDTO) {
		String realId = (String) session.getAttribute("usersId");
		service.modifyStore(storeDTO, realId);
		return "myPage/modifyStorePro";
	}

	@RequestMapping("reviewAll")
	public String reviewAll(HttpSession session, Model model) {
		if (session.getAttribute("usersId") != null) {
			String realId = (String) session.getAttribute("usersId");
			UsersDTO usersDTO = service.selectUsers(realId);
			model.addAttribute("users", usersDTO);
		}
		return "myPage/reviewAll";
	}

	@RequestMapping("myReview")
	public String myReview(HttpSession session, Model model,@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		if(session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		service.myReview(realId, pageNum, model);
		}
		return "myPage/myReview";
	}

	@RequestMapping("getReview")
	public String getReview(HttpSession session, Model model,@RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		if(session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		service.getReview(realId, pageNum, model);
		}
		return "myPage/getReview";
	}

	@RequestMapping("myReviewDelete")
	public String myReviewUpdate(@RequestParam("reviewNum") int reviewNum, Model model) {
		service.myReviewDelete(reviewNum);
		return "myPage/myReviewDelete";
	}


	@RequestMapping("myQNA")
	public String myQNA(HttpSession session, Model model, @RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		if(session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		UsersDTO usersDTO = service.selectUsers(realId);
		model.addAttribute("users", usersDTO);
		service.myQNA(realId, pageNum, model);
		}
		return "myPage/myQNA";
	}
	
	@RequestMapping("myProduct")
	public String myProduct(HttpSession session, Model model, @RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		if(session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		UsersDTO usersDTO = service.selectUsers(realId);
		model.addAttribute("users", usersDTO);
		int storeCount = service.storeCount(service.selectUsers(realId).getId());
		if(storeCount > 0) {
		service.postingList(realId, pageNum, model);
		}
		model.addAttribute("storeCount",storeCount);
		}
		return "myPage/myProduct";
	}
	
	@RequestMapping("myProductBuyer")
	public String myProductBuyer(int postingId, Model model,@RequestParam(value = "orderType" , defaultValue = "idDESC")String orderType) {
		List<PaymentDTO> paymentList = service.myProductBuyer(postingId,orderType);
		PostingDTO postingDTO = service.selectPostingInfo(postingId);
		model.addAttribute("paymentList",paymentList);
		model.addAttribute("posting",postingDTO);
		model.addAttribute("orderType",orderType);
		return "myPage/myProductBuyer";
	}
	
	@RequestMapping("myBuyList")
	public String myBuyList(HttpSession session, Model model, @RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		if(session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		service.myBuyList(realId, pageNum, model);
		UsersDTO usersDTO = service.selectUsers(realId);
		model.addAttribute("users", usersDTO);
		}
		return "myPage/myBuyList";
	}
	
	@RequestMapping("HSList")
	public String HSList(HttpSession session, Model model) {
		if (session.getAttribute("usersId") != null) {
			String realId = (String) session.getAttribute("usersId");
			UsersDTO usersDTO = service.selectUsers(realId);
			model.addAttribute("users", usersDTO);
		}
		return "myPage/HSList";
	}
	
	@RequestMapping("heartList")
	public String heartList(Model model, HttpSession session, @RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		if(session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		service.myHeartList(realId, pageNum, model);
		}
		return "myPage/heartList";
	}
	
	@RequestMapping("subscribeList")
	public String subscribeList(Model model, HttpSession session, @RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		if(session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		service.mySubscribeList(realId, pageNum, model);
		}
		return "myPage/subscribeList";
	}
	
	@RequestMapping("product")
	public String product(int productId,Model model) {
		ProductDTO product = service.product(productId);
		model.addAttribute("product", product);
		return "myPage/product";
	}
	
	@RequestMapping("addHashtag")
	public ResponseEntity<JsonNode> addHashtag(@RequestParam("tag") String tag) {
		ObjectMapper objectMapper = new ObjectMapper();
		
		if (!tag.matches("^[a-zA-Z0-9ㄱ-힣]+$")) {
	        // 특수 문자가 포함된 경우
			JsonNode responseJson = objectMapper.createObjectNode()
	                .put("error", "특수문자는 포함할 수 없습니다.")
	                .put("responseCode", "error");
			return ResponseEntity.ok(responseJson);
	    }
		
		JsonNode responseJson = objectMapper.createObjectNode()
                .put("tag", tag)
                .put("responseCode", "success");
        return ResponseEntity.ok(responseJson);
	}
	
	@RequestMapping("addDeliveryType")
	public ResponseEntity<JsonNode> addDeliveryType(@RequestParam("type") String type) {
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode responseJson = objectMapper.createObjectNode()
                .put("type", type)
                .put("responseCode", "success");
        return ResponseEntity.ok(responseJson);
	}
	
	@PostMapping("addReviewAnswer")
	public @ResponseBody Map<String, Object> addReviewAnswer(HttpSession session,
									@RequestParam("content") String content, @RequestParam("reviewId") int reviewId) {

		Map<String, Object> result = new HashMap<>();
		
		//세션에서 유저 아이디 받아오기
		String realId = (String)session.getAttribute("usersId");
		int count = service.selectReviewAnswerCount(reviewId);
		//realId주면 userId 가져오기
		int userId = service.selectUsers(realId).getId();
		reviewAnswerDTO.setContent(content);
		reviewAnswerDTO.setReviewId(reviewId);
		reviewAnswerDTO.setUserId(userId);
		//DB INSERT: 해당 유저 넘버로 저장
		int row = 0;
		if(count == 0) {
		row = service.addReviewAnswer(reviewAnswerDTO);
		}
		else if(count >0) {
			row = 2;
		}
		System.out.println("row==========="+row);
		if(row == 1) {
			result.put("code", 1);
			result.put("result", "성공");
		}else if(row == 2) {
			result.put("code", 2);
			result.put("result", "이미 답변을 등록하셨습니다.");
		}else{
			result.put("code", 500);
			result.put("errorMessage", "리뷰가 업로드 되지 않았습니다.");
		}

		return result;
	}
	
	@RequestMapping("getReviewAnswerCount")
	public @ResponseBody ResponseEntity<String> getReviewAnswerCount(@RequestParam("reviewId")int reviewId) {
		String count = String.valueOf(service.selectReviewAnswerCount(reviewId));
		
		return new ResponseEntity<>(count, HttpStatus.OK);
	}
	
	@RequestMapping("test")
	public String test() {
		return "myPage/test";
	}
	
	@RequestMapping("orderDetail")
	public String orderDetail(@ModelAttribute OrderDTO order, Model model) {
		List<ProductData> productData = order.getProducts(); 
		int deliveryTypeId = Integer.parseInt(order.getDeliveryTypeId());
		int postingId = Integer.parseInt(order.getPostingId());
		int categoryId = service.selectCategoryIdPosting(postingId);
		String paymentType = service.selectPaymentTypePosting(postingId);
		DeliveryTypeDTO deliveryTypeDTO = service.selectDeliveryTypeInfo(deliveryTypeId);
		List<ProductDTO> productDetail = new ArrayList<ProductDTO>();
		for(int i = 0; i <productData.size(); i++) {
		productDTO = service.selectProductInfo(Integer.parseInt(productData.get(i).getProductId()));
		productDTO.setQuantity(Integer.parseInt(productData.get(i).getQuantity()));
		productDetail.add(productDTO);
		System.out.println("productDetailAfter================"+productDetail);
		}
		model.addAttribute("productDetail",productDetail);
		model.addAttribute("deliveryTypeId",deliveryTypeId);
		model.addAttribute("postingId",postingId);
		model.addAttribute("categoryId",categoryId);
		model.addAttribute("paymentType",paymentType);
		model.addAttribute("deliveryTypeDTO",deliveryTypeDTO);
		model.addAttribute("productData",productData);
		return "myPage/orderDetail";
	}
	
	@RequestMapping("orderSuccessPro")
	public String orderSuccessPro(HttpSession session, String address1, String address2, PaymentDTO paymentDTO, PaymentEtcDTO paymentEtcDTO, PaymentProductDTO paymentProductDTO, Model model, String[] productId, String []amount) {
		if(session.getAttribute("usersId") != null) {
		String realId = (String) session.getAttribute("usersId");
		int userId = service.selectUsers(realId).getId();
		paymentDTO.setAddress(address1+" "+address2);
		paymentDTO.setUserId(userId);
		service.addPayment(paymentDTO);
		paymentEtcDTO.setPaymentId(paymentDTO.getId());
		paymentProductDTO.setPaymentId(paymentDTO.getId());
		service.addPaymentEtc(paymentEtcDTO);
		for(int i = 0; i <productId.length; i++) {
			if(Integer.parseInt(amount[i])!=0) {
				paymentProductDTO.setProductId(Integer.parseInt(productId[i]));
				paymentProductDTO.setAmount(Integer.parseInt(amount[i]));
				service.addPaymentProduct(paymentProductDTO);
				service.updateProductQuantity(paymentProductDTO);
			}
		}
		
		}
		return "redirect:/my/orderSuccess";
	}
	
	@RequestMapping("orderSuccess")
	public String orderSuccess() {
		return "myPage/orderSuccess";
	}
	
	
	@RequestMapping("myOrderList")
	public String myOrderList(HttpSession session, Model model, @RequestParam(value="pageNum", defaultValue = "1") int pageNum) {
		if (session.getAttribute("usersId") != null) {
			String realId = (String) session.getAttribute("usersId");
			UsersDTO usersDTO = service.selectUsers(realId);
			service.myOrderList(realId, pageNum, model);
			model.addAttribute("users", usersDTO);
		}
		return "myPage/myOrderList";
	}
	
	@PostMapping("myOrderProductList")
	public @ResponseBody ResponseEntity<List<MyOrderProductDTO>> myOrderProductList(HttpSession session,
									@RequestParam("paymentId") String paymentId) {
		List<MyOrderProductDTO> orderProductList = service.selectMyOrderProduct(Integer.parseInt(paymentId));
		
        return new ResponseEntity<>(orderProductList, HttpStatus.OK);
	}
	
	@PostMapping
	public @ResponseBody void updateMyProductBuyer(int paymentId, int selectedStatus){
		service.updateMyProductBuyer(paymentId, selectedStatus);
	}
	
	@PostMapping("myProductBuyerEtc")
	public @ResponseBody ResponseEntity<List<PaymentEtcDTO>> myProductBuyerEtc(HttpSession session,
									@RequestParam("paymentId") String paymentId) {
		List<PaymentEtcDTO> paymentEtcList = service.selectPaymentEtc(Integer.parseInt(paymentId));
		
        return new ResponseEntity<>(paymentEtcList, HttpStatus.OK);
	}
	
}
