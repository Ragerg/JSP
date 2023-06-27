<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

    <meta charset="UTF-8">
<title>답글</title>

<body>
<%@ include file="/jsp/include/header.jsp" %>

    <c:if test="${ empty user}">
      <script>alert("로그인 후 이용해 주세요."); location.href = "index.do";</script>
    </c:if>
    <section class="section">
      <div class="container">
      <h1 class="my-3 text-primary">답글</h1>
        <h4 class="mb-3"></h4>
        <form class="validation-form" novalidate="" onsubmit="return submitForm()"
          action="${ pageContext.request.contextPath }/insertReBoard.do" method="post">
          <div class="form-group">
            <div class="mb-3">
              <label for="title">제목</label>
              <input type="text" class="form-control " id="title" name="title" required="" value="Re: ${ board.title }">
              <input type="hidden" name="b_no" required="" value="${board.b_no }">
            </div>

            <div class="mb-5">
              <label for="content">내용</label>
              <textArea  class="form-control" id="content" name="content" rows="10"></textArea>
            </div>
          </div>
          <button class="btn btn-primary btn-lg btn-block" type="submit">답글달기</button>
        </form>
      </div>
    </section>

     <%@ include file="/jsp/include/footer.jsp" %>
</body>
</html>
