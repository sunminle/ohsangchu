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

    <form action="/my/orderSuccess" method="post">
        <div class="form-group">
            <label for="productName">상품명:${productName}</label>
            
        </div>

		<b>으음 : ${order }</b>

        <div class="form-group">
            <label for="quantity">수량:${quantity}</label>
        </div>

        <div class="form-group">
            <label for="deliveryTypeName">배송 방법:${deliveryTypeName}</label>
        </div>

        <div class="form-group">
            <label for="price">가격:${price}원</label>
        </div>
        
		<div class="form-group">
			<center>주문자 정보</center><br/>
            <label for="price">주문자 성함</label>
            <input type="text" id="userName" name="userName" class="input-field" required>
            
            <label for="price">이메일</label>
            <input type="text" id="email" name="email" class="input-field" required>
            
            <label for="price">전화번호</label>
            <input type="text" id="tel" name="tel" class="input-field" required>
            
        </div>
        
        <div class="form-group">
			<center>배송지 정보</center><br/>
            <label for="price">수령자 성함</label>
            <input type="text" id="userName" name="userName" class="input-field" required>
            
            <label for="price">연락처</label>
            <input type="text" id="tel" name="tel" class="input-field" required>
            
            <label for="price">주소</label>
            <input type="text" id="address" name="address" class="input-field" required>
            
        </div>
        
        <div class="form-group">
			<center>환불 정보</center><br/>
            <label for="price">은행 이름</label>
            <input type="text" id="bankName" name="bankName" class="input-field" required>
            
            <label for="price">계좌 번호</label>
            <input type="text" id="account" name="account" class="input-field" required>
            
            
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