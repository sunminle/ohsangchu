package com.gi.osc.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gi.osc.bean.ProductDTO;
import com.gi.osc.bean.UsersDTO;
import com.gi.osc.domain.Users;
import com.gi.osc.service.ProductService;
import com.gi.osc.service.UsersService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    
    @Autowired
    private UsersService userService;
    
    //---------admin---------
    @RequestMapping("/adminMain")
    public String adminMain(Model model) {
    	List<Users> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/adminMain";
    }
    
 // 사용자 권한 변경 
    @PostMapping("/auth")
    @ResponseBody
    public ResponseEntity<?> changeUserAuth(String userId, @RequestParam String auth) {
    	System.out.println(""+userId+"----"+auth);
        try {
            UsersDTO user = userService.getUserByRealId(userId);
            if (user != null) {
                user.changeUserAuth(auth);
                userService.updateUserAuth(user);
                return ResponseEntity.ok().body("{\"msg\": \"success.\"}");
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("{\"msg\": \"aaaaa.\"}");
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("{\"msg\": \"사용자 권한 변경에 실패했습니다: " + e.getMessage() + "\"}");
        }
    }
    
 // 상품 상태 변경 
    
    @Autowired
    private ProductService productService;
    
    @GetMapping("/goodsAdmin")
    public String getProductList(Model model) {
        List<ProductDTO> productList = productService.productList2(0);
        model.addAttribute("products", productList);
        return "admin/goodsAdmin"; 
    }
}
