package com.gi.osc.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gi.osc.bean.NoticeDTO;
import com.gi.osc.service.NoticeService;
import com.gi.osc.service.NoticeServiceImpl;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

	@Inject
	NoticeService service;

	@Autowired
	private NoticeServiceImpl serviceImpl;

	@RequestMapping("noticeboard")
	public String noticeboard() {

		return "notice/noticeboard";
	}
	/*
	 * @RequestMapping("addNotice") public String addNotice() {
	 * 
	 * return "notice/addNotice"; }
	 * 
	 * @RequestMapping("addNoticePro") public String addNoticePro() {
	 * 
	 * return "notice/addNoticePro"; }
	 */

	// 공지글 get
	@RequestMapping(value = "/addNotice", method = RequestMethod.GET)
	public void getAddNotice() throws Exception {
		logger.info("get 공지글");
	}

	// 공지글 post
	@RequestMapping(value = "/addNoticePro", method = RequestMethod.POST)
	public String postAddNoticePro(NoticeDTO dto, Model model) throws Exception {
		logger.info("post 공지글");
		logger.info(dto.toString());

		 try {
		        // 공지글 등록 처리
		        boolean registrationSuccess = service.addNoticePro(dto);

		        if (registrationSuccess) {
		            // 글 등록 성공 시
		            model.addAttribute("message", "Registration successful!");
		            return "redirect:/notice/noticeboard"; // 공지글 메인으로 리다이렉트
		        } else {
		            // 글 등록 실패 시
		            model.addAttribute("error", "Registration failed. Please try again.");
		            return "notice/addNotice"; // 글 작성 페이지로 이동
		        }
		    } catch (Exception e) {
		        // 예외 발생 시
		        logger.error("Error occurred while processing addNoticePro", e);
		        model.addAttribute("error", "An error occurred. Please try again later.");
		        return "notice/addNotice"; // 글 작성 페이지로 이동
		    }
		}
	
	  @PostMapping("/processHtml")
	    public String processHtml(@RequestBody String htmlContent) {
	        // NoticeService를 사용하여 HTML 태그를 제거하고 텍스트만 얻기
	        String textContent = NoticeService.processHtmlContent(htmlContent);

	        return textContent;
	    }
	  
	  //공지글 리스트
	  @GetMapping("/noticeList")
	    public String noticeList(Model model) {
	        List<NoticeDTO> noticeList = service.noticeList();
	        
	        // 각 공지사항의 detailUrl 설정
	        for (NoticeDTO notice : noticeList) {
	            notice.setDetailUrl("/notice/detail/" + notice.getId());
	        }

	        model.addAttribute("noticeList", noticeList);
	        return "notice/noticeList";
	    }
	  
	    // 상세 페이지 매핑
	    @GetMapping("/noticeDetail/{id}") // {id}는 실제 공지사항의 ID 값
	    public String noticeDetail(@PathVariable("id") Long id, Model model) {
	        // 공지사항 상세 정보를 가져와서 model에 추가
	        NoticeDTO notice = service.getNoticeById(id);
	        model.addAttribute("notice", notice);

	        return "notice/noticeDetail"; 
	    }
}
