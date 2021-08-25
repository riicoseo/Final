<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);

*, *:before, *:after {
	box-sizing: border-box;
}

body {
	background: rgb(253, 169, 11);
	font: 14px/20px "Lato", Arial, sans-serif;
	padding: 40px 0;
	color: white;
}

.container {
	margin: 0 auto;
	width: 750px;
	background: #444753;
	border-radius: 5px;
}

.people-list {
	width: 260px;
	float: left;
}

.toManager {
	padding: 20px;
}

.toManager>button {
	border-radius: 3px;
	border: none;
	padding: 13px;
	color: white;
	background: #6A6C75;
	width: 90%;
	font-size: 14px;
	margin-bottom: 20px;
}

ul {
	padding: 20px;
	height: 770px;
}

li {
	padding-bottom: 20px;
	list-style: none;
}

img {
	float: left;
}

.about {
	float: left;
	margin-top: 8px;
}

.about {
	padding-left: 8px;
}

.status {
	color: gray;
}

.chat {
	width: 490px;
	float: left;
	background: #F2F5F8;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	color: #434651;
}

.chat-header {
	padding: 20px;
	border-bottom: 2px solid white;
}

img {
	float: left;
}

.chat-about {
	float: left;
	padding-left: 10px;
	margin-top: 6px;
}

.chat-with {
	font-weight: bold;
	font-size: 16px;
}

.chat-num-messages {
	color: #92959E;
}

.fa-star {
	float: right;
	color: #D8DADF;
	font-size: 20px;
	margin-top: 12px;
}

.chat-history {
	padding: 30px 30px 20px;
	border-bottom: 2px solid white;
	overflow-y: scroll;
	height: 575px;
}

.message-data {
	margin-bottom: 15px;
}

.message-data-time {
	color: lighten(#92959E, 8%);
	padding-left: 6px;
}

.message {
	color: white;
	padding: 18px 20px;
	line-height: 26px;
	font-size: 16px;
	border-radius: 7px;
	margin-bottom: 30px;
	width: 90%;
	position: relative;
}

.message:after {
	bottom: 100%;
	left: 7%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-bottom-color: #86BB71;
	border-width: 10px;
	margin-left: -10px;
}

.my-message {
	background: #86BB71;
}

.other-message {
	background: #94C2ED;
}

.other-message:after {
	border-bottom-color: #94C2ED;
	left: 93%;
}

.chat-message {
	padding: 30px;
}

textarea {
	width: 100%;
	border: none;
	padding: 10px 20px;
	font: 14px/22px "Lato", Arial, sans-serif;
	margin-bottom: 10px;
	border-radius: 5px;
	resize: none;
}

.fa-file-o, .fa-file-image-o {
	font-size: 16px;
	color: #92959E;
	cursor: pointer;
}

button {
	float: right;
	color: #94C2ED;
	font-size: 16px;
	text-transform: uppercase;
	border: none;
	cursor: pointer;
	font-weight: bold;
	background: #F2F5F8;
}

button:hover {
	color: darken(#94C2ED, 7%);
}

.online, .offline, .me {
	margin-right: 3px;
	font-size: 10px;
}

.online {
	color: #86BB71;
}

.offline {
	color: #E38968;
}

.me {
	color: #94C2ED;
}

.align-left {
	text-align: left;
}

.align-right {
	text-align: right;
}

.float-right {
	float: right;
}

.clearfix:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
}

.pleft {
	text-align: left;
}

.name>a {
	text-decoration: none;
	color: white;
	font-size: 18px;
	font-weight: bold;
	text-shadow: 1px 1px 1px gray;
}

.deleteMsg {
	float: left;
	text-decoration: none;
	color: white;
	background-color: gray;
	font-size: 14px;
	border-radius: 10%;
}

#backBtn {
	float: right;
	font-size: 50px;
	text-decoration: none;
	color: white;
	margin-right: 5%;
}
</style>
<script>
	$(document).ready(function() {

	})
	$(function() {

		let ws = new WebSocket("ws://172.30.1.24/chat");
		ws.onmessage = function(event) {
			/* let text = JSON.parse(event.data);
			let line = $("<div>");
			
			let nickLine = $("<div>");
			nickLine.append(text.nickname);
			
			let messageLine = $("<div>");
			messageLine.append(text.message);
			
			line.append(nickLine);
			line.append(messageLine);
			$("#chat-history").append(line); 
			updateScroll(); */

			let text = JSON.parse(event.data);
			if (text.writer == 'client') {
				let li = $("<li class='clearfix'>");
				let line = $("<div class='message-data-ajax align-right'>");
				let time = $("<span class='message-data-time'></span>");
				let timeID = $("#loginID").val();
				time.append(timeID);
				let who = $("<span class='message-data-name'>me</span>");

				let msgLine = $("<div class='message other-message float-right pleft'>");
				msgLine.append(text.contents);
				line.append(time);
				line.append(msgLine);
				li.append(line);
				$("#history-under").append(li);
			} else {
				let li = $("<li class='clearfix'>");
				let line = $("<div class='message-data-left'>");
				let time = $("<span class='message-data-time'></span>");
				let timeID = text.nickname;
				time.append(timeID);
				let who = $("<span class='message-data-name'>me</span>");

				let msgLine = $("<div class='message my-message'>");
				msgLine.append(text.contents);
				line.append(time);
				line.append(msgLine);
				li.append(line);
				$("#history-under").append(li);
			}

		}

		/* function updateScroll(){
		   var element = document.getElementById("chat-history");
		   element.scrollTop = element.scrollHeight;
		} */
		$("#send").on("click", function() {
			let text = $("#message-to-send").val();
			ws.send(text);
			$("#message-to-send").val(" ");

		})

		$(".deleteMsg").on("click", function() {
			if (confirm("해당 채팅방을 정말로 삭제하시겠습니까? 상대방과 나의 모든 기록이 삭제됩니다.")) {
				location.href = $(this).attr('id');
			}
		})
	})
</script>
</head>
<body>
	<a id="backBtn" href="/cMember/mypage">X</a>
	<div class="container clearfix">

		<div class="people-list" id="people-list">
			<div class="toManager">
				<button type="button" id="sendManager">Chat List</button>
			</div>
			<!-- 채팅 리스트 -->
			<ul class="list">

				<c:forEach var="item" items="${chatStore}">
					<c:if test="${item.store != null }">
						<li class="clearfix"><img
							src="${pageContext.request.contextPath}/resources/images/shop.png"
							alt="avatar" />
							<div class="about">
								<div class="name">
									<a href="/chat/makeChat?store=${item.store }">${item.store }</a>
								</div>
								<div class="status">
									<button type="button" class="deleteMsg"
										id="/chat/deleteChatRoom?chatnum=${item.chatnum }">delete</button>
								</div>
							</div></li>
					</c:if>
					<c:if test="${item.store == null }">
						<div>null입니다</div>
					</c:if>
				</c:forEach>
			</ul>
		</div>

		<div class="chat">
			<div class="chat-header clearfix">
				<img
					src="${pageContext.request.contextPath}/resources/images/shop.png"
					alt="avatar" />

				<div class="chat-about">
					<div class="chat-with">Chat with ${storeName }</div>
					<div class="chat-num-messages">already 1 902 messages</div>
				</div>
				<i class="fa fa-star"></i>
			</div>
			<!-- end chat-header -->

			<div class="chat-history">
				<input type="hidden" id="loginID" value="${loginID }">
				<ul id="history-under">

					<c:forEach var="i" items="${chatlist}">
						<c:if test="${i.nickname == loginID}">
							<li class="clearfix">
								<div class="message-data align-right">
									<span class="message-data-time">${i.write_date }</span> &nbsp;
									&nbsp; <span class="message-data-name">${i.nickname }</span> <i
										class="fa fa-circle me"></i>
								</div>
								<div class="message other-message float-right">${i.contents }</div>
							</li>
						</c:if>
						<c:if test="${i.nickname != loginID}">
							<li>
								<div class="message-data">
									<span class="message-data-name">${i.nickname }</span> <span
										class="message-data-time">${i.write_date }</span>
								</div>
								<div class="message my-message">${i.contents }</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>

			</div>
			<!-- end chat-history -->

			<div class="chat-message clearfix">
				<textarea name="message-to-send" id="message-to-send"
					placeholder="Type your message" rows="3" autofocus></textarea>

				<i class="fa fa-file-o"></i> &nbsp;&nbsp;&nbsp; <i
					class="fa fa-file-image-o"></i>

				<button id="send">Send</button>

			</div>
			<!-- end chat-message -->

		</div>
		<!-- end chat -->

	</div>
	<!-- end container -->

	<script id="message-template" type="text/x-handlebars-template">
  <li class="clearfix">
    <div class="message-data align-right">
      <span class="message-data-time" >{{time}}, Today</span> &nbsp; &nbsp;
      <span class="message-data-name" >Olia</span> <i class="fa fa-circle me"></i>
    </div>
    <div class="message other-message float-right">
      {{messageOutput}}
    </div>
  </li>
</script>

	<script id="message-response-template"
		type="text/x-handlebars-template">
  <li>
    <div class="message-data">
      <span class="message-data-name"><i class="fa fa-circle online"></i> Vincent</span>
      <span class="message-data-time">{{time}}, Today</span>
    </div>
    <div class="message my-message">
      {{response}}
    </div>
  </li>
</script>

</body>

</html>