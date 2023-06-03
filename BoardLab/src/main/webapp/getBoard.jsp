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
			<th>조회수</th>
			<td>${ board.hit }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre>${ board.content }</pre></td>
		</tr>
		<c:if test="${ user.id == board.writer }">
			<tr>
				<td colspan="2">
					<form action="updateBoard.jsp" method="post">
					<input type="hidden" name="seq" value="${ board.seq }">
					<input type="hidden" name="title" value="${ board.title }">
					<input type="hidden" name="content" value="${ board.content }">
					<input type="hidden" name="hit" value="${ board.hit }">
					<input type="submit" value="수정">
					<input type="button" value="삭제" onclick="location.href='deleteboard.do?seq=${ board.seq }'">
					</form>
				</td>
			</tr>
		</c:if>	
	</table>
<a href="getBoardList.do">목록</a>
</body>
</html>