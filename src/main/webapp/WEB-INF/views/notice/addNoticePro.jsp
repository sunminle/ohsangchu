<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
<c:if test="${boolean addNoticePro == true}">
    
<script>
	alert("공지사항이 등록되었습니다.");
	
	 location.href = "<c:url value='notice/noticeboard'/>"; // 공지메인페이지로
</script>

</c:if>