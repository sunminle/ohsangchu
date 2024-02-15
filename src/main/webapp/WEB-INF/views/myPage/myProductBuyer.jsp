<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/resources/js/jquery-3.7.1.min.js"></script>

<script>
$(document).ready(function() {
    <c:forEach var="payment" items="${paymentList}" varStatus="i">
        processOrder('${payment.id}', ${i.count});
    </c:forEach>
});

function processOrder(paymentId, index) {
    var formData = new FormData();
    formData.append("paymentId", paymentId);
    console.log(paymentId);
     $.ajax({
        type: "POST",
        url: '/my/myProductBuyerEtc',
        contentType: false,
        processData: false,
        data: formData,
        success: function(data) {
            for (var i = 0; i < data.length; i++) {
                var paymentEtc = data[i]; 
                console.log(paymentEtc);
                	$("#accountHolder_" + index).append(paymentEtc.accountHolder);
            }
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
    }); 
}
	
	
	
	
	var postingId = ${posting.id};
	var lastAjaxRequest
	$(function(){
		$("#orderType").change(function(){
			var orderType = $(this).val();
			if (lastAjaxRequest && lastAjaxRequest.readyState !== 4) {
				lastAjaxRequest.abort();
			}
			lastAjaxRequest = $.ajax({
				url : "/my/myProductBuyer?postingId="+postingId+"&orderType="+orderType,
				success : function(e){
					$("#buyer").html(e);
				},
				async: true
			});
		});
	});
	
	
	$(document).off("click", "button[id^='update_']").on("click", "button[id^='update_']", function () {
	    var buttonId = $(this).attr('id');
	    var rowIndex = buttonId.split('_')[1];
	    var selectedStatus = $("select[name='paymentStatus_" + rowIndex + "']").val();
	    var paymentId = $("input[name='paymentId_" + rowIndex + "']").val();
	    console.log("Selected Status on button click: " + selectedStatus + "paymentid :"+paymentId);
	    
	    $(this).prop('disabled', true);
	     $.ajax({
	        url: "/my/updateMyProductBuyer",
	        method: "POST",
	        data: {
	        	paymentId: paymentId,
	            selectedStatus: selectedStatus
	        },
	        success: function (response) {
	            alert("결제 상태가 업데이트되었습니다.");
	        },
	        error: function (error) {
	            console.error("오류 발생:", error);
	        },
	        complete: function () {
	            $(this).prop('disabled', false);
	        }
	    }); 
	    	    
	});
	
	
</script>

<div id="buyer">
	<input type="button" value="뒤로가기" onclick="history.go(-1)"> <a
		href="/product/detail?postNum=${posting.id}">${posting.title}</a>
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
					<th>환불계좌명</th>
					<th>주소</th>
					<th>입금방식</th>
					<th>주문일자</th>
					<th>주문상태</th>
					<th>수정</th>
					<th>무통장입금여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="payment" items="${paymentList}" varStatus="i">
					<tr>
						<td align="center">${i.index+1}</td>
						<td>${payment.nickname}</td>
						<td id = "accountHolder_${i.count}"></td>
						<td>${payment.address}</td>
						<td>${payment.paymentType}
						<input type="hidden" name = "paymentId_${i.count}" value = "${payment.id}">
						</td>
						<td><fmt:formatDate value="${payment.orderDate}"
								pattern="yyyy-MM-dd HH:mm" /></td>
						<c:if test="${payment.status == 0}">
							<td>
								<select name = "paymentStatus_${i.count}">
									<option value = "0">입금대기</option>
									<option value = "1">결재완료</option>
									<option value = "2">배송준비</option>
									<option value = "3">배송완료</option>
								</select> 
							</td>
						</c:if>
						<c:if test="${payment.status == 1}">
							<td>
								<select name = "paymentStatus_${i.count}">
									<option value = "1">결재완료</option>
									<option value = "0">입금대기</option>
									<option value = "2">배송준비</option>
									<option value = "3">배송완료</option>
								</select> 
							</td>
						</c:if>
						<c:if test="${payment.status == 2}">
							<td>
								<select name = "paymentStatus_${i.count}">
									<option value = "2">배송준비</option>
									<option value = "0">입금대기</option>
									<option value = "1">결재완료</option>
									<option value = "3">배송완료</option>
								</select> 
							</td>
						</c:if>
						<c:if test="${payment.status == 3}">
							<td>
								<select name = "paymentStatus_${i.count}">
									<option value = "3">배송완료</option>
									<option value = "0">입금대기</option>
									<option value = "1">결재완료</option>
									<option value = "2">배송준비</option>
								</select> 
							</td>
						</c:if>
						<td>
							<button id = "update_${i.count}">수정하기</button>
						</td>
						<td align = "center">
							<c:if test="${payment.status == 0 && payment.paymentType == '무통장 입금'}">
							x
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>

	<c:if test="${empty paymentList}">
		<h2>아직 구매자가 없습니다.</h2>
	</c:if>


</div>