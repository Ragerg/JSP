<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>${ board.seq }. ${ board.title }</h2>
<hr>
	<table border="1">	
		<tr>
			<th>제목</th>
			<td>${ board.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${ board.writer }</td>
		</tr>
		<tr>
			<th>작성일자</th>
			<td>${ board.regDate }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="40" rows="10">${ board.content }</textarea></td>
		</tr>
	</table>
<a href="getBoardList.do">목록</a>
</body>
</html>