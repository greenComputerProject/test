<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Epic Games Store | Official Site</title>

	
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    
        <link rel="stylesheet" href="/resources/css/error/errpage.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
    
	<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
	
	<div class="error-p">
		<div class="error-c">
			<div class="emoji"><i class="fas fa-exclamation-triangle fa-3x"></i></div>
			<div class="text">
				<c:if test="${error == 500 }">문제가 발생했습니다. 관리자에게 문의하세요.</c:if>
				<c:if test="${error == 401 }">해당 자원에 대한 권한이 없습니다.</c:if>
			</div>
		</div>
	</div>

 	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
 <script type="text/javascript" src="/resources/js/error/errpage.js"></script>
<script type="text/javascript" src="/resources/js/index.js"></script>

</body>
</html>