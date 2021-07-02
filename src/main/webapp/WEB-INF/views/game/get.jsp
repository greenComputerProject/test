<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Genshin Impact | 무료 다운로드 및 플레이</title>
    <link rel="stylesheet" href="/resources/css/layout/navbar.css">
    <link rel="stylesheet" href="/resources/css/layout/navbar-search.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/layout/footer.css">
    <link rel="stylesheet" href="/resources/css/game/get.css">
    <link rel="stylesheet" href="/resources/css/layout/order-form.css">
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
        <li><a href="#" id="not-selected" onclick="clickSearch(this)">< 검색으로 돌아가기</a></li>
        <li>| 원신</li>
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
   <!-- game get start -->
<div class="game">
    <div class="game-content">
        
        <div class="game-title">
            원신
        </div>
        <div class="game-slide">
            <div class="slide-image active"><img src="/resources/img/game/genshin-slide-image-1.jpg" alt=""></div>
            <div class="slide-image"><img src="/resources/img/game/genshin-slide-image-2.jpg" alt=""></div>
            <div class="slide-image"><img src="/resources/img/game/genshin-slide-image-3.jpg" alt=""></div>
            <div class="slide-image"><img src="/resources/img/game/genshin-slide-image-4.jpg" alt=""></div>
            <div class="slide-image"><img src="/resources/img/game/genshin-slide-image-5.jpg" alt=""></div>
        </div>
        <div class="game-slide-dots">
            <ul>
                <!-- <li id="prev-dot" class="side-dot" ><div>&#10094;</div></li>
                <li id="1" class="dot selected"></li>
                <li id="2" class="dot"></li>
                <li id="3" class="dot"></li>
                <li id="4" class="dot"></li>
                <li id="5" class="dot"></li>
                <li id="next-dot" class="side-dot"><div>&#10095;</div></li> -->
            </ul>
        </div>
        <div class="game-text">
            <p>
                당신은 게임 속에서 「티바트」라 불리는 판타지 세계를 탐험하게 됩니다. 이 광활한 세계에서 당신은 일곱 나라를 돌아다니면서 다양한 성격과 독특한 능력을 지닌 동료들과 만나고 강력한 적을 함께 무찌르며 잃어버린 혈육을 되찾는 여정을 나서게 됩니다. 또한, 목적 없이 여행하며 생명이 충만한 세상에서 구석구석의 숨겨진 비밀들을 파헤칠 수도 있습니다. 당신이 잃어버린 혈육과 재회하는 날, 이 모든 것의 진실을 알게 될 것입니다.
            </p>
        </div>
        <div class="game-attr">
            <div class="attr-box">
                <div class="attr-content">
                    <div class="attr-title">개발사</div>
                    <div class="attr-name">miHoYo Limited</div>
                </div>
                <div class="attr-content">
                    <div class="attr-title">태그</div>
                    <div class="attr-name">
                        <ul class="attr-tags">
                            <li>RPG</li>,
                            <li>Open World</li>,
                            <li>Adventure</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="attr-box">
                <div class="attr-content">
                    <div class="attr-title">퍼블리셔</div>
                    <div class="attr-name">miHoYo Limited</div>
                </div>
                <div class="attr-content">
                    <div class="attr-title">플랫폼</div>
                    <div class="attr-name">Windows</div>
                </div>
            </div>
            <div class="attr-box">
                <div class="attr-content">
                    <div class="attr-title">출시일</div>
                    <div class="attr-name">2021년 6월 9일</div>
                </div>
                <div class="attr-content">
                    <div class="attr-title"></div>
                    <div class="attr-name"></div>
                </div>
            </div>
        </div>
        <div class="game-reviews">
            <div class="review-head">
                <div>유저 리뷰</div>
            </div>
            <ul>
                <li class="reviews-head">
                    <div class="writer">작성자</div>
                    <div class="content">내용</div>
                    <div class="regdate">등록일</div>
                    <div class="likes">좋아요 수</div>
                    <div class="buttons"></div>
                </li>
                <li>
                    <div class="writer">송강찬</div>
                    <div class="content">재밌어요</div>
                    <div class="regdate">2021-06-22</div>
                    <div class="likes">12</div>
                    <div class="buttons">
                        <button class="like-button">좋아요</button>
                        <button class="delete-button">삭제</button>
                    </div>
                </li>
                <li>
                    <div class="writer">송강찬</div>
                    <div class="content">재밌어요</div>
                    <div class="regdate">2021-06-22</div>
                    <div class="likes">12</div>
                    <div class="buttons">
                        <button class="like-button">좋아요</button>
                        <button class="delete-button">삭제</button>
                    </div>
                </li>
                <li>
                    <div class="writer">송강찬</div>
                    <div class="content">재밌어요</div>
                    <div class="regdate">2021-06-22</div>
                    <div class="likes">12</div>
                    <div class="buttons">
                        <button class="like-button">좋아요</button>
                        <button class="delete-button">삭제</button>
                    </div>
                </li>
                <li>
                    <div class="writer">송강찬</div>
                    <div class="content">재밌어요</div>
                    <div class="regdate">2021-06-22</div>
                    <div class="likes">12</div>
                    <div class="buttons">
                        <button class="like-button">좋아요</button>
                        <button class="delete-button">삭제</button>
                    </div>
                </li>
                <li>
                    <div class="writer">송강찬</div>
                    <div class="content">재밌어요</div>
                    <div class="regdate">2021-06-22</div>
                    <div class="likes">12</div>
                    <div class="buttons">
                        <button class="like-button">좋아요</button>
                        <button class="delete-button">삭제</button>
                    </div>
                </li>
                <li>
                    <div class="writer">송강찬</div>
                    <div class="content">재밌어요</div>
                    <div class="regdate">2021-06-22</div>
                    <div class="likes">12</div>
                    <div class="buttons">
                        <button class="like-button">좋아요</button>
                        <button class="delete-button">삭제</button>
                    </div>
                </li>
                <li>
                    <div class="writer">송강찬</div>
                    <div class="content">재밌어요</div>
                    <div class="regdate">2021-06-22</div>
                    <div class="likes">12</div>
                    <div class="buttons">
                        <button class="like-button">좋아요</button>
                        <button class="delete-button">삭제</button>
                    </div>
                </li>
                <li>
                    <div class="writer">송강찬</div>
                    <div class="content">재밌어요</div>
                    <div class="regdate">2021-06-22</div>
                    <div class="likes">12</div>
                    <div class="buttons">
                        <button class="like-button">좋아요</button>
                        <button class="delete-button">삭제</button>
                    </div>
                </li>
                <li>
                    <div class="writer">오윤식</div>
                    <div class="content">재미없어요</div>
                    <div class="regdate">2021-06-21</div>
                    <div class="likes">12</div>
                    <div class="buttons">
                        <button class="like-button">좋아요</button>
                        <button class="delete-button">삭제</button>
                    </div>
                </li>
                <li>
                    <div class="writer">송민섭</div>
                    <div class="content">그냥 그래요</div>
                    <div class="regdate">2021-06-20</div>
                    <div class="likes">12</div>
                    <div class="buttons">
                        <button class="like-button">좋아요</button>
                        <button class="delete-button">삭제</button>
                    </div>
                </li>
                <li class="reviews-form">
                        <form action="#">
                            <div class="review-form-writer">
                                <input type="text" id="writer" name="writer" value="유저1" readonly>
                            </div>
                            <div class="review-form-content">
                                <input type="text" id="content" name="content" placeholder="리뷰를 입력하세요." required>
                            </div>
                            <div class="review-form-button">
                                <button type="submit">등록</button>
                            </div>
                        </form>
                </li>
            </ul>
            
        </div>
        <div class="spec">사양</div>
        <div class="game-spec">
            <div class="spec-head">WINDOWS
                <hr>
            </div>
            
            <div class="spec-content">
                <div id="minimum" class="content-box">
                    <div class="content-box-head">
                        최소
                    </div>
                    <div id="os">
                        <div class="spec-title">운영체제</div>
                        <div class="spec-content">Windows 7 SP1 64비트, Windows 8.1 64비트, 또는 Windows 10 64비트(Windows 10 개발자 빌드는 현재 지원되지 않음)</div>
                    </div>
                    <div id="processor">
                        <div class="spec-title">프로세서</div>
                        <div class="spec-content">Intel Core i5 또는 동급의 제품</div>
                    </div>
                    <div id="memory">
                        <div class="spec-title">메모리</div>
                        <div class="spec-content">8GB</div>
                    </div>
                    
                    <div id="storage">
                        <div class="spec-title">스토리지</div>
                        <div class="spec-content">30GB</div>
                    </div>
                    <div id="directX">
                        <div class="spec-title">DirectX</div>
                        <div class="spec-content">11</div>
                    </div>
                    <div id="gpu">
                        <div class="spec-title">그래픽 카드</div>
                        <div class="spec-content">NVIDIA® GeForce® GT 1030 이상</div>
                    </div>
                </div>
                <div id="recomended" class="content-box">
                    <div class="content-box-head">
                        권장
                    </div>
                    <div id="os">
                        <div class="spec-title">운영체제</div>
                        <div class="spec-content">Windows 7 SP1 64비트, Windows 8.1 64비트, 또는 Windows 10 64비트(Windows 10 개발자 빌드는 현재 지원되지 않음)</div>
                    </div>
                    <div id="processor">
                        <div class="spec-title">프로세서</div>
                        <div class="spec-content">Intel Core i7 또는 동급의 제품</div>
                    </div>
                    <div id="memory">
                        <div class="spec-title">메모리</div>
                        <div class="spec-content">16GB</div>
                    </div>
                    
                    <div id="storage">
                        <div class="spec-title">스토리지</div>
                        <div class="spec-content">30GB</div>
                    </div>
                    <div id="directX">
                        <div class="spec-title">DirectX</div>
                        <div class="spec-content">11</div>
                    </div>
                    <div id="gpu">
                        <div class="spec-title">그래픽 카드</div>
                        <div class="spec-content">NVIDIA® GeForce® GTX 1060 6GB 이상</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="game-aside">
        <div class="game-aside-image">
            <img src="/resources/img/game/genshin-get-logo.webp" alt="">
        </div>
        <div class="game-aside-price">무료</div>
        <div class="game-aside-download">
            <button class="download-button" onclick="showPopup()">구매</button>
        </div>
        <div class="game-aside-wishlist">
            <button class="wishlist-button">
                <i class="fas fa-plus-circle"></i>
                위시리스트에 추가</button>
        </div>
        <div class="game-aside-rating">
            <div class="my-rating">내가 준 별점 : <span>3</span></div>
            <div class="avg-rating">평균 별점 : <span>4</span></div>
            <div class="stars">
                <i id="1" class="fa fa-star fa-2x" onmouseover="hoverStar(this)" onclick="clickStar(this)"></i>
                <i id="11" class="fa fa-star fa-2x" onmouseover="hoverStar(this)" onclick="clickStar(this)"></i>
                <i id="111" class="fa fa-star fa-2x" onmouseover="hoverStar(this)" onclick="clickStar(this)"></i>
                <i id="1111" class="fa fa-star fa-2x" onmouseover="hoverStar(this)" onclick="clickStar(this)"></i>
                <i id="11111" class="fa fa-star fa-2x" onmouseover="hoverStar(this)" onclick="clickStar(this)"></i>
            </div>
        </div>
    </div>
</div>

   <!-- game get end -->
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
<script type="text/javascript" src="/resources/js/game/get.js"></script>
        <script type="text/javascript" src="/resources/js/layout/footer.js"></script>
        <script type="text/javascript" src="/resources/js/layout/order-form.js"></script>
</body>
</html>