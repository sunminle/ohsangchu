<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2>구매 목록</h2>
<c:if test = "${!empty productList and !empty imgList}">
<c:set var = "firstImg" value = "false"/>
<c:forEach var = "product" items = "${productList}">
주문일자 : <fmt:formatDate value="${product.orderDate}"
			pattern="yyyy-MM-dd HH:mm" /><br/>
상품명 : <a href = "/product/detail?productId=${product.id}">${product.productName}</a><br/>
<c:forEach var = "img" items = "${imgList}">
<c:if test="${img.productId == product.id and firstImg == false}">
<c:set var = "firstImg" value = "true"/>
<img style = "width:200px;" src = "/resources/images/product/${img.img_URL}">
</c:if>
</c:forEach>
<c:if test = "${firstImg == false}">
<img style = "width:200px;" src = "/resources/images/product/notImage.jpg">
</c:if>
<c:set var = "firstImg" value = "false"/>
<hr/>
</c:forEach>
</c:if>
<c:if test = "${empty productList}">
아직 구매한 상품이 없습니다.
</c:if>