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
    
    <link rel="stylesheet" href="/resources/css/support/list.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
    
	<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
  
  	<div class="support-list">
  		<div class="support-head">
  			<span>고객 문의</span>
  			<a href="#"><button>글쓰기</button></a>
  		</div>
  		
  		<table class="support-table">
  			<thead>
				<tr>
					<th class="writer">작성자</th>
					<th class="title">제목</th>
					<th class="regdate">작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="writer">김강찬</td>
					<td class="title"><a href="#">환불해주세요</a><span>[답변완료]</span></td>
					<td class="regdate">2021-12-21</td>
				</tr>
				<tr>
					<td class="writer">김강찬</td>
					<td class="title"><a href="#">환불해주세요</a></td>
					<td class="regdate">2021-12-21</td>
				</tr>
				<tr>
					<td class="writer">김강찬</td>
					<td class="title"><a href="#">환불해주세요</a></td>
					<td class="regdate">2021-12-21</td>
				</tr>
			</tbody>
  		</table>

		<div class="page">
			<ul>
				<li><a href="#"><i class="fas fa-caret-left"></i></a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#"><i class="fas fa-caret-right"></i></a></li>
			</ul>
		</div>
  	</div>
  	
 	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
 
<script type="text/javascript" src="/resources/js/support/support-common.js"></script>
<script type="text/javascript" src="/resources/js/support/list.js"></script>
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
</script>

</body>
</html>