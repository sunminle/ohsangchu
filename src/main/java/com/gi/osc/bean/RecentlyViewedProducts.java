package com.gi.osc.bean;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class RecentlyViewedProducts {

    private List<ProductDTO> productList = new ArrayList<>();

    public void addProduct(ProductDTO product) {
        // 중복 체크 등 필요한 로직 수행
        productList.add(product);
    }

    public List<ProductDTO> getRecentlyViewedProducts() {
        return productList;
    }
}
