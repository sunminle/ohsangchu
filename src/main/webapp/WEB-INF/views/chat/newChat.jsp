<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:forEach var = "usersDTO" items="${usersList}">
<a href = "/chat/doChat?enemyId=${usersDTO.id}">${usersDTO.nickname}</a><br/>
</c:forEach>