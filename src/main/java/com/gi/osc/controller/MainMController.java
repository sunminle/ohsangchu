package com.gi.osc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gi.osc.bean.StoreDTO;
import com.gi.osc.service.MainService;
import com.gi.osc.service.MainServiceImpl;

@Controller
@RequestMapping("/main/*")
public class MainMController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("/view")
	public String view() {
		return "main/view";
	}
	
	@GetMapping("/getSearchList")
	@ResponseBody
	private List<StoreDTO> getSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword, Model model) throws Exception{
		StoreDTO dto = new StoreDTO();
		dto.setType(type);
		dto.setKeyword(keyword);

		return service.getSearchList(dto);
	}
    

}
