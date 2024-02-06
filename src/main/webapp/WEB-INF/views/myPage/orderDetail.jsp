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



</style>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 페이지</title>
</head>
<body>

<div class="containers">
    <div class="headers">
        주문목록
    </div>

    <form action="/my/orderSuccess" method="post">
        <div class="form-group">
            <label for="productName">상품명:${productName}</label>
            <input type = "hidden" name = "productName" value = "${productName}">
        </div>

        <div class="form-group">
            <label for="quantity">수량:${quantity}</label>
            <input type = "hidden" name = "quantity" value = "${quantity}">
        </div>

        <div class="form-group">
            <label for="deliveryTypeName">배송 방법:${deliveryTypeName}</label>
        </div>

        <div class="form-group">
            <label for="price">가격:${price}원</label>
        </div>
        
		
        
        <div class="form-group">
			<center>배송지 정보</center><br/>
            <label for="getterName">수령자 성함</label>
            <input type="text" id="getterName" name="getterName" class="input-field" required>
            
            <label for="getterTel">연락처</label>
            <input type="text" id="getterTel" name="getterTel" class="input-field" required>
            
            <label for="sample6_postcode">우편번호</label>
		    <input type="text" id="sample6_postcode" placeholder="우편번호" class="input-field">
		    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		    <label for="sample6_address">주소</label>
		    <input type="text" id="sample6_address" placeholder="주소" class="input-field" name = "address1"><br>
		    <label for="sample6_detailAddress">상세주소</label>
		    <input type="text" id="sample6_detailAddress" placeholder="상세주소" class="input-field" name = "address2">
					
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
            
        </div>
        
        <div class="form-group">
			<center>환불 정보</center><br/>
            <label for="bankName">은행 이름</label>
            <input type="text" id="bankName" name="bankName" class="input-field" required>
            
            <label for="account">계좌 번호</label>
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