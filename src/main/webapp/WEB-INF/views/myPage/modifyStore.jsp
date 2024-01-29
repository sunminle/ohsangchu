<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
var StoreNameCheckValue = 0;

$(function(){
	$("#StoreNameCheckButton").click(function(){
		var storeName = $("input[name='storeName']").val();
		if (storeName.trim() !== "") {
		$.ajax({
			url : "/my/storeNameCheck",
			data: { storeName: storeName },
			success : function(result){
				StoreNameCheckValue = result;
				if (StoreNameCheckValue === "1") {
                    $("#storeNameCheckResult").html("사용 가능한 상점 이름입니다.");
                } else {
                    $("#storeNameCheckResult").html("이미 사용 중인 상점 이름입니다.");
                }
			}
		});
		}else {
            $("#storeNameCheckResult").html("상점 이름을 입력하세요.");
        }
	});
});

function StoreNameCheckForm() {
    if (StoreNameCheckValue == 0) {
    	alert("중복 확인을 먼저 진행하세요.");
        return false;
        
    } 
}
</script>
<c:if test="${storeCount > 0 }">
<center>
	<h2>판매자 정보 수정</h2>
	<br />
	<form method="post" action="/my/modifyStorePro" onsubmit="return StoreNameCheckForm()">
		상점 이름 : <input type="text" value="${storeDTO.storeName}"
			name="storeName"> <input type="button" id="StoreNameCheckButton" value="중복 확인"><div id = "storeNameCheckResult"></div><br /> 상점
		소개 <br />
		<textarea rows="20" cols="100" name="storeIntro">${storeDTO.storeIntro}</textarea>
		<br /> <input type="submit" value="수정">
	</form>
</center>
</c:if>

<c:if test="${storeCount == 0 }">
	아직 상점을 개설하지 않으셨습니다.<br/>
	<a href = "/my/addStore">상점 개설</a>
</c:if>