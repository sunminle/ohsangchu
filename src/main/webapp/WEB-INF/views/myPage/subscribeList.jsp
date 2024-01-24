<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function paginationClickHandler() {
    // 이 부분에 paginationClickHandler의 로직을 추가
    
    // 스크롤을 페이지 상단으로 이동
    $('html, body').animate({scrollTop: 0}, 'fast');
}


    $(document).on("click", ".mySubscribeListPagination", function(e){
        e.preventDefault();
        var pageNum;
        if ($(this).text() === "이전") {
            pageNum = ${startPage - 10};
        } else if ($(this).text() === "다음") {
            pageNum = ${startPage + 10};
        } else {
            pageNum = $(this).text();
        }
        $(document).off("click", ".mySubscribeListPagination");
        $.ajax({
            url: "/my/subscribeList?pageNum=" + pageNum,
            success: function(response){
                $("#HSList").html(response);
                paginationClickHandler();
                $(document).on("click", ".mySubscribeListPagination", paginationClickHandler);
                
            }
        });
    });
</script>

<h2>구독상점 목록</h2>
<c:if test = "${!empty list}">
	<c:forEach var = "store" items = "${list}">
	상점이름 : <a href = "/product/store?storeNum=${store.id}">${store.storeName}</a>
	<hr>
	</c:forEach>
	<c:if test="${startPage > 10 }">
		<a href="/my/subscribeList?pageNum=${startPage - 10}" class="mySubscribeListPagination">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		<a href="#" class="mySubscribeListPagination">${i}</a>
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="/my/subscribeList?pageNum=${startPage + 10}" class="mySubscribeListPagination">다음</a>
	</c:if>
</c:if>

<c:if test = "${empty list}">
구독한 상점이 없습니다.
</c:if>
