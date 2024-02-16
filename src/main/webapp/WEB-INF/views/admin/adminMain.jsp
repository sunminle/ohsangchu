<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>
<style>
table {
	width: 50%;
	border-collapse: collapse;
	margin: 20px auto;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
	position: relative;
	font-size: 14px; 
}

th {
	background-color: #f2f2f2;
}

.number {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	font-weight: bold;
	font-size: 14px; 
	color: #555;
}
</style>


<!--favicon-->
<link rel="icon" href="/resources/images/site/leaf-solid.png">
<!-- css -->
<link href="/resources/css/myPage.css" rel="stylesheet">
<link href="/resources/css/include.css" rel="stylesheet">
<!--favicon-->
<link rel="icon" href="/resources/images/site/leaf-solid.png">
<!-- css -->
<link href="/resources/css/myPage.css" rel="stylesheet">
<link href="/resources/css/include.css" rel="stylesheet">
<!-- bootstrap:css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<jsp:include page="/WEB-INF/views/include/header.jsp" />
<c:if test="${sessionScope.usersId != null}">
	<center>
		<br />
		<h2>
			ADMIN PAGE
			<h2>

				<div id="container">
					<div id="buttonContainer">
						Admin<br />
						<button onclick="window.location='/admin/adminMain'">회원관리</button>
						<button onclick="window.location.href='/admin/goodsAdmin'">상품관리</button>


						
					</div>
					<div id="modify">
						<h5>회원리스트</h5>

						<table class="table table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>이름</th>
									<th>닉네임</th>

									<th>가입일</th>

								</tr>
							</thead>

							<c:forEach items="${users}" var="user">
								<tr>
									<td>${user.realId}</td>
									<td>${user.userName}</td>
									<td>${user.nickname}</td>

									<td><fmt:formatDate value="${user.regDate}"
											pattern="yy.MM.dd aa hh:mm" /></td>
									<!-- 등급 변경 -->
									<td><select id="auth">
											<option value="1" ${user.auth eq 1 ? 'selected' : ''}>일반</option>
											<option value="10" ${user.auth eq 10 ? 'selected' : ''}>프리미엄</option>
											<option value="0" ${user.auth eq 0 ? 'selected' : ''}>제한/휴면</option>
									</select>
									<button onclick="changeUserAuth('${user.realId}')">수정</button>
								</tr>

							</c:forEach>

							</tbody>

						</table>
						<br /> <br />
					</div>
				</div>
	</center>
</c:if>

<script>
    function changeUserAuth(realId) {
        $.ajax({
            type: "post",
            url: "/admin/auth/",
            data: { auth: $("#auth").val() , userId:realId },
            dataType: "json",
        }).done((res) => {
            alert("회원정보 수정이 완료되었습니다.");
           
        }).fail((err) => {
            alert(err.responseJSON.msg);
        });
    }

	   function modifyUser() {
        // 사용자가 "수정" 버튼을 클릭했을 때 수행되는 코드
        alert("수정 버튼이 클릭되었습니다.");
     
    }
	   
	 

</script>



<!-- 
<script>
    function deleteUser(id) {
        $.ajax({
            type: "delete",
            url: "/admin/user/" + id + "/delete",
            dataType: "json"
        }).done((res) => {
            alert(res.msg);
            $('#user-' + id).remove();
        }).fail((err) => {
            alert(err.responseJSON.msg);
        });
    }
</script>
 -->

<jsp:include page="/WEB-INF/views/include/footer.jsp" />