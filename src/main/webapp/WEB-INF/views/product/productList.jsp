<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:forEach var = "list" items = "${list}">
	상품 이름 : ${list.productName} <br/>
	상품 가격 : ${list.price} <br/>
	상품 수량 : ${list.quantity} <br/>
	상품 설명 <br/>
	${list.productIntro}
	<br/>
	<hr/>

</c:forEach>