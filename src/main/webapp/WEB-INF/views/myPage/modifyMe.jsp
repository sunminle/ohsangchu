<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>

<h2>정보수정</h2><br/>
<form method = "post" action = "/my/modifyMePro" enctype="multipart/form-data">
닉네임 : <input type = "text" value = "${usersDTO.nickname}" name = "nickname"> <button>중복 확인</button><br/>
프로필사진 : <input type = "file" name = "profile"><br/>
<img src="/resources/images/${usersDTO.profile}"> <br/>
이메일 : <a>${userInfoDTO.email}</a><br/>
<input type = "submit" value = "수정">
</form>