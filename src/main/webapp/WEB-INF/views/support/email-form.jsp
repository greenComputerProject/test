<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 지원</title>


    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    
    <link rel="stylesheet" href="/resources/css/support/email-form.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
    
	<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
  
  	<div class="support-form">
  		<div class="head">
  			<span>고객 문의</span>
  		</div>
  		<form action="#">
  			<div class="username">
  				<c:if test="${user.name != null}">
  					<input type="text" name="senderName" id="senderName" placeholder="표시명[선택]" value="${user.name}">
  				</c:if>
  				<c:if test="${user.name == null }">
  					<input type="text" name="senderName" id="senderName" placeholder="표시명[선택]">
  				</c:if>
  			</div>
  			<div class="email">
  				<input type="email" name="customerEmail" id="customerEmail" placeholder="연락용 이메일" required autofocus>
  			</div>
  			<div class="content">
  				<textarea type="text" name="message" id="message" placeholder="문의할 내용을 적어주세요." required></textarea>
  			</div>
  			<div class="buttons">
  				<a href="javascript:history.back()" class="email-cancel">취소</a>
  				<a id="emailSend" class="email-send" onclick="sendEmail()">전송</a>
  			</div>
  		</form>
  	</div>
  	
 	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

<script type="text/javascript" src="/resources/js/support/support-common.js"></script> 	
<script type="text/javascript" src="/resources/js/support/email-form.js"></script>
<script type="text/javascript" >
let changeBackground = function(){
	
	var box = document.getElementById("box");
	var r = parseInt(Math.random() * 10);
	var r1 = parseInt(Math.random() * 10);
	var r2 = parseInt(Math.random() * 10);
	var first = 'rgb( ' + (225 + r) + ', 240, 240)';
	var middle = 'rgb( ' + (225 + r1) + ', 240, 240)';
	var last = 'rgb( ' + (225 + r2) + ', 240, 240)';
	var gradient = 'linear-gradient( to right , '+ first + " , " + middle +" , " + last +  ")"
	console.log(document.body);	
	document.body.style.background = gradient;
	document.querySelector('.navbar-search').style.background = gradient; 
	
}
changeBackground(); 

let sendEmail = function(){
	alert('메일이 발송중입니다. 잠시만 기다려주세요.');
	let senderName = document.querySelector("#senderName");
	let customerEmail = document.querySelector("#customerEmail");
	let message = document.querySelector("#message");

	let data = {
		senderName : senderName.value,
		customerEmail : customerEmail.value,
		message : message.value
	}

	$.ajax({
		type:'POST',
		url: '/support/send',
		data: JSON.stringify(data),
		contentType: 'application/json; charset=utf-8',
		dataType: 'JSON',
		success: function(data) {
			alert('문의가 성공적으로 발송되었습니다.');
			window.location.href="/"
		}, error : function(error) {
			alert('문제가 발생했습니다.');
		}
	})

}
</script>
</body>
</html>