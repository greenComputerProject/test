<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/user/signup.css">
<link rel="stylesheet" href="/resources/css/user/login.css">
</head>
<body>

<form class="signup-form" action="/processingLogin" method="POST">
    <div class="title">
        <h2>로그인</h2>
    </div>
    <div class="input-email">
        <!-- 스프링 시큐리티를 위해 username 으로 name 을 설정함 -->
        <input type="email" name="username" id="username" placeholder="이메일을 입력하세요." required autofocus="autofocus">
    </div>
    <div>
        <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요." required>
    </div>
    <span>${error}</span>	
    <div>
    	
        <button type="submit" >로그인</button>
    </div>
</form>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/user/login.js"></script>
</body>
</html>