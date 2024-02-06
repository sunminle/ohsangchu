<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Notice Detail</title>
</head>
<body>

<h2>공지사항 상세 페이지</h2>

<!-- Thymeleaf 템플릿을 사용하여 notice 객체의 title과 content를 출력 -->
<p th:text="${notice.title}">${notice.title}</p>
<p th:text="${notice.content}">${notice.content}</p>

</body>
</html>