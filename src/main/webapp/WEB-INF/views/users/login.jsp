<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:if test = "${chk == 1}">
	<c:set var = "usersId" value = "${usersDTO.realId}" scope = "session" />
	<c:redirect url = "/users/main" />
</c:if>
<c:if test = "${chk == 0}">
	<script> 
	  alert("아이디 / 비밀번호를 확인하세요.");
      history.go(-1);
	</script>
</c:if>