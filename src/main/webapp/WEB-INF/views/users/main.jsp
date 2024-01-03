<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
	
		<!-- CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link href="/resources/css/style.css" rel="stylesheet">
	
			<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	
		<title>로그인 메인</title>
	</head>

	<c:if test="${sessionScope.usersId == null}">
	<form action = "/users/login" method = "post">

 	<div class="wrapper">
		<section id="container">
	
	<form action = "/users/login" method = "post">
		id : <input type = "text" name = "realId"> <br/>
		pw : <input type = "password" name = "userPw"> <br/>
	<input type = "submit" value = "로그인">
	
	    <title>Kakao Login</title>
</head>
<body>
<a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id={ff7b89b43db02f47252b06a513236d36}&redirect_uri=https%3A%2F%2Flocalhost%3A8080%2Foauth">
    Kakao 로그인
</a>
	</form>
			
		</section>
		
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	</c:if>
	
	<c:if test="${sessionScope.usersId != null}">
		<h2>${sessionScope.usersId}님 어서오세요.</h2>
	</c:if>

