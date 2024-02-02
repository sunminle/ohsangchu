<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<style>
    table {
        width: 50%;
        border-collapse: collapse;
        margin: 20px auto;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
        position: relative;
        font-size: 14px; /* 테이블 셀의 기본 폰트 크기 설정 */
    }

    th {
        background-color: #f2f2f2;
    }

    .number {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-weight: bold;
        font-size: 14px; /* 숫자의 폰트 크기 설정 */
        color: #555;
    }
</style>
<script>
	/* $(function(){
		$("#modifyInfo").click(function(){
			$.ajax({
				url : "/my/modifyMe",
				cache: false,
				success : function(e){
					$("#modify").html(e);
					console.log("${sessionScope.usersId}");
					console.log("${sessionScope.usersProfile}");
				}
			});
		});
	});
	
	$(function(){
		$("#modifyStoreInfo").click(function(){
			$.ajax({
				url : "/my/modifyStore",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(function(){
		$("#reviewAll").click(function(){
			$.ajax({
				url : "/my/reviewAll",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(function(){
		$("#myQNA").click(function(){
			$.ajax({
				url : "/my/myQNA",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(function(){
		$("#myProduct").click(function(){
			$.ajax({
				url : "/my/myProduct",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(function(){
		$("#myBuyList").click(function(){
			$.ajax({
				url : "/my/myBuyList",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	
	$(function(){
		$("#HS").click(function(){
			$.ajax({
				url : "/my/HSList",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	});
	*/
	$(function(){
		$("#chattingList").click(function(){
			$.ajax({
				url : "/chat/chattingList",
				success : function(e){
					$("#modify").html(e);
				}
			});
		});
	}); 
	
	/* $(document).on("click", "#myProductPagination a", function(e){
	    e.preventDefault();
	    var pageNum = $(this).attr("href").split("pageNum=")[1];
	    $.ajax({
	        url: "/my/myProduct?pageNum=" + pageNum,
	        success: function(e){
	            $("#modify").html(e);
	        }
	    });
	}); */
	
	
	
</script>


<!--favicon-->
<link rel="icon" href="/resources/images/site/leaf-solid.png">
<!-- css -->
<link href="/resources/css/myPage.css" rel="stylesheet">
<link href="/resources/css/include.css" rel="stylesheet">
<!-- bootstrap:css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<c:if test="${sessionScope.usersId != null}">
	<center>
		<a style="color: green;">${users.nickname}</a>님의 마이페이지.<br />
		
		<div id="container">
            <div id="buttonContainer">
            	계정 정보<br/>
				<button onclick="window.location='/my/modifyMe'">정보수정</button>
				판매자<br/>
				<button onclick="window.location='/my/modifyStore'">상점정보수정</button>
				<button onclick="window.location='/my/myProduct'">구매자 관리</button>
				<button onclick="window.location='/my/addProduct'">상품등록</button>
				리뷰<br/>
				<button onclick="window.location='/my/reviewAll'">리뷰 관리</button>
				Q&A<br/>
				<button onclick="window.location='/my/myQNA'">문의 내역</button>
				구매자<br/>
				<button onclick="window.location='/my/myBuyList'">구매목록</button>
				<button onclick="window.location='/my/HSList'">찜,구독 목록</button>
				채팅<br/>
				<button id="chattingList">채팅</button>
			</div>
			<div id="modify">
				<h5>최근주문내역</h5>
				<table>
				<tr>
				<th>썸네일</th>
				<th>포스팅</th>
				<th>주문날짜</th>
				</tr>
				<c:forEach var = "recentList" items = "${recentPaymentList}">
				<tr>
				<td>
				<img src = "/resources/images/posting/${recentList.thumnail}" width = "80">
				</td>
				<td>
				<a href = "/product/detail?postNum=${recentList.id}">${recentList.title}</a>
				</td>
				<td>
				<fmt:formatDate value="${recentList.orderDate}" pattern="yyyy-MM-dd HH:mm" />
				</td>
				<tr/>
				
				</c:forEach>
				</table>
				<br/>
				<br/>
				<a href = "/my/reviewAll">리뷰 관리</a>
				<table border="1">
				<tr>
				<th>나의 리뷰</th>
				<th>받은 리뷰</th>
				</tr>
				<tr>
				<td><span class="number">${myReviewCount}</span></td>
				<td><span class="number">${getReviewCount}</span></td>
				</tr>
				</table>
			</div>
		</div>
	</center>
</c:if>

<c:if test="${sessionScope.usersId == null}">
	<script>
		alert("로그인 후 이용가능합니다.");
		window.location = "/users/main";
	</script>
</c:if>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />