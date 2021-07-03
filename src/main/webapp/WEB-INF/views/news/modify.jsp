<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새 소식 수정</title>
    <link rel="stylesheet" href="/resources/css/layout/navbar.css">
    <link rel="stylesheet" href="/resources/css/layout/navbar-search.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/layout/footer.css">
    <link rel="stylesheet" href="/resources/css/news/register.css">
    <link rel="stylesheet" href="/resources/css/news/modify.css">
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
        <li>| 새 소식 수정 </li>
    </ul>

    
</div>
    <!-- navbar end -->

    <div class="game-register">
        <div class="input-title">
            <div id="titleGameTitle" class="form-input"><span>제목</span></div>
            <div id="titleGameContent" class="textarea"><span>내용</span></div>
            <div id="titleImage" class="form-input"><span>이미지</span></div>

            <div id="titleFormButton" class="form-input"></div>
        </div>
        <div class="input-form">
        <form action="/news/modify" role="form" method="post">
            <div id="formGameTitle" class="form-input">
                <input type="text" name="title" id="title" placeholder="제목을 입력하세요." value="${get.title}" required>
            </div>
            <div id="formGameContent" class="textarea">
                <textarea name="content" id="content"  placeholder="내용을 입력하세요." required>${get.content}</textarea>
            </div>
            <div id="formImage" class="form-input">
                <input type="file" name="uploadFile" id="uploadFile" accept="image/gif,image/jpeg,image/png" multiple required>
            </div>
            <input type="hidden" name="nno" id="nno" value="${get.nno}" >
            <div id="formFormButton" class="form-input">
                <button id="modify" type="submit">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>
        </form>
    </div>
    </div>

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
<script type="text/javascript" src="/resources/js/layout/footer.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<!-- file upload -->
<script>
	
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		//file type input 
        $("input[type='file']").change(function(e){
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            var files = inputFile[0].files;
            for(var i = 0; i < files.length; i++){
                if(!fileCheck(files[i].name)){
                    return false;
                }
                formData.append("uploadFile", files[i]);
                console.log("확인 1)" + files[i]);
            }
            
            $.ajax({
                    url: '/news/uploadAjaxAction',
                    processData: false, 
                    contentType: false,
                    data: formData,
                    type: 'POST',
                    dataType:'json',
                    success: function(result){
                        console.log("result :  "+ result); 
                        fileSubmit(result);
                	},
            		error: function(a){
            			console.log(a);
            		}
            }); //$.ajax
    	});  //change 이벤트
    	
    	//클릭했을때 업로드 된 파일 삭제
    	$("input[type='file']").click(function(e){
    		var fn = $("#fileName").val();
    		var ui = $("#uuid").val();
    		var up = $("#uploadPath").val();
    		console.log(fn);
    		console.log(ui);
    		console.log(up);
    		if(fn != null){
    			console.log("null이 아닐 경우")
    			 $.ajax({
		            url: '/news/deleteFile',
		            data: { fileName: fn, uuid: ui },
		            dataType: 'text',
		            type: 'POST',
		            success: function (result) {
		              console.log(result);
		              	$("#fileName").remove();
	    			 	$("#uuid").remove();
		    			$("#uploadPath").remove();
		            },
		          }) //$.ajax
    		}//if
    	})//click function
    	
      	//이미지 파일만 올리게 하는 함수 생성
    	function fileCheck(obj){
    		console.log(obj);
    		pathpoint= obj.lastIndexOf('.');
    		filepoint= obj.substring(pathpoint+1, obj.length);
    		filetype= filepoint.toLowerCase();
    		if(filetype=='jpg'||filetype=='png'||filetype=='jpeg'){
    			//올릴수 있는 이미지 확장자 인 경우
    			console.log("image file");
    			return true;
    		}else{
    			alert("이미지 파일만 선택할 수 있습니다.");
    			return false;
    		}
    	}
    	
    	//db에 올리기위해 input 태그추가 함수
    	function fileSubmit(result){
    		var str = '';
    		console.log("확인용 obj : " + result);
    		$(result).each(function(i,obj){
    			str += "<input type='hidden' id='fileName' name='getFile.fileName' value='" + obj.fileName + "'>"
                str += "<input type='hidden' id='uuid' name='getFile.uuid' value='" + obj.uuid + "'>"
                str += "<input type='hidden' id='uploadPath' name='getFile.uploadPath' value='" + obj.uploadPath + "'>"
    		})
    		
            console.log("확인용 str : " + str);
            formObj.append(str);
    	}
	})
</script>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		
		$("#delete").click(function(e){
			e.preventDefault();
			console.log('delete')
			formObj.attr("action", "/news/delete");
			formObj.submit();
		})
	})
</script>
</body>
</html>