<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>찜상품 목록</h2>
<c:if test = "${!empty postingList}">
<c:forEach var = "posting" items = "${postingList}">
상품명 : <a href = "/product/detail?postNum=${posting.id}">${posting.title}</a><br/>
<img style = "width:200px;" src = "/resources/images/posting/${posting.thumnail}">
<hr/>
</c:forEach>
</c:if>
<c:if test = "${empty postingList}">
찜한 상품이 없습니다.
</c:if>