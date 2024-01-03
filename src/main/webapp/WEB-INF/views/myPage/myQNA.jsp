<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2>나의 문의 내역</h2>

<c:forEach var="QNA" items="${QNAList}">
	문의 제목 : <a href="/qna/dd?QNAId=${QNA.id}">${QNA.title}</a>
	<br />
	문의 내용 : ${QNA.content}<br />
	문의 작성일 : <fmt:formatDate value="${QNA.regDate}"
			pattern="yyyy-MM-dd HH:mm" /><br />
	<hr />
</c:forEach>