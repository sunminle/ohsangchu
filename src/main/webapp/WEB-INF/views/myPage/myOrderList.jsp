<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<script>
function paginationClickHandler() {
    // 이 부분에 paginationClickHandler의 로직을 추가
    
    // 스크롤을 페이지 상단으로 이동
    $('html, body').animate({scrollTop: 0}, 'fast');
}

$(document).ready(function() {
    <c:forEach var="post" items="${list}" varStatus="i">
        processOrder('${post.paymentId}', ${i.count});
    </c:forEach>
});

function processOrder(paymentId, index) {
    var formData = new FormData();
    formData.append("paymentId", paymentId);
    
    $.ajax({
        type: "POST",
        url: '/my/myOrderProductList',
        contentType: false,
        processData: false,
        data: formData,
        success: function(data) {
            for (var i = 0; i < data.length; i++) {
                var product = data[i]; 
                console.log(product);
                if(i === data.length - 1){
                	$("#productList_" + index).append("상품명: " + product.productName + ", 구매수량: " + product.amount + ", Price: " + product.amount*product.price);
                }
                else{
                	$("#productList_" + index).append("상품명: " + product.productName + ", 구매수량: " + product.amount + ", Price: " + product.amount*product.price + "<br>");
                }
            }
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}

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
		<br/>
		<a href = "/my/myPageMain" style="color: green;">${users.nickname}</a>님의 마이페이지.<br />
		
		<div id="container">
            <div id="buttonContainer">
            	🔒계정 정보🔒<br/>
				<button onclick="window.location='/my/modifyMe'">정보수정</button>
				👨‍💼판매자👨‍💼<br/>
				<button onclick="window.location='/my/modifyStore'">상점정보수정</button>
				<button onclick="window.location='/my/myProduct'">구매자 관리</button>
				<button onclick="window.location='/my/addProduct'">상품등록</button>
				🗨리뷰🗨<br/>
				<button onclick="window.location='/my/reviewAll'">리뷰 관리</button>
				❓Q&A❓<br/>
				<button onclick="window.location='/my/myQNA'">문의 내역</button>
				🙍‍♂️구매자🙍‍♂️<br/>
				<button onclick="window.location='/my/myOrderList'">주문목록</button>
				<button onclick="window.location='/my/myBuyList'">구매목록</button>
				<button onclick="window.location='/my/HSList'">찜,구독 목록</button>
				채팅<br/>
				<button id="chattingList">채팅</button>
			</div>
			<div id="modify">
				<h2>주문 목록</h2>
				<c:if test = "${!empty list}">
					<c:forEach var = "post" items = "${list}" varStatus="i">
					주문일자 : <fmt:formatDate value="${post.orderDate}" pattern="yyyy-MM-dd HH:mm" /><br/>
					포스팅명 : <a href = "/product/detail?postNum=${post.id}">${post.title}</a><br/>
					<img style = "width:200px;" src = "/resources/images/posting/${post.thumnail}"><br/>
					<c:set var = "paymentId" value="${post.paymentId}"></c:set>
					<div id = "productList_${i.count}"></div>
					<c:if test="${post.paymentType == '무통장 입금' }">
					무통장 입금
					</c:if>
					<c:if test="${post.paymentType == '카카오 페이' }">
						<form method="post" action = "/kakaoPay" >
							<input type = "hidden" name = "paymentId" value = "${post.paymentId}">
							<button><img width = "30" height = "30" src = "/resources/images/kakaoPay.png"></button>
						</form>
					</c:if>
					<hr/>
					</c:forEach>
					<c:if test="${startPage > 10 }">
						<a href="/my/myOrderList?pageNum=${startPage - 10}" class="myOrderListPagination">이전</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<a href="/my/myOrderList?pageNum=${i}" class="myOrderListPagination">${i}</a>
					</c:forEach>
					<c:if test="${endPage < pageCount}">
						<a href="/my/myOrderList?pageNum=${startPage + 10}" class="myOrderListPagination">다음</a>
					</c:if>
				</c:if>
				<c:if test = "${empty list}">
					아직 구매한 상품이 없습니다.
				</c:if>
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