<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${check == 1}">
	이미 사용중인 닉네임입니다.<br />
	<center>
		<input type="button" value="확인" onclick="window.close();">
	</center>
</c:if>

<c:if test="${check == 0}">
	사용할수 있는 닉네임입니다.<br />
	<center>
		<input type="button" value="확인" onclick="window.close();">
	</center>
</c:if>