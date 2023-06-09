<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
    <title>마이페이지</title>
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
          회원정보 <br>
          <a href="${ pageContext.request.contextPath }/insertBookPage.do">회원정보 수정</a> | 
          <a href="${ pageContext.request.contextPath }/searchBookPage.do">회원탈퇴</a>
          <hr>
          대여도서<br>
          <a href="${ pageContext.request.contextPath }/searchBookPage.do">도서대여</a> | 
          <a href="${ pageContext.request.contextPath }/joinPage.do">반납하기</a><br>
        </div>
      </div>
    </section>
    <footer>
      <%@ include file="/jsp/include/bottom.jsp" %>
    </footer>
  </body>

  </html>