package com.gi.osc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@RequestMapping("noticeboard")
	public String noticeboard() {
		
		return "notice/noticeboard";
	}
	
	@RequestMapping("writeForm")
	public String writeForm() {
		
		return "notice/writeForm";
	}
}
