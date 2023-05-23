<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
</head>
<body>
<%
//현재 로그인상태인지?
boolean isLogin = session.getAttribute("id") != null;

if(isLogin) {
	//로그인이 되어있으면 메인서비스 페이지로 이동
	response.sendRedirect("Main.jsp");
} else {
//로그인 안 되어있으면 id, pw 입력받아서 로그인프로세스로 id,pw 넘김
%>
<h1>Login</h1>
<form action="Loginprocess.jsp" method="post">
<label> ID : <input type="text" name="id" placeholder="아이디"></label><br>
<label> PW : <input type="password" name="pw" placeholder="비밀번호"></label><br>
<input type="submit" value="로그인">
</form>
<%
}
%>


</body>
</html>