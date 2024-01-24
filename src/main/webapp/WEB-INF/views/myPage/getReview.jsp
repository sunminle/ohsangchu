<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
function paginationClickHandler() {
    // 이 부분에 paginationClickHandler의 로직을 추가
    
    // 스크롤을 페이지 상단으로 이동
    $('html, body').animate({scrollTop: 0}, 'fast');
}


    $(document).on("click", ".getReviewPagination", function(e){
        e.preventDefault();
        var pageNum;
        if ($(this).text() === "이전") {
            pageNum = ${startPage - 10};
        } else if ($(this).text() === "다음") {
            pageNum = ${startPage + 10};
        } else {
            pageNum = $(this).text();
        }
        $(document).off("click", ".getReviewPagination");
        $.ajax({
            url: "/my/getReview?pageNum=" + pageNum,
            success: function(response){
                $("#review").html(response);
                paginationClickHandler();
                $(document).on("click", ".getReviewPagination", paginationClickHandler);
                
            }
        });
    });
</script>
<h2>나에게 쓴 리뷰 목록</h2>
<c:if test="${!empty list}">
	<c:forEach var="getReview" items="${list}">
	상품 이름 : <a href="/product/detail?postNum=${getReview.postingId}">${getReview.title}</a>
		<br />
	리뷰 내용 : ${getReview.content}<br />
	리뷰 별점 : <c:forEach var="point" begin="1" end="${getReview.point}">★</c:forEach><c:if test="${getReview.point % 1 != 0}">☆</c:if>
		<br />
		<c:if test="${!empty getReview.img}">
		리뷰 이미지 <br />
			<img src="/resources/images/review/${getReview.img}">
			<br />
		</c:if>
	작성일 : <fmt:formatDate value="${getReview.regDate}"
			pattern="yyyy-MM-dd HH:mm" />
		<br />
		<input type="button" value="답글" onclick="window.location=">
		<hr>
	</c:forEach>
	<c:if test="${startPage > 10 }">
	<a href="/my/getReview?pageNum=${startPage - 10}" class="getReviewPagination">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		<a href="#" class="getReviewPagination">${i}</a>
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="/my/getReview?pageNum=${startPage + 10}" class="getReviewPagination">다음</a>
	</c:if>
</c:if>

<c:if test="${empty list}">
아직 나에게 쓴 리뷰가 없습니다..!!
</c:if>