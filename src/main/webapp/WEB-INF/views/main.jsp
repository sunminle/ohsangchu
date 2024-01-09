<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OSangChu</title>

<script language="javascript" src="/resources/js/search.js"></script>


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
</head>
<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- /header -->
	
	
	<nav class="navbar">
	
  <div class="container-fluid">
  <a class="navbar-brand" href="#"><b class="green">Navbar</b></a>
  <a class="navbar-brand" href="#">Home</a>
  <a class="navbar-brand" href="#">Features</a>
  <a class="navbar-brand" href="#">Pricing</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
     
    </button>
  </div>
</nav>
	<div class="collapse" id="navbarToggleExternalContent" data-bs-theme="">
  <div class="p-4">
    <ul class="navbar-nav d-flex justify-content-between">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Features</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Pricing</a></li>
				</ul>
  </div>
</div>


	<section class="mb-8">
		<div id="banner">
			<div id="carouselExample" class="carousel slide">
				<div class="carousel-inner">
					<div class="carousel-item active banners">
						<img src="/resources/images/site/da.png" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item banners">
						<img src="/resources/images/site/mimi.gif" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item banners">
						<img src="/resources/images/site/po.gif" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item banners">
						<img src="/resources/images/site/yf.png" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item banners">
						<img src="/resources/images/site/ff.gif" class="d-block w-100" alt="...">
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
		
		<div id="qnabanner" class="mt-3">
			<a class="w-100 d-flex justify-content-center" href="#">
				<img src="/resources/images/site/osc.gif">
			</a>
			<hr>
		</div>
		
		<div id="newProduct" class="m-3">
			<span class="bold"><b class="green">TOP</b> 금주의 인기 상품</span>
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-fire" viewBox="0 0 16 16">
  <path d="M8 16c3.314 0 6-2 6-5.5 0-1.5-.5-4-2.5-6 .25 1.5-1.25 2-1.25 2C11 4 9 .5 6 0c.357 2 .5 4-2 6-1.25 1-2 2.729-2 4.5C2 14 4.686 16 8 16Zm0-1c-1.657 0-3-1-3-2.75 0-.75.25-2 1.25-3C6.125 10 7 10.5 7 10.5c-.375-1.25.5-3.25 2-3.5-.179 1-.25 2 1 3 .625.5 1 1.364 1 2.25C11 14 9.657 15 8 15Z"/>
</svg>
			<div id="newProList" class="d-flex justify-content-start">
				<div class="pro" onclick="location.href='/product/detail';">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
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
	
	<br />
		
		<div id="newProduct" class="m-3">
			<span class="bold"><b class="green">pick</b> 오상추 추천 상품</span>
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pin-angle-fill" viewBox="0 0 16 16">
  <path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.922 5.922 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146z"/>
</svg>
			<div id="newProList" class="d-flex justify-content-start">
				<div class="pro" onclick="location.href='/product/detail';">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
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
		
		<br />
		
		<div id="newProduct" class="m-3">
			<span class="bold"><b class="green">NEW</b> 최신 등록 상품</span>
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmark-star-fill" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zM8.16 4.1a.178.178 0 0 0-.32 0l-.634 1.285a.178.178 0 0 1-.134.098l-1.42.206a.178.178 0 0 0-.098.303L6.58 6.993c.042.041.061.1.051.158L6.39 8.565a.178.178 0 0 0 .258.187l1.27-.668a.178.178 0 0 1 .165 0l1.27.668a.178.178 0 0 0 .257-.187L9.368 7.15a.178.178 0 0 1 .05-.158l1.028-1.001a.178.178 0 0 0-.098-.303l-1.42-.206a.178.178 0 0 1-.134-.098L8.16 4.1z"/>
</svg>
			<div id="newProList" class="d-flex justify-content-start">
				<div class="pro" onclick="location.href='/product/detail';">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
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
		
		<br />
		
		<div id="newProduct" class="m-3">
			<span class="bold"><b class="green">my</b> 최근 본 상품</span>
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmarks-fill" viewBox="0 0 16 16">
  <path d="M2 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L7 13.101l-4.223 2.815A.5.5 0 0 1 2 15.5V4z"/>
  <path d="M4.268 1A2 2 0 0 1 6 0h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L13 13.768V2a1 1 0 0 0-1-1H4.268z"/>
</svg>
			<div id="newProList" class="d-flex justify-content-start">
				<div class="pro" onclick="location.href='/product/detail';">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="https://cdn.9oodnews.com/news/photo/202112/13094_18959_2534.jpg" alt="프로필이미지">
							</div>
							<span>진짜이재현</span>
						</div>
					</div>
				</div>
				<div class="pro">
					<img src="https://id.ktown4u.com/goods_files/SH0164/goods_images/000096/GD00095887.default.1.jpg">
					<div class="proDes">
						<div class="proTitle">더보이즈 리빌 3종 애플뮤직 미개봉 미공포(특전)포함 일괄 판매 + 개봉 미공포 판매(영훈, 현재, 주연, 선우)</div>
						<div class="proPrice d-flex justify-content-end"><span>112,400 원</span></div>
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
		
	</section>
	
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- /footer -->
	

</body>

<script>
var slideIndex = 0;

//배너 이미지 자동 넘기기
$(document).ready(function() {
	showSlides();
	
	function showSlides() {
	    var i;
	    var slides = document.getElementsByClassName("banners");
	   
	    for (i = 0; i < slides.length; i++) {
	        slides[i].style.display = "none";
	    }
	    slideIndex++;
	    if (slideIndex > slides.length) {
	        slideIndex = 1
	    }
	    slides[slideIndex - 1].style.display = "block";

	    setTimeout(showSlides, 2000); // 2초마다 이미지가 체인지됩니다
	}
});



</script>

</html>