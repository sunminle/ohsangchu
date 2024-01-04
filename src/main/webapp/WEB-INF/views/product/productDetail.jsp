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
		
		<div id="storeNav">
		  <ul class="d-flex justify-content-start">
		    <li id="detailLi" class="d-flex justify-content-center align-items-center"><a href="#detail" class="scroll_move">상세설명</a></li>
		    <li id="reviewLi" class="d-flex justify-content-center align-items-center"><a href="#reviews" class="scroll_move">후기 <small class="ml-2">913</small></a></li>
		  </ul>
		</div>

		<div id="lists">
			<div id="detail" class="d-flex justify-content-center">
				<div id="desc" class="text-center">
					💛10cm인형 귀도리&뜨개옷&가방 소품들💛<br> <img width="1000px" src="https://d2i2w6ttft7yxi.cloudfront.net/froala%2F1702149197161-%EA%B3%B5%EC%A7%80.png"><br> <img width="1000px"
						src="https://d2i2w6ttft7yxi.cloudfront.net/froala%2F1702160323784-IMG_1670.jpeg"
					><br> <img width="1000px" src="https://d2i2w6ttft7yxi.cloudfront.net/froala%2F1702149335487-KakaoTalk_20231210_040311196.jpg"><br> 생축케이크 모자<br> <img width="1000px"
						src="https://d2i2w6ttft7yxi.cloudfront.net/froala%2F1702187315893-BB25D826-6800-4BC3-A9CA-62A092FB03E6.jpeg"
					><br> 왕리본<br> <img width="1000px" src="https://d2i2w6ttft7yxi.cloudfront.net/froala%2F1702153523038-KakaoTalk_20231209_141442621_01.jpg"><br> 하트 냥 모자<br> <img
						width="1000px" src="https://d2i2w6ttft7yxi.cloudfront.net/froala%2F1702202729006-C2418567-3F4B-415F-9C46-6810387DB835.jpeg"
					><br> 판다클라바<br> <img width="1000px" src="https://d2i2w6ttft7yxi.cloudfront.net/froala%2F1702155863499-KakaoTalk_20231210_060355611.jpg"><br> <img width="1000px"
						src="https://d2i2w6ttft7yxi.cloudfront.net/froala%2F1702194859460-8EADADD6-258A-4702-88FA-325FCCEF1925.jpeg"
					><br> 체리 볼도리/메론빵 볼도리<br> <img width="1000px" src="https://d2i2w6ttft7yxi.cloudfront.net/froala%2F1702152510194-KakaoTalk_20231208_144116105_02.jpg"><br> 너구리 보이<br> <img
						width="1000px" src="https://d2i2w6ttft7yxi.cloudfront.net/ckeditor/20230611045225_519867_40jc.jpg"
					><br> 메이드복 간단<br> <img width="1000px" src="https://d2i2w6ttft7yxi.cloudfront.net/ckeditor/20230402054442_519867_0kf9.jpg"><br> 독기룩<br> <img width="1000px"
						src="https://d2i2w6ttft7yxi.cloudfront.net/ckeditor/20230402052855_519867_ch5a.jpg"
					><br>
				</div>
			</div>
			<div id="reviews" class="d-flex justify-content-center">
				<div>
					<div id="" class="d-flex justify-content-between">
						<div>후기(913)</div>
						<div><a>후기작성</a></div>
					</div>
					<div id="reviewList">
						<div class="re">
							<div class="proProfile d-flex align-items-center">
								<div class="proImg">
									<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
								</div>
								<span>진짜이재현</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- /footer -->
	
</body>

<script>
$(document).ready(function($) {
    $(".scroll_move").click(function(event){
    	console.log("탭 클릭"); 
        event.preventDefault();
        $('html,body').animate({scrollTop:$(this.hash).offset().top}, 500);
    });
});

$(function() {
	var detail = $('#detail').offset().top;
	var reviews = $('#reviews').offset().top;
	var storeNav = $("#storeNav").offset().top;
	
	//스크롤시 동작
	$(window).scroll(function() {
		//스크롤시 메뉴 고정
		var window = $(this).scrollTop();	//현재 스크롤위치
		if(storeNav <= window) {	//현재 스크롤위치보다 아래에 메뉴바가 있다(안보인다)
			$("#storeNav").addClass("fixed");
		}else{
			$("#storeNav").removeClass("fixed");
		}
	  
	  	//스크롤시 메뉴바 변경
	  	if(window<reviews-150){	//스크롤이 detail과 window 사이
	  		$('#detailLi').addClass('clicked');
	  	}else{
	  		$('#detailLi').removeClass('clicked');
	  	}
	  	
	  	if(window>=reviews-150){
	  		$('#reviewLi').addClass('clicked');
	  	}else{
	  		$('#reviewLi').removeClass('clicked');
	  	}
	  
	})
});
</script>

</html>