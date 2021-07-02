<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%--     <%@include file="./layout/navbar-search.jsp" %>
    <%@include file="./layout/navbar.jsp" %> --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Epic Games Store | Official Site</title>


    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    
    <link rel="stylesheet" href="/resources/css/index.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
    
	<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
    <!-- section start -->
<div class="main">
    <div class="section">
    <div class="main-section">
    	
    	
    <c:forEach items="${games}" var="game" end="2"  varStatus="status">
    			<c:choose>
    				
    				<c:when test="${status.count ==1}">
    				<div id="<c:out value='box${status.count}'></c:out>" class="main-section-image-slide-visible">
    				</c:when>
    				<c:otherwise>
    				<div id="<c:out value='box${status.count}'></c:out>" class="main-section-image-slide">
    				</c:otherwise>
    				
    			</c:choose>
		        
		        
		            <img class="image-slide-visible" src="<c:out value='${game.titlePicture}'></c:out>"  alt="">
		            <div class="text-container">
		                <div class="game-logo">
		                    <img src="<c:out value='${game.logo}'></c:out>" alt="">
		                </div>
			                <c:if test="${game.isOnSale==true}">
				                <div class="title">
				                    할인 및 특별가
				                </div>
			                </c:if>
			                <c:if test="${game.isOnSale==false}">
			                	<div class="title">
				                    지금 막 출시!
				                </div>
			                </c:if>
		                <div class="content">
		                   	<c:out value='${game.content}'></c:out>
		                </div>
		                <div class="button">
		                    <a href="#">
		                        자세히 보기</a>
		                </div>
		            </div>
		        </div>
        </c:forEach>




        <div class="main-section-side-images">
            <ul>
            
            <c:forEach items="${games }" var="game" end="2" varStatus="status">
            	<div id="<c:out value='box${status.count}'></c:out>" class="box" onclick="clickBox(this.id)">
                    <li>
                        <div class="div-small-image">
                            <img class="small-image" src="<c:out value='${game.titlePicture }'></c:out>" alt="">
                        </div>
                        <div class="text">
                            <c:out value='${game.title}'></c:out>
                        </div>
                    </li>
                </div>
			</c:forEach>
               
            </ul>
        </div>

    </div>
    </div>
    <!-- section end -->
    <!-- article start -->
    <div class="displayed-games">
    	<c:forEach items="${games}" var="game" begin="0" end="2">
	    	<div class="game-box">
	            <div class="game-box-image">
	                <a href="#">
	                    <img src="<c:out value="${game.titlePicture}"></c:out>" alt="">
	                    </a>
	            </div>
	            <div class="game-box-text">
	                <div class="game-box-title"><c:out value="${game.title}"></c:out></div>
	                <div class="game-box-content"><c:out value="${game.content}"></c:out></div>
	                <c:choose>
	                	<c:when test="${game.price != 0 }">
	                		<div class="game-box-price"> <c:out value="${game.price}"></c:out> </div>
	                	</c:when>
	                	<c:otherwise>
	                		<div class="game-box-price"> free</div>
	                	</c:otherwise>
	                </c:choose>
	                
	            </div>
	        </div>
    </c:forEach>
    
    
 	
    </div> 
    <!-- article end -->

    <!-- wishlist start -->
     <div class="wishlist">
        <div class="wishlist-title">
            <div class="wishlist-title-text">
                위시리스트에 등록된 게임
            </div>
         <c:if test="${user != null }">
         	<div class="wishlist-title-link">
                <a href="/wishlist">위시리스트</a>               
            </div>
		</c:if>
            
        </div>

        	
        <div class="wishlist-game">	
        	<c:if test="${user != null }">
        	
        		<c:forEach items="${wishlistGames }" var="wishGame" end="1">
        			<c:if test="${wishGame != null}">
	        			<a href="#">
				            <div class="wishlist-game-box">
				                <div class="wishlist-game-picture">
				                    <img src="<c:out value='${wishGame.titlePicture }'></c:out>" alt="">
				                </div>
				                <div class="wishlist-game-title">
				                    <c:out value="${wishGame.title }"></c:out>
				                </div>
				                <div class="wishlist-game-company">
				                    <c:out value="${wishGame.company }"></c:out>
				                </div>
				                <div class="wishlist-game-price">
				                    <c:out value="${wishGame.price }원"></c:out>
				                </div>
				            </div>
			        	</a>
		        	</c:if>
		        	<c:if test="${wishlistCount == 1}">
		        		<a href="#">
				            <div class="wishlist-game-box">
				                <div class="wishlist-game-picture">
				                </div>
				                <div class="wishlist-game-title">

				                </div>
				                <div class="wishlist-game-company">
				                </div>
				                <div class="wishlist-game-price">

				                </div>
				            </div>
			        	</a>
		        	</c:if>
        		</c:forEach>
        	
        		<c:if test="${wishlistGames.size() <= 0 }">
        			<h1>아직 위시리스트에 등록된 게임이 없습니다.</h1>
        		</c:if>
        	</c:if>
        	
		    <c:if test="${user == null }">
		    	<h1>위시리스트를 보려면 로그인하세요.</h1>
		    </c:if>
		
		</div>

        	

		
        
        </div>
    </div>
    </div> 
<!-- wishlist end -->
 	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
 	
<script type="text/javascript" src="/resources/js/index.js"></script>

</body>
</html>