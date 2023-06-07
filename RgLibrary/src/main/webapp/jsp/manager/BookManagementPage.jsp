<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
<title>도서관리</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/layout.css">
</head>
<body>
<header>
  <%@ include file="/jsp/include/top.jsp" %>
</header>
<section>
<a href="${ pageContext.request.contextPath }/insertBookPage.do">도서정보 등록</a>
<%-- <a href="${ pageContext.request.contextPath }/insertBookPage.do">도서정보 수정</a> --%>
<%-- <a href="${ pageContext.request.contextPath }/insertBookPage.do">도서정보 삭제</a> --%>
</section>
<footer>
<%@ include file="/jsp/include/bottom.jsp" %>
</footer>
</body>
</html>