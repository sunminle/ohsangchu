<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- view.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Postings</title>
</head>
<body>
    <h1>Postings</h1>
    <ul>
        <!-- 포스팅 정보 출력 -->
        <c:forEach items="${postings}" var="posting">
        <div class="pro" onclick="location.href='/product/detail?postNum=${posting.id}';">
            <li>
                <h2>${posting.title}</h2>
                <img src="/resources/images/posting/${posting.thumnail}" alt="프로필이미지" width="300px" height="300px">
            </li>
            </div>
        </c:forEach>
    </ul>
</body>
</html>
