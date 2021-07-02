<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 라이브러리</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <!-- wishlist.css 포함해야함 -->
    <link rel="stylesheet" href="/resources/css/user/wishlist.css">
    <link rel="stylesheet" href="/resources/css/user/library.css">
</head>
<body>
    
	<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
 
<!-- wishlist start -->
<div class="wishlist">
    <div class="library">
        내 라이브러리
    </div>
    <div class="order-form">
        <div class="title" onclick="clickOrderTitle()">
            <div>
            정렬 기준: <span>출시일</span> 
            <i class="fas fa-caret-down"></i>
            </div>
        </div>
        <div class="list">
            <ul>
                <li><button onclick="clickOrderButton(this)">연관성</button></li>
                <li><button onclick="clickOrderButton(this)">신작</button></li>
                <li><button onclick="clickOrderButton(this)">출시일</button></li>
                <li><button onclick="clickOrderButton(this)">사전순</button></li>
                <li><button onclick="clickOrderButton(this)">가격: 오름차순</button></li>
                <li><button onclick="clickOrderButton(this)">가격: 내림차순</button></li>
            </ul>
        </div>
    </div>
    <div class="wishlist-games">
        <ul>
        	<c:forEach items="${games}" var="game">
            <li>
                <div class="wishlist-game">
                    <a href="#">
                    <div class="image-and-title">
                        <div class="wishlist-image"><img src="${game.titlePicture}" alt=""></div>
                        <div class="wishlist-title">${game.title}</div>
                    </div>
                    <button class="price-and-button" onclick="alert('아직 준비되지 않았어요!')">
                        <div class="wishlist-price">다운로드</div>
                        <div class="button"><i class="far fa-arrow-alt-circle-down"></i></div>
                    </button>
                    </a>
                </div>
            </li>
            </c:forEach>
        </ul>
    </div>
</div>
<!-- wishlist end -->
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

<script type="text/javascript" src="/resources/js/layout/navbar-search.js"></script>
<script type="text/javascript" src="/resources/js/user/wishlist.js"></script>
</body>
</html>