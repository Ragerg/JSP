<%-- <%@ ������ ��ü�� ����, JSP�������� ���þ� ���� %> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Date" %>
<%@ page session = "false" %>    

<%-- <%!���� ����, �޼ҵ� ���� %> --%>
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
	<h1>��ũ��Ʈ �׽�Ʈ</h1>
<%-- 	<% ���� �ִ� �κ�, �ڹ� �ڵ带 �����ϱ� ���� ��ũ��Ʈ %> --%>
	<%
		date = new Date();
	%>
<%-- 	<%= ��� %> --%>
	���� ��¥ : <%= date.toLocaleString() %>
</body>
</html>