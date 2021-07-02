<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginSuccess</title>
</head>
<body>
	<h1>Welcome <c:out value="${user.name}"></c:out> </h1>
	<h2>Your Email is <c:out value="${user.email}"></c:out>.</h2>
	<h3>Your UserId is <c:out value="${user.userid}"></c:out></h3>
	<form action="/logout" method="POST">
		<button>Logout</button>
	</form>
</body>
</html>