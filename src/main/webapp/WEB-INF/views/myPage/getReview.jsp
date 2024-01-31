<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- bootstrap:css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!-- boot : js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!-- jQuery -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<!-- css -->
<link href="/resources/css/include.css" rel="stylesheet">
<link href="/resources/css/product.css" rel="stylesheet">
<!-- style -->
<link href="/resources/css/addReview.css" rel="stylesheet">
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

    var myModal = document.getElementById('modal_addReviewAnswer')
    myModal.addEventListener('show.bs.modal', function (e) {      
    	console.log(e);
    	var ids = e.relatedTarget.id;
    	var c = $("#"+ids).attr("reviewcount");
    	var reviewId = $("#"+ids).attr("reviewid");
    	if(c > 0){
    		alert("이미 답변을 등록하셨습니다.");
    		e.preventDefault();
    	}
    	else{
    		$("#modal_addReviewAnswer").data('reviewId', reviewId);
    		$("#modal_addReviewAnswer").data('myModal', myModal);
    	}
    });
    
    	
    function openReviewAnswerModal(reviewId,reviewAnswerCount,count) {
        // reviewId를 모달에 전달하거나 필요한 처리를 수행할 수 있습니다.
        // 모달에 reviewId 설정
    	if(reviewAnswerCount > 0){
			alert("이미 답변을 등록하셨습니다.");
			$("#model_"+count).attr("data-bs-target","");
			return false;
		}
		$("#modal_addReviewAnswer").data('reviewId', reviewId);
		$("#modal_addReviewAnswer").data('reviewAnswerCount', reviewAnswerCount);
		console.log("Review ID:", reviewId);
		console.log("reviewAnswerCount:", reviewAnswerCount);
	
    }

</script>
<h2>나에게 쓴 리뷰 목록</h2>
<c:if test="${!empty list}">
	<c:forEach var="getReview" items="${list}" varStatus="i">
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
		<a id="model_${i.count}" data-bs-toggle="modal" data-bs-target="#modal_addReviewAnswer" reviewcount="${getReview.reviewAnswerCount}"  reviewid="${getReview.id}">
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16"><path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/><path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/></svg>
			답글작성
		</a>
									
		<hr>
	</c:forEach>
	<jsp:include page="reviewAnswer.jsp" />
	
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