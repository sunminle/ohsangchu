<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	
		<!-- CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link href="/resources/css/style.css" rel="stylesheet">
		<link href="/resources/css/include.css" rel="stylesheet">
		
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	
		<title>회원가입</title>
	</head>

	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#realId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#realId").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("이름을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				if($("#userPw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPw").focus();
					return false;
				}
				if($("#nickname").val()==""){
					alert("닉넴을 입력해주세요.");
					$("#nickname").focus();
					return false;
				}
				
			});
			
				
			
		})
		
	</script>
	
	

	<body>
	 <div class="wrapper">
		<section id="container">
	
			<form action="/member/register" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="realId">아이디</label>
					<input class="form-control" type="text" id="realId" name="realId" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userName">이 름</label>
					<input class="form-control" type="text" id="userName" name="userName" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="userPw">패스워드</label>
					<input class="form-control" type="password" id="userPw" name="userPw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="nickname">닉네임</label>
					<input class="form-control" type="text" id="nickname" name="nickname" />
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cancle btn btn-danger" type="button">취소</button>
				</div>
			</form>
			
		</section>
		
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
	</body>
	
</html>