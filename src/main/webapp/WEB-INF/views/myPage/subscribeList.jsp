<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>구독상점 목록</h2>
<c:if test = "${!empty storeList}">
<c:forEach var = "store" items = "${storeList}">
상점이름 : <a href = "/store/detail?storeId=${store.id}">${store.storeName}</a>
<hr>
</c:forEach>
</c:if>
<c:if test = "${empty storeList}">
구독한 상점이 없습니다.
</c:if>
