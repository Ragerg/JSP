<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
   <jsp:useBean id="login" class="homework.LoginBean2" />
   <jsp:setProperty name="login" property="id" />
   <jsp:setProperty name="login" property="pw" />
   <%
   if (login.dbCheck()) {
	   session.setAttribute("id", login.getId());
	   response.sendRedirect("Main.jsp");
   } else {
	   response.sendRedirect("Error.html");
   }
   %>
</body>
</html>