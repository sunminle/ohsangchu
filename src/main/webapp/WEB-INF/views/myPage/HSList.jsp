<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>

<script>

	$(document).ready(function() {
	    $("#HSList").load("/my/heartList");
	
	    $("#heartList").click(function() {
	        $("#HSList").load("/my/heartList");
	    });
	
	    $("#subscribeList").click(function() {
	        $("#HSList").load("/my/subscribeList");
	    });
	});

</script>

<!--favicon-->
<link rel="icon" href="/resources/images/site/leaf-solid.png">
<!-- css -->
<link href="/resources/css/myPage.css" rel="stylesheet">
<link href="/resources/css/include.css" rel="stylesheet">
<!-- bootstrap:css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<c:if test="${sessionScope.usersId != null}">
	<center>
		<br/>
		<a href = "/my/myPageMain" style="color: green;">${users.nickname}</a>님의 마이페이지.<br />
		
		<div id="container">
            <div id="buttonContainer">
            	계정 정보<br/>
				<button onclick="window.location='/my/modifyMe'">정보수정</button>
				판매자<br/>
				<button onclick="window.location='/my/modifyStore'">상점정보수정</button>
				<button onclick="window.location='/my/myProduct'">구매자 관리</button>
				<button onclick="window.location='/my/addProduct'">상품등록</button>
				리뷰<br/>
				<button onclick="window.location='/my/reviewAll'">리뷰 관리</button>
				Q&A<br/>
				<button onclick="window.location='/my/myQNA'">문의 내역</button>
				구매자<br/>
				<button onclick="window.location='/my/myBuyList'">구매목록</button>
				<button onclick="window.location='/my/HSList'">찜,구독 목록</button>
				채팅<br/>
				<button id="chattingList">채팅</button>
			</div>
			<div id="modify">
				<a id="heartList" style="color: green;">찜 상품</a>
				<a id="subscribeList" style="color: blue;">구독 상점</a>
				<div id="HSList">
				</div>
			</div>
		</div>
	</center>
</c:if>

<c:if test="${sessionScope.usersId == null}">
	<script>
		alert("로그인 후 이용가능합니다.");
		window.location = "/users/main";
	</script>
</c:if>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />