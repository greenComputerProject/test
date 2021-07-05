<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게임 수정</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/game/register.css">
    <link rel="stylesheet" href="/resources/css/game/modify.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
 	<jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>

    <div class="game-register">
        <div class="input-title">
            <div id="titleGameTitle" class="form-input"><span>타이틀</span></div>
            <div id="titleGameContent" class="textarea"><span>소개</span></div>
            <div id="titleGamePrice"  class="form-input"><span>가격</span></div>
            <div id="titleGameGenre" class="select"><span>장르</span></div>
            <div id="titleGameCompany" class="form-input"><span>제작사</span></div>
            <div id="titleGameTag" class="select"><span>태그</span></div>
            <div id="titleGameAgeLimit" class="form-input"><span>연령제한</span></div>
            <div id="titleGameSpec" class="textarea">
                <div class="spec"><span>사양</span></div>
            </div>
            <div id="titleImage" class="form-input"><span>이미지</span></div>

            <div id="titleFormButton" class="form-input"><span></span></div>
            
        </div>
        <div class="input-form">
       	<form action="/game/modify" role="form" method="post">
       		<input type="hidden" name="cno" id="cno" value="${game.cno}">
       		<input type="hidden" name="gno" id="gno" value="${game.gno}">

            <div id="formGameTitle" class="form-input">
                <input type="text" name="title" id="title" value="${game.title}" required>
            </div>
            <div id="formGameContent" class="textarea">
                <textarea name="content" id="content" value="" required>${game.content}</textarea>
            </div>
            <div id="formGamePrice" class="form-input">
                <input type="text" name="price" id="price" value="${game.price}" required>
            </div>
            <div id="formGameGenre" class="select">
                <select name="name" id="name" required>
                    <option value=""> ${tag0} </option>
               		<option value="">-----------</option>
                    <option value="FPS">FPS</option>
                    <option value="TPS">TPS</option>
                    <option value="RTS">RTS</option>
                    <option value="RPG">RPG</option>
                    <option value="시뮬레이션">시뮬레이션</option>
                    <option value="격투">격투</option>
                    <option value="리듬">리듬</option>
                    <option value="전략">전략</option>
                    <option value="인디">인디</option>
                </select>
            </div>
            <div id="formGameCompany" class="form-input">
                <div class="company-name">
                    <input type="text" name="company" id="company" value="${game.companyvo.company}" required>
                </div>
                <div class="company-input">
                
                <label for="country">국가 선택</label>
                <select name="country" id="country" required>
               		<option value="">${game.companyvo.country}</option>
               		<option value="">-----------</option>
                    <option value="미국">미국</option>
                    <option value="영국">영국</option>
                    <option value="프랑스">프랑스</option>
                    <option value="독일">독일</option>
                    <option value="중국">중국</option>
                    <option value="일본">일본</option>
                    <option value="한국">한국</option>
                    <option value="캐나다">캐나다</option>
                    <option value="호주">호주</option>
                </select>
            </div>
            </div>
            <div id="formGameTag" class="select">
                <select onchange="clickOption(event)" name = "name" id = "name">
                    <!-- <option value="">태그를 선택하세요.</option> -->
                    <option value=""> ${tag} </option>       
                    <option value="">-----------</option>
                    <option value="싱글플레이" onselect="clickOption(this)">싱글플레이</option>
                    <option value="멀티플레이" onselect="clickOption(this)">멀티플레이</option>
                    <option value="협동" onselect="clickOption(this)">협동</option>
                    <option value="무료" onselect="clickOption(this)">무료</option>
                    <option value="VR" onselect="clickOption(this)">VR</option>
                    <option value="실시간" onselect="clickOption(this)">실시간</option>
                    <option value="어두운" onselect="clickOption(this)">어두운</option>
                </select>
               
                <button type="button" onclick="resetTag()">초기화</button>
                <input type="text" name="tag" id="tag" value="" readonly required/>
            </div>
			<div id="formGameAgeLimit" class="form-input">
                <input type="text" name="ageLimit" id="ageLimit" placeholder="게임 이용 연령대를 입력하세요." required>
            </div>
            <div id="formGameSpec" class="textarea">
                    <div class="os">
                        <input type="text" name="os" id="os" value="${game.specvo.os}"  required>
                    </div>
                    <div class="cpu">
                        <input type="text" name="cpu" id="cpu" value="${game.specvo.cpu}"  required>
                    </div>
                    <div class="gpu">
                        <input type="text" name="gpu" id="gpu" value="${game.specvo.gpu}"  required>
                    </div>
                    <div class="ram">
                        <input type="text" name="ram" id="ram" value="${game.specvo.ram}"  required>
                    </div>
                    <div class="language">
                        <select name="language" id="language" required>
                        	<option value="">${game.specvo.language}</option>
               				<option value="">-----------</option>
                            <option value="영어">영어</option>
                            <option value="프랑스어">프랑스어</option>
                            <option value="독일어">독일어</option>
                            <option value="중국어">중국어</option>
                            <option value="일본어">일본어</option>
                            <option value="한국어">한국어</option>
                        </select>
                    </div>
            </div>
			<div id="formImage" class="textarea">
                <input type="text" name="logo" placeholder="게임 로고 url을 입력하세요 (필수)" required>
                <input type="text" name="video" placeholder="게임 영상 url을 입력하세요 (필수)" required>
                <input type="text" name="titlePicture" placeholder="게임 메인   이미지 url을 입력하세요 (필수)" required>
                <!-- <input type="text" name="pictureList[0].contentPicture" placeholder="게임 서브 이미지 url을 입력하세요 (선택)" >
                <input type="text" name="pictureList[1].contentPicture" placeholder="게임 서브 이미지 url을 입력하세요 (선택)" >
                <input type="text" name="pictureList[2].contentPicture" placeholder="게임 서브 이미지 url을 입력하세요 (선택)" >
                <input type="text" name="pictureList[3].contentPicture" placeholder="게임 서브 이미지 url을 입력하세요 (선택)" > -->
                <input type="text" name="contentPicture" placeholder="게임 서브 이미지 url을 입력하세요 (선택)" >
                <input type="text" name="contentPicture" placeholder="게임 서브 이미지 url을 입력하세요 (선택)" >
                <input type="text" name="contentPicture" placeholder="게임 서브 이미지 url을 입력하세요 (선택)" >
                <input type="text" name="contentPicture" placeholder="게임 서브 이미지 url을 입력하세요 (선택)" >
            </div>
            <div id="formImage" class="form-input">
                <input type="image" name="image" id="image" required>
            </div>
            <div id="formFormButton" class="form-input">
                <button class="modify">수정</button>
                <button class="delete">삭제</button>
            </div>
        </form>
    </div>
    </div>
    
<script>
	$("document").ready(function(){
		console.log("사랑");
		var a = "${game.companyvo}"
		console.log(a);
	})
	
</script>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/game/register.js"></script>
</body>
</html>