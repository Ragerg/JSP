<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <link rel="icon" href="${ pageContext.request.contextPath }/image/favicon.png">
    <title>회원조회</title>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/layout.css">
    </head>
    <body>
    <header>
      <%@ include file="/jsp/include/top.jsp" %>
    </header>
        <c:if test="${ member.role != 'M'}">
            <script>alert("잘못된 접근입니다."); location.href = "main.do";</script>
        </c:if>
        <section id="userTable">
        <h2>회원목록</h2>
        <hr>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Phone</th>
<!--                         <th scope="col">Role</th> -->
                        <th scope="col">Return_date</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="member" items="${ memberList }">
                        <tr>
                            <th scope="row">${ member.id}</th>
                            <td>${ member.name}</td>
                            <td>${ member.phone}</td>
<%--                             <td>${user.role}</td> --%>
                            <td>${ member.return_date}</td>
                            <td>
<%--                             <c:if test = "${user.grade == 'user' }"> --%>
<%--                             <a href = "${pageContext.request.contextPath }/updateGrade.do?id=${user.id}"><input type="button" value="관리자로 임명"> </a> --%>
<%--                             </c:if> --%>
<%--                             <a href = "${pageContext.request.contextPath }/deleteUser.do?id=${user.id}"><input type="button" value="탈퇴"> </a> --%>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    <footer>
      <%@ include file="/jsp/include/bottom.jsp" %>
    </footer>
  </body>

  </html>