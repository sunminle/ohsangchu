<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- css -->
<link href="/resources/css/main.css" rel="stylesheet">
<!-- bootstrap:css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<c:forEach var = "list" items = "${list}">
	상품 이름 : ${list.productName} <br/>
	상품 가격 : ${list.price} <br/>
	상품 수량 : ${list.quantity} <br/>
	상품 설명 <br/>
	${list.productIntro}
	<br/>
	<hr/>

</c:forEach>
    <jsp:include page="/WEB-INF/views/include/footer.jsp" />