<%-- <%@ 페이지 전체에 영향, JSP페이지의 지시어 선언 %> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Date" %>
<%@ page session = "false" %>    

<%-- <%!변수 선언, 메소드 선언 %> --%>
<%!
Date date;
String name;
String email;
%>

<%!
public int getLength() {
	int len = email.length();
	return len;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>스크립트 테스트</h1>
<%-- 	<% 변수 있는 부분, 자바 코드를 실행하기 위한 스크립트 %> --%>
	<%
		date = new Date();
	%>
<%-- 	<%= 출력 %> --%>
	현재 날짜 : <%= date.toLocaleString() %>
</body>
</html>