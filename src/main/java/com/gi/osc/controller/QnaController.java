package com.gi.osc.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gi.osc.bean.MyOrderProductDTO;
import com.gi.osc.bean.QNADTO;
import com.gi.osc.bean.QNAReplyDTO;
import com.gi.osc.service.MyPageService;
import com.gi.osc.service.QnaService;
import com.gi.osc.service.QnaServiceImpl;

@Controller
@RequestMapping("/qna")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	@Inject
	QnaService service;

	@Autowired
	private QnaServiceImpl serviceImpl;

	@Autowired
	private MyPageService myPageService;
	

	// Qna글 get
	@RequestMapping(value = "/addQna", method = RequestMethod.GET)
	public void getAddQna() throws Exception {
		logger.info("get Qna글");
	}

	// 공지글 post
	@RequestMapping(value = "/addQnaPro", method = RequestMethod.POST)
	public String postAddQnaPro(QNADTO dto, HttpSession session, Model model) throws Exception {
		logger.info("post Qna글");
		logger.info(dto.toString());
		String realId = (String) session.getAttribute("usersId");
		int userId = myPageService.selectUsers(realId).getId();
		dto.setUserId(userId);
		 try {
		        // 공지글 등록 처리
		        boolean registrationSuccess = service.addQnaPro(dto);

		        if (registrationSuccess) {
		            // 글 등록 성공 시
		            model.addAttribute("message", "Registration successful!");
		            return "redirect:/qna/qnaList"; // 공지글 메인으로 리다이렉트
		        } else {
		            // 글 등록 실패 시
		            model.addAttribute("error", "Registration failed. Please try again.");
		            return "qna/addQna"; // 글 작성 페이지로 이동
		        }
		    } catch (Exception e) {
		        // 예외 발생 시
		        logger.error("Error occurred while processing addQnaPro", e);
		        model.addAttribute("error", "An error occurred. Please try again later.");
		        return "qna/addQna"; // 글 작성 페이지로 이동
		    }
		}
	
	  @PostMapping("/processHtml")
	    public String processHtml(@RequestBody String htmlContent) {
	        // QnaService를 사용하여 HTML 태그를 제거하고 텍스트만 얻기
	        String textContent = QnaService.processHtmlContent(htmlContent);

	        return textContent;
	    }
	  
	  //qna 리스트
	  @GetMapping("/qnaList")
	    public String qnaList(Model model,HttpSession session) {
		  	int userAuth = 0;
		  	if(session.getAttribute("usersId") != null) {
		  	String realId = (String) session.getAttribute("usersId");
		  	userAuth = Integer.parseInt( myPageService.selectUsers(realId).getAuth());
		  	}
	        List<QNADTO> qnaList = service.qnaList();
	        
	        // 각 공지사항의 detailUrl 설정
	        for (QNADTO qna : qnaList) {
	            qna.setDetailUrl("/qna/detail/" + qna.getId());
	        }

	        model.addAttribute("qnaList", qnaList);
	        model.addAttribute("userAuth",userAuth);
	        return "qna/qnaList";
	    }
	  
	  //qna 리스트 _Admin용
	  @GetMapping("/qnaListAdmin")
	    public String qnaListAdmin(Model model) {
	        List<QNADTO> qnaList = service.qnaList();
	        
	        // 각 공지사항의 detailUrl 설정
	       // for (QNADTO qna : qnaListAdmin) {
	      //      qna.setDetailUrl("/qna/detail/" + qna.getId());
	      //  }

	        model.addAttribute("qnaList", qnaList);
	        return "qna/qnaListAdmin";
	    }
	  
	    // 상세 페이지 매핑
	    @GetMapping("/qnaDetail/{id}") // {id}는 실제 공지사항의 ID 값
	    public String qnaDetail(@PathVariable("id") long id, Model model) {
	        // 공지사항 상세 정보를 가져와서 model에 추가
	        QNADTO qna = service.getQnaById(id);
	        model.addAttribute("qna", qna);

	        return "qna/qnaDetail"; 
	    }
	    
	    //공지 페이지 admin, 일반 분리
	    @GetMapping("/checkRealId")
	    public String checkRealId(@RequestParam("realId") String realId, Model model) {
	        // Service 메서드 호출
	        boolean checkRealId = service.checkRealId(realId);

	        if (checkRealId) {
	            // 사용자 realId가 'admin'일 경우 qnaListAdmin.jsp로 이동
	            return "qna/qnaListAdmin";
	        } else {
	            // 다른 경우에는 qnaList.jsp로 이동 
	            return "qna/qnaList";
	        }
	    }
	    
	    @RequestMapping("addQnaAnswer")
	    public String addQnaAnswer(int qnaId, Model model) {
	    	int qnaReplyCheck = service.qnaReplyCount(qnaId);
	    	model.addAttribute("qnaId",qnaId);
	    	model.addAttribute("qnaReplyCheck",qnaReplyCheck);
	    	return "qna/addQnaAnswer";
	    }
	    
	    @RequestMapping("addQnaAnswerPro")
	    public String addQnaAnswerPro(QNAReplyDTO qnaReplyDTO, HttpSession session) {
	    	if(session.getAttribute("usersId") != null) {
			  	String realId = (String) session.getAttribute("usersId");
			  	qnaReplyDTO.setUserId(myPageService.selectUsers(realId).getId());
			  	service.addQnaReply(qnaReplyDTO);
			  	}
	    	return "qna/addQnaAnswerPro";
	    }
	    
	    @PostMapping("qnaAnswerList")
		public @ResponseBody ResponseEntity<QNAReplyDTO> myOrderProductList(HttpSession session,
										@RequestParam("qnaId") String qnaId) {
	    	QNAReplyDTO qnaReplyDTO = new QNAReplyDTO();
	    	int qnaReplyCount = service.qnaReplyCount(Integer.parseInt(qnaId));
	    	qnaReplyDTO.setQnaReplyCount(qnaReplyCount);
	    	if(qnaReplyCount > 0) {
	    	qnaReplyDTO = service.qnaReplyList(Integer.parseInt(qnaId));
	    	qnaReplyDTO.setQnaReplyCount(qnaReplyCount);
	    	qnaReplyDTO.setRealId(myPageService.selectRealId(qnaReplyDTO.getUserId()));
	    	}
	        return new ResponseEntity<>(qnaReplyDTO, HttpStatus.OK);
		}
	    
	    
	    @GetMapping("/qnaAnswerDetail/{id}") // {id}는 실제 공지사항의 ID 값
	    public String qnaAnswerDetail(@PathVariable("id") long id, Model model) {
	        // 공지사항 상세 정보를 가져와서 model에 추가
	        QNAReplyDTO qna = service.getQnaReplyById(id);
	        model.addAttribute("qna", qna);

	        return "qna/qnaAnswerDetail"; 
	    }

}

