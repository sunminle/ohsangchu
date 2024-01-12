<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="/resources/css/include.css" rel="stylesheet">
<link href="/resources/css/style.css" rel="stylesheet">

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<title>noticeboard</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">Notice</h1>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<button type="button"
							class="btn btn-outline btn-primary pull-right">
							<i class="fa fa-edit fa-fw"></i> 공지사항 작성
						</button>
					</div>
				</div>
				<br>
				<div class="panel panel-default">
					<div class="panel-heading">공지사항</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>첫 공지사항</td>
									<td>관리자</td>
									<td>2024.01.10</td>
									<td>1</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-lg-12">
					<button type="button" class="btn btn-outline btn-primary pull-left">
						<i class="fa fa-edit fa-fw"></i> 목록
					</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>
