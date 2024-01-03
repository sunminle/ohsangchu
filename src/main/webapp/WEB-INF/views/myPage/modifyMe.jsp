<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function openPopup(url, width, height) {
	  var nickname = document.getElementsByName("nickname")[0].value;
	  var popupOptions = 'width=' + width + ', height=' + height + ', top=100, left=100, resizable=no, scrollbars=no, toolbar=no, menubar=no, location=no, status=no';
	  window.open(url + '?nickname=' + encodeURIComponent(nickname), 'Popup', popupOptions);
	}
</script>

<h2>정보수정</h2><br/>
	<form method = "post" action = "/my/modifyMePro" enctype="multipart/form-data">
		닉네임 : <input type = "text" value = "${usersDTO.nickname}" name = "nickname"> <input type = "button" value = "중복 확인" onclick = "openPopup('/my/nickCheck', 250, 50);"><br/>
		프로필사진 : <input type = "file" name = "file" accept="image/*" ><br/>
		<img src="/resources/images/profiles/${usersDTO.profile}"> <br/>
		이메일 : <a>${userInfoDTO.email}</a><br/>
		<input type = "submit" value = "수정">
	</form>