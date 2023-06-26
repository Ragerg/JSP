<%@page import="java.util.ArrayList"%>
<%@page import="biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
    <h1>게시글 목록</h1>
    <ul>
        <% ArrayList<BoardVO> boardList = (ArrayList<BoardVO>)request.getAttribute("boardList");
           if (boardList != null && boardList.size() > 0) { // 게시글이 있는 경우만 실행
               for(BoardVO board : boardList) {
        %>
        <li>
            <a href="${ pageContext.request.contextPath }/boardRead.do?id=<%= board.getId() %>"><%= board.getTitle() %></a>
        </li>
        <% } // 게시글이 있는 경우 종료
           } else { // 게시글이 없는 경우
        %>
        <li>게시글이 없습니다.</li>
        <% } // 게시글이 없는 경우 종료 %>
    </ul>
    <a href="${ pageContext.request.contextPath }/boardWriteForm.do">글 작성하기</a>
</body>
</html>
