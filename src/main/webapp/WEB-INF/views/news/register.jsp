<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새 소식 등록</title>
    <link rel="stylesheet" href="/resources/css/layout/navbar.css">
    <link rel="stylesheet" href="/resources/css/layout/navbar-search.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/layout/footer.css">
    <link rel="stylesheet" href="/resources/css/news/register.css">
</head>
<body>
	 <jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
	
    <div class="game-register">
        <div class="input-title">
            <div id="titleGameTitle" class="form-input"><span>제목</span></div>
            <div id="titleGameContent" class="textarea"><span>내용</span></div>
            <div id="titleImage" class="form-input"><span>이미지</span></div>

            <div id="titleFormButton" class="form-input"></div>
        </div>
        <div class="input-form">
        <form action="/news/register" role="form" method="post">
            <div id="formGameTitle" class="form-input">
                <input type="text" name="title" id="title" placeholder="제목을 입력하세요." required>
            </div>
            <div id="formGameContent" class="textarea">
                <textarea name="content" id="content"  placeholder="내용을 입력하세요." required></textarea>
            </div>
            <div id="formImage" class="form-input">
                <input type="file" name="uploadFile" id="uploadFile" accept="image/jpeg,image/png" required>
                <div class="uploadFile">
                	<ul>
                	</ul>
                </div>
            </div> 
            <input type="hidden" name ="userid" id="userid" value="${user.userid}">
            <div id="formFormButton" class="form-input">
                <button type="submit">등록</button>
            </div>
        </form>
    </div>
    </div>
<!-- file upload -->
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
 <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

<script type="text/javascript" src="/resources/js/news/news-common.js"></script>
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
                        showFile(result);
                	},
            		error: function(a){
            			console.log(a);
            		}
            }); //$.ajax
    	});  //change 이벤트
    	
    	//클릭했을때 업로드 된 파일 삭제
    	//$("input[type='file']").click(function(e){
    		//var fn = $("#fileName").val();
    		//var ui = $("#uuid").val();
    		//var up = $("#uploadPath").val();
    		//console.log(fn);
    		//console.log(ui);
    		//console.log(up);
    		//if(fn != null){
    			//console.log("null이 아닐 경우")
    			 //$.ajax({
		           // url: '/news/deleteFile',
		            //data: { fileName: fn, uuid: ui },
		           // dataType: 'text',
		            //type: 'POST',
		            //success: function (result) {
		              //console.log(result);
		              	//$("#fileName").remove();
	    			 	//$("#uuid").remove();
		    			//$("#uploadPath").remove();
		            //},
		          //}) //$.ajax
    			
    		//}
    	//})
    	$(".uploadFile").on("click" ,"button",function(e){
    		console.log("delete 파일 ");
    		var targetFile = $(this).data('file'); 
    		//var targetUuid = $(this).data('uuid'); 
    		var targetLi = $(this).closest("li");
    		var str = "";

    		$.ajax({
    			url:'/news/deleteFile',
    			data:{fileName:targetFile},
    			dataType:'text',
    			type:'POST',
    			success:function(result){
    				alert(result);
    				targetLi.remove();
    			}
    		});//$.ajax
    	}); //click 이벤트
    	
    	
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
    	
    	$("button[type='submit']").on("click", function(e){
    	    e.preventDefault();
			console.log("submit ")
    	    var str = "";
    	    $(".uploadFile ul li").each(function(i, obj){
				console.log("여기도 안찍히는 듯하고 2)");
				var jobj = $(obj);
				console.dir(jobj);
				console.log("-------------------------");
				console.log(jobj.data("filename"));
				str += "<input type='hidden' name='getFile.fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='getFile.uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='getFile.uploadPath' value='"+jobj.data("path")+"'>";
				
    	    });
    	   	console.log("str : " , str);
    	    e.preventDefault();
    	    formObj.append(str).submit();
    	    
    	  });
    	
    	//function fileSubmit(result){
    		//var str = '';
    		//console.log("확인용 obj : " + result);
    		//$(result).each(function(i,obj){
    			//str += "<input type='hidden' id='fileName' name='getFile.fileName' value='" + obj.fileName + "'>"
                //str += "<input type='hidden' id='uuid' name='getFile.uuid' value='" + obj.uuid + "'>"
                //str += "<input type='hidden' id='uploadPath' name='getFile.uploadPath' value='" + obj.uploadPath + "'>"
    		//})
    		
            //console.log("확인용 str : " + str);
            //formObj.append(str);
    	//}
    	
    	function showFile(result){
    		var uploadUl = $(".uploadFile ul");
    		
    		str = "";
    		$(result).each(function(i,obj){
	    		var fileCallPath =  encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
	    		str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"'"
				str += " ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/news/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str += "</li>";
    		});
    		
    		console.log(str);
			uploadUl.append(str);
    	}
	})
</script>
</body>
</html>