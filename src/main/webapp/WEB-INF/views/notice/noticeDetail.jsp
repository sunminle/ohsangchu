<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세 페이지</title>
</head>
<body>

<h2>공지사항 상세 페이지</h2>

<c:out value="${notice.title}"/>
<br>
<c:out value="${notice.content}"/>

</body>
</html>