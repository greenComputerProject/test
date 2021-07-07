<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.min.js" integrity="sha512-2hPuJOZB0q6Eu4RlRRL2/8/MZ+IoSSxgDUu+eIUNzHOoHLUwf2xvrMFN4se9mu0qCgxIjHum6jdGk/uMiQoMpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/chat/chat.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>

<div class="chat">
	<div class="ch-ul">
		
	</div>
	<div class="ch-in">
		<input id="msg" type="text" placeholder="메시지를 입력하세요.">
		<button id="button-send">전송</button>
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/chat/chat.js"></script>
	<script>
	
		let changeBackground = function(){
			
			var box = document.getElementById("box");
			var r = parseInt(Math.random() * 50);
			console.log(document.body);
			document.body.style.backgroundColor = 'rgb( ' + (200 + r) + ', 240, 240)';
			document.querySelector('.navbar-search').style.backgroundColor = 'rgb( ' + (200 + r) + ', 240, 240)';
		}
		changeBackground();
		
		let resetChat = function() {
			let num = document.querySelectorAll('.ch-li').length;
			
			if(num >= 16){
				document.querySelector('.ch-ul').innerHTML = "";
			}
		}

		$("#button-send").on("click", function(e){
			sendMessage();
			$("#msg").val('');			
		});

		var sock = new SockJS('http://localhost:8080/chatting');
		sock.onmessage = onMessage;
		sock.onclose = onClose;
		sock.onopen = onOpen;

		function sendMessage(){
			sock.send($('#msg').val());
		}

		function onMessage(msg){
			
			var data = msg.data;
			var sessionId = null;
			var message = null;

			var arr = data.split(":");

			for(var i=0; i<arr.length; i++){
				console.log('arr[' + i + ']: ' + arr[i]);
			}

			var cur_session = '${userid}';
			console.log('cur_session : ' + cur_session);

			sessionId = arr[0];
			message = arr[1];

			if(sessionId == cur_session){
				var str = "sessionId == cur_session";
				$(".ch-ul").append('<div class="ch-li" id="msgArea" >' + str + '</div>');

			} else {

				var str = sessionId + " : " + message ;

				$(".ch-ul").append('<div class="ch-li" id="msgArea">' + str + '</div>');
			}
			changeBackground();
			resetChat();
			
		}

		function onClose(evt){

			var user = '${pr.username}';
			var str = user + " 님이 퇴장하셧습니다.";

			$(".ch-ul").append('<div class="ch-li" id="msgArea">' + str + '</div>');
			changeBackground();
			resetChat();
		}

		function onOpen(evt){

			var user = '${pr.username}';
			var str = user + " 님이 퇴장하셧습니다.";

			$(".ch-ul").append('<div class="ch-li" id="msgArea">' + str + '</div>');
			changeBackground();
			resetChat();
		}
	</script>
	
</body>
</html>