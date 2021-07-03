<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>

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
        <li>| ${game.title}</li>
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
            ${game.title}
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
               ${game.content}
            </p>
        </div>
        <div class="game-attr">
            <div class="attr-box">
                <div class="attr-content">
                    <div class="attr-title">개발사</div>
                    <div class="attr-name">${game.companyvo.company}</div>
                </div>
                <div class="attr-content">
                    <div class="attr-title">퍼블리셔</div>
                    <div class="attr-name">${game.companyvo.company}</div>
                </div>
            </div>
            <div class="attr-box">
            	<div class="attr-content">
                    <div class="attr-title">장르</div>
                    <div class="attr-name">${tag0}</div>
                </div>
                <div class="attr-content">
                    <div class="attr-title">태그</div>
                    <div class="attr-name">${tag}</div>
                </div>
            </div>
            <div class="attr-box">
                <div class="attr-content">
                    <div class="attr-title">연령제한</div>
                    <div class="attr-name">${game.ageLimit}</div>
                </div>
                <div class="attr-content">
                    <div class="attr-title">출시일</div>
                    <div class="attr-name">${game.regDate}</div>
                </div>
            </div>
        </div>
        <div class="game-reviews">
            <div class="review-head">
                <div>유저 리뷰</div>
            </div>
            <li class="reviews-head">
                    <div class="writer">작성자</div>
                    <div class="content">내용</div>
                    <div class="regdate">등록일</div>
                    <div class="likes">좋아요 수</div>
                    <div class="buttons"></div>
                </li>

            <ul class= "chat"></ul><!-- 댓글의 리스트 처리 -->
                
       		<div class="panel-footer"></div> <!-- 댓글의 페이지 처리 -->
        
		
            <li class="reviews-form">
	            <div class="review-apply">
	                <div class="review-form-writer">
	                	<!-- <input type="hidden" class="eot" id="rno" name ="rno"/> -->
	                    <input class="eot" type="text" id="userid" name ="userid" value="유저1" readonly>
	                </div>
	                <div class="review-form-content">
	                    <input class="eot" id='content' name = "content" placeholder="리뷰를 입력하세요." required>
	                </div>
	                <div class="review-form-button">
	                    <button id='addReplyBtn'>등록</button>
	                </div>
	            </div>
             </li> 
        </div>
		
        <div class="spec">사양</div>
        <div class="game-spec">
            <div class="spec-head">WINDOWS
                <hr>
            </div>
            
            <div class="spec-content">
                
                <div id="recomended" class="content-box">
                    <div class="content-box-head">
                        권장
                    </div>
                    <div id="os">
                        <div class="spec-title">운영체제</div>
                        <div class="spec-content">${game.specvo.os}</div>
                    </div>
                    <div id="cpu">
                        <div class="spec-title">프로세서</div>
                        <div class="spec-content">${game.specvo.cpu}</div>
                    </div>
                    <div id="ram">
                        <div class="spec-title">메모리</div>
                        <div class="spec-content">${game.specvo.ram}</div>
                    </div>
                    
                    <div id="language">
                        <div class="spec-title">지원 언어</div>
                        <div class="spec-content">${game.specvo.language}</div>
                    </div>
                    <div id="directX">
                        <div class="spec-title">DirectX</div>
                        <div class="spec-content">11</div>
                    </div>
                    <div id="gpu">
                        <div class="spec-title">그래픽 카드</div>
                        <div class="spec-content">${game.specvo.gpu}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="game-aside">
        <div class="game-aside-image">
            <img src="/resources/img/game/genshin-get-logo.webp" alt="">
        </div>
        <div class="game-aside-price">가격 | ${game.price}₩</div>
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
<script type="text/javascript" src="/resources/js/reply.js"></script>




    
    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




</body>


<script>


			$(document).ready(function () { 
				var gnoValue = '<c:out value="${game.gno}"/>';
				console.log("게임번호는" + gnoValue);
				var replyUL = $(".chat");// div 태그의  class이름이 chat인 DOM 찾고 
				showList(1); //함수 호출 
		
				//페이지처리
				function showList(page) {
					replyService.getList({ gno: gnoValue, page: page || 1 }, function (replyCnt, list) {//댓글 전체 목록 조회
						console.log("댓글 갯수 get.jsp에서 getList 호출함수내에서 댓글 갯수  " + replyCnt);
						console.log("댓글 갯수 get.jsp에서 getList 호출함수내에서 댓글 목록  " + list);
						//마지막 페이지일경우 (-1) 
						if (page == -1) {
							pageNum = Math.ceil(replyCnt / 10.0);
							showList(pageNum);//여기서 pageNum이 기존에 1이던것이 여기 pageNum의 값이 전달됨
							return; //마지막 페이지 이면 함수 종료함 
						}
						var str = "";
						if (list == null || list.length == 0) {
							replyUL.html("");
							return;
						};
						 for(var i =0, len = list.length || 0; i<len; i++){
							str += " <li data-rno='" + list[i].rno+"'>"
							str += " <div class='writer' id = 'id'>"+ list[i].userid + "</div>"
							str += " <div class='content'id = 'con'>"+ list[i].content + "</div>"
							str += " <div class='regDate'>"+ list[i].regDate + "</div>"
							str += " <div class='likes'>"+ list[i].likes + "</div>"
							str += " <div class='buttons'>"
							str += "    <button class='like-button'>"+ "좋아요" + "</button>"
							str += "    <button class='modify-button'>"+ "수정" + "</button>"
							str += "    <button class='delete-button' id='reviewremove'>"+ "삭제" + "</button>"
							str += " </div>" 
							str += " </li>"					
						}; 					
						replyUL.html(str);
						showReplyPage(replyCnt);
					});//end getList , 첫번째 파라미터는  literal 객체 ,두번째 파라미터는 익명함수 
				}; //end showList
				
				
				var pageNum = 1;
				var replyPageFooter = $(".panel-footer");

				function showReplyPage(replyCnt) {  //페이지 계산 함수 정의 
					var endNum = Math.ceil(pageNum / 10.0) * 10;
					var startNum = endNum - 9;

					var prev = startNum != 1;
					var next = false;

					if (endNum * 10 >= replyCnt) {
						endNum = Math.ceil(replyCnt / 10.0);
					}
					if (endNum * 10 < replyCnt) {
						next = true;
					}

					var str = "<ul class='pagination pull-right'>";
					if (prev) {
						str += "<li class='page-item'><a class='page-link' href ='" + (startNum - 1) + "'>이전 페이지</a></li>";
					}
					for (var i = startNum; i <= endNum; i++) {
						var active = pageNum == i ? "active" : "";
						str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
					}
					if (next) {
						str += "<li class='page-item'><a class='page-link' href ='" + (endNum + 1) + "'>다음 페이지</a></li>";
					}
					str += "</ul></div>";
					console.log(str);
					replyPageFooter.html(str);
				}


				var modal = $(".modal");
				var modalInputReply = modal.find("input[name='content']");
				var modalInputReplyer = modal.find("input[name='userid']");
				var modalInputReplyDate = modal.find("input[name='regDate']");

				var modalModBtn = $("#modalModBtn");
				var modalRemoveBtn = $("#modalRemoveBtn");
				var modalRegisterBtn = $("#modalRegisterBtn");
				var modalCloseBtn = $("#modalCloseBtn");
				
			
				var replyer = null;
				<sec:authorize access ="isAuthenticated()">
					userid ='<sec:authentication property ="principal.username"/>';
				</sec:authorize>
				
				var csrfHeaderName = "${_csrf.headerName}";
			    var csrfTokenValue = "${_csrf.token}";   
	
				var eot = $(".eot");
				var ec = $("#content");
				var eu = $("#userid");
				var en = $("#rno");
				
				var reviewReplyer = eot.find("input[name='userid']");
				
				$("#addReplyBtn").on("click",function(e){
					var content={
							content: ec.val(),
							userid: eu.val(),
							//rno: en.val(),
							gno:gnoValue	
					};
					console.log("댓글 등록이 잘들어오나");
					replyService.add(content,function(result){
						alert(result);
						eot.find("input").val("");
						showList(-1);
					})
				});
				
				//댓글 삭제
				$(".chat").on("click", ".delete-button", function (e) {
					//var rno = modal.data("rno");
					var rno = $(this).closest("li").data("rno");
					console.log("Rno : " +rno);
					console.log("Replyer : " +userid);
					
					/* if(!userid){
						alert("로그인후 삭제가 가능합니다");
						modal.modal("hide");
						return ;
					}*/
					
					var originalReplyer = reviewReplyer.val();
					console.log("작성자는? "+ originalReplyer);
					/*
					console.log("OriginalReplyer : " + originalReplyer); //댓글의 원래 작성자 
					if(userid!= originalReplyer){
						alert("자신이 작성한 댓글만  삭제가 가능합니다");
						modal.modal("hide");
						return ;
					} */
					replyService.remove(rno, originalReplyer , function (result) {
						alert(result);
						showList(pageNum);
					})
					flag = true;
				});
						
				var inputCo = "";
                var flag = true;
				var chat = $(".chat");
				//부모(.chat/ul) 아래의 수정버튼(modify-button)을 누르면 
				 $(".chat").on("click", "button", function (e) {
					 
					 var thisClass =  this.getAttribute("class");
					 var rno = $(this).closest("li").data("rno");// modify버튼 클릭 시 가까운 li(closest)를 찾아 data-rno의 정보에서 rno 정보만 가져옴
 					 var con = $(this).closest("li").find("div");
 					 var but = $(this).closest("div").find("button");

                    if(flag){
                    	
    			 		
                    	
					 	if(thisClass == "modify-button"){
						
						inputCo = $(this).closest("li").find("#con").text();
						console.log(inputCo);
						con[1].innerHTML = "<input type='text' name = 'content' value='"+con[1].innerText+"' id='modifyReply' size='40' />";
						
						but[0].setAttribute("class", 'modifyBtn');
						but[0].setAttribute("onclick", "clickModReview()")
						but[0].innerHTML = "완료";
						
						but[1].setAttribute("class", 'cancelBtn');
						but[1].innerHTML ="취소";

                        flag = false;
					 	}
					 	
					 	replyService.read(rno, function (content) {
							console.log("두 번째 파라미터(콜백함수)에 들어오나? " + rno)
							
							//modifyReplyDate.val(replyService.displayTime(content.regDate)).attr("readonly", "readonly");
							chat.data("rno", content.rno);
						}); 
                         
                    }
						
					if(thisClass == "cancelBtn"){	
						 //inputCo에 원래 content값을 저장
						$("#modifyReply").remove(); //input태그의 modifyReply삭제
						con[1].innerText = inputCo; //다시 div에 inputCo(content값)을 저장
						console.log("im ")
						but[0].setAttribute("class", 'like-button');
						but[0].setAttribute("onclick", "null")
						but[0].innerHTML = "좋아요";
				
						but[1].setAttribute("class", "modify-button");
						but[1].innerHTML ="수정";
                           flag = true;

					}
					
						 
				}); 
				
					window.clickModReview = function(){//수정 버튼을 누르면   | 주석처리된 내용  $(".chat") 으로 옮겨야됨(유저아이디 확인)
							var modifyReply = chat.find("input[name='content']");
							var modifyReplyer = chat.find("input[name='userid']");
							var modifyReplyDate = chat.find("input[name='regDate']");
							
							console.log(modifyReplyer)
					
							console.log("완료버튼이 눌리나");
							var rno = chat.data("rno"); //추가 
							
							var originalReplyer = modifyReplyer.val();
							var content={
								rno: chat.data("rno"),
								//regDate : modifyReplyDate.val(),
								content: modifyReply.val(),
								userid: originalReplyer}
							console.log("Rno : " +rno);
							console.log("Replyer : " +userid);
							console.log("Content : " +content);
							/* if(!userid){
								alert("로그인후 수정이 가능합니다");
								modal.modal("hide");
								return ;
							}
							console.log("OriginalReplyer : " + originalReplyer); //댓글의 원래 작성자 
							if(userid!= originalReplyer){
								alert("자신이 작성한 댓글만  수정이 가능합니다");
								modal.modal("hide");
								return ;
							} */
							
							replyService.update(content, function (result) {
								alert(result);
								showList(pageNum);//전체 데이터 가져오는 함수 호출 시 페이지 번호 전달하여 가져옴
							});
							
							flag = true;
					};
				
				//댓글 페이지
				replyPageFooter.on("click", "li a", function (e) {//li 태그로 만든 페이지 번호를 누르면
					e.preventDefault();
					console.log("페이지가 눌렸어요");
					var targetPageNum = $(this).attr("href");
					//this는 누른 페이지 li 태그이고 이 때의 li 태그의 href 속성을 얻어옴 href = "3(페이지)"
					console.log("targetPageNum: " + targetPageNum);
					pageNum = targetPageNum;
					showList(pageNum);
				});
				
			}); //document ready 의 끝
</script>
</html>