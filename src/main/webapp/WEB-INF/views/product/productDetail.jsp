<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
			<div>${post.title }</div>
		</div>
		
		<div class="d-flex justify-content-center align-items-center m-3">
			<div id="storeInfo" class="d-flex justify-content-center align-items-center">
				<div id="storePro" class="d-flex justify-content-end col-4">
					<div id="storeImg">
						<img src="/resources/images/profiles/${storeUser.profile}" alt="프로필이미지">
					</div>
				</div>
				<div id="storeDes" class="col-8">
					<div id="storeName" class="d-flex align-items-center" onclick="location.href='/product/store?storeNum=${store.id}';">
						<b>${store.storeName}</b>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708" /></svg>
					</div>
					<div class="stars d-flex align-items-center m-1">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16"><path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/></svg>
						
						<span>4.8 (6,724)</span>
					</div>
					<div id="introduce">
						${store.storeIntro}
					</div>
					
				</div>
			</div>
		</div>

		<div id="storeNav">
			<ul class="d-flex justify-content-start">
				<li id="detailLi" class="d-flex justify-content-center align-items-center"><a href="#detail" class="scroll_move">상세설명</a></li>
				<li id="buytab" class="d-flex justify-content-center align-items-center"><a href="#buy" class="scroll_move">구매</a></li>
				<li id="reviewLi" class="d-flex justify-content-center align-items-center"><a href="#reviews" class="scroll_move">후기 <small class="ml-2">913</small></a></li>

			</ul>
		</div>

		<div id="lists">
			<div id="detail">
				<div class="d-flex justify-content-center">
					<div id="desc" class="text-center">
						${post.content }
					</div>
				</div>

				<div id="tags" class="d-flex justify-content-center align-itemts-center">
					<div class="tag green">#더보이즈</div>
					<div class="tag green">#10cm인형</div>
					<div class="tag green">#뜨개옷</div>
				</div>
				
				<div class="d-flex justify-content-center">
					<div id="likeShare" class="d-flex justify-content-center align-items-center">
						<button>
							<!-- 찜하기전 -->
							<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16"><path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/></svg>
							<!-- 찜하고 난 후 
							<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/></svg>
							-->
							찜 115개
						</button>
						<button>
							<svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" fill="currentColor" class="bi bi-share" viewBox="0 0 16 16"><path d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5m-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3m11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3"/></svg>
							공유하기
						</button>
					</div>
				</div>
				
				<hr>
				
			</div>
			
			<!-- 구매탭 -->
			<div id="buy" class="d-flex justify-content-center">
				<div>
					<b>- 주문 상품 선택<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-asterisk" viewBox="0 0 16 16">  <path d="M8 0a1 1 0 0 1 1 1v5.268l4.562-2.634a1 1 0 1 1 1 1.732L10 8l4.562 2.634a1 1 0 1 1-1 1.732L9 9.732V15a1 1 0 1 1-2 0V9.732l-4.562 2.634a1 1 0 1 1-1-1.732L6 8 1.438 5.366a1 1 0 0 1 1-1.732L7 6.268V1a1 1 0 0 1 1-1"/></svg></b>
					
					<div class="products" class="d-flex justify-content-center align-items-center">
						섹시 메이드복 세트(24,000원/개)
					</div>
					<div class="products" class="d-flex justify-content-center align-items-center">
						미니 넥타이(6,700원/개)
					</div>
					<div class="products" class="d-flex justify-content-center align-items-center">
						냥냥 보이 모자(11,000원/개)
					</div>
				</div>			
			</div>
			<!-- /구매탭 -->
			
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
	var buy = $('#buy').offset().top;
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
	  	if(window<buy){	//스크롤이 detail = buy 아래
	  		$('#detailLi').addClass('clicked');
	  	}else{
	  		$('#detailLi').removeClass('clicked');
	  	}
	  	
	  	if(window<reviews && window >= buy){	//스크롤이 buy과 reviews 사이
	  		$('#buytab').addClass('clicked');
	  	}else{
	  		$('#buytab').removeClass('clicked');
	  	}
	  	
	  	if(window>=reviews){
	  		$('#reviewLi').addClass('clicked');
	  	}else{
	  		$('#reviewLi').removeClass('clicked');
	  	}
	  
	})
});
</script>

</html>