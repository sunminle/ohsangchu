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

<style>

.btn-default {background: #75C573;  color: #fff;}

@font-face {
    font-family: 'Dovemayo_wild';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/Dovemayo_wild.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'EF_watermelonSalad';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-EF@1.0/EF_watermelonSalad.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

.proDes {
font-family: 'Dovemayo_wild', sans-serif;
}

h2 {
font-family: 'EF_watermelonSalad', sans-serif;}

.centered-image {
    display: block;
    margin: 0 auto; /* 위아래 여백은 0으로 하고 좌우 여백을 자동으로 설정합니다. */
    width: 50%; /* 이미지의 너비를 조정할 수 있습니다. */
}
p {
font-family: 'EF_watermelonSalad', sans-serif;}
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
   <c:if test="${empty productList and empty storeList and empty hashtagList}">
    <div style="text-align: center;">
        <img src="/resources/images/site/not.gif" width="400px" height="560px alt="검색 결과가 없는 이미지" class="centered-image">
        <h2>검색 결과가 없어요ㅠㅠ..</h2>
    </div>
</c:if>


   <!-- 검색 결과가 있는 경우 -->
	<c:if test="${productList != null}">
    <!-- 각 제품에 대한 정보를 표시 -->
    <div class="row justify-content-around">
    <c:forEach var="product" items="${productList}" varStatus="loop">
        <div class="col-lg-2 col-md-4 col-sm-6 mb-4">
            <div class="pro" onclick="location.href='/product/detail?postNum=${product.id}';">
                <img src="/resources/images/posting/${product.thumnail}" alt="프로필이미지" width="300px" height="300px">
                <div class="proDes">
                    <div class="proTitle">${product.title}</div>
                    <div class="proPrice d-flex justify-content-end"><span></span></div>
                    <div class="proProfile d-flex align-items-center">
                        <div class="proImg">
                            <img src="">
                        </div>
                        <span></span>
                    </div>
                </div>
            </div>
        </div>
         <c:if test="${loop.index % 5 == 4 or loop.last}">
        </div><div class="row justify-content-around">
    </c:if>
    </c:forEach>
</div>
    
            <br />
            
             <!-- 페이징 컨트롤 표시 -->
			<div class="d-flex justify-content-center">
				<div class="btn-group">
			        <c:if test="${currentPage > 1}">
			            <a class="btn btn-default" href="?page=1&searchColumn=1&searchKeyword=${param.searchKeyword}"><<</a>
			            <a class="btn btn-default" href="?page=${currentPage - 1}&searchColumn=1&searchKeyword=${param.searchKeyword}"><</a>
			        </c:if>
			
			        <c:forEach begin="1" end="${pageCount}" varStatus="loop">
			            <a class="btn btn-default" href="?page=${loop.index}&searchColumn=1&searchKeyword=${param.searchKeyword}">${loop.index}</a>
			        </c:forEach>
			
			        <c:if test="${currentPage < pageCount}">
			            <a class="btn btn-default" href="?page=${currentPage + 1}&searchColumn=1&searchKeyword=${param.searchKeyword}">></a>
			            <a class="btn btn-default" href="?page=${pageCount}&searchColumn=1&searchKeyword=${param.searchKeyword}">>></a>
			        </c:if>
			  	</div>
			</div>
		<br />
</c:if>
<c:if test="${storeList != null}">
            <!-- 각 제품에 대한 정보를 표시 -->
            <div class="row justify-content-around">
    <c:forEach var="store" items="${storeList}" varStatus="loop">
        <div class="col-lg-2 col-md-4 col-sm-6 mb-4">
            <div class="pro" onclick="location.href='/product/store?storeNum=${store.id}';">
                <img src="/resources/images/profiles/${store.profile}" alt="프로필이미지" width="300px" height="300px">
                <div class="proDes">
                    <div class="proTitle">${store.storeName}</div>
                    <div class="proPrice d-flex justify-content-end"><span>${store.nickname}</span></div>
                    <div class="proProfile d-flex align-items-center">
                        <div class="proImg">
                            <img src="">
                        </div>
                        <span></span>
                    </div>
                </div>
            </div>
        </div>
         <c:if test="${loop.index % 5 == 4 or loop.last}">
        </div><div class="row justify-content-around">
    </c:if>
    </c:forEach>
</div>
            
            <br />
            
             <!-- 페이징 컨트롤 표시 -->
             <div class="d-flex justify-content-center">
			    <div class="btn-group">
			        <c:if test="${currentPage > 1}">
			            <a class="btn btn-default" href="?page=1&searchColumn=2&searchKeyword=${param.searchKeyword}"><<</a>
			            <a class="btn btn-default" href="?page=${currentPage - 1}&searchColumn=2&searchKeyword=${param.searchKeyword}"><</a>
			        </c:if>
			
			        <c:forEach begin="1" end="${pageCount}" varStatus="loop">
			            <a class="btn btn-default" href="?page=${loop.index}&searchColumn=2&searchKeyword=${param.searchKeyword}">${loop.index}</a>
			        </c:forEach>
			
			        <c:if test="${currentPage < pageCount}">
			            <a class="btn btn-default" href="?page=${currentPage + 1}&searchColumn=2&searchKeyword=${param.searchKeyword}">></a>
			            <a class="btn btn-default" href="?page=${pageCount}&searchColumn=2&searchKeyword=${param.searchKeyword}">>></a>
			        </c:if>
			    </div>
			  </div>
		<br />
</c:if>
<c:if test="${hashtagList != null}">
    <!-- 각 제품에 대한 정보를 표시 -->
    <div class="row justify-content-around">
    <c:forEach var="hashtag" items="${hashtagList}" varStatus="loop">
        <div class="col-lg-2 col-md-4 col-sm-6 mb-4">
            <div class="pro" onclick="location.href='/product/detail?postNum=${hashtag.id}';">
                <img src="/resources/images/posting/${hashtag.thumnail}" alt="프로필이미지" width="300px" height="300px">
                <div class="proDes">
                    <div class="proTitle">${hashtag.title}</div>
                    <div class="proPrice d-flex justify-content-end"><span></span></div>
                    <div class="proProfile d-flex align-items-center">
                        <div class="proImg">
                            
                        </div>
                        <span></span>
                    </div>
                </div>
            </div>
        </div>
         <c:if test="${loop.index % 5 == 4 or loop.last}">
        </div><div class="row justify-content-around">
    </c:if>
    </c:forEach>
</div>
    
            <br />
            
             <!-- 페이징 컨트롤 표시 -->
			<div class="d-flex justify-content-center">
				<div class="btn-group">
			        <c:if test="${currentPage > 1}">
			            <a class="btn btn-default" href="?page=1&searchColumn=3&searchKeyword=${param.searchKeyword}"><<</a>
			            <a class="btn btn-default" href="?page=${currentPage - 1}&searchColumn=3&searchKeyword=${param.searchKeyword}"><</a>
			        </c:if>
			
			        <c:forEach begin="1" end="${pageCount}" varStatus="loop">
			            <a class="btn btn-default" href="?page=${loop.index}&searchColumn=3&searchKeyword=${param.searchKeyword}">${loop.index}</a>
			        </c:forEach>
			
			        <c:if test="${currentPage < pageCount}">
			            <a class="btn btn-default" href="?page=${currentPage + 1}&searchColumn=3&searchKeyword=${param.searchKeyword}">></a>
			            <a class="btn btn-default" href="?page=${pageCount}&searchColumn=3&searchKeyword=${param.searchKeyword}">>></a>
			        </c:if>
			  	</div>
			</div>
		<br />
</c:if>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- /footer -->
	
	
</body>

</html>