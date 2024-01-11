package com.gi.osc.service;

import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UsersDTO;

public interface PostingService {
	
	public PostingDTO getPost(int postNum);
	public StoreDTO getStore(int storeId);
	public UsersDTO getUSer(int userId);
}
