<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Search Results</title>
    
    <!-- bootstrap:css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!-- boot : js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<!--favicon-->
<link rel="icon" href="/resources/images/site/leaf-solid.png">
<!-- jQuery -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<!-- css -->
<link href="/resources/css/include.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">

<style>

#newProList{
    float: left;
}
</style>
</head>
<body>
	
	<!-- header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- /header -->
</head>
<body>
    <h2>검색 결과 <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
</svg></h2>

    <!-- 검색 결과가 비어있는 경우 -->
   <c:if test="${empty productList}">
    <p>검색 결과가 없어요ㅠㅠ..</p>
</c:if>


   <!-- 검색 결과가 있는 경우 -->
<c:if test="${not empty productList}">
   
            <!-- 각 제품에 대한 정보를 표시 -->
            <c:forEach var="product" items="${productList}">
            <div id="newProduct" class="parent">
			<span class="bold"><b class="green"></b></span>
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmarks-fill" viewBox="0 0 16 16">
  <path d="M2 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L7 13.101l-4.223 2.815A.5.5 0 0 1 2 15.5V4z"/>
  <path d="M4.268 1A2 2 0 0 1 6 0h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L13 13.768V2a1 1 0 0 0-1-1H4.268z"/>
</svg>
			<div id="newProList" class="d-flex justify-content-start">
				<div class="child" onclick="location.href='/product/detail';">
					
					<div class="proDes">
						<div class="proTitle">${product.productName}</div>
						<div class="proPrice d-flex justify-content-end"><span>${product.price} 원</span></div>
						<div class="proProfile d-flex align-items-center">
							<div class="proImg">
								<img src="${product.IMG_URL}" />
							</div>
							<span>${product.storeName}</span>
						</div>
					</div>
				</div>
				</div>
				
				
                
            </c:forEach>
        
</c:if>

</body>
</html>
