<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<center>
<img src = "/resources/images/orderComplete.png" width = "150" height = "150"><br/>
주문이 완료되었습니다!<br/>
주문목록에서 결제를 진행해주세요.
</center>
${paymentDTO} <hr/>
${paymentEtcDTO}<hr/>
${paymentProductDTO}
<jsp:include page="/WEB-INF/views/include/footer.jsp" />