<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
//넘겨받은 ID, PW로 확인
String id = request.getParameter("id");
String pw = request.getParameter("pw");

// id가 admin01 이고, pw가 9999인지 확인
if(id.equals("admin01") && pw.equals("9999")) {
	// 맞으면 세션에 id 저장하고,
	session.setAttribute("id", id);
	//3분 후 세션종료
	session.setMaxInactiveInterval(180);
	// 메인서비스 페이지로 이동
	response.sendRedirect("Main.jsp");
} else {
	// 아니면 에러 페이지로 이동
	response.sendRedirect("Error.html");
}
%>
</body>
</html>