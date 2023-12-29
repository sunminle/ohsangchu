package com.gi.osc.repository;

import java.util.List;

import com.gi.osc.bean.StoreDTO;

public interface MainMapper {
	List<StoreDTO> searchList(StoreDTO dto);

}
