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
					console.log("${sessionScope.usersId}");
					console.log("${sessionScope.usersProfile}");
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
	
	$(function(){
		$("#myBuyList").click(function(){
			$.ajax({
				url : "/my/myBuyList",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(function(){
		$("#HS").click(function(){
			$.ajax({
				url : "/my/HSList",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(function(){
		$("#chattingList").click(function(){
			$.ajax({
				url : "/chat/chattingList",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(document).on("click", "#myProductPagination a", function(e){
	    e.preventDefault();
	    var pageNum = $(this).attr("href").split("pageNum=")[1];
	    $.ajax({
	        url: "/my/myProduct?pageNum=" + pageNum,
	        success: function(e){
	            $("#modify").html(e);
	        }
	    });
	});
	
	
	
</script>

<style>
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
        }

        #container {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            max-width: 1200px;
            margin: 50px auto;
        }

        #buttonContainer {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            width: 30%;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        #modify {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 15px;
            width: 68%;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        button {
            display: block;
            width: 100%;
            margin-bottom: 20px;
            padding: 15px;
            border: none;
            background-color: #5cb85c;
            color: #ffffff;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #4cae4c;
        }
    </style>

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
		<a style="color: green;">${users.nickname}</a>님의 마이페이지.<br />
		
		<div id="container">
            <div id="buttonContainer">
            	계정 정보<br/>
				<button id="modifyInfo">정보수정</button>
				판매자<br/>
				<button id="modifyStoreInfo">상점정보수정</button>
				<button id="myProduct">구매자 관리</button>
				<button onclick="window.location='/my/addProduct'">상품등록</button>
				리뷰<br/>
				<button id="reviewAll">리뷰 관리</button>
				Q&A<br/>
				<button id="myQNA">문의 내역</button>
				구매자<br/>
				<button id="myBuyList">구매목록</button>
				<button id="HS">찜,구독 목록</button>
				채팅<br/>
				<button id="chattingList">채팅</button>
			</div>
			<div id="modify"></div>
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