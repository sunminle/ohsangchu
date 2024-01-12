package com.gi.osc.service;

public interface StoreService {
	
	public int following(int storeUserId, int userId);
	public int followCheck(int storeUserId, int userId);

}
