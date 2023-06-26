<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <head>
      <link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
      <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/layout.css" />
      <script defer src="${ pageContext.request.contextPath }/js/main.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
    </head>

    <div class="inner">
      <!-- 로고-->
      <a href="${ pageContext.request.contextPath }/index.do" class="logo">
        <img src="${ pageContext.request.contextPath }/image/logo.png" alt="BANK" />
      </a>

      <!-- 메뉴 바 -->
      <div class="sub-menu">
        <ul class="menu">
          <c:choose>
            <%--로그인이 안되어있는 경우엔 로그인, 회원가입 버튼 --%>
              <c:when test="${ empty member }">
                <li><a href="${ pageContext.request.contextPath }/login.do">로그인</a></li>
                <li><a href="javascript:void(0)">회원가입</a></li>
                <li><a href="${ pageContext.request.contextPath }/boardList.do">게시판</a></li>
                <li><a href="javascript:void(0)">상품</a></li>
              </c:when>
              <%--로그인이 되어있는 경우--%>
                <%--a매니저--%>
                  <c:when test="${ member.role == 'M' }">
                    <li><a href="javascript:void(0)">회원관리</a></li>
                    <li><a href="javascript:void(0)">문의관리</a></li>
                    <li><a href="javascript:void(0)">상품관리</a></li>
                    <li><a href="javascript:void(0)">로그아웃</a></li>
                  </c:when>
                  <%--일반 사용자--%>
                    <c:otherwise>
                      <li><a href="javascript:void(0)">내계좌</a></li>
                      <li><a href="javascript:void(0)">오픈뱅킹</a></li>
                      <li><a href="javascript:void(0)">마이페이지</a></li>
                      <li><a href="${ pageContext.request.contextPath }/boardList.do">게시판</a></li>
                      <li><a href="javascript:void(0)">상품</a></li>
                      <li><a href="javascript:void(0)">로그아웃</a></li>
                    </c:otherwise>
          </c:choose>
        </ul>
      </div>
      <!-- <ul>
        <c:choose>
          <%--로그인이 안되어있는 경우엔 로그인, 회원가입 버튼 --%>
            <c:when test="${ empty member }">
              <li><a href="${ pageContext.request.contextPath }/main.do#services">게시판</a></li>
              <li><a href="${ pageContext.request.contextPath }/searchBookPage.do">상품</a></li>
            </c:when>
            <%--로그인이 되어있는 경우--%>
              <%--관리자--%>
                <c:when test="${ member.role == 'M' }">
                  <li><a href="${ pageContext.request.contextPath }/managerPage.do">상품관리</a></li>
                  <li><a href="${ pageContext.request.contextPath }/managerPage.do">회원관리</a></li>
                  <li><a href="${ pageContext.request.contextPath }/managerPage.do">문의관리</a></li>
                </c:when>
                <%--일반 사용자--%>
                  <c:otherwise>
                    <li><a href="${ pageContext.request.contextPath }/myPage.do">내계좌</a></li>
                    <li><a href="${ pageContext.request.contextPath }/myPage.do">오픈뱅킹</a></li>
                    <li><a href="${ pageContext.request.contextPath }/myPage.do">마이페이지</a></li>
                    <li><a href="${ pageContext.request.contextPath }/main.do#services">게시판</a></li>
                    <li><a href="${ pageContext.request.contextPath }/searchBookPage.do">상품</a></li>
                  </c:otherwise>
        </c:choose>
      </ul> -->
    </div>