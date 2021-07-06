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
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    <link rel="stylesheet" href="/resources/css/game/get.css">
    <link rel="stylesheet" href="/resources/css/layout/order-form.css">
</head>
<body>
   <jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
   <!-- game get start -->
<div class="game">
    <div class="game-content">
        
        <div class="game-title">
            ${game.title}
        </div>
        <div class="game-slide">
        	<c:if test="${game.resourcevo.video != null}">
            <div class="slide-image active"><iframe width="100%" height="435vw" src="https://www.youtube.com/embed/${game.resourcevo.video}?autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
            </c:if>
            <c:forEach var="picture" items="${game.pictureList}">
            	<div class="slide-image"><img src="${picture.contentPicture}" alt=""></div>
            </c:forEach>
        </div>
        <div class="game-slide-dots">
            <ul>
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
            <ul class="reviews-head">
                <li>
                    <div class="writer">작성자</div>
                    <div class="content">내용</div>
                    <div class="regdate">등록일</div>
                    <div class="likes"><i class="far fa-thumbs-up"></i></div>
                    <div class="buttons"></div>
                </li>
            </ul>

            <ul class= "chat"></ul><!-- 댓글의 리스트 처리 -->
                
       		<div class="panel-footer"></div> <!-- 댓글의 페이지 처리 -->
        
		
            <div class="reviews-form">
	            <div class="review-apply">
	                <div class="review-form-writer">
	                	<!-- <input type="hidden" class="eot" id="rno" name ="rno"/> -->
	                    <input class="eot" type="text" id="idname" name ="name" value="${user.name}" readonly> 
	                    <input type="hidden" id="userid" value="${user.userid}">
	                </div>
	                <div class="review-form-content">
	                    <input class="eot" id='content' name = "content" placeholder="리뷰를 입력하세요." required>
	                </div>
	                <div class="review-form-button">
	                    <button id='addReplyBtn'>등록</button>
	                </div>
	            </div>
             </div> 
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
            <img src="${game.resourcevo.logo}" alt="">
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
        
        <div class="game-button">
        	<a href="/game/modify?title=${game.title}" class="game-modify" style="display: none;"><span>게임 수정</span></a>
        </div>
    </div>
</div>

   <!-- game get end -->
  <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/game/get.js"></script>
<script type="text/javascript" src="/resources/js/layout/order-form.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>




    
    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




</body>


<script>


		if('${user.userid}' == '${game.userid}'){
			document.querySelector('.game-modify').style.display = 'flex';	
		}
		
		let changeNavbarSearch = function() {
		    let searchLinks = document.querySelectorAll(".navbar-search-links li");
			console.log(searchLinks)
		    searchLinks[0].innerHTML = '<a href="/browse" id="not-selected" onclick="clickSearch(this)">< 목록으로 돌아가기</a>'
		    searchLinks[1].innerHTML = "<span>"+ 
		        "| " + '${game.title}'
		    +"</span>"

		    let searchForm = document.querySelector(".navbar-search-wishlist-and-form");
		    searchForm.style.display = "none";
		    console.log(searchForm);
		}
		//navbar-search 화면 변경
		changeNavbarSearch();

    

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
							str += '<input type= "hidden" id="uid" value = "'+ list[i].userid +'" readonly/>';
							str += " <div class='writer' id = 'idname' name = 'originid' >"+ list[i].name + "</div>"
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
					
					var amountPerPage = 6;
					
					if (endNum * amountPerPage >= replyCnt) {
						endNum = Math.ceil(replyCnt / 6.0);
					}
					if (endNum * amountPerPage < replyCnt) {
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

					
				var replyer = null;
				<sec:authorize access ="isAuthenticated()">
					userid ='<sec:authentication property ="principal.username"/>';
				</sec:authorize>
				
				console.log("userid ======> " + userid);
				
				var csrfHeaderName = "${_csrf.headerName}";
			    var csrfTokenValue = "${_csrf.token}";   
	
				var eot = $(".eot");
				var ec = $("#content");
				var eu = $("#userid");
				var en = $("#rno");
				
				
				var replyDate = eot.find("div[name='regDate']").text();
				
				//댓글 등록
				$("#addReplyBtn").on("click",function(e){
					var content={
							content: ec.val(),
							userid: eu.val(),
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
					var rno = $(this).closest("li").data("rno");
					var userid = eu.val();
					var reviewReplyer = $(this).closest("li").find("input[id='uid']").val();	
					var originalReplyer = reviewReplyer;
					
					console.log("댓글번호 : " +rno);
					console.log("로그인한아이디 : " +userid);
					console.log("댓글 작성자는? "+ originalReplyer);//댓글의 원래 작성자 
					
					if(!userid){
						alert("로그인 후 삭제가 가능합니다");
						return ;
					}
					if(userid!= originalReplyer){
						alert("자신이 작성한 댓글이 아닙니다.");
						return ;
					} 
					
					replyService.remove(rno, originalReplyer , function (result) {
						alert(result);
						showList(pageNum);
					})
					flag = true;
				});
						
				var inputCo = "";
                var flag = true;
				var chat = $(".chat");
				
				//댓글 수정
				 $(".chat").on("click", "button", function (e) {
					 
					 var thisClass =  this.getAttribute("class");
					 var rno = $(this).closest("li").data("rno");// modify버튼 클릭 시 가까운 li(closest)를 찾아 data-rno의 정보에서 rno 정보만 가져옴
 					 var con = $(this).closest("li").find("div");
 					 var but = $(this).closest("div").find("button");

                    if(flag){
                    	
					 	if(thisClass == "modify-button"){
					 		var userid = eu.val();
					 		var modifyReplyer = $(this).closest("li").find("input[id='uid']").val();	
	    					var originalReplyer = modifyReplyer;
	    					
	    					if(!userid){
	    						alert("로그인 후 수정이 가능합니다.");
	    						return ;
	    					}
	    					console.log("로그인한 아이디: " + userid);
	    					console.log("모디파이리플라이어" + modifyReplyer);
	    					console.log("댓글의 작성자 : " + originalReplyer); //댓글의 원래 작성자 
	    					
	    					if(userid!= originalReplyer){
	    						alert("자신이 작성한 댓글만 수정이 가능합니다.");
	    						return ;
	    					}  	
					 		
					 		
					 		
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
							//replyDate.val(replyService.displayTime(content.regDate)).attr("readonly", "readonly");
							chat.data("rno", content.rno);
						}); 
                         
                    }
						
					if(thisClass == "cancelBtn"){	
						 //inputCo에 원래 content값을 저장
						$("#modifyReply").remove(); //input태그의 modifyReply삭제
						con[1].innerText = inputCo; //다시 div에 inputCo(content값)을 저장
						console.log("취소버튼누름");
						but[0].setAttribute("class", 'like-button');
						but[0].setAttribute("onclick", "null")
						but[0].innerHTML = "좋아요";
				
						but[1].setAttribute("class", "modify-button");
						but[1].innerHTML ="수정";
                           flag = true;

					}
					
						 
				}); 
				
					window.clickModReview = function(){//완료 버튼을 누르면
							var modifyReply = chat.find("input[name='content']");
							var modifyReplyer = chat.find("input[name='userid']");
							var modifyReplyDate = chat.find("input[name='regDate']");
							
							console.log(modifyReplyer)
					
							console.log("완료버튼이 눌리나");
							var rno = chat.data("rno"); //추가 
							
							var originalReplyer = modifyReplyer.val();
							var content={
								rno: chat.data("rno"),
								regDate : modifyReplyDate.val(),
								content: modifyReply.val(),
								userid: originalReplyer}
							console.log("댓글번호 : " +rno);
							console.log("작성자id : " +userid);
							console.log("댓글내용 : " +content);
							 							
							replyService.update(content, function (result) {
								alert(result);
								//replyDate.val(replyService.displayTime(content.regDate));
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