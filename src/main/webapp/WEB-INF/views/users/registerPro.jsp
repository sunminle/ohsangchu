<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<c:if test="${boolean registerPro == true}">
<!--  	<c:set var="register" value="${usersDTO.realId}" scope="session" />
-->	
	<script>
		alert("회원가입이 완료되었습니다.");

		 location.href = "<c:url value='users/main'/>"; // 로그인메인페이지로
	</script>

</c:if>

