<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script>
	var nickCheckValue = 0;

	$(function() {
		$("#nickCheckButton").click(
				function() {
					var nickname = $("input[name='nickname']").val();
					if (nickname.trim() !== "") {
						$.ajax({
							url : "/my/nickCheck",
							data : {
								nickname : nickname
							},
							success : function(result) {
								nickCheckValue = result;
								if (nickCheckValue === "1") {
									$("#nickCheckResult")
											.html("사용 가능한 닉네임입니다.").css(
													"color", "green");
								} else {
									$("#nickCheckResult").html(
											"이미 사용 중인 닉네임입니다.").css("color",
											"red");
								}
							}
						});
					} else {
						$("#nickCheckResult").html("닉네임을 입력하세요.");
					}
				});
	});

	function nickCheckForm() {
		if (nickCheckValue == 0) {
			alert("중복 확인을 먼저 진행하세요.");
			return false;

		}
	}
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
		<a href = "/my/myPageMain" style="color: green;">${usersDTO.nickname}</a>님의 마이페이지.<br />

		<div id="container">
			<div id="buttonContainer">
				계정 정보<br />
				<button onclick="window.location='/my/modifyMe'">정보수정</button>
				판매자<br />
				<button onclick="window.location='/my/modifyStore'">상점정보수정</button>
				<button onclick="window.location='/my/myProduct'">구매자 관리</button>
				<button onclick="window.location='/my/addProduct'">상품등록</button>
				리뷰<br />
				<button onclick="window.location='/my/reviewAll'">리뷰 관리</button>
				Q&A<br />
				<button onclick="window.location='/my/myQNA'">문의 내역</button>
				구매자<br />
				<button onclick="window.location='/my/myBuyList'">구매목록</button>
				<button onclick="window.location='/my/HSList'">찜,구독 목록</button>
				채팅<br />
				<button id="chattingList">채팅</button>
			</div>
			<div id="modify">

				<h2>정보수정</h2>
				<br />
				<form method="post" action="/my/modifyMePro"
					enctype="multipart/form-data" onsubmit="return nickCheckForm()">
					닉네임 : <input type="text" value="${usersDTO.nickname}"
						name="nickname"> <input type="button" id="nickCheckButton"
						value="중복 확인">
					<div id="nickCheckResult"></div>
					<br /> 프로필사진 : <input type="file" name="file" accept="image/*"><br />
					<img src="/resources/images/profiles/${usersDTO.profile}"> <br />
					이메일 : <a>${userInfoDTO.email}</a><br /> <input type="submit"
						value="수정">
				</form>

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