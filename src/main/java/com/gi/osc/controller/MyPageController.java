package com.gi.osc.controller;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gi.osc.bean.ProductDTO;
import com.gi.osc.service.ProductService;

@Controller
@RequestMapping("/my/*")
public class MyPageController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("addProduct")
	public String addProduct() {
		return "product/addProduct";
	}
	
	@RequestMapping("addProductPro")
	public String addProductPro(ProductDTO dto,Model model,HttpSession session) {
		String realId = (String) session.getAttribute("usersId");
		dto.setRealId(realId);
		service.addProduct(dto);
		return "product/addProductPro";
	}
	
	@RequestMapping(value="uploadSummernoteImageFile", produces = "application/json", consumes = "multipart/form-data")
	public ResponseEntity<JsonNode> uploadSummernoteImageFile(@RequestPart("file") MultipartFile multipartFile,HttpServletRequest request) {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode responseJson;
        String fileRoot = request.getServletContext().getRealPath("/resources/summernoteImage/");

        try {
            String originalFileName = multipartFile.getOriginalFilename();
            String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
            String savedFileName = UUID.randomUUID() + extension;

            Path targetPath = Path.of(fileRoot, savedFileName);
            Files.copy(multipartFile.getInputStream(), targetPath, StandardCopyOption.REPLACE_EXISTING);

            String imageUrl = request.getContextPath() + "/resources/summernoteImage/" + savedFileName;
            responseJson = objectMapper.createObjectNode()
                    .put("url", imageUrl)
                    .put("responseCode", "success");

            return ResponseEntity.ok(responseJson);
        } catch (IOException e) {
            responseJson = objectMapper.createObjectNode().put("responseCode", "error");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(responseJson);
        }
    }
	
	@RequestMapping("productList")
	public String productList(Model model) {
		int storeId = 4;
		List<ProductDTO> list = service.productList(storeId);
		model.addAttribute("list",list);
		return "product/productList";
	}
	
}
