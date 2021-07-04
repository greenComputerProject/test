<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<form class="signup-form" action="/user/signup" method="POST">
    <div class="title">
        <h2>회원가입</h2>
    </div>
    <div>
        <input type="text" name="name" id="name" placeholder="이름을 입력하세요." required>
    </div>
    <div class="input-email">
        <input type="email" name="email" id="email" placeholder="이메일을 입력하세요." onblur="checkEmail(this.value)" required>
        <span>이미 존재하는 이메일입니다.</span>
    </div>
    <div>
        <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요." required>
    </div>
    <div>
        <button type="button" >회원가입</button>
    </div>
</form>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/user/signup.js"></script>
 
</body>
</html>