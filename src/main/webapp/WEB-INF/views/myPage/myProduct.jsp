<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script>
function paginationClickHandler() {
    // 이 부분에 paginationClickHandler의 로직을 추가
    
    // 스크롤을 페이지 상단으로 이동
    $('html, body').animate({scrollTop: 0}, 'fast');
}


    $(document).on("click", ".myProductPagination", function(e){
        e.preventDefault();
        var pageNum;
        if ($(this).text() === "이전") {
            pageNum = ${startPage - 10};
        } else if ($(this).text() === "다음") {
            pageNum = ${startPage + 10};
        } else {
            pageNum = $(this).text();
        }
        $(document).off("click", ".myProductPagination");
        $.ajax({
            url: "/my/myProduct?pageNum=" + pageNum,
            success: function(response){
                $("#modify").html(response);
                paginationClickHandler();
                $(document).on("click", ".myProductPagination", paginationClickHandler);
                
            }
        });
    });
    
  
    
</script>

<h2>판매중 상품</h2>

<c:if test="${count == 0}">
	<h2>판매중인 상품이 없습니다.</h2>
</c:if>


<c:if test="${count > 0}">
	<c:forEach var="posting" items="${list}">
		상품이름 : <a href="/my/myProductBuyer?postingId=${posting.id}">${posting.title}</a>
		<br />
		<img src="/resources/images/posting/${posting.thumnail}" width="360"
			height="270">
		<br />
		<hr />
	</c:forEach>
	<c:if test="${startPage > 10 }">
	<a href="/my/myProduct?pageNum=${startPage - 10}" class="myProductPagination">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		<a href="#" class="myProductPagination">${i}</a>
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="/my/myProduct?pageNum=${startPage + 10}" class="myProductPagination">다음</a>
	</c:if>
</c:if>


