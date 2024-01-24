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


    $(document).on("click", ".myQNAPagination", function(e){
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
    });
</script>

<h2>나의 문의 내역</h2>
<c:if test="${!empty list}">
	<c:forEach var="QNA" items="${list}">
		문의 제목 : <a href="/qna/dd?QNAId=${QNA.id}">${QNA.title}</a>
		<br />
		문의 내용 : ${QNA.content}<br />
		문의 작성일 : <fmt:formatDate value="${QNA.regDate}"
				pattern="yyyy-MM-dd HH:mm" /><br />
		<hr />
	</c:forEach>
	<c:if test="${startPage > 10 }">
		<a href="/my/myQNA?pageNum=${startPage - 10}" class="myQNAPagination">이전</a>
	</c:if>
	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
		<a href="#" class="myQNAPagination">${i}</a>
	</c:forEach>
	<c:if test="${endPage < pageCount}">
		<a href="/my/myQNA?pageNum=${startPage + 10}" class="myQNAPagination">다음</a>
	</c:if>
</c:if>

<c:if test = "${empty list}">
문의내용이 없습니다.
</c:if>