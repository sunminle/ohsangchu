<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function deleteChk(reviewNum){
		var result = confirm("리뷰를 삭제하시겠습니까?\n(리뷰를 삭제하면 다시 작성이 불가능합니다.)");
        if (result) {
    			$.ajax({
    				url : "/my/myReviewDelete?reviewNum="+reviewNum,
    				success : function(e){
    					alert("리뷰가 삭제되었습니다.");
    			        location.reload();
    				}
    			});
        } else {
            alert("리뷰 삭제가 취소되었습니다.");
        }
	};
	
	function paginationClickHandler() {
	    // 이 부분에 paginationClickHandler의 로직을 추가
	    
	    // 스크롤을 페이지 상단으로 이동
	    $('html, body').animate({scrollTop: 0}, 'fast');
	}


	    $(document).on("click", ".myReviewPagination", function(e){
	        e.preventDefault();
	        var pageNum;
	        if ($(this).text() === "이전") {
	            pageNum = ${startPage - 10};
	        } else if ($(this).text() === "다음") {
	            pageNum = ${startPage + 10};
	        } else {
	            pageNum = $(this).text();
	        }
	        $(document).off("click", ".myReviewPagination");
	        $.ajax({
	            url: "/my/myReview?pageNum=" + pageNum,
	            success: function(response){
	                $("#review").html(response);
	                paginationClickHandler();
	                $(document).on("click", ".myReviewPagination", paginationClickHandler);
	                
	            }
	        });
	    });
</script>
<h2>내가 쓴 리뷰 목록</h2>
<c:if test="${!empty list}">
	<c:forEach var="myReview" items="${list}">
		상품 이름 : <a href="/product/detail?postNum=${myReview.postingId}">${myReview.title}</a>
		<br />
		리뷰 내용 : ${myReview.content}<br />
		리뷰 별점 : <c:forEach var="point" begin="1" end="${myReview.point}">★</c:forEach><c:if test="${myReview.point % 1 != 0}">☆</c:if>
		<br />
			<c:if test="${!empty myReview.img}">
				리뷰 이미지 <br />
				<img src="/resources/images/review/${myReview.img}">
				<br />
			</c:if>
		작성일 : <fmt:formatDate value="${myReview.regDate}"
				pattern="yyyy-MM-dd HH:mm" />
		<br />
		<input type="button" value="삭제" onclick="deleteChk(${myReview.id});">
		<hr>
	</c:forEach>
	<c:if test="${startPage > 10 }">
		<a href="/my/myReview?pageNum=${startPage - 10}" class="myReviewPagination">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		<a href="#" class="myReviewPagination">${i}</a>
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="/my/myReview?pageNum=${startPage + 10}" class="myReviewPagination">다음</a>
	</c:if>
</c:if>

<c:if test="${empty list}">
아직 작성한 리뷰가 없습니다..!!
</c:if>
