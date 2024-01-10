<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/js/jquery-3.7.1.min.js"></script>

<script>
	$(function() {
		$("#heartList").click(function() {
			$.ajax({
				url : "/my/heartList",
				cache : false,
				success : function(e) {
					$("#HSList").html(e);
				}
			});
		});
	});

	$(function() {
		$("#subscribeList").click(function() {
			$.ajax({
				url : "/my/subscribeList",
				cache : false,
				success : function(e) {
					$("#HSList").html(e);
				}
			});
		});
	});
</script>
<a id="heartList" style="color: green;">찜 상품</a>
<a id="subscribeList" style="color: blue;">구독 상점</a>
<div id="HSList"></div>