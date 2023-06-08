<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
<title>관리자 페이지</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/layout.css">
</head>
<body>
<header>
  <%@ include file="/jsp/include/top.jsp" %>
</header>
<section>
<a href="${ pageContext.request.contextPath }/searchBookPage.do">도서관리</a><br>
<a href="${ pageContext.request.contextPath }/memberManagementPage.do">회원관리</a>
</section>
<footer>
<%@ include file="/jsp/include/bottom.jsp" %>
</footer>
</body>
</html>