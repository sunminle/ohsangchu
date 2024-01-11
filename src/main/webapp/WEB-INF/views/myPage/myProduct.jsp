<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>판매중 상품</h2>

<c:if test="${!empty postingList}">
<c:forEach var = "posting" items = "${postingList}">
상품이름 : <a href = "/my/myProductBuyer?postingId=${posting.id}">${posting.title}</a><br/><hr/>
</c:forEach>
</c:if>


<c:if test="${empty postingList}">
판매중인 상품이 없습니다.
</c:if>