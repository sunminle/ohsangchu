<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>찜상품 목록</h2>
<c:if test = "${!empty postingList and !empty imgList}">
<c:set var = "firstImg" value = "false"/>
<c:forEach var = "posting" items = "${postingList}">
상품명 : <a href = "/product/detail?postingId=${posting.id}">${posting.title}</a><br/>
<c:forEach var = "img" items = "${imgList}">
<c:if test="${img.postingId == posting.id and firstImg == false}">
<c:set var = "firstImg" value = "true"/>
<img style = "width:200px;" src = "/resources/images/posting/${img.img_URL}">
</c:if>
</c:forEach>
<c:if test = "${firstImg == false}">
<img style = "width:200px;" src = "/resources/images/posting/notImage.jpg">
</c:if>
<c:set var = "firstImg" value = "false"/>
<hr/>
</c:forEach>
</c:if>
<c:if test = "${empty postingList}">
찜한 상품이 없습니다.
</c:if>