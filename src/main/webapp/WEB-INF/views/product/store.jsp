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
<link href="/resources/css/store.css" rel="stylesheet">

<title>상품상세</title>
</head>

<script>
//세션 스토리지에서 방문한 스토어 정보 목록 가져오기
function getVisitedStores() {
    return JSON.parse(sessionStorage.getItem('visitedStores')) || [];
}

// 이미지 URL은 중복돼도 추가, 페이지 URL은 중복되면 삭제하고 추가
function addVisitedStore(imageUrl, pageUrl) {
    const visitedStores = getVisitedStores();
    const storeInfo = { imageUrl, pageUrl };

    // 페이지 URL이 중복되는 값이 세션 스토리지에 있을 경우 삭제
    visitedStores.forEach((store, index) => {
        if (store.pageUrl === pageUrl) {
            visitedStores.splice(index, 1);
        }
    });

    // 최근 6개 유지
    if (visitedStores.length >= 6) {
        visitedStores.pop(); // 배열의 마지막 항목 제거
    }

    // 새로운 항목을 배열 앞에 추가
    visitedStores.unshift(storeInfo);

    sessionStorage.setItem('visitedStores', JSON.stringify(visitedStores));
    console.log("Visited Stores:", visitedStores);
}

// 페이지가 로드될 때 방문한 스토어 정보를 세션 스토리지에 추가
window.onload = function () {
    const storeImageUrl = "/resources/images/profiles/${storeUser.profile}";
    const storePageUrl = window.location.href;
    addVisitedStore(storeImageUrl, storePageUrl);
};


</script>




<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- /header -->
	
	<section>
		<hr>
		<div class="d-flex justify-content-start align-items-center m-3">
			<div id="storeInfo" class="d-flex justify-content-between align-items-center">
				<div class="d-flex justify-content-start align-items-center">
					<div id="storeImg">
						<img src="/resources/images/profiles/${storeUser.profile}" alt="프로필이미지">
					</div>
					<div id="storeDes">
						<div id="storeName" class="d-flex align-items-center" onclick="location.href='#';">
							<b>${store.storeName}</b>
						</div>
						<div><b>${folcnt.following}<span class="m-2 green">팔로잉</span>${folcnt.follower}<span class="m-2 green">팔로워</span></b></div>
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
				<div class="d-flex justify-content-end align-items-start" id="contact">
					<c:choose>
						<%-- 팔로우중 --%>
						<c:when test="${followCheck eq 1}">
							<button class="fu" id="unfollow" data-store-id="${store.id}"><b>언팔로우</b></button>
						</c:when>
						<%-- 로그인 중이 아닐때 --%>
						<c:when test="${followCheck eq 3}">
							<button id="follow" class="fu"  data-store-id="${store.id}"><b>팔로우</b></button>
						</c:when>
						<%-- 팔로우중이 아닐때 --%>
						<c:otherwise>
							<button class="fu" id="follow" data-store-id="${store.id}"><b>팔로우</b></button>
						</c:otherwise>
					</c:choose>
					<button id="message" onclick="location='/chat/doChat?enemyId=${storeUser.id}'"><b>메세지</b></button>
				</div>
			</div>
		</div>

	</section>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- /footer -->
	
</body>

<script>
	$(document).ready(function() {
		
		//////////팔로우버튼
		$(".fu").click(function() {
			
			var uid = '${sessionScope.usersId}';

			if(uid == ''){//로그인 안했을땐 로그인페이지로
				alert("로그인이 필요합니다!");
				window.location.href="/users/main?backURI="+window.location.pathname+window.location.search;	
			}else{//로그인 한 상태라면 팔언팔 동작
				console.log("팔/언");
			
				let storeId = $(this).data('store-id');
				
				//alert(postId);
				$.ajax({
					url:"/store/follow/" + storeId
					, success:function(data) {
						if (data.code == 1) {
							console.log(data.result);
							location.reload(true);
						} else {
							alert(data.errorMessage);	
						}
					}
					, error: function(e) {
						alert("팔로우 에러. 다시 시도해주세요.");
					}
				});
			}
		});
		//////////팔로우버튼
		
	});
</script>

</html>