<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>

<script>
	$(function() {
		$("#myReview").click(function() {
			$.ajax({
				url : "/my/myReview",
				cache : false,
				success : function(e) {
					$("#review").html(e);
				}
			});
		});
	});

	$(function() {
		$("#getReview").click(function() {
			$.ajax({
				url : "/my/getReview",
				cache : false,
				success : function(e) {
					$("#review").html(e);
				}
			});
		});
	});
</script>
<a id="myReview" style="color: green;">나의 리뷰</a>
<a id="getReview" style="color: blue;">받은 리뷰</a>
<div id="review"></div>