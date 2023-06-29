<%@page import="java.util.ArrayList"%>
<%@page import="biz.board.BoardVO"%>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

    <meta charset="UTF-8">
<title>거래내역</title>


<body>
      <%@ include file="/jsp/include/header.jsp" %>
    
	<section class="section" id="transList">
    <div class="container">
    
        <h1 class="my-3 text-primary">거래내역</h1>
        <h4 class="my-3 text-primary"> ${ account_name } | ${ account_no }</h4>
         <table  style="text-align: center">
        <thead class="table-dark">
            <tr>
                <th scope="col" class="date">거래일자</th>
                <th scope="col">거래내용</th>
                <th scope="col">거래금액</th>
                <th scope="col">잔액</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="trans" items="${transList}">
            <tr>
<%--                     <tr onclick="location.href='${pageContext.requesst.contextPath }/getBoard.do?b_no=${ board.b_no }'"> --%>
<%--                         <th scope="row">${ trans.trans_date }</th> --%>
<!--                         <td class="title text-truncate"> -->
<%--                         <c:if test = "${board.level > 1 }"> --%>
<%--                             <c:forEach var="i" begin="1" end="${board.level-1}"> --%>
<!--                             &nbsp;&nbsp; -->
<%--                             </c:forEach> --%>
<!--                             <i class="bi bi-arrow-return-right"></i> -->
<%--                         </c:if> --%>
<%--                         ${ board.title } --%>
<!--                         </td> -->
                        <td>${ trans.trans_date }</td>
                        <td>${ trans.trans_name }</td>
                        <c:choose>
                        <c:when test="${ trans.trans_type == 'W'}">
                        <td style="text-align: center; color: red">
                        <fmt:formatNumber value="-${ trans.trans_amount }" pattern="#,###" /></td>
                        </c:when>
                        <c:when test="${ trans.trans_type == 'D'}">
                        <td style="text-align: center; color: blue">
                        <fmt:formatNumber value="${ trans.trans_amount }" pattern="#,###" /></td>
                        </c:when>
                        </c:choose>
                        <td style="text-align: center">
                        <fmt:formatNumber value="${ trans.trans_balance }" pattern="#,###" /></td>
                    </tr>
            </c:forEach>
              </tbody>
              </table>
    
    </div>
    </section>
    
    <%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>
