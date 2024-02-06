<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<!--favicon-->
<link rel="icon" href="/resources/images/site/leaf-solid.png">
<!-- css -->
<link href="/resources/css/include.css" rel="stylesheet">
<!-- bootstrap:css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
}

.containers {
    max-width: 800px;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.headers {
    text-align: center;
    font-size: 24px;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.input-field {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

.button {
    background-color: #4caf50;
    color: white;
    padding: 15px;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.button:hover {
    background-color: #45a049;
}


}
</style>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<div class="containers">
    <div class="headers">
        주문목록
    </div>

    <form action="/my/orderSuccess" method="post">
        <div class="form-group">
            <label for="productName">상품명:${productName}</label>
            
        </div>

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