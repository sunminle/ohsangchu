<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
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
<link  href="/resources/css/purchase.css" rel="stylesheet">

<title>결제 페이지</title>
</head>

<body>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<div class="containers">
    <div class="headers">
        주문목록
    </div>
    
    <b>${order }</b>

	<form action="/my/orderSuccess" method="post">
		<div class="basket" id="basket">
			<!-- "장바구니 헤더" -->
			<div class="row head">
				<div class="check">선택</div>
				<div class="img">이미지</div>
				<div class="pname">상품명</div>
				<div class="basketprice">가격</div>
				<div class="num">수량</div>
				<div class="sum">합계</div>
				<div class="basketcmd">삭제</div>
			</div>
			<!-- "장바구니 상품 목록" -->
			<div class="row data">
				<div class="check">
					<input type="checkbox" name="buy" value="260" checked="">&nbsp;
				</div>
				<div class="img">
					<img src="./backup/704/img/basket1.jpg" width="60">
				</div>
				<div class="pname">
					<span>찜마마(XJ-92214/3)</span>
				</div>
				<div class="basketprice">
					<input type="hidden" name="p_price" id="p_price1" class="p_price" value="20000">20,000원
				</div>
				<div class="num">
					<!-- "장바구니 수량 변경" -->
					<div class="updown">
						<input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="2"> <span><i class="fas fa-arrow-alt-circle-up up"></i></span> <span><i
							class="fas fa-arrow-alt-circle-down down"
						></i></span>
					</div>
				</div>
				<!-- "장바구니 상품 합계" -->
				<div class="sum">40,000원</div>
				<div class="basketcmd">
					<a href="#" class="abutton">삭제</a>
				</div>
			</div>
		</div>
		<!-- "장바구니 기능 버튼" -->
		<div class="right-align basketrowcmd">
			<a href="#" class="abutton">선택상품삭제</a> <a href="#" class="abutton">장바구니비우기</a>
		</div>
		<!-- "장바구니 전체 합계 정보" -->
		<div class="bigtext right-align sumcount" id="sum_p_num">상품갯수: 4개</div>
		<div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액: 74,200원</div>


		<div id="goorder" class="">
			<div class="clear"></div>
			<div class="buttongroup center-align cmd">
				<a href="#">선택한 상품 주문</a>
			</div>
		</div>

		<div class="form-group">
			<center>주문자 정보</center>
			<br /> <label for="price">주문자 성함</label> <input type="text" id="userName" name="userName" class="input-field" required> <label for="price">이메일</label> <input type="text" id="email"
				name="email" class="input-field" required
			> <label for="price">전화번호</label> <input type="text" id="tel" name="tel" class="input-field" required>

		</div>

		<div class="form-group">
			<center>배송지 정보</center>
			<br /> <label for="price">수령자 성함</label> <input type="text" id="userName" name="userName" class="input-field" required> <label for="price">연락처</label> <input type="text" id="tel"
				name="tel" class="input-field" required
			> <label for="price">주소</label> <input type="text" id="address" name="address" class="input-field" required>

		</div>

		<div class="form-group">
			<center>환불 정보</center>
			<br /> <label for="price">은행 이름</label> <input type="text" id="bankName" name="bankName" class="input-field" required> <label for="price">계좌 번호</label> <input type="text" id="account"
				name="account" class="input-field" required
			>


		</div>
		<center>
			<button type="submit" class="button">주문 하기</button>
		</center>
	</form>
		<form method="post" action="/kakaoPay">
		<input type = "hidden" name = "productName" value = "${productName}">
		<input type = "hidden" name = "quantity" value = "${quantity}">
		<input type = "hidden" name = "deliveryTypeName" value = "${deliveryTypeName}">
		<input type = "hidden" name = "price" value = "${price}">
		<button><img width = "30" height = "30" src = "/resources/images/kakaoPay.png"></button>
	</form>
    
</div>

</body>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</html>