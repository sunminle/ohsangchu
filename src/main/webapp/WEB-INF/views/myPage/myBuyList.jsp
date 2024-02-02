<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<!-- bootstrap:css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!-- boot : js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!-- jQuery -->
<!-- css -->
<link href="/resources/css/include.css" rel="stylesheet">
<link href="/resources/css/product.css" rel="stylesheet">
<script>
function paginationClickHandler() {
    // 이 부분에 paginationClickHandler의 로직을 추가
    
    // 스크롤을 페이지 상단으로 이동
    $('html, body').animate({scrollTop: 0}, 'fast');
}


   /*  $(document).on("click", ".myBuyListPagination", function(e){
        e.preventDefault();
        var pageNum;
        if ($(this).text() === "이전") {
            pageNum = ${startPage - 10};
        } else if ($(this).text() === "다음") {
            pageNum = ${startPage + 10};
        } else {
            pageNum = $(this).text();
        }
        $(document).off("click", ".myBuyListPagination");
        $.ajax({
            url: "/my/myBuyList?pageNum=" + pageNum,
            success: function(response){
                $("#modify").html(response);
                paginationClickHandler();
                $(document).on("click", ".myBuyListPagination", paginationClickHandler);
                
            }
        });
    }); */
</script>

<!--favicon-->
<link rel="icon" href="/resources/images/site/leaf-solid.png">
<!-- css -->
<link href="/resources/css/myPage.css" rel="stylesheet">
<link href="/resources/css/include.css" rel="stylesheet">
<!-- bootstrap:css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<c:if test="${sessionScope.usersId != null}">
	<center>
		<a style="color: green;">${users.nickname}</a>님의 마이페이지.<br />
		
		<div id="container">
            <div id="buttonContainer">
            	계정 정보<br/>
				<button onclick="window.location='/my/modifyMe'">정보수정</button>
				판매자<br/>
				<button onclick="window.location='/my/modifyStore'">상점정보수정</button>
				<button onclick="window.location='/my/myProduct'">구매자 관리</button>
				<button onclick="window.location='/my/addProduct'">상품등록</button>
				리뷰<br/>
				<button onclick="window.location='/my/reviewAll'">리뷰 관리</button>
				Q&A<br/>
				<button onclick="window.location='/my/myQNA'">문의 내역</button>
				구매자<br/>
				<button onclick="window.location='/my/myBuyList'">구매목록</button>
				<button onclick="window.location='/my/HSList'">찜,구독 목록</button>
				채팅<br/>
				<button id="chattingList">채팅</button>
			</div>
			<div id="modify">
				<h2>구매 목록</h2>
				<c:if test = "${!empty list}">
					<c:forEach var = "post" items = "${list}">
					주문일자 : <fmt:formatDate value="${post.orderDate}" pattern="yyyy-MM-dd HH:mm" /><br/>
					상품명 : <a href = "/product/detail?postNum=${post.id}">${post.title}</a><br/>
					<img style = "width:200px;" src = "/resources/images/posting/${post.thumnail}"><br/>
					<a data-bs-toggle="modal" data-bs-target="#modal_addReview">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16"><path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/><path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/></svg>
					후기작성</a><hr/>
					<input type="hidden" id="postingId" value="${post.id}">
					</c:forEach>
					<jsp:include page="addReview.jsp" />
					<c:if test="${startPage > 10 }">
						<a href="/my/myBuyList?pageNum=${startPage - 10}" class="myBuyListPagination">이전</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="/my/myBuyList?pageNum=${i}" class="myBuyListPagination">${i}</a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a href="/my/myBuyList?pageNum=${startPage + 10}" class="myBuyListPagination">다음</a>
					</c:if>
				</c:if>
				<c:if test = "${empty list}">
					아직 구매한 상품이 없습니다.
				</c:if>
			</div>
		</div>
	</center>
</c:if>

<c:if test="${sessionScope.usersId == null}">
	<script>
		alert("로그인 후 이용가능합니다.");
		window.location = "/users/main";
	</script>
</c:if>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />