<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>

<!-- bootstrap:css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!-- boot : js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!--favicon-->
<link rel="icon" href="/resources/images/site/leaf-solid.png">
<!-- jQuery -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<!-- css -->
<link href="/resources/css/include.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
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

<!-- header -->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<!-- /header -->


<title>회원가입</title>
</head>

<script type="text/javascript">
		
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
					alert("닉네임을 입력해주세요.");
					$("#nickname").focus();
					return false;
				}
				
				
			});
			
				
			
		})
		
	</script>



<body>


	<div id=border>
		<section id="container">

			<form action="/users/login" method="post">
	<h3>JOIN</h3><br><br><br>
				<div class="input-box">
					<input id="realId" type="text" name="realId" placeholder="아이디">
					<label for="realId">아이디</label>
				</div>

				<div class="input-box">
					<input id="userName" type="text" name="userName" placeholder="이름">
					<label for="userName">이 름</label>
				</div>

				<div class="input-box">
					<input id="userPw" type="text" name="userPw" placeholder="패스워드">
					<label for="userPw">패스워드</label>
				</div>

				<div class="input-box">
					<input id="nickname" type="text" name="nickname" placeholder="닉네임">
					<label for="nickname">닉네임</label>
				</div>

				<div class="form-group has-feedback">
					<input type="submit" id="submit" value="회원가입">

				</div>
			</form>

		</section>

		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</div>
</body>

</html>