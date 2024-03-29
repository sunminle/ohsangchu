<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src = "/resources/js/jquery-1.10.2.min.js"></script>
<script src = "/resources/js/socket.io.js"></script>
<script>
	$(function(){
		var socket = io.connect("http://192.168.219.180:9999");
		var chatId = '${chatId}';
		socket.emit("joinRoom",{id : '${sessionScope.usersId}'}, {user1Id: '${user1Id}'}, {user2Id: '${user2Id}'}, {chatId: '${chatId}'}); 
		
		// 채팅 내용 받는다.
		socket.on("response",function(message){
			$("#msgs").append(message.msg+"<br />");
		});
		
		// 채팅 내용을 보내기
		$("#sendBtn").on("click",function(){
			socket.emit("chatMsg",{msg : '${user1Nick}'+"님의 채팅 : "+$("#chat").val()},{id : '${sessionScope.usersId}'},{user1Id: '${user1Id}'},{user2Id: '${user2Id}'}, {chatId: '${chatId}'}); // 보내기
			
			 $("#chat").val('');
		});
		
		$(window).on("beforeunload", function(){
			var id = '${sessionScope.usersId}';
			var chatId = '${chatId}';
			$.ajax({
				url : "/chat/disconnect?id="+id+"&chatId="+chatId,
				success : function(e){
					
				}
			});
			
			
			console.log("Beforeunload event triggered");
			
	    });
		
		
		
	});
</script>

<h1>chat</h1>
<div id = "msgs">
====채팅방==== <br/>
<c:if test="${!empty lineList }">
	<c:forEach var = "lineList" items = "${lineList}">
	<a>${lineList}</a><br/>
	</c:forEach>
</c:if>
</div>
<input type = "text" name = "chat" id = "chat">
<input type = "button" value = "전송" id = "sendBtn">
<br/>


