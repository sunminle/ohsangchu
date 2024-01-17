package com.gi.osc.bean;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RecentlyViewedStores {

    private List<StoreDTO> storeList = new ArrayList<>();

    public void addStore(StoreDTO store) {
        // 중복 체크 등 필요한 로직 수행
        storeList.add(store);
    }

    public List<StoreDTO> getRecentlyViewedStores() {
        return storeList;
    }
}
