<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="UTF-8">

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
<link href="/resources/css/product.css" rel="stylesheet">

<title>상품상세</title>
</head>

<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- /header -->
	
	<section>
		<div id="title" class="bg-dark text-white d-flex justify-content-center align-items-center">
			<div>10cm 인형 뜨개 18차◡̈</div>
		</div>
		<div id="storeInfo" class="d-flex justify-content-center">
			<div>
				<div id="tags" class="d-flex justify-content-center align-itemts-center">
					<div class="tag green">#더보이즈</div>
					<div class="tag green">#10cm인형</div>
					<div class="tag green">#뜨개옷</div>
				</div>
			</div>
		</div>
		
		<div>
		  <ul id="storeNav">
		    <li><a href="#detail" class="scroll_move">상세설명</a><li>
		    <li><a href="#reviews" class="scroll_move">후기</a><li>
		  </ul>
		</div>
		
		<div class="listbox">
		  <div id="detail" class="bg-warning">detail</div>
		  <div id="reviews" class="bg-info">reviews</div>
		</div>
		
	</section>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- /footer -->
	
</body>

<script>
$(document).ready(function($) {
    $(".scroll_move").click(function(event){
        console.log(".scroll_move");         
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
    });

});

</script>

</html>