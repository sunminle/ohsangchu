<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<h2>채팅 목록</h2>
<c:choose>
<c:when test="${!empty usersDTOList}">
<c:forEach var = "usersDTO" items="${usersDTOList}">
채팅상대 : <a href = "/chat/doChat?enemyId=${usersDTO.id}">${usersDTO.nickname}</a><br/>
</c:forEach>
<a href = "/chat/newChat">새채팅</a>
</c:when>

<c:when test="${empty usersDTOList}">
채팅목록이 없습니다. 새채팅을 시작해보세요!
<a href = "/chat/newChat">새채팅</a>
</c:when>
</c:choose>
