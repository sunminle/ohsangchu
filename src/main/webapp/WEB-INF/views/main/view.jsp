<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    
    <title>View Postings</title>
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
 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barriecito&family=Dancing+Script:wght@400..700&display=swap" rel="stylesheet">
  
<link href="/resources/css/view.css" rel="stylesheet">
	<style>

</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<!-- /header -->
    <h2>Postings</h2>
    
    <br />
    
    <div class="posting">
    <h3>${postings[0].categoryName}</h3>
</div>
    
    <br />
    
        <!-- 포스팅 정보 출력 -->
        <div id="newProduct">
    <div id="newProList" class="row justify-content-around">
    <c:forEach var="posting" items="${postings}" varStatus="loop">
        <div class="col-lg-2 col-md-4 col-sm-6 mb-4">
            <div class="pro" onclick="location.href='/product/detail?postNum=${posting.id}';">
                <img src="/resources/images/posting/${posting.thumnail}" alt="프로필이미지" width="300px" height="300px">
                <div class="proDes">
                    <div class="proTitle">${posting.title}</div>
                    <div class="proPrice d-flex justify-content-end"><span></span></div>
                    <div class="proProfile d-flex align-items-center">
                        
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
</div>
        
        <br />
        
         <!-- 페이징 컨트롤 표시 -->
			<div class="d-flex justify-content-center">
				<div class="btn-group">
			        <c:if test="${currentPage > 1}">
			            <a class="btn btn-default" href="?page=1&categoryId=${param.categoryId}"><<</a>
			            <a class="btn btn-default" href="?page=${currentPage - 1}&categoryId=${param.categoryId}"><</a>
			        </c:if>
			
			        <c:forEach begin="1" end="${pageCount}" varStatus="loop">
			            <a class="btn btn-default" href="?page=${loop.index}&categoryId=${param.categoryId}">${loop.index}</a>
			        </c:forEach>
			
			        <c:if test="${currentPage < pageCount}">
			            <a class="btn btn-default" href="?page=${currentPage + 1}&categoryId=${param.categoryId}">></a>
			            <a class="btn btn-default" href="?page=${pageCount}&categoryId=${param.categoryId}">>></a>
			        </c:if>
			  	</div>
			</div>
			
 			<br />
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	<!-- /footer -->	
    
</body>
</html>
