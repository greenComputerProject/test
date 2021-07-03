<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Epic Games Store | 새소식</title>
    <link rel="stylesheet" href="/resources/css/layout/navbar.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/layout/footer.css">
    <link rel="stylesheet" href="/resources/css/news/list.css">
</head>
<body>
    <!-- navbar start -->
    <div class="navbar">
        <ul class="navbar-menu-center">
            <li><a href="#" class="navbar-menu-center-logoLink"><p><img class="logo" src="/resources/img/layout/epic logo.png" alt=""></p></a></li>
            <li><a href="#" class="navbar-menu-center-menuLink"><p>스토어</p></a></li>
            <li><a href="#" class="navbar-menu-center-menuLink selected"><p>새 소식</p></a></li>
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
    <!-- navbar end -->
 
    <!-- news get start -->
    <div class="news-list">
        <div class="news-title">
            새 소식 
        </div><div class="news-new">
        <c:forEach items="${news_list}" var="news" begin="0" end="1">
		            <div class="new-box">
		                <a href="/news/get?nno=${news.nno}">
		                    <div class="new-image">
		                        <img src="/resources${news.getFile.uploadPath}/${news.getFile.uuid}_${news.getFile.fileName}" alt="">
		                    </div>
		                    <div class="new-date"> 
		                        <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${news.regDate}" /> 
		                    </div>
		                    <div class="new-title">
		                        <c:out value="${news.title}"/>
		                    </div>
		                    <div class="new-details">
		                        <u>자세히 보기</u>
		                        
		                    </div>
		                </a>
		            </div>
		</c:forEach>
		</div>
		<c:forEach items="${news_list}" var="news" begin="2" >
		   
				<div class="news-old">
		            <ul>
		                <li>
		                    <a href="/news/get?nno=${news.nno}">
		                        <div class="old-image">
		                            <img src="/resources${news.getFile.uploadPath}/${news.getFile.uuid}_${news.getFile.fileName}" alt="">
		                        </div>
		                        <div class="old-text">
		                            <div class="old-date">
		                                <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${news.regDate}" />
		                            </div>
		                            <div class="old-title">
		                                <c:out value="${news.title}"/>
		                            </div>
		                            <div class="old-details">
		                                <u>자세히 보기</u>
		                            </div>
		                        </div>
		                    </a>
		                </li>
		            </ul>
		        </div>
		   </c:forEach>
    </div>
    <!-- new get end -->

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
<script type="text/javascript" src="/resources/js/layout/footer.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<script>
$(document).ready(function(){
	//시간 변경 함수
	function displayedAt(createdAt) {
		  const regDate = new Date(createdAt);
		  const milliSeconds = new Date() - regDate
		  const seconds = milliSeconds / 1000
		  if (seconds < 60) return `방금 전`
		  const minutes = seconds / 60
		  if (minutes < 60) return `\${Math.floor(minutes)}분 전`
		  const hours = minutes / 60
		  if (hours < 24) return `\${Math.floor(hours)}시간 전`
		  const days = hours / 24
		  if (days < 7) return `\${Math.floor(days)}일 전`
		  const weeks = days / 7
		  if (weeks < 5) return `\${Math.floor(weeks)}주 전`
		  const months = days / 30
		  if (months < 12) return `\${Math.floor(months)}개월 전`
		  const years = days / 365
		  return `${Math.floor(years)}년 전`
		}
	//console.log(displayedAt('2021/07/01 16:30:09'));
	//console.log(new Date());
	const newDate = $(".new-date")
	//const abc = $($(".new-date")[0]).text();
	console.log(newDate);
	newDate.each((i,item)=>{
		const param = $(item).text();
		//console.log(param)
		const result = displayedAt(param);
		$(item).text(result);
	});
	
	const oldDate = $(".old-date")
	oldDate.each((i,item)=>{
		const param = $(item).text();
		const result = displayedAt(param);
		$(item).text(result);
	});
	
})
	
	
	
	
</script>
</body>
</html>