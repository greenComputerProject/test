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
    
    <link rel="stylesheet" href="/resources/css/support/get.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
    
	<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
  
  	<div class="support-get">
  		
  		<div class="client">
  			<div class="writer-regdate">
		  		<div class="title">
		  			배틀필드 환불해주세요.
		  		</div>
  				<div class="writer">
					김강찬  				
  				</div>
  				<div class="regdate">
					2021-07-09	  				
  				</div>
  			</div>
  			<div class="content">
  				<span>
  					컴퓨터 사양이 낮아서 렉이 너무 심합니다.
  					환불 부탁드려요
  				</span>
  			</div>
  		</div>
  		<div class="admin">
  			<div class="writer-regdate">
				<div class="writer">
					운영자
				</div>
				<div class="regdate">
					2021-07-09
				</div>  				
  			</div>
  			<div class="content">
  				<span>
  				주문 번호와 이메일을 알려주시면 환불이 가능한지 확인 후 안내해드리겠습니다.
  				</span>
  			</div>
  			<div class="content-form">
  				<form action="#">
  					<div class="form-input">
  						<textarea placeholder="답변을 입력하세요."></textarea>
  					</div>
  					<div class="form-button">
  						<button>답변하기</button>
  					</div>
  				</form>
  			</div>
  		</div>
  		
  	</div>
  	<div class="support-buttons">
  			<a href="#"><button class="modifyBtn">수정</button></a>
  			<a href="#"><button class="removeBtn">삭제</button></a>
  	</div>
  	
 	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

<script type="text/javascript" src="/resources/js/support/support-common.js"></script> 	
<script type="text/javascript" src="/resources/js/support/get.js"></script>
<script type="text/javascript">
let changeBackground = function(){
	
	var box = document.getElementById("box");
	var r = parseInt(Math.random() * 30);
	var first = 'rgb( ' + (220 + r) + ', 240, 240)';
	var middle = 'rgb( ' + (210 + r) + ', 250, 250)';
	var last = 'rgb( ' + (220 + r) + ', 220, 220)';
	var gradient = 'linear-gradient( to right , '+ first + " , " + middle +" , " + last +  ")"
	console.log(document.body);	
	document.body.style.background = gradient;
	document.querySelector('.navbar-search').style.background = gradient; 
	
}
changeBackground(); 

let sendEmail = function() {
	
}
</script>
</body>
</html>