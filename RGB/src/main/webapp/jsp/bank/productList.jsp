<%@page import="java.util.ArrayList" %>
  <%@page import="biz.board.BoardVO" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
      <!DOCTYPE html>
      <html>

      <meta charset="UTF-8">
      <title>상품</title>


      <body>
        <%@ include file="/jsp/include/header.jsp" %>
        
<section class="section">

    <div class="container">
    <h1 class="my-3 text-primary">상품목록</h1>
    <div class="row">
    <c:forEach var = "product" items= "${ productList }">
    <div class="card col-md-4 mb-3 ms-3" style="width: 18rem;">
  <div class="card-body">
    <h4 class="card-title">${ product.product_name }</h4>
    <h5 class="card-subtitle mb-2 text-muted">이자율 : ${ product.interest_rate }%</h5>
    <h5 class="card-subtitle mb-2 text-muted">상품개시일 : ${ product.reg_date }</h5>
    <a href="${pageContext.request.contextPath }/createAccountPage.do?product_cd=${ product.product_cd }" class="card-link btn btn-primary">개설하기</a>
  </div>
</div>
    </c:forEach>
    </div>
    </div>
</section>

<%@ include file="/jsp/include/footer.jsp" %>
      </body>

      </html>