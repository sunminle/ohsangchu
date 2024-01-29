<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
var nickCheckValue = 0;

$(function(){
	$("#nickCheckButton").click(function(){
		var nickname = $("input[name='nickname']").val();
		if (nickname.trim() !== "") {
		$.ajax({
			url : "/my/nickCheck",
			data: { nickname: nickname },
			success : function(result){
				nickCheckValue = result;
				if (nickCheckValue === "1") {
                    $("#nickCheckResult").html("사용 가능한 닉네임입니다.");
                } else {
                    $("#nickCheckResult").html("이미 사용 중인 닉네임입니다.");
                }
			}
		});
		}else {
            $("#nickCheckResult").html("닉네임을 입력하세요.");
        }
	});
});

function nickCheckForm() {
    if (nickCheckValue == 0) {
    	alert("중복 확인을 먼저 진행하세요.");
        return false;
        
    } 
}
</script>
<center>
	<h2>정보수정</h2>
	<br />
	<form method="post" action="/my/modifyMePro"
		enctype="multipart/form-data" onsubmit="return nickCheckForm()">
		닉네임 : <input type="text" value="${usersDTO.nickname}" name="nickname">
		<input type="button" id="nickCheckButton" value="중복 확인"><div id = "nickCheckResult"></div><br /> 프로필사진 :
		<input type="file" name="file" accept="image/*"><br /> <img
			src="/resources/images/profiles/${usersDTO.profile}"> <br />
		이메일 : <a>${userInfoDTO.email}</a><br /> <input type="submit"
			value="수정">
	</form>
</center>