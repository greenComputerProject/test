<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새 소식 수정</title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/news/register.css">
    <link rel="stylesheet" href="/resources/css/news/modify.css">
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
        <form action="/news/modify" role="form" method="post">
            <div id="formGameTitle" class="form-input">
                <input type="text" name="title" id="title" placeholder="제목을 입력하세요." value="${get.title}" required>
            </div>
            <div id="formGameContent" class="textarea">
                <textarea name="content" id="content"  placeholder="내용을 입력하세요." required>${get.content}</textarea>
            </div>
            <div id="formImage" class="form-input">
                <input type="file" name="uploadFile" id="uploadFile" accept="image/jpeg,image/png"  required>
                <div class="uploadFile">
                	<ul>
                	</ul>
                </div>
            </div>
            <input type="hidden" name="nno" id="nno" value="${get.nno}" >
            <div id="formFormButton" class="form-input">
                <button id="modify" type="submit">수정</button>
                <button id="delete" type="submit">삭제</button>
            </div>
        </form>
    </div>
    </div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

<script type="text/javascript" src="/resources/js/news/news-common.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>

<script>
	$(document).ready(function () {
		(function () {
			var nno = ${get.nno};
			$.getJSON("/news/getFileList", { nno: nno }, function (arr) {
				console.log(arr);
				str = "";
				$(arr).each(function (i, obj) {
					var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_"
						+ obj.fileName);
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
				$(".uploadFile ul").html(str);
			});//end getjson
		})();//end function
	})
</script>

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
		            //url: '/news/deleteFile',
		            //data: { fileName: fn, uuid: ui },
		            //dataType: 'text',
		            //type: 'POST',
		            //success: function (result) {
		              //console.log(result);
		              	//$("#fileName").remove();
	    			 	//$("#uuid").remove();
		    			//$("#uploadPath").remove();
		            //},
		          //}) //$.ajax
    		//}//if
    	//})//click function
    	
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
    	
    	$("button[type='submit']").on("click", function(e){
    	    e.preventDefault();
			console.log("submit ")
    	    var str = "";
    	    $(".uploadFile ul li").each(function(i, obj){
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
      	
    	//db에 올리기위해 input 태그추가 함수
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