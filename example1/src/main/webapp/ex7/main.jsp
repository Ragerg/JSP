<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "head.jsp" %>
	<br>
	<% 
		name = request.getParameter("name");
		email = request.getParameter("email");	
	%>
	name : <%= name %><br>
	email : <%= email %><br>
	
<!-- 	include가 되어서 에러가 안난다 -->
	<%= date.getDate() %> 일 입니다. 이 배열의 길이는 <%= getLength() %> 입니다.
</body>
</html>