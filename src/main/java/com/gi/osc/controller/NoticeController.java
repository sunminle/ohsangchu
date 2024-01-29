package com.gi.osc.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
}
