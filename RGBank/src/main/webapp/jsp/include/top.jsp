<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <style>

    </style>
    <!-- 로고-->
    <a href="${ pageContext.request.contextPath }/main.do"><img
        src="${ pageContext.request.contextPath }/image/logo.png" /></a>
    <!-- 메뉴 바 -->
    <nav>
      <ul>
        <c:choose>
          <%--로그인이 안되어있는 경우엔 로그인, 회원가입 버튼 --%>
            <c:when test="${ empty member }">
              <li><a href="${ pageContext.request.contextPath }/main.do#services">게시판</a></li>
              <li><a href="${ pageContext.request.contextPath }/searchBookPage.do">상품</a></li>
              <li><a href="${ pageContext.request.contextPath }/loginPage.do">로그인</a></li>
              <li><a href="${ pageContext.request.contextPath }/joinPage.do">회원가입</a></li>
            </c:when>
            <%--로그인이 되어있는 경우--%>
              <%--관리자--%>
                <c:when test="${ member.role == 'M' }">
                  <li><a href="${ pageContext.request.contextPath }/managerPage.do">상품관리</a></li>
                  <li><a href="${ pageContext.request.contextPath }/managerPage.do">회원관리</a></li>
                  <li><a href="${ pageContext.request.contextPath }/managerPage.do">문의관리</a></li>
                  <li><a href="${ pageContext.request.contextPath }/logout.do">로그아웃</a></li>
                </c:when>
                <%--일반 사용자--%>
                  <c:otherwise>
                    <li><a href="${ pageContext.request.contextPath }/myPage.do">내계좌</a></li>
                    <li><a href="${ pageContext.request.contextPath }/myPage.do">오픈뱅킹</a></li>
                    <li><a href="${ pageContext.request.contextPath }/myPage.do">마이페이지</a></li>
                    <li><a href="${ pageContext.request.contextPath }/main.do#services">게시판</a></li>
                    <li><a href="${ pageContext.request.contextPath }/searchBookPage.do">상품</a></li>
                    <li><a href="${ pageContext.request.contextPath }/logout.do">로그아웃</a></li>
                  </c:otherwise>
        </c:choose>
      </ul>
    </nav>