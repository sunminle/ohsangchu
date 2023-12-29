package com.gi.osc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gi.osc.bean.StoreDTO;
import com.gi.osc.repository.MainMapper;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainMapper mapper;

	@Override
	public List<StoreDTO> getSearchList(StoreDTO dto) {
		// TODO Auto-generated method stub
	
		return mapper.searchList(dto);
	}

	
	

}
