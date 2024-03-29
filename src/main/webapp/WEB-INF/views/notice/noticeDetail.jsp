<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>

<!-- bootstrap:css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!-- boot : js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<!--favicon-->
<link rel="icon" href="/resources/images/site/leaf-solid.png">
<!-- jQuery -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
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

<title>noticeDetail</title>
</head>
<body>
	<form id="addNotice">
		<div class="page-wrapper">
			<div class="container-fluid">

				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">Notice</h1>
				</div>
				
				<br>
				<div class="panel panel-default">
					<div class="panel-heading">작성일 : <td><fmt:formatDate value="${notice.regDate}" pattern="yy.MM.dd aa hh:mm" /></td></div>
					<div class="panel-body">
						<table class="table table-hover">
							
							
								<tr>
									<p th:text="${notice.title}"><h3>${notice.title}</h3></p>
									
								</tr>
						<hr><br>
								<tr>
									<p th:text="${notice.content}">${notice.content}</p>
								</tr>
						
							
							
						
						
          
							
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>




	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
