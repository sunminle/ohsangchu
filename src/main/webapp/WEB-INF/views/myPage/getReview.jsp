<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<h2> 나에게 쓴 리뷰 목록</h2>
<c:if test="${!empty list}">
<c:forEach var = "review" items = "${list}">
	상품 이름 : <a href = "/product/productDetail?id=${review.productId}">${review.productName}</a><br/>
	리뷰 내용 : ${review.content}<br/>
	리뷰 별점 : <c:forEach var = "point" begin = "1" end = "${review.point}" >★</c:forEach><c:if test="${review.point % 1 != 0}">☆</c:if><br/>
	<c:if test="${!empty review.img}">
		리뷰 이미지 <br/>
		<img src = "/resources/images/review/${review.img}"><br/>
	</c:if>
	작성일 : <fmt:formatDate value = "${review.regDate}" pattern="yyyy-MM-dd HH:mm"/><br/>
	<input type = "button" value = "답글" onclick = "window.location=">
	<hr>
</c:forEach>
</c:if>

<c:if test="${empty list}">
아직 나에게 쓴 리뷰가 없습니다..!!
</c:if>