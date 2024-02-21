<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<c:if test = "${chk == 1}">
	<c:set var = "usersId" value = "${usersDTO.realId}" scope = "session" />
	<c:set var = "usersProfile" value = "${usersDTO.profile}" scope = "session" />
	
	<script>
	alert("로그인이 완료되었습니다.");
	
	// 뒤로 갈 히스토리가 있는 경우 및 우리 시스템에서 링크를 통해 유입된 경우aaa
	if ('${backURI}' != '') {
		location.href = "/${backURI}";   
	}
	// 히스토리가 없는 경우 (URL을 직접 입력하여 유입된 경우)
	else {
	    location.href = "/main";    // 메인페이지로 
	}
	</script>
	
</c:if>

<c:if test = "${chk == 0}">
	<script> 
	  alert("아이디 / 비밀번호를 확인하세요.");
      history.go(-1);
      
	</script>
</c:if>	

