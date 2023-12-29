<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OSangChu</title>

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
	
	<!-- header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- /header -->
	
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
	
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- /footer -->
	

</body>

</html>