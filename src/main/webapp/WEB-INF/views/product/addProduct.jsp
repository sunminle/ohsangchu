<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">


<script>
$(document).ready(function() {
    $('#summernote').summernote({
        height: 700,
        lang: "ko-KR"
    });
});
</script>
</head>
	<center>
	<h2>상품 등록</h2>
	<form action="/product/addProductPro" method = "post">
    상품 이름 : <input type = "text" name = "productName"> <br/>
    상품 가격 : <input type = "number" name = "price"> <br/>
    상품 수량 : <input type = "number" name = "quantity"> <br/>
    상품 소개 <br/> <textarea id="summernote" name = "productIntro"></textarea><br/>
    수량 공개 여부 : 	<select name = "isPublic">
    					<option value = "0">비공개</option>
    					<option value = "1">공개</option>
    				</select> <br/>
    카테고리 : 	<select name = "categoryId">
    				<option value = "100">전자기기</option>
    				<option value = "200">학용품</option>
    			</select> <br/>
    <input type = "submit" value = "등록하기">
    </form>
    </center>
    