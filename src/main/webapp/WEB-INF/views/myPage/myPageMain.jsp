<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>

<script>
	$(function(){
		$("#modifyInfo").click(function(){
			$.ajax({
				url : "/my/modifyMe",
				cache: false,
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(function(){
		$("#modifyStoreInfo").click(function(){
			$.ajax({
				url : "/my/modifyStore",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(function(){
		$("#reviewAll").click(function(){
			$.ajax({
				url : "/my/reviewAll",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(function(){
		$("#myQNA").click(function(){
			$.ajax({
				url : "/my/myQNA",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(function(){
		$("#myProduct").click(function(){
			$.ajax({
				url : "/my/myProduct",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	
</script>
<!-- css -->
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
		<a style="color: green;">${usersDTO.nickname}</a>님의 마이페이지.<br />

		<button id="modifyInfo">정보수정</button>
		<button id="modifyStoreInfo">상점정보수정</button>
		<button onclick="window.location='/my/addProduct'">상품등록</button>
		<button id="reviewAll">리뷰 관리</button>
		<button id="myQNA">문의 내역</button>
		<button id="myProduct">구매자 관리</button>
		<div id="modify"></div>
	</center>
</c:if>

<c:if test="${sessionScope.usersId == null}">
	<script>
		alert("로그인 후 이용가능합니다.");
		window.location = "/users/main";
	</script>
</c:if>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />