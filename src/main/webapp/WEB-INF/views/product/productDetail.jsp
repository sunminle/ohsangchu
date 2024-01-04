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
					<div class="d-flex justify-content-between mb-3">
						<div>후기(913)</div>
						<div class="green">
							<a>
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16"><path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/><path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/></svg>
								후기작성
							</a>
						</div>
					</div>
					<div id="reviewList">
						<div class="re">
							<div class="d-flex justify-content-between align-items-start">
								<div class="proProfile d-flex align-items-center" onclick="location.href='#';">
									<div class="proImg">
										<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
									</div>
									<div>
										<span>진짜이재현</span>
										<div class="stars d-flex">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16"><path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/></svg>
										</div>
									</div>
								</div>
								<div class="d-flex">
									<span><a>수정</a></span>
									<span><a>삭제</a></span>
								</div>
							</div>
							<div class="reCon d-flex">
								<img src="https://media.bunjang.co.kr/product/245451839_2_1702987673_w360.jpg">
								<div>
									너무 귀여워요! 집에 인형 10cm 아깅이들한테 겨울 기념으로 귀도리 하나씩 장만해줬는데 진짜 찰떡이에요!!
									너무 귀여워요! 집에 인형 10cm 아깅이들한테 겨울 기념으로 귀도리 하나씩 장만해줬는데 진짜 찰떡이에요!!
									너무 귀여워요! 집에 인형 10cm 아깅이들한테 겨울 기념으로 귀도리 하나씩 장만해줬는데 진짜 찰떡이에요!!
									너무 귀여워요! 집에 인형 10cm 아깅이들한테 겨울 기념으로 귀도리 하나씩 장만해줬는데 진짜 찰떡이에요!!
									너무 귀여워요! 집에 인형 10cm 아깅이들한테 겨울 기념으로 귀도리 하나씩 장만해줬는데 진짜 찰떡이에요!!
									너무 귀여워요! 집에 인형 10cm 아깅이들한테 겨울 기념으로 귀도리 하나씩 장만해줬는데 진짜 찰떡이에요!!
									너무 귀여워요! 집에 인형 10cm 아깅이들한테 겨울 기념으로 귀도리 하나씩 장만해줬는데 진짜 찰떡이에요!!
									너무 귀여워요! 집에 인형 10cm 아깅이들한테 겨울 기념으로 귀도리 하나씩 장만해줬는데 진짜 찰떡이에요!!
								</div>							
							</div>
						</div>
						<div class="re">
							<div class="d-flex justify-content-between align-items-start">
								<div class="proProfile d-flex align-items-center" onclick="location.href='#';">
									<div class="proImg">
										<img src="https://i.ytimg.com/vi/eo-nf8w-FVk/maxres2.jpg" alt="프로필이미지">
									</div>
									<div>
										<span>화난김선우</span>
										<div class="stars d-flex">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16"><path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/></svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16"><path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/></svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16"><path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/></svg>
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16"><path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.56.56 0 0 0-.163-.505L1.71 6.745l4.052-.576a.53.53 0 0 0 .393-.288L8 2.223l1.847 3.658a.53.53 0 0 0 .393.288l4.052.575-2.906 2.77a.56.56 0 0 0-.163.506l.694 3.957-3.686-1.894a.5.5 0 0 0-.461 0z"/></svg>
										</div>
									</div>
								</div>
								<!-- 작성자가 아닐경우 
								<div class="d-flex">
									<span><a>수정</a></span>
									<span><a>삭제</a></span>
								</div>-->
							</div>
							<div class="reCon d-flex">
								<!-- 이미지가 없는 경우 
								<img src="https://media.bunjang.co.kr/product/245451839_2_1702987673_w360.jpg">-->
								<div>
									게장 다 터져서 왔다구요;;<br>
									주문처는 전화, 문자도 안받고 디엠은 답도 없으시고...게장 냄새만 한가득 나서 갖다버렸는데 환불 조치 좀 해주세요
								</div>							
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