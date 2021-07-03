<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게임 등록</title>
    <link rel="stylesheet" href="/resources/css/layout/navbar.css">
    <link rel="stylesheet" href="/resources/css/layout/navbar-search.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/layout/footer.css">
    <link rel="stylesheet" href="/resources/css/game/register.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
    <!-- navbar start -->
    <div class="navbar">
        <ul class="navbar-menu-center">
            <li><a href="#" class="navbar-menu-center-logoLink"><p><img class="logo" src="/resources/img/layout/epic logo.png" alt=""></p></a></li>
            <li><a href="#" class="navbar-menu-center-menuLink"><p>스토어</p></a></li>
            <li><a href="#" class="navbar-menu-center-menuLink"><p>새 소식</p></a></li>
            <li><a href="#" class="navbar-menu-center-menuLink"><p>자주 묻는 질문</p></a></li>
            <li><a href="#" class="navbar-menu-center-menuLink"><p>지원센터</p></a></li>
            <li><a href="#" class="navbar-menu-center-menuLink"><p>언리얼 엔진</p></a></li>
        </ul>
    
        <ul class="navbar-menu-side">
            <li class="languageButton"><a href=""><p><i class="fas fa-globe fa-lg"></i></p></a></li>
            <li class="dropdown-button">
                <a href="">
                    <img class="userLogo" src="" alt="">
                    <p>사용자</p>
                </a>
                <div class="dropdown-menu">
                    <ul>
                        <li class="dropdown-menu-link"><a href="#">계정</a></li>
                        <li class="dropdown-menu-link"><a href="#">코드 사용</a></li>
                        <li class="dropdown-menu-link"><a href="#">상품권</a></li>
                        <li class="dropdown-menu-link"><a href="#">위시리스트</a></li>
                        <li class="dropdown-menu-link"><a href="#">로그아웃</a></li>
                    </ul>
                </div>
            </li>
            <li><a class="downloadLink" href=""><p>에픽게임즈 받기</p></a></li>
        </ul>
</div>

<div class="navbar-search">
    <ul class="navbar-search-links">
        <li><a href="#" id="not-selected" onclick="clickSearch(this)">< 메인으로 가기</a></li>
        <li>| 게임 등록 </li>
    </ul>

    <div class="navbar-search-wishlist-and-form">
        <ul class="navbar-search-wishlist">
            <li><a href="#">위시리스트</a></li>
            <li><p>0</p></li>
        </ul>

        <div class="navbar-search-form">
            <form action="">
                <div class="input">
                    <input type="text" placeholder="검색" autofocus>
                </div>
                <div class="button">
                    <button><i class="fas fa-search"></i></button>
                </div>
            </form>
        </div>
    </div>
</div>
    <!-- navbar end -->

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

            <div id="titleFormButton" class="form-input"></div>
        </div>
        <div class="input-form">
        <form action="/game/register" role="form" method="post">
        	<input type="hidden" name="cno" id="cno" value="${game.cno}">
       		<input type="hidden" name="gno" id="gno" value="${game.gno}">
            <div id="formGameTitle" class="form-input">
                <input type="text" name="title" id="title" placeholder="게임 타이틀을 입력하세요." required>
            </div>
            <div id="formGameContent" class="textarea">
                <textarea name="content" id="content"  placeholder="게임 소개를 입력하세요." required></textarea>
            </div>
            <div id="formGamePrice" class="form-input">
                <input type="text" name="price" id="price" placeholder="가격을 입력하세요." required>
            </div>
            <div id="formGameGenre" class="select">
                <select name="tagName" id="tagName" required>
                    <option value="">장르를 선택하세요.</option>
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
                    <input type="text" name="company" id="company" placeholder="제작사를 입력하세요." required>
                </div>
                <div class="company-input">
                <label for="country">국가 선택</label>
                <select name="country" id="country" required>
                	<option value="">국가를 선택하세요.</option>
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
                <select onchange="clickOption(event)" name = "" id = "">
                    <option value="">태그를 선택하세요.</option>
                    <option value="싱글플레이" onselect="clickOption(this)">싱글플레이</option>
                    <option value="멀티플레이" onselect="clickOption(this)">멀티플레이</option>
                    <option value="협동" onselect="clickOption(this)">협동</option>
                    <option value="무료" onselect="clickOption(this)">무료</option>
                    <option value="VR" onselect="clickOption(this)">VR</option>
                    <option value="실시간" onselect="clickOption(this)">실시간</option>
                    <option value="어두운" onselect="clickOption(this)">어두운</option>
                </select>
               
                <button type="button" onclick="resetTag()">초기화</button>
                <input type="text" name="tagName" id="tagName" value="" readonly required/>      
            </div>
			<div id="formGameAgeLimit" class="form-input">
                <input type="text" name="ageLimit" id="ageLimit" placeholder="게임 이용 연령대를 입력하세요." required>
            </div>
            <div id="formGameSpec" class="textarea">
                    <div class="os">
                        <input type="text" name="os" id="os" placeholder="운영체제를 입력하세요."  required>
                    </div>
                    <div class="cpu">
                        <input type="text" name="cpu" id="cpu" placeholder="CPU를 입력하세요."  required>
                    </div>
                    <div class="gpu">
                        <input type="text" name="gpu" id="gpu" placeholder="그래픽카드를 입력하세요."  required>
                    </div>
                    <div class="ram">
                        <input type="text" name="ram" id="ram" placeholder="램을 입력하세요."  required>
                    </div>
                    <div class="language">
                        <select name="language" id="language" required>
                            <option value="">지원 언어를 선택하세요.</option>
                            <option value="영어">영어</option>
                            <option value="프랑스어">프랑스어</option>
                            <option value="독일어">독일어</option>
                            <option value="중국어">중국어</option>
                            <option value="일본어">일본어</option>
                            <option value="한국어">한국어</option>
                        </select>
                    </div>
            </div>
            <div id="formImage" class="form-input">
                <input type="image" name="image" id="image" required>
            </div>
            <div id="formFormButton" class="form-input">
                <button>등록</button>
            </div>
        </form>
    </div>
    </div>
    <script>
    $("#country").on("change",function(){
   		
    	var a = $("#country").val();
    	
    	console.log(a);
		
	})
	
	$("#language").on("change",function(){
   		
    	var b = $("#language").val();
    	
    	console.log(b);
		
	})
	</script>
    <!-- footer start -->
<footer class="footer">
    <div class="footer-logo-box">
        <div class="logo-images">
            <a href="#"><i class="fab fa-facebook-square fa-2x"></i></a>
            <a href="#"><i class="fab fa-twitter fa-2x"></i></a>
            <a href="#"><i class="fab fa-youtube fa-2x"></i></a>
        </div>
        <div class="go-to-top">
            <a href="#" onclick="scrollToTop()"><i class="far fa-arrow-alt-circle-up fa-3x"></i></a>
        </div>
    </div>
    <div class="footer-table-box">
        <div class="tables-box">
            <table>
                <tr class="table-head">
                    <td>리소스</td>
                </tr>
                <tr>
                    <td><a href="#"><span>크리에이터 후원</span></a></td>
                    <td><a href="#"><span>스토어 문의</span></a></td>
                    <td><a href="#"><span>채용안내</span></a></td>
                </tr>
                <tr>
                    <td><a href="#"><span>에픽게임즈 소개</span></a></td>
                    <td><a href="#"><span>한국법인 소개</span></a></td>
                    <td><a href="#"><span>에픽 뉴스룸</span></a></td>
                </tr>
                <tr>
                    <td><a href="#"><span>팬 아트 정책</span></a></td>
                    <td><a href="#"><span>사용자 경험 조사</span></a></td>
                    <td><a href="#"><span>스토어 EULA</span></a></td>
                </tr>
                <tr>
                    <td><a href="#"><span>에픽 온라인 서비스</span></a></td>
                    <td><a href="#"><span>커뮤니티 규칙</span></a></td>
                    <td><a href="#"><span>본인인증</span></a></td>
                </tr>
            </table>
            <table>
                <tr class="table-head">
                    <td>에픽게임즈 제작</td>
                </tr>
                <tr>
                    <td><a href="#"><span>배틀 브레이커스</span></a></td>
                    <td><a href="#"><span>포트나이트</span></a></td>
                    <td></td>
                </tr>
                <tr>
                    <td><a href="#"><span>인피니티 블레이드</span></a></td>
                    <td><a href="#"><span>로보 리콜</span></a></td>
                    <td></td>
                </tr>
                <tr>
                    <td><a href="#"><span>섀도우 컴플렉스</span></a></td>
                    <td><a href="#"><span>스파이징크스</span></a></td>
                    <td></td>
                </tr>
                <tr>
                    <td><a href="#"><span>언리얼 토너먼트</span></a></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
        <div class="table-box-text">
            <p>스토어 환불 정책이 2021년 6월 10일부로 업데이트 되었습니다. 새로운 변경사항에 대해 확인하시는 것을 권장합니다.</p>
        </div>
    </div>
    <div class="hr">
        <hr>
    </div>
    <div class="footer-copyright-box">
        <p>© 2021, Epic Games, Inc. All Rights Reserved. Epic, Epic Games, Epic Games 로고, Fortnite, Fortnite 로고, Unreal, Unreal Engine, Unreal Engine 로고, Unreal Tournament, Unreal Tournament 로고의 모든 저작권은 Epic Games, Inc.에 있으며, 이는 미국 및 그 외 국가에 모두 해당됩니다. 기타 브랜드 또는 제품 이름은 해당 소유자의 상표입니다. 미국 외 거래는 Epic Games International, S.à r.l.을 통해 이뤄집니다.  </p>
    </div>
    <div class="footer-support-box">
        <div class="support-box-links">
            <a href="#">이용약관</a>
            <a href="#">개인정보처리방침</a>
            <a href="#">스토어 환불 정책</a>
        </div>
        <div class="support-box-logos">
            <a href="#"><img src="/resources/img/game/logo.png" alt=""></a>
            <a href="#"><img src="/resources/img/game/unreal-engine-555438.png" alt=""></a>
        </div>
    </div>
</footer>
<!-- footer end -->
<script type="text/javascript" src="/resources/js/layout/navbar-search.js"></script>
<script type="text/javascript" src="/resources/js/game/register.js"></script>
        <script type="text/javascript" src="/resources/js/layout/footer.js"></script>
</body>
</html>