<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로고와 도서관 이름 -->
<a href="/MyLibrary"><img src="image/logo.png" /></a>
<!-- 메뉴 바 -->
<nav>
  <ul>
    <li><a href="#home">홈</a></li>
    <li><a href="#about">소개</a></li>
    <li><a href="#search">도서 검색</a></li>
    <li><a href="#services">이용 안내</a></li>
    <li><a href="#join">회원가입</a></li>
  </ul>
</nav>

<!-- <table style="width:100%" border="1"> -->
<!-- 	<tr> -->
<!-- 		<td rowspan="2"> 로고 </td> -->
<!-- 		<td align="right"> -->
<!-- 			<span style="padding-right: 5px">즐겨찾기</span> -->
<%--
<c:if test="${ not empty loginUser }">
  --%> <%-- [${ loginUser.name }(${ loginUser.id })님 로그인중...] --%> <%--
</c:if>
--%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td align="right"> -->
<%--
<c:if test="${ loginUser.type eq 'S' }">
  --%>
  <!-- 			회원관리 |  -->
  <%--
</c:if>
--%>
<!-- 			게시판 |  -->
<%--
<c:choose>
  --%> <%--
  <c:when test="${ empty loginUser }">
    --%>
    <!-- 					회원가입 |  -->
    <!-- 					<a href="/MyLibrary/jsp/login/login.jsp">로그인</a> -->
    <%--
  </c:when>
  --%> <%--
  <c:otherwise>
    --%>
    <!-- 					마이페이지 |  -->
    <!-- 					<a href="/MyLibrary/jsp/login/logout.jsp">로그아웃</a> -->
    <%--
  </c:otherwise>
  --%> <%--
</c:choose>
--%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->
