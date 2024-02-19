<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OSangChu</title>



<!-- 부트스트랩 JS 및 Popper.js, jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barriecito&family=Dancing+Script:wght@400..700&display=swap" rel="stylesheet">

</head>
<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- /header -->
	
	
	<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
         <c:if test="${usersId != null && usersId == 'admin'}">
  	<a class="navbar-brand" href="/notice/noticeListAdmin"><b class="green">Notice</b></a>
  </c:if>
  <c:if test="${ usersId != 'admin'}">
  	<a class="navbar-brand" href="/notice/noticeList"><b class="green">Notice</b></a>
  </c:if>
  

       
            
                 <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
       식품
    </a>
    <ul class="dropdown-menu">
        <!-- 각 카테고리에 대한 메뉴 아이템 -->
        <c:forEach items="${categories}" var="category">
            <c:choose>
                <c:when test="${category.id ge 100 and category.id lt 200}">
                    <!-- 각 카테고리에 대한 폼 -->
                    <li>
                        <form action="/main/view" method="get">
                            <!-- hidden input을 사용하여 카테고리 아이디 전달 -->
                            <input type="hidden" name="categoryId" value="${category.id}">
                            <!-- 실제로 클릭되는 링크 -->
                            <button type="submit" class="dropdown-item">${category.categoryName}</button>
                        </form>
                    </li>
                </c:when>
            </c:choose>
        </c:forEach>
    </ul>
</li>
               
           <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
       패션
    </a>
    <ul class="dropdown-menu">
        <!-- 각 카테고리에 대한 메뉴 아이템 -->
        <c:forEach items="${categories}" var="category">
            <c:choose>
                <c:when test="${category.id ge 200 and category.id lt 300}">
                    <!-- 각 카테고리에 대한 폼 -->
                    <li>
                        <form action="/main/view" method="get">
                            <!-- hidden input을 사용하여 카테고리 아이디 전달 -->
                            <input type="hidden" name="categoryId" value="${category.id}">
                            <!-- 실제로 클릭되는 링크 -->
                            <button type="submit" class="dropdown-item">${category.categoryName}</button>
                        </form>
                    </li>
                </c:when>
            </c:choose>
        </c:forEach>
    </ul>
</li>
                
                 <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
       홈데코
    </a>
    <ul class="dropdown-menu">
        <!-- 각 카테고리에 대한 메뉴 아이템 -->
        <c:forEach items="${categories}" var="category">
            <c:choose>
                <c:when test="${category.id ge 300 and category.id lt 400}">
                    <!-- 각 카테고리에 대한 폼 -->
                    <li>
                        <form action="/main/view" method="get">
                            <!-- hidden input을 사용하여 카테고리 아이디 전달 -->
                            <input type="hidden" name="categoryId" value="${category.id}">
                            <!-- 실제로 클릭되는 링크 -->
                            <button type="submit" class="dropdown-item">${category.categoryName}</button>
                        </form>
                    </li>
                </c:when>
            </c:choose>
        </c:forEach>
    </ul>
</li>
            
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
       케이스/문구
    </a>
    <ul class="dropdown-menu">
        <!-- 각 카테고리에 대한 메뉴 아이템 -->
        <c:forEach items="${categories}" var="category">
            <c:choose>
                <c:when test="${category.id ge 400 and category.id lt 500}">
                    <!-- 각 카테고리에 대한 폼 -->
                    <li>
                        <form action="/main/view" method="get">
                            <!-- hidden input을 사용하여 카테고리 아이디 전달 -->
                            <input type="hidden" name="categoryId" value="${category.id}">
                            <!-- 실제로 클릭되는 링크 -->
                            <button type="submit" class="dropdown-item">${category.categoryName}</button>
                        </form>
                    </li>
                </c:when>
            </c:choose>
        </c:forEach>
    </ul>
</li>
                       
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
       뷰티
    </a>
    <ul class="dropdown-menu">
        <!-- 각 카테고리에 대한 메뉴 아이템 -->
        <c:forEach items="${categories}" var="category">
            <c:choose>
                <c:when test="${category.id ge 500 and category.id lt 600}">
                    <!-- 각 카테고리에 대한 폼 -->
                    <li>
                        <form action="/main/view" method="get">
                            <!-- hidden input을 사용하여 카테고리 아이디 전달 -->
                            <input type="hidden" name="categoryId" value="${category.id}">
                            <!-- 실제로 클릭되는 링크 -->
                            <button type="submit" class="dropdown-item">${category.categoryName}</button>
                        </form>
                    </li>
                </c:when>
            </c:choose>
        </c:forEach>
    </ul>
</li>
            
            <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
       공예
    </a>
    <ul class="dropdown-menu">
        <!-- 각 카테고리에 대한 메뉴 아이템 -->
        <c:forEach items="${categories}" var="category">
            <c:choose>
                <c:when test="${category.id ge 600}">
                    <!-- 각 카테고리에 대한 폼 -->
                    <li>
                        <form action="/main/view" method="get">
                            <!-- hidden input을 사용하여 카테고리 아이디 전달 -->
                            <input type="hidden" name="categoryId" value="${category.id}">
                            <!-- 실제로 클릭되는 링크 -->
                            <button type="submit" class="dropdown-item">${category.categoryName}</button>
                        </form>
                    </li>
                </c:when>
            </c:choose>
        </c:forEach>
    </ul>
</li>
            
  <c:if test="${usersId != null}">
  	<a class="navbar-brand" href="/qna/qnaList"><b class="green">QnA</b></a>
  </c:if> 
            
        </div>

</nav>


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
			<span class="bold"><b class="green">TOP</b> 오상추 인기 상품</span>
			<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-fire" viewBox="0 0 16 16">
  <path d="M8 16c3.314 0 6-2 6-5.5 0-1.5-.5-4-2.5-6 .25 1.5-1.25 2-1.25 2C11 4 9 .5 6 0c.357 2 .5 4-2 6-1.25 1-2 2.729-2 4.5C2 14 4.686 16 8 16Zm0-1c-1.657 0-3-1-3-2.75 0-.75.25-2 1.25-3C6.125 10 7 10.5 7 10.5c-.375-1.25.5-3.25 2-3.5-.179 1-.25 2 1 3 .625.5 1 1.364 1 2.25C11 14 9.657 15 8 15Z"/>
</svg>
			<div id="newProList" class="d-flex justify-content-start">
			<c:forEach var="product" items="${popularProducts}">
				<div class="pro" onclick="location.href='/product/detail?postNum=${product.id}';">
					<img src="/resources/images/posting/${product.thumnail}" alt="프로필이미지" width="300px" height="300px">
					<div class="proDes">
						<div class="proTitle">${product.title}</div>
						<div class="proPrice d-flex justify-content-end"><span>${product.productname}</span></div>
						<div class="proPrice d-flex justify-content-end"><span> </span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="/resources/images/profiles/${product.profile}" alt="프로필이미지" width="300px" height="300px">
							</div>
							<span>${product.storeName}</span>
						</div>
					</div>
				</div>
				 </c:forEach>
    </div>
	</div>			
	
	<br />
		
		<div id="newProduct" class="m-3">
			<span class="bold"><b class="green">pick</b> 오상추 추천 상품</span>
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pin-angle-fill" viewBox="0 0 16 16">
  <path d="M9.828.722a.5.5 0 0 1 .354.146l4.95 4.95a.5.5 0 0 1 0 .707c-.48.48-1.072.588-1.503.588-.177 0-.335-.018-.46-.039l-3.134 3.134a5.927 5.927 0 0 1 .16 1.013c.046.702-.032 1.687-.72 2.375a.5.5 0 0 1-.707 0l-2.829-2.828-3.182 3.182c-.195.195-1.219.902-1.414.707-.195-.195.512-1.22.707-1.414l3.182-3.182-2.828-2.829a.5.5 0 0 1 0-.707c.688-.688 1.673-.767 2.375-.72a5.922 5.922 0 0 1 1.013.16l3.134-3.133a2.772 2.772 0 0 1-.04-.461c0-.43.108-1.022.589-1.503a.5.5 0 0 1 .353-.146z"/>
</svg>
			<div id="newProList" class="d-flex justify-content-start">
				<div class="pro" onclick="location.href='/product/detail?postNum=5';">
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
				<div class="pro" onclick="location.href='/product/detail?postNum=5';">
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
				<div class="pro" onclick="location.href='/product/detail?postNum=5';">
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
				<div class="pro" onclick="location.href='/product/detail?postNum=5';">
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
				<div class="pro" onclick="location.href='/product/detail?postNum=5';">
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
				<div class="pro" onclick="location.href='/product/detail?postNum=5';">
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
			<span class="bold"><b class="green">NEW</b> 최근 본 상품</span>
			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
</svg>
			 <!-- 방문한 항목을 표시할 컨테이너 -->
    <div id="mainContainer" style="list-style: none; display: flex;"></div>

    <script>
        // 세션 스토리지에서 방문한 정보 목록 가져오기
        function getVisitedItems() {
            return JSON.parse(sessionStorage.getItem('visitedItems')) || [];
        }

        // 출력 부분
        const mainContainer = document.getElementById('mainContainer');
        const visitedItems = getVisitedItems();

        // 기존 목록을 지우고 새로 목록을 출력
        mainContainer.innerHTML = '';

        if (visitedItems.length > 0) {
            mainContainer.classList.add('hasData');
            visitedItems.forEach(item => {
                const itemContainer = document.createElement('div');
                itemContainer.className = 'visited-item';

                const imgElement = document.createElement('img');
                imgElement.src = item.imageUrl;
                imgElement.alt = '방문한 항목 썸네일';

                // 이미지의 폭과 높이를 설정하여 크기 조정
                imgElement.style.width = '280px'; // 원하는 폭으로 변경
                imgElement.style.height = '280px'; // 원하는 높이로 변경

                // 이미지를 클릭했을 때 저장된 페이지 URL로 이동하는 이벤트 추가
                imgElement.addEventListener('click', function() {
                    window.location.href = item.pageUrl;
                });

                itemContainer.appendChild(imgElement);
                mainContainer.appendChild(itemContainer);
            });
        } else {
            mainContainer.classList.add('noData');
            const noDataMessage = document.createElement('p');
            noDataMessage.textContent = '최근 본 상품이 없어요';
            noDataMessage.style.color = 'gray';
            noDataMessage.style.fontSize = '20px';
            noDataMessage.style.fontWeight = 'bold';
            noDataMessage.style.margin = '0 auto';

            mainContainer.appendChild(noDataMessage);
        }
    </script>
		
		</div>
		
		
		<div id="newProduct" class="m-3">
			<span class="bold"><b class="green">my</b> 최근 본 상점</span>
			<svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-shop" viewBox="0 0 16 16">
  <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z"/>
</svg>
		


<!-- 메인 뷰의 HTML 파일에 목록을 표시할 요소 -->
<ul id="mainViewList" style="list-style: none; display: flex;"></ul>

<!-- 출력을 위한 요소 -->
<!-- <div id="output"></div> -->

<script>
    // 세션 스토리지에서 방문한 스토어 정보 목록 가져오기
    function getVisitedStores() {
        return JSON.parse(sessionStorage.getItem('visitedStores')) || [];
    }

    window.onload = function () {
        console.log("Main view script loaded.");

        const mainViewList = document.getElementById('mainViewList');
        const visitedStores = getVisitedStores();

        // 기존 목록을 지우고 새로 목록을 출력
        mainViewList.innerHTML = '';

        if (visitedStores.length > 0) {
        	mainViewList.classList.add('hasData');
            visitedStores.forEach(storeInfo => {
                const listItem = document.createElement('li');
                listItem.classList.add('visited-item');
                const imgElement = document.createElement('img');
                imgElement.src = storeInfo.imageUrl;
                imgElement.alt = "Store Image";
                
             // 이미지의 폭과 높이를 설정하여 크기 조정
                imgElement.style.width = '280px'; // 원하는 폭으로 변경
                imgElement.style.height = '280px'; // 원하는 높이로 변경

                // 이미지를 클릭했을 때 상점 페이지로 이동하는 이벤트 추가
                imgElement.addEventListener('click', function() {
                    window.location.href = storeInfo.pageUrl;
                });

                listItem.appendChild(imgElement);
                mainViewList.appendChild(listItem);
            });
        } else {
        	mainViewList.classList.add('noData');
            const noDataMessage = document.createElement('p');
            noDataMessage.textContent = '다녀온 상점이 없어요';
            noDataMessage.style.color = 'gray';
            noDataMessage.style.fontSize = '20px';
            noDataMessage.style.fontWeight = 'bold';
            noDataMessage.style.margin = '0 auto';
            
            mainViewList.appendChild(noDataMessage);
        }

        console.log("Main view script executed.");

       
        const outputElement = document.getElementById('output');
        outputElement.innerHTML = "<p>Visited Stores: " + JSON.stringify(getVisitedStores()) + "</p><br />";
    };
</script>

<style>
    .visited-item {
        margin: 0 15px 20px 15px; /* 상, 우, 하, 좌의 여백 설정 (원하는 크기로 조정) */
    }
</style>


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