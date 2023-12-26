<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<h2> 메인 </h2>

<c:if test="${sessionScope.usersId == null}">
<form action = "/users/login" method = "post">
id : <input type = "text" name = "realId"> <br/>
pw : <input type = "password" name = "userPw"> <br/>
	<input type = "submit" value = "로그인">
</form>
</c:if>

<c:if test="${sessionScope.usersId != null}">
<h2>${sessionScope.usersId}님 어서오세요.</h2>
</c:if>