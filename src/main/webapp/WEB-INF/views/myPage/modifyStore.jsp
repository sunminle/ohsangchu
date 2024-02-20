<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script>
	var StoreNameCheckValue = 0;

	$(function() {
		$("#StoreNameCheckButton").click(
				function() {
					var storeName = $("input[name='storeName']").val();
					if (storeName.trim() !== "") {
						$.ajax({
							url : "/my/storeNameCheck",
							data : {
								storeName : storeName
							},
							success : function(result) {
								StoreNameCheckValue = result;
								if (StoreNameCheckValue === "1") {
									$("#storeNameCheckResult").html(
											"사용 가능한 상점 이름입니다.").css("color",
											"green");
								} else {
									$("#storeNameCheckResult").html(
											"이미 사용 중인 상점 이름입니다.").css("color",
											"red");
								}
							}
						});
					} else {
						$("#storeNameCheckResult").html("상점 이름을 입력하세요.");
					}
				});
	});

	function StoreNameCheckForm() {
		if (StoreNameCheckValue == 0) {
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
				🔒계정 정보🔒<br />
				<button onclick="window.location='/my/modifyMe'">정보수정</button>
				👨‍💼판매자👨‍💼<br />
				<button onclick="window.location='/my/modifyStore'">상점정보수정</button>
				<button onclick="window.location='/my/myProduct'">구매자 관리</button>
				<button onclick="window.location='/my/addProduct'">상품등록</button>
				🗨리뷰🗨<br />
				<button onclick="window.location='/my/reviewAll'">리뷰 관리</button>
				❓Q&A❓<br />
				<button onclick="window.location='/my/myQNA'">문의 내역</button>
				🙍‍♂️구매자🙍‍♂️<br />
				<button onclick="window.location='/my/myOrderList'">주문목록</button>
				<button onclick="window.location='/my/myBuyList'">구매목록</button>
				<button onclick="window.location='/my/HSList'">찜,구독 목록</button>
				채팅<br />
				<button id="chattingList">채팅</button>
			</div>
			<div id="modify">
				<c:if test="${storeCount > 0 }">
					<center>
						<h2>판매자 정보 수정</h2>
						<br />
						<a href = "/product/store?storeNum=${storeDTO.id}">내상점으로</a>
						<form method="post" action="/my/modifyStorePro"
							onsubmit="return StoreNameCheckForm()">
							상점 이름 : <input type="text" value="${storeDTO.storeName}"
								name="storeName"> <input type="button"
								id="StoreNameCheckButton" value="중복 확인">
							<div id="storeNameCheckResult"></div>
							<br /> 상점 소개 <br />
							<textarea rows="20" cols="100" name="storeIntro">${storeDTO.storeIntro}</textarea>
							<br /> <input type="submit" value="수정">
						</form>
					</center>
				</c:if>

				<c:if test="${storeCount == 0 }">
	아직 상점을 개설하지 않으셨습니다.<br />
					<a href="/my/addStore">상점 개설</a>
				</c:if>
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