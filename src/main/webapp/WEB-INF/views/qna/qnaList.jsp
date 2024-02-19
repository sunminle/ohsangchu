<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>

<!-- bootstrap:css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!-- boot : js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<!--favicon-->
<link rel="icon" href="/resources/images/site/leaf-solid.png">
<!-- jQuery -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<!-- css -->
<link href="/resources/css/include.css" rel="stylesheet">
<link href="/resources/css/main.css" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
    <c:forEach var="qna" items="${qnaList}" varStatus="i">
        processOrder('${qna.id}', ${i.count});
    </c:forEach>
});

function processOrder(qnaId, index) {
    var formData = new FormData();
    formData.append("qnaId", qnaId);
    console.log(qnaId);
     $.ajax({
        type: "POST",
        url: '/qna/qnaAnswerList',
        contentType: false,
        processData: false,
        data: formData,
        success: function(data) {
                var qnaReplyList = data; 
                console.log(qnaReplyList);
                if(qnaReplyList.qnaReplyCount > 0){
                	var regDate = new Date(qnaReplyList.regDate);

                	var options = {
                	        year: '2-digit',
                	        month: '2-digit',
                	        day: '2-digit',
                	        hour: '2-digit',
                	        minute: '2-digit'
                	    };

                	    var formattedDate = new Intl.DateTimeFormat('ko-KR', options).format(regDate);

                	$("#qna_" + index).append("<td>"+qnaReplyList.qnaId+"-1</td>"
							+"<td><a href='qnaAnswerDetail/"+qnaReplyList.id+"'>ㄴ"+qnaReplyList.title+"</td>"
							+"<td>"+qnaReplyList.realId+"</td>"
							+"<td>"+formattedDate+"</td>"
							+"<td></td>");
                }
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
    }); 
}

</script>
<link href="/resources/css/include.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">

<!-- header -->
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<!-- /header -->

<title>qnaList</title>
</head>
<body>
	<form id="addQna">
		<div class="page-wrapper">
			<div class="container-fluid">

				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">QnA</h1>
				</div>
					<div class="row">
					<c:if test="${userAuth < 100}">
					<div class="col-lg-12">
						<button type="button"
							class="btn btn-outline btn-primary pull-right"
							onclick="location.href='addQna'">
							<i class="fa fa-edit fa-fw"></i> 글쓰기
						</button>
					</div>
					</c:if>
				</div>
				<br>
				<div class="panel panel-default">
					<div class="panel-heading">QnA</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<c:if test="${userAuth >99}">
										<th>답변달기</th>
									</c:if>
								</tr>
							</thead>
							 <c:forEach var="qna" items="${qnaList}" varStatus="i">
          
							<tbody>
								<tr>
									<td>${qna.id}</td>
									<td><a href="qnaDetail/${qna.id}">${qna.title}</td>
									<td>${qna.userId}</td>
									<td><fmt:formatDate value="${qna.regDate}" pattern="yy. MM. dd. aa hh:mm" /></td>
									<c:if test="${userAuth >99}">
										<td>
											<button type="button"
												class="btn btn-outline btn-primary pull-right"
												onclick="location.href='/qna/addQnaAnswer?qnaId=${qna.id}'">
												<i class="fa fa-edit fa-fw"></i> 답변쓰기
											</button>
										</td>
									</c:if>
								</tr>
								<tr id = "qna_${i.count}">
								</tr>
							</tbody>
							</c:forEach>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>




	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>