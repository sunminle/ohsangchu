package com.gi.osc.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gi.osc.domain.Users;
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
}
