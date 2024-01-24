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


    $(document).on("click", ".myBuyListPagination", function(e){
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
    });
</script>

<h2>구매 목록</h2>
<c:if test = "${!empty list}">

	<c:forEach var = "posting" items = "${list}">
	주문일자 : <fmt:formatDate value="${posting.orderDate}"
			pattern="yyyy-MM-dd HH:mm" /><br/>
	상품명 : <a href = "/product/detail?postNum=${posting.id}">${posting.title}</a><br/>
	<img style = "width:200px;" src = "/resources/images/posting/${posting.thumnail}">
	<hr/>
	</c:forEach>
	<c:if test="${startPage > 10 }">
		<a href="/my/myBuyList?pageNum=${startPage - 10}" class="myBuyListPagination">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		<a href="#" class="myBuyListPagination">${i}</a>
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="/my/myBuyList?pageNum=${startPage + 10}" class="myBuyListPagination">다음</a>
	</c:if>
</c:if>

<c:if test = "${empty list}">
아직 구매한 상품이 없습니다.
</c:if>