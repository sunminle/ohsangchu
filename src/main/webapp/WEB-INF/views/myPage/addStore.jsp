<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>    
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
                        $("#storeNameCheckResult").html("사용 가능한 상점 이름입니다.").css("color", "green");
                    } else {
                        $("#storeNameCheckResult").html("이미 사용 중인 상점 이름입니다.").css("color", "red");
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
<!-- css -->
<link href="/resources/css/include.css" rel="stylesheet">
<!-- bootstrap:css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<center>
	<h2>상점 개설</h2>
	<br />
	<form  method="post" action="/my/addStorePro" onsubmit="return StoreNameCheckForm()">
		상점 이름 : <input type="text" name="storeName"> <input type="button" id="StoreNameCheckButton" value="중복 확인"><div id = "storeNameCheckResult"></div><br /> 상점
		소개 <br />
		<textarea rows="20" cols="100" name="storeIntro"></textarea>
		<br /> <input type="submit" value="개설">
	</form>
</center>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
