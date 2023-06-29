<%@page import="java.util.ArrayList"%>
<%@page import="biz.board.BoardVO"%>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

    <meta charset="UTF-8">
<title>문의 게시판</title>


<body>
      <%@ include file="/jsp/include/header.jsp" %>
    
	<section class="section" id="board">
    <div class="container">
    
        <h1 class="my-3 text-primary">문의 게시판</h1>
         <table>
        <thead class="table-dark">
            <tr style="text-align:center;">
                <th scope="col" style="width: 8%;" >#</th>
                <th scope="col" class="title" style="width: 55%;overflow: hidden">Title</th>
                <th scope="col" style="width: 15%;">Writer</th>
                <th scope="col" class="date" style="width: 15%;">Date</th>
<!--                 <th scope="col" class="hit" style="width: 10%;">Hit</th> -->
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${boardList}">
                    <tr onclick="location.href='${pageContext.request.contextPath }/getBoard.do?b_no=${ board.b_no }'">
                        <th scope="row" style="text-align:center;">
                        <c:if test = "${board.level == 1 }">
                        	문의
                        </c:if>
                        </th>
                        <td class="title text-truncate">
                        <c:if test = "${board.level > 1 }">
                            <c:forEach var="i" begin="1" end="${board.level-1}">
                            &nbsp;&nbsp;
                            </c:forEach>
                            <i class="bi bi-arrow-return-right"></i>
                        </c:if>
                        ${ board.title }
                        </td>
                        <c:choose>
                        <c:when test = "${ board.level == 1}">
                        <td>${ board.user_id }</td>
                        </c:when>
                        <c:when test = "${board.level > 1 }">
                        <td>관리자</td>
                        </c:when>
                        </c:choose>
                        <td><fmt:formatDate value="${ board.reg_date }" pattern="yyyy-MM-dd" type="date"/></td>
                    </tr>
            </c:forEach>
              </tbody>
              </table>
    <nav id = "paging" aria-label="Page navigation example">
    		<c:if test="${ user.role_cd == 'U1' }">
            <a href="${ pageContext.request.contextPath }/insertBoardPage.do">
            <input type="button" value="문의하기" class="btn btn-primary mt-3" style="float: right;">
            </a>
            </c:if>
        <ul class="pagination" style="justify-content: center;margin: 10px auto;">
            <li class="page-item <c:if test="${ vpage == 1 }"> disabled </c:if>">
                <a class="page-link" href="${pageContext.request.contextPath }/getBoardList.do?vpage=${vpage - 1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="i" begin="1" end="${ lastPage }">
                <li class="page-item  <c:if test = "${vpage == i }" >active</c:if>"><a class="page-link" href="${pageContext.request.contextPath }/getBoardList.do?vpage=${i}"> ${i} </a></li>
            </c:forEach>
            <li class="page-item <c:if test="${vpage == lastPage}"> disabled </c:if>">
                <a class="page-link" href="${pageContext.request.contextPath }/getBoardList.do?vpage=${vpage + 1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>

    </nav>
    </div>
    </section>
    
    
    
    <%@ include file="/jsp/include/footer.jsp" %>
    <script>
    var userId = "${ board.user_id }";
    var userIdBeforeAt = userId.split('@')[0];
    document.write("<td>" + userIdBeforeAt + "</td>");
</script>
</body>
</html>
