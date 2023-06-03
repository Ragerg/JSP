<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
try {
request.setCharacterEncoding("utf-8");
} catch (Exception e) {
	e.printStackTrace();
	}
%>
</head>
<body>
<h1>글 수정</h1>
<hr>
<form action="updateboard.do" method="post">
	<input type="hidden" value="${ param.seq }" name="seq">
	<input type="hidden" value="${ param.hit }" name="hit">
	<table border="1">	
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="${ param.title }"></td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><textarea name="content" cols="40" rows="10" >${ param.content }</textarea></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="수정"></td>
		</tr>
	</table>
</form>
</body>
</html>