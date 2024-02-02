<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>

<script>
function paginationClickHandler() {
    // 이 부분에 paginationClickHandler의 로직을 추가
    
    // 스크롤을 페이지 상단으로 이동
    $('html, body').animate({scrollTop: 0}, 'fast');
}


   /*  $(document).on("click", ".myQNAPagination", function(e){
        e.preventDefault();
        var pageNum;
        if ($(this).text() === "이전") {
            pageNum = ${startPage - 10};
        } else if ($(this).text() === "다음") {
            pageNum = ${startPage + 10};
        } else {
            pageNum = $(this).text();
        }
        $(document).off("click", ".myQNAPagination");
        $.ajax({
            url: "/my/myQNA?pageNum=" + pageNum,
            success: function(response){
                $("#modify").html(response);
                paginationClickHandler();
                $(document).on("click", ".myQNAPagination", paginationClickHandler);
                
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
				<h2>나의 문의 내역</h2>
				<c:if test="${!empty list}">
					<c:forEach var="QNA" items="${list}">
						문의 제목 : <a href="/qna/dd?QNAId=${QNA.id}">${QNA.title}</a><br />
						문의 내용 : ${QNA.content}<br />
						문의 작성일 : <fmt:formatDate value="${QNA.regDate}" pattern="yyyy-MM-dd HH:mm" /><br /><hr />
					</c:forEach>
					<c:if test="${startPage > 10 }">
						<a href="/my/myQNA?pageNum=${startPage - 10}" class="myQNAPagination">이전</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="/my/myQNA?pageNum=${i}" class="myQNAPagination">${i}</a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a href="/my/myQNA?pageNum=${startPage + 10}" class="myQNAPagination">다음</a>
					</c:if>
				</c:if>

				<c:if test = "${empty list}">
					문의내용이 없습니다.
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