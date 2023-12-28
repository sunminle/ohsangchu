<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OSangChu</title>

<script language="javascript" src="/resources/js/search.js"></script>

<!-- bootstrap:css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!-- boot : js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!--favicon-->
<link rel="icon" href="/resources/images/site/leaf-solid.png">
<!-- jQuery -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<!-- css -->
<link href="/resources/css/main.css" rel="stylesheet">
</head>
<body>

	<header class="d-flex justify-content-between align-items-center">
		<div class="d-flex">
			<div id="logo" class="m-3 text-center">
				<%-- <img src="/resources/images/site/logo2.png"> --%>
				<h1><b>OSangChu</b></h1>
				<span><small>오늘의 상품 추천</small></span>
			</div>
			<div class="d-flex align-items-center m-2">
				<div id="searchBox">
					<input size="10" type="text" placeholder="상품, 상점 이름을 검색하세요!">
					<input type=button" onclick="getSearchList()" value="검색" onSubmit="return getSearchList()">
					<button>
						<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" /></svg>
					</button>
				</div>
			</div>
	
			<div id="chart" class="d-flex align-items-center">
				<script type="text/javascript">
				
					$(document).ready(function(){
						var word = new Array();
						//객체 가져오기
						var ranking = document.getElementById("ranking");
						//Ajax객체 생성
						var request = new XMLHttpRequest();
						//요청준비
						request.open("get", "/resources/etc/search.json", true);
						//데이터 요청
						request.send();
						//데이터 수신
						request.onreadystatechange = function() {
							if (request.readyState == 4) {
								if (request.status == 200) {
									var obj = JSON.parse(request.responseText); //json객체로 변환
									console.log(obj);
									var str = "";
									for (var i = 0; i < 6; i++) {
										str = "<b>"+(i + 1) + "</b> &nbsp;&nbsp;" + obj[i]['name'];
										word[i] = str; //str을 순서대로 배열 형태로 저장
									}
								}
							}
						}
						var i = 0;
						var interval = setInterval(function() {
							if (i > 5) { //i가 5이상이되면 반복이 종료되므로 
								i = 0; //다시 i를 0으로 초기화
							}
							ranking.innerHTML = "<h3>" + word[i] + "</h3>";
							i++;
						}, 2000); //2초마다 갱신
						
	//					setTimeout(function() {
	//					clearInterval(interval);
	//				}, 20000); //20초후 정지
	
					});
				</script>
				
				<div id="ranking"></div>
				<svg id="arrow" xmlns="http://www.w3.org/2000/svg" width="17" height="17" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/></svg>
			</div>
		</div>
		
		<div id="loginBox m-3">
			<%-- 세션에 아이디가 없을 경우 --%>
			<c:if test="${sessionScope.usersId == null}">
				<div><a>로그인</a> <a>회원가입</a></div>
			</c:if>
			<%-- 세션에 아이디 존재 --%>
			<c:if test="${sessionScope.usersId != null}">
				<h2>${sessionScope.usersId}님어서오세요.</h2>
			</c:if>
		</div>
	</header>
	
	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Navbar</a>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav d-flex justify-content-between">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Features</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Pricing</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<section>
		<div id="banner">
			<div id="carouselExample" class="carousel slide">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="https://i.namu.wiki/i/82N8K0CPSFhZsqShieizBlUEGOKUkyEgfZPVGCN1jFjKootBTCec7-dxXLA4j_feJKAWzsNWLGYKwBxHlgLH0A.gif" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="https://blog.kakaocdn.net/dn/bL3GVY/btsAFtzcZI0/aIFzh6IXmfGk7SYNmQRfIK/img.gif" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
						<img src="https://blog.kakaocdn.net/dn/ucGeZ/btsCBMEee79/4aLKN8eZKerUjVp1UKLyHk/img.gif" class="d-block w-100" alt="...">
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
	</section>

	<footer class="bg-light">
		<hr>
		<div class="text-center">
			Copyright © 2023 OSC team01. All rights reserved.
		</div>
	</footer>

</body>

</html>