<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Epic Games Store | Official Site</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/game/list.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
 	<jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
    <!-- game list section start -->
    <div class="browse">
        <div class="game-list">
            <div class="order-form">
                <div class="title" onclick="clickOrderTitle()">
                    <div>
                    정렬 기준: <span></span> 
                    <i class="fas fa-caret-down"></i>
                    </div>
                </div>
                <div class="list">
                    <ul>
                        <li><button onclick="clickSort(this.value)" value="&order=g.regDate&direction=asc">출시일 오름차순</button></li>
                        <li><button onclick="clickSort(this.value)" value="&order=g.regDate&direction=desc">출시일 내림차순</button></li>
                        <li><button onclick="clickSort(this.value)" value="&order=g.price&direction=asc">가격 오름차순</button></li>
                        <li><button onclick="clickSort(this.value)" value="&order=g.price&direction=desc">가격 내림차순</button></li>
                    </ul>
                </div>
            </div>
            <div class="games">
                <ul>
                    <c:forEach items="${games}" var="game" >
                    
                    <li>
                        <a href="#" class="gno${game.gno}">
                        <div class="gno" style="display: none;">${game.gno}</div>
                        <div class="image"><img src='<c:out value="${game.titlePicture}"></c:out>' alt=""></div>
                        
                        <div class="text">
	                        <div class="title"> <c:out value="${game.title}"></c:out>  </div>
	                        <div class="company"><c:out value="${game.company}"></c:out> </div>
		                        <c:if test="${game.price != 0}">
		                        	<div class="price"><c:out value="${game.price}"></c:out>원</div>
		                        </c:if>
		                        <c:if test="${game.price == 0 }">
		                        	<div class="price">무료</div>
		                        </c:if>
	                        	</div>
	
	                        	<i class="fas fa-plus-circle" id="${game.gno}" onclick="addWishlist(${game.gno})" ></i>
	
	                        </a>
	                    </li>
                    
                    </c:forEach>
                </ul>
            </div>
            <div class="page-links">
                <ul>
                <c:if test="${pageMaker.prev == true}">
                	<li class="prev-button"><a href="#"><</a></li>
                </c:if>
                    
                    <c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    	<li><a href="#" onclick="clickPageLink(this)">${i}</a></li>	
                    </c:forEach>
				
				<c:if test="${pageMaker.next == true}">
                    <li class="next-button"><a href="#">></a></li>
				</c:if>
                </ul>
            </div>
        </div>
        <div class="filter">
            <div class="head">
                <div class="head-text">필터 [<span class="number">1</span>]</div>
                <div><button class="reset-filter" onclick="clickResetFilter()">초기화</button></div>
            </div>
            
            <div id="event" class="category">
                <div class="event-dropdown-button"  onclick="clickCategory(this)">
                    <div class="text">나라</div>
                    <div class="image"><i class="fas fa-caret-down"></i></div>
                </div>
                <div class="list">
                    <ul>
                        <li><button value="미국">미국</button></li>
                        <li><button value="영국">영국</button></li>
                        <li><button value="독일">독일</button></li>
                        <li><button value="프랑스">프랑스</button></li>
                        <li><button value="한국">한국</button></li>
                        <li><button value="일본">일본</button></li>
                        <li><button value="중국">중국</button></li>
                    </ul>
                </div>
            </div>
            <div id="price" class="category">
                <div class="event-dropdown-button"  onclick="clickCategory(this)">
                    <div class="text">태그</div>
                    <div class="image"><i class="fas fa-caret-down"></i></div>
                    
                </div>
                <div class="list">
                    <ul>
                        <li><button value="싱글플레이">싱글플레이</button></li>
                        <li><button value="멀티플레이">멀티플레이</button></li>
                        <li><button value="온라인 경쟁">온라인 경쟁</button></li>
                        <li><button value="협동">협동</button></li>
                        <li><button value="생존">생존</button></li>
                        <li><button value="공상과학">공상과학</button></li>
                        <li><button value="사이버펑크">사이버펑크</button></li>
                        <li><button value="공포">공포</button></li>
                        <li><button value="어두운">어두운</button></li>
                        <li><button value="분위기 있는">분위기 있는</button></li>
                        <li><button value="애니">애니</button></li>
                        <li><button value="파티 기반">파티 기반</button></li>
                        <li><button value="경영">경영</button></li>
                        <li><button value="연애">연애</button></li>
                        <li><button value="전쟁">전쟁</button></li>
                        <li><button value="시간여행">시간여행</button></li>
                    </ul>
                </div>
            </div>
            <div id="genre" class="category" >
                <div class="event-dropdown-button" onclick="clickCategory(this)">
                    <div class="text">장르</div>
                    <div class="image"><i class="fas fa-caret-down"></i></div>
                </div>
                <div class="list">
                    <ul>
                        <li><button value="FPS">FPS</button></li>
                        <li><button value="TPS">TPS</button></li>
                        <li><button value="RPG">RPG</button></li>
                        <li><button value="RTS">RTS</button></li>
                        <li><button value="시뮬레이션">시뮬레이션</button></li>
                        <li><button value="전략">전략</button></li>
                        <li><button value="격투">격투</button></li>
                        <li><button value="퍼즐">퍼즐</button></li>
                        <li><button value="레이싱">레이싱</button></li>
                        <li><button value="스포츠">스포츠</button></li>
                        <li><button value="플랫포머">플랫포머</button></li>
                        <li><button value="카드">카드</button></li>
                    </ul>
                </div>
            </div>
           
            <div id="platform" class="category">
                <div class="event-dropdown-button"  onclick="clickCategory(this)">
                    <div class="text">할인</div>
                    <div class="image"><i class="fas fa-caret-down"></i></div>
                </div>
                <div class="list">
                    <ul>
                        <li><button value="Y">할인 중</button></li>
                        <li><button value="N">할인 중이지 않음</button></li>
                    </ul>
                </div>
            </div>

            <div id="platform" class="category">
                <div class="event-dropdown-button"  onclick="clickCategory(this)">
                    <div class="text">연령 제한</div>
                    <div class="image"><i class="fas fa-caret-down"></i></div>
                </div>
                <div class="list">
                    <ul>
                        <li><button value="전체이용가">전체이용가</button></li>
                        <li><button value="12세 이상">12세 이상</button></li>
                        <li><button value="15세 이상">15세 이상</button></li>
                        <li><button value="19세 이상">19세 이상</button></li>
                    </ul>
                </div>
            </div>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
            	<a class="game-register-button" href="/game/register">게임 등록</a>
            </sec:authorize>
        </div>
    </div>
    <!-- game list section end -->

  <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
  
<script type="text/javascript" src="/resources/js/game/list.js"></script>
<script type="text/javascript" src="/resources/js/game/sort.js"></script>
</body>
</html>