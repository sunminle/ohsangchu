package com.gi.osc.repository;

import java.util.ArrayList;

import com.gi.osc.bean.PostingDTO;
import com.gi.osc.bean.ReviewDTO;
import com.gi.osc.bean.StoreDTO;
import com.gi.osc.bean.UsersDTO;

public interface PostingMapper {
	
	public PostingDTO getPost(int id);
	public StoreDTO getStore(int id);
	public UsersDTO getUser(int id);
	public ArrayList<ReviewDTO> getReviews(int postingid);

}
