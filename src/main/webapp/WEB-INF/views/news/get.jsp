<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${get.title}"/></title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/news/get.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>

    <!-- news get start -->
    <div class="news-get">
        <div class="news-get-image">
            <img src="/resources${get.getFile.uploadPath}/${get.getFile.uuid}_${get.getFile.fileName}" alt="">
        </div>
        <div class="news-get-content">
            <p>
               "${get.content}"
            </p>
        </div>
        <div id ="addButoon"></div>
    </div>
    
    
    <!-- news get end -->

		
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
        <script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
        <script type="text/javascript" src="/resources/js/news/news-common.js"></script>
        
        <script type="text/javascript">
        	$(document).ready(function(){
        		
        		var nno = ${get.nno}
        		var formData = new FormData();
        		if(${user.userid} == ${get.userid}){
        			str = "<button id='modify'>수정</button>"
        			$("#addButoon").append(str);
        		}
        		
        		$("#modify").click(function(){
        			self.location="modify?nno="+nno;
        		})
        	})
        </script>
</body>
</html>