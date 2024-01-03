<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Search Results</title>
</head>
<body>
    <h2>검색 결과</h2>

    <!-- 검색 결과가 비어있는 경우 -->
   <c:if test="${empty productList}">
    <p>검색 결과가 없어요ㅠㅠ..</p>
</c:if>


   <!-- 검색 결과가 있는 경우 -->
<c:if test="${not empty productList}">
    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <!-- 기타 필요한 필드들 추가 -->
            </tr>
        </thead>
        <tbody>
            <!-- 각 제품에 대한 정보를 표시 -->
            <c:forEach var="product" items="${productList}">
                <tr>
                    <td>${product.productName}</td>
                    <td>${product.price}</td>
                    <td>${product.storeName}</td>
                    
                    <!-- 기타 필요한 필드들 추가 -->
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

</body>
</html>
