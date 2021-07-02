<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 수정</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
    <link rel="stylesheet" href="/resources/css/user/signup.css">
</head>
<body>
<form class="signup-form" action="/user/signup" method="POST">
    <div class="title">
        <h2>내 정보 수정</h2>
    </div>
    <div>
        <input type="text" name="name" id="name" value="${user.name }">
    </div>
    <div class="input-email">
        <input type="email" name="email" id="email" value="${user.email }"  readonly>
    </div>
    <div>
        <input type="password" name="password" id="password" placeholder="새 비밀번호">
    </div>
    <div class="buttons">
        <button type="button" class="user-mod-btn" onclick="clickModBtn()">수정</button>
        <button type="button" class="user-remove-btn" onclick="clickRemoveBtn()">회원 탈퇴</button>
    </div>
</form>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/user/info.js"></script>
</body>
</html>