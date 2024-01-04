<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2>나에게 쓴 리뷰 목록</h2>
<c:if test="${!empty getReviewList}">
	<c:forEach var="getReview" items="${getReviewList}">
	상품 이름 : <a href="/product/productDetail?id=${getReview.productId}">${getReview.productName}</a>
		<br />
	리뷰 내용 : ${getReview.content}<br />
	리뷰 별점 : <c:forEach var="point" begin="1" end="${getReview.point}">★</c:forEach><c:if test="${getReview.point % 1 != 0}">☆</c:if>
		<br />
		<c:if test="${!empty getReview.img}">
		리뷰 이미지 <br />
			<img src="/resources/images/review/${getReview.img}">
			<br />
		</c:if>
	작성일 : <fmt:formatDate value="${getReview.regDate}"
			pattern="yyyy-MM-dd HH:mm" />
		<br />
		<input type="button" value="답글" onclick="window.location=">
		<hr>
	</c:forEach>
</c:if>

<c:if test="${empty getReviewList}">
아직 나에게 쓴 리뷰가 없습니다..!!
</c:if>