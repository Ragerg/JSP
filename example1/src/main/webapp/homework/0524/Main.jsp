<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Main</title>
</head>
<body>
<h1>Main Service Page</h1>
<%
if(session.getAttribute("id") != null) {
%>
<p><%= session.getAttribute("id")%> 님 환영합니다!!!</p>
<form action="Logout.jsp" method="post">
<input type="submit" value="로그아웃">
<%} else {
	response.sendRedirect("Login.jsp");
}
	%>
</form>
</body>
</html>