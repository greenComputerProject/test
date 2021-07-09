<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	    <link rel="stylesheet" href="/resources/css/layout/navbar.css">
	    <link rel="stylesheet"  href="/resources/css/layout/footer.css">
        <link rel="stylesheet" href="/resources/css/layout/navbar-search.css">
        <link rel="stylesheet" href="/resources/css/layout/media-query.css">

	    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>

	<!-- navbar start -->
    <div class="navbar">
        <ul class="navbar-menu-center">
            <li><a href="/" class="navbar-menu-center-logoLink"><p><img class="logo" src="/resources/img/layout/epic logo.png" alt=""></p></a></li>
            <li><a href="/browse" class="navbar-menu-center-menuLink selected"><p>스토어</p></a></li>
            <li><a href="/news/list?page=1" class="navbar-menu-center-menuLink"><p>새 소식</p></a></li>
            <li><a href="/support" class="navbar-menu-center-menuLink"><p>문의</p></a></li>
            <li><a href="/chat" class="navbar-menu-center-menuLink"><p>채팅<i class="far fa-comment" style="margin-left: 3px;"></i></p></a></li>
        </ul>
    
        <ul class="navbar-menu-side">
            
            <li class="dropdown-button">
		
				<a href="">
					<img class="userLogo" src="" alt="">
					<p></p>
				</a>

				<div class="dropdown-menu">
					<ul>
						
					</ul>
				</div>
			</li>
            
           
             <li><a class="downloadLink" href="https://github.com/greenComputerProject/test"><p>깃허브 구경가기</p></a></li>
        </ul>

    </div>
    <div class="mobile icon">
        <i class="far fa-surprise fa-2x"></i>
    </div>
    <div class="mobile text">
        <span >아직 모바일 환경은 지원하지 않아요!</span>
    </div>

</body>
</html>