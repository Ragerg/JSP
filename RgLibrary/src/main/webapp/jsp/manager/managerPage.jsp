<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/layout.css">
    <style>
      .container {
        display: flex;
        justify-content: center;
      }
    </style>

  </head>

  <body>
    <header>
      <%@ include file="/jsp/include/top.jsp" %>
    </header>
    <section>
      <div class="container justify-content-center">
        <div class="row">
          도서관리<br>
          <a href="${ pageContext.request.contextPath }/insertBookPage.do">도서등록</a> | 
          <a href="${ pageContext.request.contextPath }/searchBookPage.do">도서삭제</a><br>
          <hr>
			회원관리<br>
<%--           <a href="${ pageContext.request.contextPath }/joinPage.do">회원조회</a> | --%>
          <a href="${ pageContext.request.contextPath }/joinPage.do">회원등록</a> | 
<%--           <a href="${ pageContext.request.contextPath }/joinPage.do">회원탈퇴</a>  --%>
          
        </div>
      </div>
    </section>
    <footer>
      <%@ include file="/jsp/include/bottom.jsp" %>
    </footer>
  </body>

  </html>