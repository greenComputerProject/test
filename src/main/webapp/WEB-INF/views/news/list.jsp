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
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/resources/css/news/list.css">
</head>
<body>
   
	<jsp:include page="/WEB-INF/views/layout/navbar.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/layout/navbar-search.jsp"></jsp:include>
   
    <!-- navbar end -->
 
    <!-- news get start -->
    <div class="news-list">
        <div class="news-title">
            새 소식 
        </div>
        <div class="news-new">
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
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
<script type="text/javascript" src="/resources/js/news/news-common.js"></script>

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