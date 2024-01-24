<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function paginationClickHandler() {
    // 이 부분에 paginationClickHandler의 로직을 추가
    
    // 스크롤을 페이지 상단으로 이동
    $('html, body').animate({scrollTop: 0}, 'fast');
}


    $(document).on("click", ".myHeartListPagination", function(e){
        e.preventDefault();
        var pageNum;
        if ($(this).text() === "이전") {
            pageNum = ${startPage - 10};
        } else if ($(this).text() === "다음") {
            pageNum = ${startPage + 10};
        } else {
            pageNum = $(this).text();
        }
        $(document).off("click", ".myHeartListPagination");
        $.ajax({
            url: "/my/heartList?pageNum=" + pageNum,
            success: function(response){
                $("#HSList").html(response);
                paginationClickHandler();
                $(document).on("click", ".myHeartListPagination", paginationClickHandler);
                
            }
        });
    });
</script>

<h2>찜상품 목록</h2>
<c:if test = "${!empty list}">
	<c:forEach var = "posting" items = "${list}">
	상품명 : <a href = "/product/detail?postNum=${posting.id}">${posting.title}</a><br/>
	<img style = "width:200px;" src = "/resources/images/posting/${posting.thumnail}">
	<hr/>
	</c:forEach>
	<c:if test="${startPage > 10 }">
		<a href="/my/heartList?pageNum=${startPage - 10}" class="myHeartListPagination">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		<a href="#" class="myHeartListPagination">${i}</a>
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="/my/heartList?pageNum=${startPage + 10}" class="myHeartListPagination">다음</a>
	</c:if>
</c:if>

<c:if test = "${empty list}">
찜한 상품이 없습니다.
</c:if>