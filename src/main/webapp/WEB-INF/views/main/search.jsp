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
        #newProList {
            float: left;
           
        }

        .pagination {
            display: flex;
            list-style: none;
            padding: 0;
        }

        .page-item {
            margin: 0 5px;
        }

        .page-link {
            text-decoration: none;
            color: #007bff;
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
<br />

    <!-- 검색 결과가 비어있는 경우 -->
   <c:if test="${empty productList}">
    <p>검색 결과가 없어요ㅠㅠ..</p>
</c:if>


   <!-- 검색 결과가 있는 경우 -->
<c:if test="${not empty productList}">
   
            <!-- 각 제품에 대한 정보를 표시 -->
            <c:forEach var="product" items="${productList}">

<div id="newProList" class="card" style="width: 18rem;">
  <!-- <img src="${product.IMG_URL}" class="card-img-top" alt="..."> -->
  <div class="child" onclick="location.href='/product/detail?postNum=${product.postingId}';">
    <h5 class="card-title">${product.productName}</h5>
    <p class="card-text">${product.price} 원</p>
  </div>
  <ul class="list-group list-group-flush" >
    <li class="list-group-item">${product.storeName}</li>
    <li class="list-group-item">${product.content}</li>
    <li class="list-group-item">${product.title}</</li>
  </ul>
 
</div>



            </c:forEach>
           
             <!-- 페이징 컨트롤 표시 -->

<div class="position-absolute bottom-0 start-50 translate-middle-x">
    <ul class="pagination">
        <c:if test="${currentPage > 1}">
            <li><a href="?page=1&searchKeyword=${param.searchKeyword}">처음</a></li>
            <li><a href="?page=${currentPage - 1}&searchKeyword=${param.searchKeyword}">이전</a></li>
        </c:if>

        <c:forEach begin="1" end="${pageCount}" varStatus="loop">
            <li><a href="?page=${loop.index}&searchKeyword=${param.searchKeyword}">${loop.index}</a></li>
        </c:forEach>

        <c:if test="${currentPage < pageCount}">
            <li><a href="?page=${currentPage + 1}&searchKeyword=${param.searchKeyword}">다음</a></li>
            <li><a href="?page=${pageCount}&searchKeyword=${param.searchKeyword}">마지막</a></li>
        </c:if>
    </ul>
</div>



       
       
</c:if>

</body>
</html>
