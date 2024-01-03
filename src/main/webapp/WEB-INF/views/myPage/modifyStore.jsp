<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function openPopup(url, width, height) {
	  var storeName = document.getElementsByName("storeName")[0].value;
	  var popupOptions = 'width=' + width + ', height=' + height + ', top=100, left=100, resizable=no, scrollbars=no, toolbar=no, menubar=no, location=no, status=no';
	  window.open(url + '?storeName=' + encodeURIComponent(storeName), 'Popup', popupOptions);
	}
</script>
<center>
<h2>판매자 정보 수정</h2><br/>
	<form method = "post" action = "/my/modifyStorePro" >
		상점 이름 : <input type = "text" value = "${storeDTO.storeName}" name = "storeName"> <input type = "button" value = "중복 확인" onclick = "openPopup('/my/storeNameCheck', 250, 50);"><br/>
		상점 소개 <br/>
		<textarea rows="20" cols="100"  name = "storeIntro">${storeDTO.storeIntro}</textarea><br/>
		<input type = "submit" value = "수정">
	</form>
</center>