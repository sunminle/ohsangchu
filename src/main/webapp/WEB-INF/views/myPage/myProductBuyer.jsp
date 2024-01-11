<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/resources/js/jquery-3.7.1.min.js"></script>

<script>
	var postingId = ${posting.id};

	$(function(){
		$("#orderType").change(function(){
			var orderType = $(this).val();
			$.ajax({
				url : "/my/myProductBuyer?postingId="+postingId+"&orderType="+orderType,
				success : function(e){
					$("#buyer").html(e);
				}
			});
		});
	});
</script>

<div id="buyer">
	<input type="button" value="뒤로가기" onclick="history.go(-1)"> <a
		href="/product/productDetail?postingId=${posting.id}">${posting.title}</a>
	구매자 목록 <br />


	<c:if test="${!empty paymentList}">
		<p style="margin-left: 700px;">
			정렬방식 <select id=orderType>
				<option value="idDESC" ${orderType == 'idDESC' ? 'selected' : ''}>최신순</option>
				<option value="idASC" ${orderType == 'idASC' ? 'selected' : ''}>오래된순</option>
				<option value="status" ${orderType == 'status' ? 'selected' : ''}>주문상태</option>
				<option value="paymentType"
					${orderType == 'paymentType' ? 'selected' : ''}>입금방식</option>
			</select>
		</p>
		<table border="1">
			<thead>
				<tr>
					<th>순번</th>
					<th>닉네임</th>
					<th>수량</th>
					<th>주소</th>
					<th>입금방식</th>
					<th>주문상태</th>
					<th>주문일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="payment" items="${paymentList}" varStatus="i">
					<tr>
						<td align="center">${i.index+1}</td>
						<td>${payment.nickname}</td>
						<td align="center">${payment.amount}</td>
						<td>${payment.address}</td>
						<td>${payment.paymentType}</td>
						<c:if test="${payment.status == 0}">
							<td>입금대기</td>
						</c:if>
						<c:if test="${payment.status == 1}">
							<td>결재완료</td>
						</c:if>
						<c:if test="${payment.status == 2}">
							<td>배송준비</td>
						</c:if>
						<c:if test="${payment.status == 3}">
							<td>배송완료</td>
						</c:if>

						<td><fmt:formatDate value="${payment.orderDate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

	<c:if test="${empty paymentList}">
		<h2>아직 구매자가 없습니다.</h2>
	</c:if>


</div>