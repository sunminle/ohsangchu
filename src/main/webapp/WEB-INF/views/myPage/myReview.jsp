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
</script>
<h2>내가 쓴 리뷰 목록</h2>
<c:if test="${!empty myReviewList}">
	<c:forEach var="myReview" items="${myReviewList}">
	상품 이름 : <a href="/product/detail?id=${myReview.productId}">${myReview.title}</a>
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
		<input type="button" value="수정"
			onclick="window.location='/my/myReviewUpdate?reviewNum=${myReview.id}'">
		<input type="button" value="삭제" onclick="deleteChk(${myReview.id});">
		<hr>
	</c:forEach>
</c:if>

<c:if test="${empty myReviewList}">
아직 작성한 리뷰가 없습니다..!!
</c:if>
