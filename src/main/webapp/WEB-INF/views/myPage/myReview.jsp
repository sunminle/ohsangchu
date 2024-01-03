<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
<h2> 내가 쓴 리뷰 목록</h2>
<c:if test="${!empty list}">
<c:forEach var = "review" items = "${list}">
	상품 이름 : <a href = "/product/productDetail?id=${review.productId}">${review.productName}</a><br/>
	리뷰 내용 : ${review.content}<br/>
	리뷰 별점 : <c:forEach var = "point" begin = "1" end = "${review.point}" >★</c:forEach><c:if test="${review.point % 1 != 0}">☆</c:if><br/>
	<c:if test="${!empty review.img}">
		리뷰 이미지 <br/>
		<img src = "/resources/images/review/${review.img}"><br/>
	</c:if>
	작성일 : <fmt:formatDate value = "${review.regDate}" pattern="yyyy-MM-dd HH:mm"/><br/>
	<input type = "button" value = "수정" onclick = "window.location='/my/myReviewUpdate?reviewNum=${review.id}'">
	<input type = "button" value = "삭제" onclick = "deleteChk(${review.id});">
	<hr>
</c:forEach>
</c:if>

<c:if test="${empty list}">
아직 작성한 리뷰가 없습니다..!!
</c:if>
