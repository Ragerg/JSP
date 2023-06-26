<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
</head>
<body>
    <h1>게시글 수정</h1>
    <form action="${ pageContext.request.contextPath }/boardEdit.do" method="post">
        <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">
        <p>
            제목: <input type="text" name="title" value="<%= request.getAttribute("title") %>">
        </p>
        <p>
            작성자: <input type="text" name="author" value="<%= request.getAttribute("author") %>">
        </p>
        <p>
            내용: <textarea name="content" rows="10" cols="50">
            <%= request.getAttribute("content") %>
        </textarea></p>
        <p>
            공개 여부: <input type="checkbox" name="isPublic" value="true" <%= ((Boolean)request.getAttribute("isPublic")) ? "checked" : "" %>>
        </p>
        <p>
            <input type="submit" value="수정하기">
        </p>
    </form>
    <!-- 삭제 버튼 -->
    <form action="${ pageContext.request.contextPath }/boardDelete.do" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
        <input type="hidden" name="id" value="<%= request.getAttribute("id") %>">
        <input type="submit" value="삭제하기">
    </form>
    <a href="${ pageContext.request.contextPath }/boardList.do">목록으로</a>
</body>
</html>
