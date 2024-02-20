<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="d-flex justify-content-between align-items-center">
	<div class="d-flex">
		<div id="logo" class="m-3 text-center">
			<%-- <img src="/resources/images/site/logo2.png"> --%>
			<h1>
				<b><a href="/main">OSangChu</a></b>
			</h1>
			<span><small>오늘의 상품 추천</small></span> <img
				src="/resources/images/site/ppp.gif" class=""
				style="width: 40px; height: 40px;" />
		</div>

		<div class="d-flex align-items-center m-2">
			<form action="/main/search" method="get">
				<div class="d-flex align-items-center m-2">
					<div class="d-flex justify-content-between align-items-center">
						<select id="searchColumn" class="form-select" aria-label="Default select example"
							name="searchColumn">
							<option selected value="1">상품</option>
							<option value="2">상점</option>
							<option value="3">해시태그</option>
						</select>
					</div>
					 <div class="form-group mx-1">
					<div id="searchBox">
						<input size="10" type="text" placeholder="상품, 상점 이름을 검색하세요!"
							id="searchKeyword" name="searchKeyword" required>
						<button>
							<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23"
								fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path
									d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
						</svg>
						</button>
</div>
					</div>
			</form>
		</div>
	</div>

	<div id="chart" class="d-flex align-items-center">
		<script type="text/javascript">
			var word = new Array();
			var ranking = document.getElementById("ranking");
			$.ajax({
				url : '/main/pwWord',
				success : function(data){
					console.log(data[0].PWWORD);
					for(var j =0 ; j < data.length ; j++){
						str = "<b>" + (j + 1)+ "</b> &nbsp;&nbsp;"+ data[j].PWWORD;
						word[j] = str; //str을 순서대로 배열 형태로 저장
					}
				}
			});
			
			var i=0;
			var interval = setInterval(function(){
				if(i > 5){
					i = 0 ;
				}
				$("#ranking").html("<h3>" + word[i]+ "</h3>");
				i++;
			},2000);
		</script>
		

		<div id="ranking"></div>
		<svg id="arrow" xmlns="http://www.w3.org/2000/svg" width="17"
			height="17" fill="currentColor" class="bi bi-chevron-down"
			viewBox="0 0 16 16">
				<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" /></svg>
	</div>
	</div>

	<div id="loginBox">
		<%-- 세션에 아이디가 없을 경우 --%>
		<c:if test="${sessionScope.usersId == null}">
			<div>
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
					color="green" fill="currentColor" class="bi bi-person-circle"
					viewBox="0 0 16 16">
					<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
					<path fill-rule="evenodd"
						d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" /></svg>
				<a href="/users/main">로그인</a> <a href="/users/register">회원가입</a>
			</div>
		</c:if>
		<!-- 세션에 아이디 존재 -->
		<c:if test="${sessionScope.usersId != null}">
			<div class="text-end">
				<div class="d-flex">
					<div class="box">
						<img id="profileImage"
							src="/resources/images/profiles/${sessionScope.usersProfile}">

					</div>
					<b>${sessionScope.usersId}</b>님 환영합니다♥
				</div>
				<c:if test="${ usersId == 'admin'}">
					<a class="navbar-brand" href="/admin/adminMain"><b
						class="green">회원관리</b></a>
				</c:if>
				<a href="/chat/chattingList">🗨채팅🗨</a> <a href="/my/myPageMain">마이페이지</a> <a href="/users/logout">로그아웃</a>
			</div>
		</c:if>
	</div>
</header>