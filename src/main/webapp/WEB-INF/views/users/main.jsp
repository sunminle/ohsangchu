<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>


<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="/resources/css/include.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">

<jsp:include page="/WEB-INF/views/include/header.jsp" />


<title>로그인 메인</title>
</head>
<body>
	<p>
		<c:if test="${sessionScope.usersId == null}">

			<div id=border>
				<h4>안녕하세요! 오상추입니다.</h4>
				<br>
				<h5>오상추를 이용하시려면 로그인이 필요합니다</h5>
				<br>

				<form action="/users/login" method="post">

					<div class="input-box">
						<input id="username" type="text" name="realId" placeholder="아이디">
						<label for="username">아이디</label>
					</div>

					<div class="input-box">

						<input id="password" type="password" name="userPw"
							placeholder="비밀번호"> <label for="password">비밀번호</label>
					</div>
					<div id="forgot">
						<a href="">아이디 찾기</a>
						<a href="">비밀번호 찾기</a>
					</div>
					<input type="submit" value="로그인">

				</form>

				<div
					onClick="location.href='https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=ff7b89b43db02f47252b06a513236d36&redirect_uri=http://localhost:8080/main';">
					<img src="/resources/images/kakao_login.png" />
				</div>


			</div>

		</c:if>


	</p>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
