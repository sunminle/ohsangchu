<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
카카오페이 결제가 정상적으로 완료되었습니다.<br/>
 
결제일시:${info.approved_at}<br/>
주문번호:${info.partner_order_id}<br/>
상품명:${info.item_name}<br/>
상품수량:${info.quantity}<br/>
결제금액:${info.amount.total}<br/>
<button onclick="window.location='/my/myBuyList'">구매목록 바로가기</button>