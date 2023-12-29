<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>

<script>
	$(function(){
		$("#modifyInfo").click(function(){
			$.ajax({
				url : "/my/modifyMe",
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
	
	
</script>
<!-- css -->
<link href="/resources/css/main.css" rel="stylesheet">
<!-- bootstrap:css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<center>
<a style = "color: green;">${usersDTO.nickname}</a>님의 마이페이지.<br/>

<button id = "modifyInfo">정보수정</button>
<button id = "modifyStoreInfo">상점정보수정</button>
<button onclick="window.location='/my/addProduct'">상품등록</button>
<div id = "modify"></div>




</center>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />