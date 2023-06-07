<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <style>
      a:hover {
        color: #FFD966;
        text-decoration: none;
      }
    </style>
    <!-- 로고와 도서관 이름 -->
    <a href="${ pageContext.request.contextPath }/main.do"><img src="${ pageContext.request.contextPath }/image/logo.png" /></a>
    <!-- 메뉴 바 -->
    <nav>
      <ul>
        <li><a href="${ pageContext.request.contextPath }/main.do">홈</a></li>
        <li><a href="#about">소개</a></li>
        <li><a href="#search">도서 검색</a></li>
        <li><a href="#services">이용 안내</a></li>
        <c:choose>
          <%--로그인이 안되어있는 경우엔 로그인, 회원가입 버튼 --%>
            <c:when test="${ empty member }">
              <li><a href="${ pageContext.request.contextPath }/loginPage.do">로그인</a></li>
              <li><a href="${ pageContext.request.contextPath }/joinPage.do">회원가입</a></li>
            </c:when>
            <%--로그인이 되어있는 경우--%>
	            <%--관리자--%>
              <c:when test="${ member.role == 'M' }">
<%--                 <li><a href="${ pageContext.request.contextPath }/myPage.do">관리자페이지</a></li> --%>
				<li><a href="${ pageContext.request.contextPath }/insertBookPage.do">관리자페이지</a></li>
                <li><a href="${ pageContext.request.contextPath }/logout.do">로그아웃</a></li>
              </c:when>
	            <%--일반 사용자--%>
              <c:otherwise>
                <li><a href="${ pageContext.request.contextPath }/myPage.do">마이페이지</a></li>
                <li><a href="${ pageContext.request.contextPath }/logout.do">로그아웃</a></li>
              </c:otherwise>
        </c:choose>
      </ul>
    </nav>

    <!-- <table style="width:100%" border="1"> -->
    <!-- 	<tr> -->
    <!-- 		<td rowspan="2"> 로고 </td> -->
    <!-- 		<td align="right"> -->
    <!-- 			<span style="padding-right: 5px">즐겨찾기</span> -->
    <%-- <c:if test="${ not empty loginUser }">
      --%> <%-- [${ loginUser.name }(${ loginUser.id })님 로그인중...] --%> <%-- </c:if>
          --%>
          <!-- 		</td> -->
          <!-- 	</tr> -->
          <!-- 	<tr> -->
          <!-- 		<td align="right"> -->
          <%-- <c:if test="${ loginUser.type eq 'S' }">
            --%>
            <!-- 			회원관리 |  -->
            <%-- </c:if>
              --%>
              <!-- 			게시판 |  -->
              <%-- <c:choose>
                --%> <%-- <c:when test="${ empty loginUser }">
                  --%>
                  <!-- 					회원가입 |  -->
                  <!-- 					<a href="/MyLibrary/jsp/login/login.jsp">로그인</a> -->
                  <%-- </c:when>
                    --%> <%-- <c:otherwise>
                      --%>
                      <!-- 					마이페이지 |  -->
                      <!-- 					<a href="/MyLibrary/jsp/login/logout.jsp">로그아웃</a> -->
                      <%-- </c:otherwise>
                        --%> <%-- </c:choose>
                          --%>
                          <!-- 		</td> -->
                          <!-- 	</tr> -->
                          <!-- </table> -->