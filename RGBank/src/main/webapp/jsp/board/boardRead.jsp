<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 내용</title>
</head>
<body>
    <h1>게시글 내용</h1>
    <p>제목: <%= request.getAttribute("title") %></p>
    <p>작성자: <%= request.getAttribute("author") %></p>
    <p>작성일: <%= request.getAttribute("createdAt") %></p>
    <hr>
<pre><%= request.getAttribute("content") %></pre>
    <hr>
    <a href="${ pageContext.request.contextPath }/boardEditForm.do?id=<%= request.getAttribute("id") %>">수정하기</a>
    <a href="${ pageContext.request.contextPath }/boardDelete.do?id=<%= request.getAttribute("id") %>">삭제하기</a>
    <br><br>
    <a href="${ pageContext.request.contextPath }/boardList.do">목록으로</a>
</body>
</html>
html>