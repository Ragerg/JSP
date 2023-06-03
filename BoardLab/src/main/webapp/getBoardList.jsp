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
<h1>게시글 목록</h1>
<hr>
<h3>${ user.name }님 환영합니다. <a href="logout.do">로그아웃</a></h3>
	<table>	
		<tr>
			<th>No.</th><th>TITLE</th><th>WRITER</th><th>DATE</th><th>HIT</th>
		</tr>
		<c:forEach var="board" items="${ boardList }">
		<tr>
			<td>${ board.seq }</td>
			<td><a href="getboard.do?seq=${ board.seq }" >${ board.title }</a></td>
			<td>${ board.writer }</td>
			<td>${ board.regDate }</td>
			<td>${ board.hit }</td>
		</tr>
		</c:forEach>
		<tr>
		<td colspan="4"><a href="./insertBoard.jsp">글쓰기</a></td>
		</tr>
	</table>
<hr>
<form action="searchboard.do" method="post">
	<table>
		<tr>
			<td>
			<input type="text" name="writer">
			</td>
			<td>
			<input type="submit" value="검색">
			</td>
		</tr>
	</table>
</form>
</body>
</html>