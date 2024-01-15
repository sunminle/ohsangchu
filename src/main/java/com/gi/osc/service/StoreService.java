package com.gi.osc.service;

import java.util.Map;

public interface StoreService {
	
	public int following(int storeUserId, int userId);
	public int followCheck(int storeUserId, int userId);
	public Map<String,Integer> folcnt(int storeId, int storeUserId);
	
}
